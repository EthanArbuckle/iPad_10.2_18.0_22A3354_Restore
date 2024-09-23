@implementation ACCTicketManager

- (id)cryptograph
{
  return (id)objc_msgSend(+[ACFComponents components](ACFComponents, "components"), "cryptograph");
}

- (id)certificateStoragePolicy
{
  return (id)objc_msgSend(+[ACFComponents components](ACFComponents, "components"), "certificateStoragePolicy");
}

- (ACCSSOTGTStoragePolicy)tgtStoragePolicy
{
  return (ACCSSOTGTStoragePolicy *)objc_msgSend(+[ACCComponents components](ACCComponents, "components"), "tgtStoragePolicy");
}

- (void)dealloc
{
  objc_super v3;

  -[ACCTicketManager setAuthContextClass:](self, "setAuthContextClass:", 0);
  -[ACCTicketManager setSsoTokenClass:](self, "setSsoTokenClass:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACCTicketManager;
  -[ACCTicketManager dealloc](&v3, sel_dealloc);
}

- (__SecCertificate)certificateFromString:(id)a3
{
  const __CFData *v5;

  if (objc_msgSend(a3, "length"))
  {
    v5 = (const __CFData *)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "decodeBase64:", a3);
    if (-[__CFData length](v5, "length"))
      return SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v5);
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACCTicketManager certificateFromString:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 68, 0, "Failed to decode PEM data");
    }
  }
  return 0;
}

- (BOOL)installCertificateWithString:(id)a3 version:(id)a4 forRealm:(id)a5
{
  void *v9;
  __SecCertificate *v10;
  __SecCertificate *v11;
  BOOL v12;

  if (!objc_msgSend(a3, "length") || !objc_msgSend(a4, "length"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCTicketManager installCertificateWithString:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 98, 0, "Public key or version missing in the server response");
    return 0;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACCTicketManager installCertificateWithString:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 79, 0, "Install new public key with version %@", a4);
  v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("-----BEGIN CERTIFICATE-----")), "componentsJoinedByString:", &stru_24FCE58F0), "componentsSeparatedByString:", CFSTR("-----END CERTIFICATE-----")), "componentsJoinedByString:", &stru_24FCE58F0);
  v10 = -[ACCTicketManager certificateFromString:](self, "certificateFromString:", objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet")), "componentsJoinedByString:", &stru_24FCE58F0));
  if (!v10)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCTicketManager installCertificateWithString:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 93, 0, "Failed to read certificate data");
    return 0;
  }
  v11 = v10;
  v12 = -[ACCTicketManager setPublicKeyWithCertificate:version:forRealm:](self, "setPublicKeyWithCertificate:version:forRealm:", v10, a4, a5) != 0;
  CFRelease(v11);
  return v12;
}

- (void)uninstallPublicKeyForRealm:(id)a3
{
  objc_msgSend(-[ACCTicketManager certificateStoragePolicy](self, "certificateStoragePolicy"), "removeCertificateWithLabel:realm:", -[ACCTicketManager certificateLabelForRealm:](self, "certificateLabelForRealm:", a3), a3);
}

- (__SecCertificate)certificateForRealm:(id)a3
{
  id v5;
  __SecCertificate *result;

  v5 = -[ACCTicketManager certificateLabelForRealm:](self, "certificateLabelForRealm:");
  result = (__SecCertificate *)objc_msgSend(v5, "length");
  if (result)
    return (__SecCertificate *)objc_msgSend(-[ACCTicketManager certificateStoragePolicy](self, "certificateStoragePolicy"), "certificateWithLabel:realm:", v5, a3);
  return result;
}

