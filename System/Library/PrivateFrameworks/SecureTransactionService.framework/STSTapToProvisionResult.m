@implementation STSTapToProvisionResult

- (STSTapToProvisionResult)initWithProvisionDataBlob:(id)a3 casdCertificate:(id)a4
{
  id v7;
  id v8;
  STSTapToProvisionResult *v9;
  STSTapToProvisionResult *v10;
  NSString *platformId;
  NSString *configId;
  NSString *transactionId;
  uint64_t v14;
  NSData *casdSignature;
  uint64_t v16;
  NSData *authenticationTag;
  uint64_t v18;
  NSData *ephemeralPublicKey;
  NSString *formatVersion;
  uint64_t v21;
  NSData *keyIdentifier;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)STSTapToProvisionResult;
  v9 = -[STSTapToProvisionResult init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provisionDataBlob, a3);
    platformId = v10->_platformId;
    v10->_platformId = (NSString *)&stru_24D3A78C0;

    configId = v10->_configId;
    v10->_configId = (NSString *)&stru_24D3A78C0;

    transactionId = v10->_transactionId;
    v10->_transactionId = (NSString *)&stru_24D3A78C0;

    objc_storeStrong((id *)&v10->_casdCertificate, a4);
    v14 = objc_opt_new();
    casdSignature = v10->_casdSignature;
    v10->_casdSignature = (NSData *)v14;

    v16 = objc_opt_new();
    authenticationTag = v10->_authenticationTag;
    v10->_authenticationTag = (NSData *)v16;

    v18 = objc_opt_new();
    ephemeralPublicKey = v10->_ephemeralPublicKey;
    v10->_ephemeralPublicKey = (NSData *)v18;

    formatVersion = v10->_formatVersion;
    v10->_formatVersion = (NSString *)&stru_24D3A78C0;

    v21 = objc_opt_new();
    keyIdentifier = v10->_keyIdentifier;
    v10->_keyIdentifier = (NSData *)v21;

  }
  return v10;
}

- (STSTapToProvisionResult)initWithProvisionDataBlob:(id)a3 platformId:(id)a4 configId:(id)a5 transactionId:(id)a6 casdCertificate:(id)a7 casdSignature:(id)a8 authenticationTag:(id)a9 ephemeralPublicKey:(id)a10 formatVersion:(id)a11 keyIdentifier:(id)a12
{
  return -[STSTapToProvisionResult initWithProvisionDataBlob:casdCertificate:](self, "initWithProvisionDataBlob:casdCertificate:", a3, a7, a5, a6);
}

+ (id)fromOR:(id)a3
{
  id v3;
  STSTapToProvisionResult *v4;
  void *v5;
  void *v6;
  STSTapToProvisionResult *v7;

  v3 = a3;
  v4 = [STSTapToProvisionResult alloc];
  objc_msgSend(v3, "provisionDataBlob");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "casdCertificate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[STSTapToProvisionResult initWithProvisionDataBlob:casdCertificate:](v4, "initWithProvisionDataBlob:casdCertificate:", v5, v6);
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Tap To Provision Result : \n            \tprovisionDataBlob=%@,\n            \tcasdCertificate=%@\n"), self->_provisionDataBlob, self->_casdCertificate);
}

- (NSData)provisionDataBlob
{
  return self->_provisionDataBlob;
}

- (NSData)casdCertificate
{
  return self->_casdCertificate;
}

- (NSString)platformId
{
  return self->_platformId;
}

- (NSString)configId
{
  return self->_configId;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSData)casdSignature
{
  return self->_casdSignature;
}

- (NSData)authenticationTag
{
  return self->_authenticationTag;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_authenticationTag, 0);
  objc_storeStrong((id *)&self->_casdSignature, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_configId, 0);
  objc_storeStrong((id *)&self->_platformId, 0);
  objc_storeStrong((id *)&self->_casdCertificate, 0);
  objc_storeStrong((id *)&self->_provisionDataBlob, 0);
}

@end
