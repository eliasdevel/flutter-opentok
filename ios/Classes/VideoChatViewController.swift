//
//  VideoChatViewController.swift
//  Runner
//
//  Created by STLLPT038 on 02/01/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import OpenTok

final class VideoChatViewController: UIViewController {
    
    let kApiKey = "46362752"
    let kSessionId = "2_MX40NjM2Mjc1Mn5-MTU2NTY4Nzc1NjE2N345NFBzUWhhOXhjV2JMM0RSWmY5ZHI5STJ-fg"
    let kToken = "T1==cGFydG5lcl9pZD00NjM2Mjc1MiZzaWc9NzU1YWJkYWViNjRmNTRjZGMyMGM3NWVlY2Y4MTMyM2QyMWFkZGU1NDpzZXNzaW9uX2lkPTJfTVg0ME5qTTJNamMxTW41LU1UVTJOVFk0TnpjMU5qRTJOMzQ1TkZCelVXaGhPWGhqVjJKTU0wUlNXbVk1WkhJNVNUSi1mZyZjcmVhdGVfdGltZT0xNTY1Njg3NzkzJm5vbmNlPTAuOTAzNzc3MjE4ODA0MDMzNiZyb2xlPXB1Ymxpc2hlciZleHBpcmVfdGltZT0xNTY4Mjc5NzkyJmluaXRpYWxfbGF5b3V0X2NsYXNzX2xpc3Q9"
    
    var session: OTSession?
    var publisher: OTPublisher?
    var subscriber: OTSubscriber?
    
    var onCloseTap: ((_ callDuration: TimeInterval) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectToAnOpenTokSession()
    }
    
    func connectToAnOpenTokSession() {
        session = OTSession(apiKey: kApiKey, sessionId: kSessionId, delegate: self)
        
        var error: OTError?
        session?.connect(withToken: kToken, error: &error)
        if error != nil {
            print(error!)
        }
    }
    
    @IBAction func didTapClose() {
        let startTime = session?.connection?.creationTime ?? Date()
        let endTime = Date()
        let duration = endTime.timeIntervalSince(startTime)
        onCloseTap?(duration)
        dismiss(animated: true, completion: nil)
        session?.disconnect()
    }
}

// MARK: - OTSessionDelegate callbacks
extension VideoChatViewController: OTSessionDelegate {
    func sessionDidConnect(_ session: OTSession) {
        print("The client connected to the OpenTok session.")
        
        let settings = OTPublisherSettings()
        settings.name = UIDevice.current.name
        guard let publisher = OTPublisher(delegate: self, settings: settings) else {
            return
        }
        
        var error: OTError?
        session.publish(publisher, error: &error)
        guard error == nil else {
            print(error!)
            return
        }
        
        guard let publisherView = publisher.view else {
            return
        }
        let screenBounds = UIScreen.main.bounds
        publisherView.frame = CGRect(x: screenBounds.width - 150 - 20, y: screenBounds.height - 150 - 20, width: 150, height: 150)
        view.addSubview(publisherView)
        
    }
    
    func sessionDidDisconnect(_ session: OTSession) {
        print("The client disconnected from the OpenTok session.")
    }
    
    func session(_ session: OTSession, didFailWithError error: OTError) {
        print("The client failed to connect to the OpenTok session: \(error).")
    }
    func session(_ session: OTSession, streamCreated stream: OTStream) {
        subscriber = OTSubscriber(stream: stream, delegate: self)
        guard let subscriber = subscriber else {
            return
        }
        
        var error: OTError?
        session.subscribe(subscriber, error: &error)
        guard error == nil else {
            print(error!)
            return
        }
        
        guard let subscriberView = subscriber.view else {
            return
        }
        subscriberView.frame = UIScreen.main.bounds
        view.insertSubview(subscriberView, at: 0)
    }
    
    func session(_ session: OTSession, streamDestroyed stream: OTStream) {
        print("A stream was destroyed in the session.")
    }
}

// MARK: - OTPublisherDelegate callbacks
extension VideoChatViewController: OTPublisherDelegate {
    func publisher(_ publisher: OTPublisherKit, didFailWithError error: OTError) {
        print("The publisher failed: \(error)")
    }
}

// MARK: - OTSubscriberDelegate callbacks
extension VideoChatViewController: OTSubscriberDelegate {
    public func subscriberDidConnect(toStream subscriber: OTSubscriberKit) {
        print("The subscriber did connect to the stream.")
    }
    
    public func subscriber(_ subscriber: OTSubscriberKit, didFailWithError error: OTError) {
        print("The subscriber failed to connect to the stream.")
    }
}