- (__SecKey)publicKeyForRealm:(id)a3
{
  __SecCertificate *v5;
  const void *v6;
  SecPolicyRef BasicX509;
  OSStatus v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  int v14;
  SecTrustRef trust;

  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0)
    ACFProfileStart((uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 121, 0, 0);
  v5 = -[ACCTicketManager certificateForRealm:](self, "certificateForRealm:", a3);
  if (v5
    || (v5 = -[ACCTicketManager defaultPublicKeyCertificateForRealm:](self, "defaultPublicKeyCertificateForRealm:", a3)) != 0)
  {
    v6 = (const void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5);
    BasicX509 = SecPolicyCreateBasicX509();
    trust = 0;
    v8 = SecTrustCreateWithCertificates(v6, BasicX509, &trust);
    if (trust)
    {
      v9 = (void *)MEMORY[0x2348A38EC]();
      if (v9)
        goto LABEL_13;
      v14 = 0;
      v10 = MEMORY[0x2348A3904](trust, &v14);
      if (v10)
      {
        if (ACFLog)
        {
          v11 = v10;
          if ((ACFLogSettingsGetLevelMask() & 8) != 0)
            ACFLog(3, (uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 155, 0, "Trust evaluate failed with code: %d", v11);
        }
      }
      v9 = (void *)MEMORY[0x2348A38EC](trust);
      if (v9)
      {
LABEL_13:
        v12 = v9;
      }
      else
      {
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
          ACFLog(3, (uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 167, 0, "Failed create public key");
        v9 = 0;
      }
      CFRelease(trust);
    }
    else
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 173, 0, "Failed to create trust instance with error: %d", v8);
      v9 = 0;
    }
    CFRelease(BasicX509);
  }
  else
  {
    v9 = 0;
  }
  if (ACFProfileEnd && (ACFLogSettingsGetLevelMask() & 0x100) != 0)
    ACFProfileEnd((uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 178, 0, 0);
  return (__SecKey *)v9;
}

- (BOOL)hasValidPublicKeyForRealm:(id)a3
{
  uint64_t v5;

  if (a3)
  {
    v5 = objc_msgSend(-[ACCTicketManager publicKeyVersionForRealm:](self, "publicKeyVersionForRealm:"), "compare:", -[ACCTicketManager defaultPublicKeyVersionForRealm:](self, "defaultPublicKeyVersionForRealm:", a3));
    if (v5)
      LOBYTE(v5) = -[ACCTicketManager publicKeyForRealm:](self, "publicKeyForRealm:", a3) != 0;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)setPublicKeyWithCertificate:(__SecCertificate *)a3 version:(id)a4 forRealm:(id)a5
{
  id v9;
  __CFString *v10;
  id v11;

  v9 = -[ACCTicketManager certificateStoragePolicy](self, "certificateStoragePolicy");
  v10 = (id)SecCertificateCopySubjectSummary(a3);
  v11 = -[ACCTicketManager certificateLabelForRealm:](self, "certificateLabelForRealm:", a5);
  if (objc_msgSend(v11, "length"))
  {
    -[ACCTicketManager uninstallPublicKeyForRealm:](self, "uninstallPublicKeyForRealm:", a5);
  }
  else if (!v11 || (-[__CFString isEqualToString:](v10, "isEqualToString:", v11) & 1) == 0)
  {
    if (objc_msgSend(v9, "removeCertificateWithLabel:realm:", v10, a5))
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACCTicketManager setPublicKeyWithCertificate:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 219, 0, "Removed previous certificate");
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACCTicketManager setPublicKeyWithCertificate:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 223, 0, "Error trying to remove certificate %@", v10);
    }
  }
  if ((objc_msgSend(v9, "storeCertificate:realm:", a3, a5) & 1) != 0)
  {
    -[ACCTicketManager setPublickKeyVersion:label:forRealm:](self, "setPublickKeyVersion:label:forRealm:", a4, v10, a5);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCTicketManager setPublicKeyWithCertificate:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 229, 0, "Error trying to store certificate");
    return 0;
  }
  return v10;
}

- (void)setPublickKeyVersion:(id)a3 label:(id)a4 forRealm:(id)a5
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (__SecCertificate)defaultPublicKeyCertificateForRealm:(id)a3
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)defaultPublicKeyVersionForRealm:(id)a3
{
  return CFSTR("0.0");
}

- (id)publicKeyVersionForRealm:(id)a3
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)certificateLabelForRealm:(id)a3
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)createNonceString
{
  return (id)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "randomStringOfLength:", 32);
}

