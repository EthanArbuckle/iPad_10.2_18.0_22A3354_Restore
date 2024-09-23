@implementation ACCAuthContext

+ (id)authContextWithRequest:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"+[ACCAuthContext authContextWithRequest:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCAuthContext.m", 47, 0, "Creating initial token");
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:", a3);
}

- (ACCAuthContext)initWithRequest:(id)a3
{
  ACCAuthContext *v4;
  ACCAuthContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACCAuthContext;
  v4 = -[ACCAuthContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[ACCAuthContext setDsKeyVersion:](v4, "setDsKeyVersion:", CFSTR("0.0"));
    -[ACCAuthContext setPrincipal:](v5, "setPrincipal:", objc_msgSend(a3, "principal"));
    -[ACCAuthContext setAppID:](v5, "setAppID:", objc_msgSend(a3, "appID"));
    -[ACCAuthContext setAppIDKey:](v5, "setAppIDKey:", objc_msgSend(a3, "appIDKey"));
    -[ACCAuthContext setCreationDate:](v5, "setCreationDate:", objc_msgSend(MEMORY[0x24BDBCE60], "date"));
    -[ACCAuthContext setServiceName:](v5, "setServiceName:", objc_msgSend(a3, "serviceName"));
    -[ACCAuthContext setRequest:](v5, "setRequest:", a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[ACCAuthContext setDsKeyVersion:](self, "setDsKeyVersion:", 0);
  -[ACCAuthContext setAppID:](self, "setAppID:", 0);
  -[ACCAuthContext setAppIDKey:](self, "setAppIDKey:", 0);
  -[ACCAuthContext setRequest:](self, "setRequest:", 0);
  -[ACCAuthContext setNonce:](self, "setNonce:", 0);
  -[ACCAuthContext setEncryptionHash:](self, "setEncryptionHash:", 0);
  -[ACCAuthContext setOldUserKey:](self, "setOldUserKey:", 0);
  -[ACCAuthContext setCurrentUserKey:](self, "setCurrentUserKey:", 0);
  -[ACCAuthContext setPrincipal:](self, "setPrincipal:", 0);
  -[ACCAuthContext setCreationDate:](self, "setCreationDate:", 0);
  -[ACCAuthContext setExpirationDate:](self, "setExpirationDate:", 0);
  -[ACCAuthContext setSessionToken:](self, "setSessionToken:", 0);
  -[ACCAuthContext setTokenVersion:](self, "setTokenVersion:", 0);
  -[ACCAuthContext setTwoStepVerificationCode:](self, "setTwoStepVerificationCode:", 0);
  -[ACCAuthContext setPersonID:](self, "setPersonID:", 0);
  -[ACCAuthContext setSelectedDeviceId:](self, "setSelectedDeviceId:", 0);
  -[ACCAuthContext setSelectedDeviceType:](self, "setSelectedDeviceType:", 0);
  -[ACCAuthContext setServiceName:](self, "setServiceName:", 0);
  -[ACCAuthContext setRecoveryKey:](self, "setRecoveryKey:", 0);
  -[ACCAuthContext setClientSecretTokenHmac:](self, "setClientSecretTokenHmac:", 0);
  -[ACCAuthContext setClientSecretCreateDate:](self, "setClientSecretCreateDate:", 0);
  -[ACCAuthContext setTouchIDSupport:](self, "setTouchIDSupport:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACCAuthContext;
  -[ACCAuthContext dealloc](&v3, sel_dealloc);
}

- (NSDate)expirationDate
{
  if (self->_expirationDate)
    return self->_expirationDate;
  else
    return -[NSDate dateByAddingTimeInterval:](-[ACCAuthContext creationDate](self, "creationDate"), "dateByAddingTimeInterval:", 300.0);
}

- (void)setExpirationDate:(id)a3
{
  NSDate *expirationDate;
  NSDate *v6;

  expirationDate = self->_expirationDate;
  if (expirationDate != a3)
  {
    v6 = expirationDate;
    self->_expirationDate = (NSDate *)a3;
  }
}

- (NSMutableDictionary)parametersDictionary
{
  NSMutableDictionary *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (NSMutableDictionary *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[NSString length](-[ACFPrincipal realm](-[ACCAuthContext principal](self, "principal"), "realm"), "length"))
  {
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext tokenVersion](self, "tokenVersion"), CFSTR("a"));
    if (-[NSString length](-[ACFPrincipal userName](-[ACCAuthContext principal](self, "principal"), "userName"), "length"))
    {
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACFPrincipal userName](-[ACCAuthContext principal](self, "principal"), "userName"), CFSTR("b"));
    }
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACFPrincipal realm](-[ACCAuthContext principal](self, "principal"), "realm"), CFSTR("c"));
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[NSDate timeIntervalSince1970](-[ACCAuthContext creationDate](self, "creationDate"), "timeIntervalSince1970");
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(v4, "numberWithUnsignedLongLong:", (unint64_t)(v5 * 1000.0)), CFSTR("d"));
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[NSDate timeIntervalSince1970](-[ACCAuthContext expirationDate](self, "expirationDate"), "timeIntervalSince1970");
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(v6, "numberWithUnsignedLongLong:", (unint64_t)(v7 * 1000.0)), CFSTR("e"));
    if (-[ACCAuthContext appID](self, "appID"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext appID](self, "appID"), CFSTR("m"));
    if (-[NSString length](-[ACCAuthContext appIDKey](self, "appIDKey"), "length"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext appIDKey](self, "appIDKey"), CFSTR("n"));
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext nonce](self, "nonce"), CFSTR("o"));
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext dsKeyVersion](self, "dsKeyVersion"), CFSTR("t"));
    if (-[ACCAuthContext encryptionHash](self, "encryptionHash"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext encryptionHash](self, "encryptionHash"), CFSTR("sh"));
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext authenticationType](self, "authenticationType"), CFSTR("s"));
    if (-[ACCAuthContext sessionToken](self, "sessionToken"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext sessionToken](self, "sessionToken"), CFSTR("q"));
    if (-[ACCAuthContext currentUserKey](self, "currentUserKey"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext currentUserKey](self, "currentUserKey"), CFSTR("nv"));
    if (-[ACCAuthContext oldUserKey](self, "oldUserKey"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext oldUserKey](self, "oldUserKey"), CFSTR("ov"));
    if (-[ACCAuthContext personID](self, "personID"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext personID](self, "personID"), CFSTR("pid"));
    if (-[ACCAuthContext serviceName](self, "serviceName"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext serviceName](self, "serviceName"), CFSTR("sn"));
    if (-[ACCAuthContext selectedDeviceId](self, "selectedDeviceId"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext selectedDeviceId](self, "selectedDeviceId"), CFSTR("di"));
    if (-[ACCAuthContext selectedDeviceType](self, "selectedDeviceType"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext selectedDeviceType](self, "selectedDeviceType"), CFSTR("dk"));
    if (-[ACCAuthContext twoStepVerificationCode](self, "twoStepVerificationCode"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext twoStepVerificationCode](self, "twoStepVerificationCode"), CFSTR("sc"));
    if (-[ACCAuthContext clientSecretTokenHmac](self, "clientSecretTokenHmac"))
    {
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext clientSecretTokenHmac](self, "clientSecretTokenHmac"), CFSTR("ho"));
      if (-[ACCAuthContext clientSecretCreateDate](self, "clientSecretCreateDate"))
        -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext clientSecretCreateDate](self, "clientSecretCreateDate"), CFSTR("ccd"));
    }
    if (-[ACCAuthContext recoveryKey](self, "recoveryKey"))
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", -[ACCAuthContext recoveryKey](self, "recoveryKey"), CFSTR("rk"));
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v10 = objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone"), "name");
    if (v9)
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v9, CFSTR("lc"));
    if (v10)
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v10, CFSTR("lr"));
    if (v11)
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v11, CFSTR("tz"));
  }
  return v3;
}

