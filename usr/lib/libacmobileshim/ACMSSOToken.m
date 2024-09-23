@implementation ACMSSOToken

+ (id)tokenWithKeychainTokenInfo:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(a3, "generic");
  if (objc_msgSend(v3, "length"))
  {
    v4 = (id)objc_opt_new();
    objc_msgSend(v4, "setTokenData:", v3);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"+[ACMSSOToken tokenWithKeychainTokenInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMSSOToken.m", 56, 0, "Invalid keychain token info");
    return 0;
  }
  return v4;
}

+ (id)tokenWithToken:(id)a3 data:(id)a4
{
  id v6;

  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setNonce:", objc_msgSend(a3, "nonce"));
  objc_msgSend(v6, "setSessionToken:", objc_msgSend(a3, "sessionToken"));
  objc_msgSend(v6, "setCreationDate:", objc_msgSend(a3, "creationDate"));
  objc_msgSend(v6, "setExpirationDate:", objc_msgSend(a3, "expirationDate"));
  objc_msgSend(v6, "setRecentAuthenticationDate:", objc_msgSend(a3, "recentAuthenticationDate"));
  objc_msgSend(v6, "setRecentUnlockDate:", objc_msgSend(a3, "recentUnlockDate"));
  objc_msgSend(v6, "setPrincipal:", objc_msgSend(a3, "principal"));
  objc_msgSend(v6, "setTokenData:", a4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMSSOToken setSessionToken:](self, "setSessionToken:", 0);
  -[ACMSSOToken setRecentAuthenticationDate:](self, "setRecentAuthenticationDate:", 0);
  -[ACMSSOToken setRecentUnlockDate:](self, "setRecentUnlockDate:", 0);
  -[ACMSSOToken setInitialRequest:](self, "setInitialRequest:", 0);
  -[ACMSSOToken setPersonID:](self, "setPersonID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMSSOToken;
  -[ACMToken dealloc](&v3, sel_dealloc);
}

- (NSDictionary)tokenDictionary
{
  void *v3;
  NSString *v4;
  NSString *v5;
  void *v6;
  double v7;

  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = -[ACFPrincipal userName](-[ACMToken principal](self, "principal"), "userName");
  v5 = -[ACFPrincipal realm](-[ACMToken principal](self, "principal"), "realm");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[NSDate timeIntervalSince1970](-[ACMToken expirationDate](self, "expirationDate"), "timeIntervalSince1970");
  return (NSDictionary *)objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, CFSTR("b"), v5, CFSTR("c"), objc_msgSend(v6, "numberWithLongLong:", (uint64_t)(v7 * 1000.0)), CFSTR("e"), -[ACMToken nonce](self, "nonce"), CFSTR("o"), -[ACMSSOToken sessionToken](self, "sessionToken"), CFSTR("q"), 0);
}

- (ACFMessage)initialRequest
{
  return self->_initialRequest;
}

- (void)setInitialRequest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSDate)recentAuthenticationDate
{
  return self->_recentAuthenticationDate;
}

- (void)setRecentAuthenticationDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSDate)recentUnlockDate
{
  return self->_recentUnlockDate;
}

- (void)setRecentUnlockDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSString)clientSecret
{
  return self->_clientSecret;
}

- (void)setClientSecret:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)clientSecretCreationTimestamp
{
  return self->_clientSecretCreationTimestamp;
}

- (void)setClientSecretCreationTimestamp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (BOOL)longLiveSession
{
  return self->_longLiveSession;
}

- (void)setLongLiveSession:(BOOL)a3
{
  self->_longLiveSession = a3;
}

@end