- (id)envelopeWithContext:(id)a3
{
  id v3;
  uint64_t v5;
  __SecKey *v6;

  v3 = a3;
  if (a3)
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "principal"), "realm");
    v6 = -[ACCTicketManager publicKeyForRealm:](self, "publicKeyForRealm:", v5);
    objc_msgSend(v3, "setDsKeyVersion:", -[ACCTicketManager publicKeyVersionForRealm:](self, "publicKeyVersionForRealm:", v5));
    v3 = -[ACCTicketManager envelopeWithContext:publicKey:](self, "envelopeWithContext:publicKey:", v3, v6);
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACCTicketManager envelopeWithContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 293, 0, "Created token envelope");
  return v3;
}

- (id)envelopeWithContext:(id)a3 publicKey:(__SecKey *)a4
{
  id v7;
  id v8;
  uint64_t v9;

  if (!a3 || !a4)
    return 0;
  v7 = -[ACCTicketManager cryptograph](self, "cryptograph");
  objc_msgSend(a3, "setEncryptionKey:", objc_msgSend(v7, "randomDataOfLength:", kACFAES128KeySize));
  v8 = -[ACCTicketManager cryptograph](self, "cryptograph");
  objc_msgSend(a3, "setInitializationVector:", objc_msgSend(v8, "randomDataOfLength:", kACFAES128KeySize));
  v9 = objc_msgSend((id)objc_msgSend(a3, "tokenSourceString"), "dataUsingEncoding:", 4);
  return -[ACCTicketManager envelopEncryptedSourceToken:dsKeyVersion:encryptedRandomKey:initializationVector:tokenDataHMAC:tokenVersion:](self, "envelopEncryptedSourceToken:dsKeyVersion:encryptedRandomKey:initializationVector:tokenDataHMAC:tokenVersion:", -[ACCTicketManager encryptSourceTokenWithSourceTokenData:encryptionKey:initializationVector:](self, "encryptSourceTokenWithSourceTokenData:encryptionKey:initializationVector:", objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "compressData:", v9), -[ACCTicketManager encryptionKeyWithRandomKey:](self, "encryptionKeyWithRandomKey:", objc_msgSend(a3, "encryptionKey")), objc_msgSend(a3, "initializationVector")), objc_msgSend(a3, "dsKeyVersion"), objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encryptData:withKey:", objc_msgSend(a3, "encryptionKey"), a4), objc_msgSend(a3, "initializationVector"), -[ACCTicketManager tokenDataHMACForRandomKey:sourceTokenData:](
             self,
             "tokenDataHMACForRandomKey:sourceTokenData:",
             objc_msgSend(a3, "encryptionKey"),
             v9),
           -[ACCTicketManager tokenVersion](self, "tokenVersion"));
}

- (id)encryptSourceTokenWithSourceTokenData:(id)a3 encryptionKey:(id)a4 initializationVector:(id)a5
{
  if (objc_msgSend(a3, "length") && objc_msgSend(a4, "length") && objc_msgSend(a5, "length"))
    return (id)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encryptAES128CBCData:withKey:initializationVector:pading:", a3, a4, a5, 1);
  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCTicketManager encryptSourceTokenWithSourceTokenData:encryptionKey:initializationVector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 343, 0, "Invalid parameters");
  }
  return 0;
}

