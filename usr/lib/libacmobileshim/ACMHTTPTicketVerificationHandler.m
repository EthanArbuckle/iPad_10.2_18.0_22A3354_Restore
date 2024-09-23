@implementation ACMHTTPTicketVerificationHandler

+ (id)handlerName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (ACMHTTPTicketVerificationHandler)initWithContext:(id)a3
{
  ACMHTTPTicketVerificationHandler *v3;
  ACMHTTPTicketVerificationHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMHTTPTicketVerificationHandler;
  v3 = -[ACCHTTPHandler initWithContext:](&v6, sel_initWithContext_, a3);
  v4 = v3;
  if (v3)
    -[ACFHTTPTransportProtocol setRequestURLTemplate:](-[ACCHTTPHandler transport](v3, "transport"), "setRequestURLTemplate:", objc_msgSend(-[ACMHTTPHandler environmentPreferences](v3, "environmentPreferences"), "verifyTicketURLString"));
  return v4;
}

- (id)requestBody
{
  id v3;
  uint64_t v4;

  v3 = (id)objc_opt_new();
  if (v3)
  {
    if (-[ACCAuthContextProtocol appID](-[ACCHTTPHandler context](self, "context"), "appID"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", -[ACCAuthContextProtocol appID](-[ACCHTTPHandler context](self, "context"), "appID"), CFSTR("m"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 52, 0, "App ID is not set");
    }
    if (-[ACCAuthContextProtocol appIDKey](-[ACCHTTPHandler context](self, "context"), "appIDKey"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", -[ACCAuthContextProtocol appIDKey](-[ACCHTTPHandler context](self, "context"), "appIDKey"), CFSTR("n"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 61, 0, "App ID Key is not set");
    }
    if (objc_msgSend((id)-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "token"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend((id)-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "token"), CFSTR("st"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 70, 0, "Token is not set");
    }
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), "localeIdentifier");
    if (v4)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("u"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 81, 0, "localeIdentifier is not set");
    }
    if (objc_msgSend((id)-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "userName"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend((id)-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "userName"), CFSTR("b"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 90, 0, "userName is not set");
    }
    v3 = (id)objc_msgSend(v3, "copy");
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 96, 0, "Service ticket size: %d", objc_msgSend((id)objc_msgSend((id)-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "token"), "length"));
  return v3;
}

@end
