@implementation ACMKeychainTokenInfo

- (ACMKeychainTokenInfo)init
{
  ACMKeychainTokenInfo *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACMKeychainTokenInfo;
  v2 = -[ACFKeychainItemInfo init](&v4, sel_init);
  if (v2)
    -[ACFKeychainItemInfo setClassCode:](v2, "setClassCode:", +[ACMKeychainTokenInfo classCode](ACMKeychainTokenInfo, "classCode"));
  return v2;
}

+ (id)classCode
{
  return (id)*MEMORY[0x24BDE9230];
}

+ (id)keychainTokenInfoWithPrincipal:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "keychainItemInfo");
  if (objc_msgSend((id)objc_msgSend(a3, "realm"), "length"))
  {
    objc_msgSend(v4, "setService:", objc_msgSend(a3, "realm"));
    if (objc_msgSend((id)objc_msgSend(a3, "userName"), "length"))
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 48, 0, "Creating info with principal %@", a3);
      objc_msgSend(v4, "setAccount:", objc_msgSend(a3, "principalString"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    {
      ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 53, 0, "Creating info with %@ realm and any user", objc_msgSend(a3, "realm"));
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 58, 0, "Creating info for any user and realm");
  }
  return v4;
}

+ (id)keychainTokenInfoWithPrincipal:(id)a3 indicator:(id)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(a1, "keychainItemInfo");
  v7 = v6;
  if (a4)
    objc_msgSend(v6, "setService:", a4);
  if (objc_msgSend((id)objc_msgSend(a3, "realm"), "length"))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "userName"), "length"))
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 77, 0, "Creating info with principal %@", a3);
      objc_msgSend(v7, "setAccount:", objc_msgSend(a3, "principalString"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    {
      ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 82, 0, "Creating info with %@ realm and any user", objc_msgSend(a3, "realm"));
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 87, 0, "Creating info for any user and realm");
  }
  return v7;
}

- (void)setPrincipal:(id)a3
{
  -[ACFKeychainItemInfo setService:](self, "setService:", objc_msgSend(a3, "realm"));
  -[ACFKeychainItemInfo setAccount:](self, "setAccount:", objc_msgSend(a3, "principalString"));
}

- (ACFPrincipal)principal
{
  return +[ACFPrincipal principalWithPrincipalString:](ACFPrincipal, "principalWithPrincipalString:", -[ACFKeychainItemInfo account](self, "account"));
}

@end