- (id)decryptEncryptedContent:(id)a3 withHmac:(id)a4 context:(id)a5
{
  if (objc_msgSend(a3, "length"))
  {
    if (a4)
    {
      if (objc_msgSend((id)objc_msgSend(a5, "encryptionKey"), "length"))
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeBase16:", -[ACCTicketManager tokenDataHMACForRandomKey:sourceTokenData:](self, "tokenDataHMACForRandomKey:sourceTokenData:", objc_msgSend(a5, "encryptionKey"), a3)), "lowercaseString"), "isEqualToString:", a4))
        {
          if (objc_msgSend((id)objc_msgSend(a5, "initializationVector"), "length"))
            return (id)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "decryptAES128CBCData:withKey:initializationVector:pading:", a3, -[ACCTicketManager encryptionKeyWithRandomKey:](self, "encryptionKeyWithRandomKey:", objc_msgSend(a5, "encryptionKey")), objc_msgSend(a5, "initializationVector"), 0);
          if (ACFLog)
          {
            if ((ACFLogSettingsGetLevelMask() & 8) != 0)
              ACFLog(3, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 371, 0, "Invalid initialization vector");
          }
        }
        else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        {
          ACFLog(3, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 376, 0, "TGT checksum does not match");
        }
      }
      else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      {
        ACFLog(3, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 381, 0, "Key is empty");
      }
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 386, 0, "HMAC is invalid");
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
  {
    ACFLog(6, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 391, 0, "Nothing to decrypt");
  }
  return 0;
}

- (id)envelopEncryptedSourceToken:(id)a3 dsKeyVersion:(id)a4 encryptedRandomKey:(id)a5 initializationVector:(id)a6 tokenDataHMAC:(id)a7 tokenVersion:(id)a8
{
  void *v15;

  if (!objc_msgSend(a3, "length") || !objc_msgSend(a5, "length"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCTicketManager envelopEncryptedSourceToken:dsKeyVersion:encryptedRandomKey:initializationVector:tokenDataHMAC:tokenVersion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 429, 0, "Invalid parameters");
    return 0;
  }
  if (!-[ACCTicketManager identifier](self, "identifier"))
    return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a4, CFSTR("t"), a3, CFSTR("enc"), a5, CFSTR("ek"), 0);
  if (!objc_msgSend(a4, "length")
    || !objc_msgSend(a6, "length")
    || !objc_msgSend(a7, "length")
    || !objc_msgSend(a8, "length"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCTicketManager envelopEncryptedSourceToken:dsKeyVersion:encryptedRandomKey:initializationVector:tokenDataHMAC:tokenVersion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 423, 0, "Invalid parameters");
    return 0;
  }
  v15 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", a4, CFSTR("t"), a3, CFSTR("enc"), a5, CFSTR("ek"), -[ACCTicketManager identifier](self, "identifier"), CFSTR("ex"), a7, CFSTR("hmac"), a6, CFSTR("iv"), a8, CFSTR("a"), 0);
  if (-[ACCTicketManager clientID](self, "clientID") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ACCTicketManager clientID](self, "clientID")), CFSTR("cid"));
  return (id)objc_msgSend(v15, "copy");
}

- (id)authContextWithRequest:(id)a3
{
  void *v5;

  v5 = (void *)-[objc_class authContextWithRequest:](-[ACCTicketManager authContextClass](self, "authContextClass"), "authContextWithRequest:", a3);
  objc_msgSend(v5, "setNonce:", -[ACCTicketManager createNonceString](self, "createNonceString"));
  objc_msgSend(v5, "setDsKeyVersion:", -[ACCTicketManager publicKeyVersionForRealm:](self, "publicKeyVersionForRealm:", objc_msgSend((id)objc_msgSend(a3, "principal"), "realm")));
  objc_msgSend(v5, "setTokenVersion:", -[ACCTicketManager tokenVersion](self, "tokenVersion"));
  return v5;
}

- (id)authContextWithRequest:(id)a3 keyCode:(id)a4 authenticationType:(id)a5
{
  id v5;

  v5 = a3;
  if (a3)
  {
    if (objc_msgSend(a4, "length"))
    {
      v5 = -[ACCTicketManager authContextWithRequest:](self, "authContextWithRequest:", v5);
      objc_msgSend(v5, "setAuthenticationType:", a5);
      -[ACCTicketManager updateContextEncryptionHash:withKeyCode:](self, "updateContextEncryptionHash:withKeyCode:", v5, a4);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)authContextWithRequest:(id)a3 sessionToken:(id)a4
{
  id v5;

  v5 = -[ACCTicketManager authContextWithRequest:](self, "authContextWithRequest:", a3);
  objc_msgSend(v5, "setSessionToken:", a4);
  return v5;
}

- (void)updateContextEncryptionHash:(id)a3 withKeyCode:(id)a4
{
  objc_msgSend(a3, "setEncryptionHash:", objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "hashStringSHA256WithString:", a4));
}

- (id)identifier
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)clientID
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tokenVersion
{
  return CFSTR("3.0");
}

