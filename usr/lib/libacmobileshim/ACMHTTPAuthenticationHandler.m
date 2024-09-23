@implementation ACMHTTPAuthenticationHandler

- (ACMHTTPAuthenticationHandler)initWithContext:(id)a3
{
  ACMHTTPAuthenticationHandler *v3;
  ACMHTTPAuthenticationHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMHTTPAuthenticationHandler;
  v3 = -[ACCHTTPHandler initWithContext:](&v6, sel_initWithContext_, a3);
  v4 = v3;
  if (v3)
    -[ACFHTTPTransportProtocol setRequestURLTemplate:](-[ACCHTTPHandler transport](v3, "transport"), "setRequestURLTemplate:", objc_msgSend(-[ACMHTTPHandler environmentPreferences](v3, "environmentPreferences"), "authenticateURLString"));
  return v4;
}

- (NSString)policyVersion
{
  return (NSString *)CFSTR("1.0");
}

- (id)requestBody
{
  id result;
  id v4;
  uint64_t v5;
  uint64_t v6;

  result = (id)objc_opt_new();
  if (result)
  {
    v4 = result;
    if (-[ACCAuthContextProtocol appID](-[ACCHTTPHandler context](self, "context"), "appID"))
    {
      objc_msgSend(v4, "setObject:forKey:", -[ACCAuthContextProtocol appID](-[ACCHTTPHandler context](self, "context"), "appID"), CFSTR("m"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 52, 0, "App ID is not set");
    }
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), "localeIdentifier");
    if (v5)
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("u"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 63, 0, "Unable to set localeIdentifier");
    }
    v6 = objc_msgSend((id)objc_msgSend(+[ACCComponents components](ACCComponents, "components"), "ticketManager"), "envelopeWithContext:", -[ACCHTTPHandler context](self, "context"));
    if (v6)
    {
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("za"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 74, 0, "Token envelope is not set");
    }
    if (-[ACMHTTPAuthenticationHandler policyVersion](self, "policyVersion"))
    {
      objc_msgSend(v4, "setObject:forKey:", -[ACMHTTPAuthenticationHandler policyVersion](self, "policyVersion"), CFSTR("pv"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 83, 0, "Policy version is not set");
    }
    if (-[ACCAuthContextProtocol dsKeyVersion](-[ACCHTTPHandler context](self, "context"), "dsKeyVersion"))
    {
      objc_msgSend(v4, "setObject:forKey:", -[ACCAuthContextProtocol dsKeyVersion](-[ACCHTTPHandler context](self, "context"), "dsKeyVersion"), CFSTR("t"));
    }
    else if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 92, 0, "DS Key version is not set");
    }
    return (id)objc_msgSend(v4, "copy");
  }
  return result;
}

- (BOOL)shouldValidateTGTs
{
  return 1;
}

- (BOOL)shouldReturnResponse:(id)a3 orReportError:(id *)a4
{
  unsigned int v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  if (!a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACMHTTPAuthenticationHandler.m"), 108, CFSTR("the error should not be nil!"));
  v13.receiver = self;
  v13.super_class = (Class)ACMHTTPAuthenticationHandler;
  v7 = -[ACCHTTPHandler shouldReturnResponse:orReportError:](&v13, sel_shouldReturnResponse_orReportError_, a3, a4);
  v8 = v7;
  if (a3)
  {
    if (v7)
    {
      if (!*a4)
      {
        if (-[ACMHTTPAuthenticationHandler shouldValidateTGTs](self, "shouldValidateTGTs"))
        {
          if (!objc_msgSend(a3, "objectForKey:", CFSTR("pt")))
          {
            v9 = (void *)MEMORY[0x24BDD1540];
            v10 = (void *)MEMORY[0x24BDBCE70];
            v11 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Response from server is malformed"));
            *a4 = (id)objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("HTTPServerErrorDomain"), -100360, objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x24BDD0FD8], 0));
            if (ACFLog)
            {
              if ((ACFLogSettingsGetLevelMask() & 8) != 0)
                ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler shouldReturnResponse:orReportError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 116, 0, "Response from server does not have TGT: %@", a3);
            }
          }
        }
      }
    }
  }
  return v8;
}

- (NSString)realm
{
  return self->_realm;
}

@end
