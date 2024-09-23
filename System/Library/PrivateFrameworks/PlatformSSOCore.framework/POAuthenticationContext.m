@implementation POAuthenticationContext

- (POAuthenticationContext)init
{
  POAuthenticationContext *v2;
  void *v3;
  uint64_t v4;
  NSString *nonce;
  void *v6;
  uint64_t v7;
  NSString *requestIdentifier;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *wsTrustFederationNonce;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)POAuthenticationContext;
  v2 = -[POAuthenticationContext init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    nonce = v2->_nonce;
    v2->_nonce = (NSString *)v4;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v2->_requestIdentifier;
    v2->_requestIdentifier = (NSString *)v7;

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("urn:uuid:%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    wsTrustFederationNonce = v2->_wsTrustFederationNonce;
    v2->_wsTrustFederationNonce = (NSString *)v12;

    v2->_loginType = 0;
    v2->_wsTrustVersion = 0;
    *(_OWORD *)&v2->_retriesRemaining = xmmword_2444A2CE0;
  }
  return v2;
}

- (void)dealloc
{
  __SecKey *embeddedAssertionSigningKey;
  __SecCertificate *embeddedAssertionCertificate;
  objc_super v5;

  embeddedAssertionSigningKey = self->_embeddedAssertionSigningKey;
  if (embeddedAssertionSigningKey)
  {
    CFRelease(embeddedAssertionSigningKey);
    self->_embeddedAssertionSigningKey = 0;
  }
  embeddedAssertionCertificate = self->_embeddedAssertionCertificate;
  if (embeddedAssertionCertificate)
  {
    CFRelease(embeddedAssertionCertificate);
    self->_embeddedAssertionCertificate = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)POAuthenticationContext;
  -[POAuthenticationContext dealloc](&v5, sel_dealloc);
}

- (void)addRequiredScope:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[POAuthenticationContext scope](self, "scope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[POAuthenticationContext scope](self, "scope");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAuthenticationContext setScope:](self, "setScope:", v10);

    }
  }

}

- (POLoginConfiguration)loginConfiguration
{
  return self->_loginConfiguration;
}

- (void)setLoginConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_loginConfiguration, a3);
}

- (PODeviceConfiguration)deviceConfiguration
{
  return self->_deviceConfiguration;
}

- (void)setDeviceConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_deviceConfiguration, a3);
}

- (POJWKSStorageProvider)jwksStorageProvider
{
  return self->_jwksStorageProvider;
}

- (void)setJwksStorageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_jwksStorageProvider, a3);
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
  objc_storeStrong((id *)&self->_refreshToken, a3);
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
  objc_storeStrong((id *)&self->_userName, a3);
}

- (NSMutableData)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (__SecKey)embeddedAssertionSigningKey
{
  return self->_embeddedAssertionSigningKey;
}

- (void)setEmbeddedAssertionSigningKey:(__SecKey *)a3
{
  self->_embeddedAssertionSigningKey = a3;
}

- (__SecCertificate)embeddedAssertionCertificate
{
  return self->_embeddedAssertionCertificate;
}

- (void)setEmbeddedAssertionCertificate:(__SecCertificate *)a3
{
  self->_embeddedAssertionCertificate = a3;
}

- (NSNumber)userSepSigningAlgorithm
{
  return self->_userSepSigningAlgorithm;
}

- (void)setUserSepSigningAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_userSepSigningAlgorithm, a3);
}

- (NSString)encryptionContext
{
  return self->_encryptionContext;
}

- (void)setEncryptionContext:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionContext, a3);
}

- (NSString)serverNonce
{
  return self->_serverNonce;
}

- (void)setServerNonce:(id)a3
{
  objc_storeStrong((id *)&self->_serverNonce, a3);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSString)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
  objc_storeStrong((id *)&self->_scope, a3);
}

- (NSString)apv
{
  return self->_apv;
}

- (void)setApv:(id)a3
{
  objc_storeStrong((id *)&self->_apv, a3);
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (unint64_t)loginType
{
  return self->_loginType;
}

- (void)setLoginType:(unint64_t)a3
{
  self->_loginType = a3;
}

- (BOOL)federated
{
  return self->_federated;
}

- (void)setFederated:(BOOL)a3
{
  self->_federated = a3;
}

- (unint64_t)wsTrustVersion
{
  return self->_wsTrustVersion;
}

- (void)setWsTrustVersion:(unint64_t)a3
{
  self->_wsTrustVersion = a3;
}

- (NSURL)wsTrustFederationMexURL
{
  return self->_wsTrustFederationMexURL;
}

- (void)setWsTrustFederationMexURL:(id)a3
{
  objc_storeStrong((id *)&self->_wsTrustFederationMexURL, a3);
}

- (NSURL)wsTrustFederationURL
{
  return self->_wsTrustFederationURL;
}

- (void)setWsTrustFederationURL:(id)a3
{
  objc_storeStrong((id *)&self->_wsTrustFederationURL, a3);
}

- (NSString)wsTrustFederationNonce
{
  return self->_wsTrustFederationNonce;
}

- (void)setWsTrustFederationNonce:(id)a3
{
  objc_storeStrong((id *)&self->_wsTrustFederationNonce, a3);
}

- (NSString)tokenTypeNamespace
{
  return self->_tokenTypeNamespace;
}

- (void)setTokenTypeNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_tokenTypeNamespace, a3);
}

- (int64_t)retriesRemaining
{
  return self->_retriesRemaining;
}

- (void)setRetriesRemaining:(int64_t)a3
{
  self->_retriesRemaining = a3;
}

- (int64_t)retryDelay
{
  return self->_retryDelay;
}

- (void)setRetryDelay:(int64_t)a3
{
  self->_retryDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenTypeNamespace, 0);
  objc_storeStrong((id *)&self->_wsTrustFederationNonce, 0);
  objc_storeStrong((id *)&self->_wsTrustFederationURL, 0);
  objc_storeStrong((id *)&self->_wsTrustFederationMexURL, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_apv, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_serverNonce, 0);
  objc_storeStrong((id *)&self->_encryptionContext, 0);
  objc_storeStrong((id *)&self->_userSepSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_jwksStorageProvider, 0);
  objc_storeStrong((id *)&self->_deviceConfiguration, 0);
  objc_storeStrong((id *)&self->_loginConfiguration, 0);
}

@end