- (id)prepareToken:(id)a3 withTGTInfo:(id)a4
{
  id v4;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  if (a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("e")), "doubleValue");
    objc_msgSend(v4, "setExpirationDate:", objc_msgSend(v6, "dateWithTimeIntervalSince1970:", v7 / 1000.0));
    if (!objc_msgSend(v4, "expirationDate"))
    {
      v4 = 0;
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 8) != 0)
          ACFLog(3, (uint64_t)"-[ACCTicketManager prepareToken:withTGTInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 506, 0, "Expiration date is missing");
        return 0;
      }
    }
    if (v4)
    {
      objc_msgSend(v4, "setSessionToken:", objc_msgSend(a4, "objectForKey:", CFSTR("q")));
      if (!objc_msgSend((id)objc_msgSend(v4, "sessionToken"), "length"))
      {
        v4 = 0;
        if (ACFLog)
        {
          if ((ACFLogSettingsGetLevelMask() & 8) != 0)
            ACFLog(3, (uint64_t)"-[ACCTicketManager prepareToken:withTGTInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 516, 0, "Session token is missing");
          return 0;
        }
      }
      if (v4)
      {
        v8 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("b"));
        if (!objc_msgSend(v8, "length"))
        {
          v4 = 0;
          if (ACFLog)
          {
            if ((ACFLogSettingsGetLevelMask() & 8) != 0)
              ACFLog(3, (uint64_t)"-[ACCTicketManager prepareToken:withTGTInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 528, 0, "User name is missing");
            return 0;
          }
        }
        if (v4)
        {
          v9 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("c"));
          v10 = objc_msgSend(v9, "length");
          if (v10)
            v11 = v4;
          else
            v11 = 0;
          if (!v10 && ACFLog)
          {
            if ((ACFLogSettingsGetLevelMask() & 8) != 0)
              ACFLog(3, (uint64_t)"-[ACCTicketManager prepareToken:withTGTInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 538, 0, "Realm is missing");
            return 0;
          }
          if (!v11)
            return 0;
          if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("lls")), "integerValue"))
            objc_msgSend(v11, "setLongLiveSession:", 1);
          objc_msgSend(v11, "setPersonID:", objc_msgSend(a4, "objectForKey:", CFSTR("a")));
          objc_msgSend(v11, "setPrincipal:", +[ACFPrincipal principalWithUserName:realm:](ACFPrincipal, "principalWithUserName:realm:", v8, v9));
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "setUserPreferences:", objc_msgSend(a4, "objectForKey:", CFSTR("ap")));
        }
      }
    }
  }
  return v4;
}

- (void)prepareTokenFor2SV:(id)a3 withVerificationCode:(id)a4 tgtInfo:(id)a5
{
  void *v9;
  uint64_t v10;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 567, 0, "2SV code flow");
  objc_msgSend(a3, "setPersonID:", objc_msgSend(a5, "objectForKey:", CFSTR("a")));
  objc_msgSend(a3, "setIsTwoStepVerificationRequired:", objc_msgSend(a5, "objectForKey:", CFSTR("se")));
  if (!objc_msgSend(a3, "isTwoStepVerificationRequired"))
    objc_msgSend(a3, "setIsTwoStepVerificationRequired:", objc_msgSend(a5, "objectForKey:", CFSTR("sap")));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "setIsUserEnrolledFor2SV:", objc_msgSend(a5, "objectForKey:", CFSTR("sac")));
  if (objc_msgSend(a4, "length"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 582, 0, "TGT obtained on 2-step verification");
    v9 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("cs"));
    v10 = objc_msgSend(a5, "objectForKey:", CFSTR("ccd"));
    if (objc_msgSend(a3, "principal") && objc_msgSend(v9, "length") && objc_msgSend(a3, "personID") && v10)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a3, "setClientSecret:", v9);
        objc_msgSend(a3, "setClientSecretCreationTimestamp:", v10);
        -[ACCTicketManager tokenDidReceive2SVSecret:](self, "tokenDidReceive2SVSecret:", a3);
      }
    }
    else
    {
      if (!objc_msgSend(a3, "personID") && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 599, 0, "Person ID is missing");
      if (!objc_msgSend(v9, "length") && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 603, 0, "cSecret is missing");
      if (!v10 && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 607, 0, "cSecret create date is missing");
    }
  }
}