- (NSString)xmlTokenSourceString
{
  NSMutableDictionary *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v8;

  v3 = -[ACCAuthContext parametersDictionary](self, "parametersDictionary");
  v8 = 0;
  v4 = objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 100, 0, &v8);
  if (v8)
  {
    if (!ACFLog)
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
      goto LABEL_10;
    }
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCAuthContext xmlTokenSourceString]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCAuthContext.m", 230, 0, "Failed to create plist: %@", v8);
  }
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
  if (!ACFLog)
    return (NSString *)-[ACCAuthContext strippedPropertyListString:](self, "strippedPropertyListString:", v5);
  if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACCAuthContext xmlTokenSourceString]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCAuthContext.m", 233, 0, "SIZE TEST: Token source string size is %d", objc_msgSend(v5, "length"));
LABEL_10:
  v6 = -[ACCAuthContext strippedPropertyListString:](self, "strippedPropertyListString:", v5);
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACCAuthContext xmlTokenSourceString]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCAuthContext.m", 235, 0, "SIZE TEST: Stripped token source string size is %d", objc_msgSend(v6, "length"));
  return (NSString *)v6;
}

- (id)strippedPropertyListString:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n")), "componentsJoinedByString:", &stru_24FCE58F0), "componentsSeparatedByString:", CFSTR("\t")), "componentsJoinedByString:", &stru_24FCE58F0);
}

- (NSString)dsKeyVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDsKeyVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)appID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAppID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)appIDKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppIDKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (ACFMessage)request
{
  return (ACFMessage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)nonce
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNonce:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)encryptionHash
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEncryptionHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
  self->_authenticationType = (NSNumber *)a3;
}

- (NSString)oldUserKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOldUserKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)currentUserKey
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentUserKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (ACFPrincipal)principal
{
  return (ACFPrincipal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrincipal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)sessionToken
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSString)tokenVersion
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTokenVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)twoStepVerificationCode
{
  return self->_twoStepVerificationCode;
}

- (void)setTwoStepVerificationCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSString)selectedDeviceId
{
  return self->_selectedDeviceId;
}

- (void)setSelectedDeviceId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSString)selectedDeviceType
{
  return self->_selectedDeviceType;
}

- (void)setSelectedDeviceType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSString)clientSecretTokenHmac
{
  return self->_clientSecretTokenHmac;
}

- (void)setClientSecretTokenHmac:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSNumber)clientSecretCreateDate
{
  return self->_clientSecretCreateDate;
}

- (void)setClientSecretCreateDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSNumber)touchIDSupport
{
  return self->_touchIDSupport;
}

- (void)setTouchIDSupport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

@end
