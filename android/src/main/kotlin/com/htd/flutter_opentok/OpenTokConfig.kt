 package com.htd.flutter_opentok

 import android.webkit.URLUtil

 object OpenTokConfig {
     // *** Fill the following variables using your own Project info from the OpenTok dashboard  ***
     // ***                      https://dashboard.tokbox.com/projects                           ***

     // Replace with your OpenTok API key
    public var API_KEY: String = "46362752"
     // Replace with a generated Session ID
    public var SESSION_ID: String = "2_MX40NjM2Mjc1Mn5-MTU2NTYwNTkyMTM5Mn5IWXVtWldLL3RsM1p1NTFKRmh3MmxaWm5-fg"
     // Replace with a generated token (from the dashboard or using an OpenTok server SDK)
    public var TOKEN: String = "T1==cGFydG5lcl9pZD00NjM2Mjc1MiZzaWc9ZDdiMzBhM2EzNzQ0NDljZWI1ODYwMDcyYTYyMWVlMDY4OTRjMjY2NTpzZXNzaW9uX2lkPTJfTVg0ME5qTTJNamMxTW41LU1UVTJOVFl3TlRreU1UTTVNbjVJV1hWdFdsZExMM1JzTTFwMU5URktSbWgzTW14YVdtNS1mZyZjcmVhdGVfdGltZT0xNTY1NjA1OTMyJm5vbmNlPTAuMjQ2OTQ1ODA0OTgwMzAwMTcmcm9sZT1wdWJsaXNoZXImZXhwaXJlX3RpbWU9MTU2NTYwOTUzMiZpbml0aWFsX2xheW91dF9jbGFzc19saXN0PQ=="

     /*                           ***** OPTIONAL *****
      If you have set up a server to provide session information replace the null value
      in CHAT_SERVER_URL with it.

      For example: "https://yoursubdomain.com"
     */
    public  var CHAT_SERVER_URL = ""
    
    public  val SESSION_INFO_ENDPOINT = CHAT_SERVER_URL?:"" + "/session"


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