- (id)createSSOTokenWithContent:(id)a3 context:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v12;

  v7 = objc_msgSend(a3, "length");
  if (a4 && v7)
  {
    v12 = 100;
    v8 = objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, &v12, 0);
    if (v8)
    {
      -[ACCTicketManager ssoTokenClass](self, "ssoTokenClass");
      v9 = (id)objc_opt_new();
      objc_msgSend(v9, "setNonce:", objc_msgSend(a4, "nonce"));
      objc_msgSend(v9, "setCreationDate:", objc_msgSend(a4, "creationDate"));
      objc_msgSend(v9, "setRecentAuthenticationDate:", objc_msgSend(a4, "creationDate"));
      objc_msgSend(v9, "setInitialRequest:", objc_msgSend(a4, "request"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "setRecentUnlockDate:", objc_msgSend(a4, "creationDate"));
    }
    else
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACCTicketManager createSSOTokenWithContent:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 637, 0, "Failed to create SSO token");
      v9 = 0;
    }
    v10 = -[ACCTicketManager prepareToken:withTGTInfo:](self, "prepareToken:withTGTInfo:", v9, v8);
    if (v10)
      -[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:](self, "prepareTokenFor2SV:withVerificationCode:tgtInfo:", v10, objc_msgSend(a4, "twoStepVerificationCode"), v8);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCTicketManager createSSOTokenWithContent:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 649, 0, "Invalid Parameters");
    if (!objc_msgSend(a3, "length") && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCTicketManager createSSOTokenWithContent:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 653, 0, "Content is empty");
    v10 = 0;
    if (!a4 && ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACCTicketManager createSSOTokenWithContent:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 657, 0, "Token is absent");
      return 0;
    }
  }
  return v10;
}

- (BOOL)storeSSOToken:(id)a3
{
  if (!a3)
    return 0;
  if (!-[ACCTicketManager tgtStoragePolicy](self, "tgtStoragePolicy"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACCTicketManager.m"), 669, CFSTR("Invalid setup"));
  return -[ACCSSOTGTStoragePolicy storeToken:](-[ACCTicketManager tgtStoragePolicy](self, "tgtStoragePolicy"), "storeToken:", a3);
}

- (id)fetchSSOTokenForPrincipal:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 677, 0, "Fetching token ignoring idle expiration timeout");
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  return -[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:](self, "fetchSSOTokenForPrincipal:agedLessThan:", a3);
}

