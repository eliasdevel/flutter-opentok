 package com.htd.flutter_opentok

 import android.webkit.URLUtil

 object OpenTokConfig {
     // *** Fill the following variables using your own Project info from the OpenTok dashboard  ***
     // ***                      https://dashboard.tokbox.com/projects                           ***

     // Replace with your OpenTok API key
     val API_KEY = "46362752"
     // Replace with a generated Session ID
     val SESSION_ID = "2_MX40NjM2Mjc1Mn5-MTU2Mjc2NTk4MDMyN34wYmxVWE9DWG5EWHg4WmIxdVRUMTY0WDV-fg"
     // Replace with a generated token (from the dashboard or using an OpenTok server SDK)
     val TOKEN = "T1==cGFydG5lcl9pZD00NjM2Mjc1MiZzaWc9ZTk1NjQxNGQ4Y2E2YzI0YjZhZTY4OTFkYTUzYTFhNmNiMGU0YjFiOTpzZXNzaW9uX2lkPTJfTVg0ME5qTTJNamMxTW41LU1UVTJNamMyTlRrNE1ETXlOMzR3WW14VldFOURXRzVFV0hnNFdtSXhkVlJVTVRZMFdEVi1mZyZjcmVhdGVfdGltZT0xNTYyNzY2MDA0Jm5vbmNlPTAuMTkzMjg2ODcyMzI1NDExOTcmcm9sZT1wdWJsaXNoZXImZXhwaXJlX3RpbWU9MTU2Mjc2OTYwNCZpbml0aWFsX2xheW91dF9jbGFzc19saXN0PQ=="

     /*                           ***** OPTIONAL *****
      If you have set up a server to provide session information replace the null value
      in CHAT_SERVER_URL with it.

      For example: "https://yoursubdomain.com"
     */
     val CHAT_SERVER_URL: String? = null
     val SESSION_INFO_ENDPOINT = CHAT_SERVER_URL?:"" + "/session"


     // *** The code below is to validate this configuration file. You do not need to modify it  ***

     lateinit var webServerConfigErrorMessage: String
     lateinit var hardCodedConfigErrorMessage: String

     val isWebServerConfigUrlValid: Boolean
         get() {
             if (OpenTokConfig.CHAT_SERVER_URL == null || OpenTokConfig.CHAT_SERVER_URL.isEmpty()) {
                 webServerConfigErrorMessage = "CHAT_SERVER_URL in OpenTokConfig.java must not be null or empty"
                 return false
             } else if (!(URLUtil.isHttpsUrl(OpenTokConfig.CHAT_SERVER_URL) || URLUtil.isHttpUrl(OpenTokConfig.CHAT_SERVER_URL))) {
                 webServerConfigErrorMessage = "CHAT_SERVER_URL in OpenTokConfig.java must be specified as either http or https"
                 return false
             } else if (!URLUtil.isValidUrl(OpenTokConfig.CHAT_SERVER_URL)) {
                 webServerConfigErrorMessage = "CHAT_SERVER_URL in OpenTokConfig.java is not a valid URL"
                 return false
             } else {
                 return true
             }
         }

     fun areHardCodedConfigsValid(): Boolean {
         if (OpenTokConfig.API_KEY != null && !OpenTokConfig.API_KEY.isEmpty()
                 && OpenTokConfig.SESSION_ID != null && !OpenTokConfig.SESSION_ID.isEmpty()
                 && OpenTokConfig.TOKEN != null && !OpenTokConfig.TOKEN.isEmpty()) {
             return true
         } else {
             hardCodedConfigErrorMessage = "API KEY, SESSION ID and TOKEN in OpenTokConfig.java cannot be null or empty."
             return false
         }
     }
 }
