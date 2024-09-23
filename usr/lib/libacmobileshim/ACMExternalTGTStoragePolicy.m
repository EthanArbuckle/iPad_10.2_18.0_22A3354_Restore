@implementation ACMExternalTGTStoragePolicy

- (id)service
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "stringByAppendingString:", CFSTR(".appleconnect.tgt"));
}

- (id)searchItemWithInfo:(id)a3
{
  return (id)-[ACFKeychainManagerProtocol searchItemWithInfo:](-[ACMKeychainTGTStoragePolicy keychainManager](self, "keychainManager"), "searchItemWithInfo:", a3);
}

- (int)storeItemWithInfo:(id)a3
{
  objc_super v6;

  objc_msgSend(a3, "setAccessibleType:", *MEMORY[0x24BDE8FA0]);
  v6.receiver = self;
  v6.super_class = (Class)ACMExternalTGTStoragePolicy;
  return -[ACMKeychainTGTStoragePolicy storeItemWithInfo:](&v6, sel_storeItemWithInfo_, a3);
}

- (id)tokenDataWithDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACMExternalTGTStoragePolicy;
  return -[ACMExternalTGTStoragePolicy encryptTokenData:](self, "encryptTokenData:", -[ACMKeychainTGTStoragePolicy tokenDataWithDictionary:](&v4, sel_tokenDataWithDictionary_, a3));
}

- (id)tokenDictionaryWithData:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACMExternalTGTStoragePolicy;
  return -[ACMKeychainTGTStoragePolicy tokenDictionaryWithData:](&v4, sel_tokenDictionaryWithData_, -[ACMExternalTGTStoragePolicy decryptTokenData:](self, "decryptTokenData:", a3));
}

- (BOOL)performRemoveTokenWithPrincipal:(id)a3 service:(id)a4
{
  objc_super v8;

  -[ACMExternalTGTStoragePolicy resetSecret](self, "resetSecret");
  v8.receiver = self;
  v8.super_class = (Class)ACMExternalTGTStoragePolicy;
  return -[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:](&v8, sel_performRemoveTokenWithPrincipal_service_, a3, a4);
}

- (ACFCryptographProtocol)cryptograph
{
  return (ACFCryptographProtocol *)objc_msgSend(+[ACFComponents components](ACFComponents, "components"), "cryptograph");
}

- (id)preferences
{
  return (id)objc_msgSend(+[ACMExternalAppleConnectImplComponents components](ACMExternalAppleConnectImplComponents, "components"), "preferences");
}

- (NSData)secret
{
  NSData *v3;
  ACFCryptographProtocol *v4;
  NSData *v5;

  if (!self->_secret)
  {
    v3 = (NSData *)(id)objc_msgSend(-[ACMExternalTGTStoragePolicy preferences](self, "preferences"), "secret");
    self->_secret = v3;
    if (!-[NSData length](v3, "length"))
    {
      v4 = -[ACMExternalTGTStoragePolicy cryptograph](self, "cryptograph");
      v5 = (NSData *)(id)-[ACFCryptographProtocol randomDataOfLength:](v4, "randomDataOfLength:", 2 * kACFAES128KeySize);
      self->_secret = v5;
      objc_msgSend(-[ACMExternalTGTStoragePolicy preferences](self, "preferences"), "setSecret:", v5);
    }
  }
  return self->_secret;
}

- (void)resetSecret
{
  objc_msgSend(-[ACMExternalTGTStoragePolicy preferences](self, "preferences"), "setSecret:", 0);

  self->_secret = 0;
}

- (id)encryptTokenData:(id)a3
{
  NSData *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = -[ACMExternalTGTStoragePolicy secret](self, "secret");
  v6 = kACFAES128KeySize;
  if (-[NSData length](v5, "length") == 2 * v6)
  {
    v7 = -[NSData subdataWithRange:](v5, "subdataWithRange:", 0, kACFAES128KeySize);
    return (id)-[ACFCryptographProtocol encryptAES128CBCData:withKey:initializationVector:pading:](-[ACMExternalTGTStoragePolicy cryptograph](self, "cryptograph"), "encryptAES128CBCData:withKey:initializationVector:pading:", a3, -[NSData subdataWithRange:](v5, "subdataWithRange:", kACFAES128KeySize, kACFAES128KeySize), v7, 1);
  }
  else
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACMExternalTGTStoragePolicy encryptTokenData:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalTGTStoragePolicy.m", 119, 0, "Failed to write");
    }
    return 0;
  }
}

- (id)decryptTokenData:(id)a3
{
  NSData *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = -[ACMExternalTGTStoragePolicy secret](self, "secret");
  v6 = kACFAES128KeySize;
  if (-[NSData length](v5, "length") == 2 * v6)
  {
    v7 = -[NSData subdataWithRange:](v5, "subdataWithRange:", 0, kACFAES128KeySize);
    return (id)-[ACFCryptographProtocol decryptAES128CBCData:withKey:initializationVector:pading:](-[ACMExternalTGTStoragePolicy cryptograph](self, "cryptograph"), "decryptAES128CBCData:withKey:initializationVector:pading:", a3, -[NSData subdataWithRange:](v5, "subdataWithRange:", kACFAES128KeySize, kACFAES128KeySize), v7, 1);
  }
  else
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACMExternalTGTStoragePolicy decryptTokenData:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalTGTStoragePolicy.m", 136, 0, "Failed to read");
    }
    return 0;
  }
}

@end
