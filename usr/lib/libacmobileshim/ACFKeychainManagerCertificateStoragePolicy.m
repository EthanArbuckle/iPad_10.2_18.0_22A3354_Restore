@implementation ACFKeychainManagerCertificateStoragePolicy

- (id)keychainManager
{
  return (id)objc_msgSend(+[ACFComponents components](ACFComponents, "components"), "keychainManager");
}

- (BOOL)removeCertificateWithLabel:(id)a3 realm:(id)a4
{
  id v6;

  v6 = +[ACFKeychainItemInfo keychainItemInfo](ACFKeychainItemInfo, "keychainItemInfo", a3, a4);
  objc_msgSend(v6, "setClassCode:", *MEMORY[0x24BDE9228]);
  objc_msgSend(v6, "setLabel:", a3);
  return objc_msgSend(-[ACFKeychainManagerCertificateStoragePolicy keychainManager](self, "keychainManager"), "removeItemWithInfo:", v6);
}

- (BOOL)storeCertificate:(__SecCertificate *)a3 realm:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = +[ACFKeychainItemInfo keychainItemInfo](ACFKeychainItemInfo, "keychainItemInfo", a3, a4);
  objc_msgSend(v6, "setClassCode:", *MEMORY[0x24BDE9228]);
  objc_msgSend(v6, "setValueRef:", a3);
  if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    v7 = objc_msgSend(v6, "attributes");
    ACFLogNS(7, (uint64_t)"-[ACFKeychainManagerCertificateStoragePolicy storeCertificate:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManagerCertificateStoragePolicy.m", 35, 0, (uint64_t)CFSTR("Storing public key certificate with info = %@"), v8, v9, v7);
  }
  return objc_msgSend(-[ACFKeychainManagerCertificateStoragePolicy keychainManager](self, "keychainManager"), "storeItemWithInfo:share:result:", v6, 1, 0) == 0;
}

- (__SecCertificate)certificateWithLabel:(id)a3 realm:(id)a4
{
  id v6;
  __SecCertificate *result;

  v6 = +[ACFKeychainItemInfo keychainItemInfo](ACFKeychainItemInfo, "keychainItemInfo", a3, a4);
  objc_msgSend(v6, "setClassCode:", *MEMORY[0x24BDE9228]);
  objc_msgSend(v6, "setLabel:", a3);
  result = (__SecCertificate *)objc_msgSend((id)objc_msgSend(v6, "label"), "length");
  if (result)
  {
    objc_msgSend(v6, "setReturnRef:", 1);
    return (__SecCertificate *)objc_msgSend((id)objc_msgSend(-[ACFKeychainManagerCertificateStoragePolicy keychainManager](self, "keychainManager"), "searchItemWithInfo:", v6), "valueRef");
  }
  return result;
}

@end