- (id)fetchSSOTokenForPrincipal:(id)a3 agedLessThan:(double)a4
{
  id result;
  id v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  uint64_t v15;

  if (!-[ACCTicketManager tgtStoragePolicy](self, "tgtStoragePolicy"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACCTicketManager.m"), 683, CFSTR("Invalid setup"));
  result = (id)-[ACCSSOTGTStoragePolicy searchTokenWithPrincipal:](-[ACCTicketManager tgtStoragePolicy](self, "tgtStoragePolicy"), "searchTokenWithPrincipal:", a3);
  if (result)
  {
    v9 = result;
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 688, 0, "Token principal: %@", objc_msgSend(v9, "principal"));
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
          ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 689, 0, "Token expiration date: %@", objc_msgSend(v9, "expirationDate"));
        if (ACFLog)
        {
          if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
            ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 690, 0, "Token recent authentication date: %@", objc_msgSend(v9, "recentAuthenticationDate"));
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
            ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 691, 0, "Token recent unlock date: %@", objc_msgSend(v9, "recentUnlockDate"));
        }
      }
    }
    objc_msgSend((id)objc_msgSend(v9, "expirationDate"), "timeIntervalSinceNow");
    if (v10 < 0.0)
    {
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        {
          v11 = objc_msgSend(0, "expirationDate");
          ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 696, 0, "Token is expired: %@. Expiration date: %@, Current date: %@", a3, v11, objc_msgSend(MEMORY[0x24BDBCE60], "date"));
        }
      }
      -[ACCSSOTGTStoragePolicy removeTokenWithPrincipal:](-[ACCTicketManager tgtStoragePolicy](self, "tgtStoragePolicy"), "removeTokenWithPrincipal:", a3);
      return 0;
    }
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 701, 0, "Token is not expired");
    v12 = objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -a4);
    if (objc_msgSend((id)objc_msgSend(v9, "recentAuthenticationDate"), "compare:", v12) != 1)
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 709, 0, "Idle expiration time is out of date. Recent authentication date: %@. Reference date: %@", objc_msgSend(v9, "recentAuthenticationDate"), v12);
      return 0;
    }
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 714, 0, "Idle expiration did not pass. Token is valid.");
    v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "principal"), "realm"), "isEqual:", objc_msgSend(a3, "realm"));
    v14 = v13;
    if (v13)
      result = v9;
    else
      result = 0;
    if ((v14 & 1) == 0 && ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 723, 0, "Token realms does not match request realm", v15);
      return 0;
    }
  }
  return result;
}

- (id)changePasswordContextWithRequest:(id)a3 oldPassword:(id)a4 newPassword:(id)a5
{
  id v8;

  v8 = -[ACCTicketManager authContextWithRequest:keyCode:authenticationType:](self, "authContextWithRequest:keyCode:authenticationType:", a3, a4, &unk_24FD17288);
  objc_msgSend(v8, "setOldUserKey:", objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "hashStringSHA256WithString:", a4));
  objc_msgSend(v8, "setCurrentUserKey:", objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeBase64:", objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeObscuredDataWithString:length:", a5, 2 * objc_msgSend(a5, "lengthOfBytesUsingEncoding:", 4))));
  return v8;
}

- (id)serviceTicketStringWithRequest:(id)a3 ssoToken:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = (id)objc_msgSend(a3, "copy");
  if (objc_msgSend((id)objc_msgSend(v6, "userName"), "length"))
  {
    if ((objc_msgSend((id)objc_msgSend(v6, "userName"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a4, "principal"), "userName")) & 1) != 0)goto LABEL_7;
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCTicketManager serviceTicketStringWithRequest:ssoToken:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 755, 0, "Internal inconsistency");
  }
  objc_msgSend(v6, "setUserName:", objc_msgSend((id)objc_msgSend(a4, "principal"), "userName"));
LABEL_7:
  v7 = -[ACCTicketManager authContextWithRequest:sessionToken:](self, "authContextWithRequest:sessionToken:", v6, objc_msgSend(a4, "sessionToken"));
  if (objc_msgSend(a4, "longLiveSession"))
    objc_msgSend(v7, "setTouchIDSupport:", MEMORY[0x24BDBD1C8]);
  if (!v7)
    return 0;
  v8 = -[ACCTicketManager envelopeWithContext:](self, "envelopeWithContext:", v7);
  if (!v8)
    return 0;
  v9 = (void *)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "compactDataFromPropertyList:", v8);
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACCTicketManager serviceTicketStringWithRequest:ssoToken:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 772, 0, "SIZE TEST: Service ticket size before zipping %d", objc_msgSend(v9, "length"));
  v10 = objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "compressData:", v9);
  if (!v10)
    return 0;
  v11 = (void *)v10;
  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACCTicketManager serviceTicketStringWithRequest:ssoToken:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 777, 0, "SIZE TEST: Service ticket size before base64 encoding %d", objc_msgSend(v11, "length"));
    v12 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[ACCTicketManager serviceTicketPrefix](self, "serviceTicketPrefix"), objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeBase64:", v11));
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACCTicketManager serviceTicketStringWithRequest:ssoToken:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 779, 0, "SIZE TEST: Service ticket size is %d", objc_msgSend(v12, "length"));
    }
    return v12;
  }
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[ACCTicketManager serviceTicketPrefix](self, "serviceTicketPrefix"), objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeBase64:", v10));
}

- (id)serviceTicketPrefix
{
  return CFSTR("ACMTKN");
}

- (void)tokenDidReceive2SVSecret:(id)a3
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)twoSVPersonIDForPrincipal:(id)a3
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)twoSVSecretForPrincipal:(id)a3
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)twoSVCreateDateForPrincipal:(id)a3
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)deviceIdentifier
{
  -[ACCTicketManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)updateContextWithClientSecretIfAny:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;

  v5 = -[ACCTicketManager twoSVSecretForPrincipal:](self, "twoSVSecretForPrincipal:", objc_msgSend(a3, "principal"));
  if (objc_msgSend(v5, "length"))
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACCTicketManager updateContextWithClientSecretIfAny:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 826, 0, "cSecret present. Create HMAC");
    }
    v6 = -[ACCTicketManager twoSVPersonIDForPrincipal:](self, "twoSVPersonIDForPrincipal:", objc_msgSend(a3, "principal"));
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)objc_msgSend(a3, "creationDate"), "timeIntervalSince1970");
    objc_msgSend(a3, "setClientSecretTokenHmac:", objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeBase16:", objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "hmac256DataWithData:key:", objc_msgSend((id)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@:%@"), objc_msgSend(v8, "numberWithUnsignedLongLong:", (unint64_t)(v9 * 1000.0)), -[ACCTicketManager deviceIdentifier](self, "deviceIdentifier"), v6), "dataUsingEncoding:", 4), objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "decodeBase16:", v5))));
    objc_msgSend(a3, "setClientSecretCreateDate:", -[ACCTicketManager twoSVCreateDateForPrincipal:](self, "twoSVCreateDateForPrincipal:", objc_msgSend(a3, "principal")));
  }
}

- (id)encryptionKeyWithRandomKey:(id)a3
{
  id result;
  id v7;
  id v8;
  void *v9;
  void *v10;

  if (!objc_msgSend(a3, "length"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACCTicketManager.m"), 841, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("0 != randomKey.length"));
  result = (id)objc_msgSend(a3, "length");
  if (result)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "fillEncryptionSuffix:", v7);
    v8 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(v8, "appendData:", a3);
    objc_msgSend(v8, "appendData:", v7);
    objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "clearKey:", v7);
    v9 = (void *)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "hashDataSHA256WithData:", v8);
    v10 = (void *)objc_msgSend(v9, "subdataWithRange:", 0, kACFAES128KeySize);
    objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "clearKey:", v8);
    return v10;
  }
  return result;
}

- (id)tokenDataHMACForRandomKey:(id)a3 sourceTokenData:(id)a4
{
  id v8;
  id v9;
  void *v10;

  if (!objc_msgSend(a3, "length") || !objc_msgSend(a4, "length"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACCTicketManager.m"), 862, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("0 != randomKey.length && 0 != sourceTokenData.length"));
  if (!objc_msgSend(a3, "length"))
    return 0;
  if (!objc_msgSend(a4, "length"))
    return 0;
  v8 = objc_alloc(MEMORY[0x24BDBCEC8]);
  objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "fillHMACSuffix:", v8);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  objc_msgSend(v9, "appendData:", a3);
  objc_msgSend(v9, "appendData:", v8);
  objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "clearKey:", v8);
  v10 = (void *)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "hashDataSHA256WithData:", v9);
  objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "clearKey:", v9);
  if (objc_msgSend(v10, "length"))
    return (id)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "hmac256DataWithData:key:", a4, v10);
  else
    return 0;
}

- (Class)authContextClass
{
  return self->_authContextClass;
}

- (void)setAuthContextClass:(Class)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (Class)ssoTokenClass
{
  return self->_ssoTokenClass;
}

- (void)setSsoTokenClass:(Class)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
