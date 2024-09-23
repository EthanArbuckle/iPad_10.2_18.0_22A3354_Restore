@implementation ORProvisionResult

- (ORProvisionResult)initWithProvisionDataBlob:(id)a3 casdCertificate:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ORProvisionResult *v13;
  uint64_t v14;
  NSData *provisionDataBlob;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSData *casdCertificate;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ORProvisionResult;
  v13 = -[ORProvisionResult init](&v24, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v6, v8, v9, v10, v11, v12);
    provisionDataBlob = v13->_provisionDataBlob;
    v13->_provisionDataBlob = (NSData *)v14;

    v21 = objc_msgSend_copy(v7, v16, v17, v18, v19, v20);
    casdCertificate = v13->_casdCertificate;
    v13->_casdCertificate = (NSData *)v21;

  }
  return v13;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  NSData *provisionDataBlob;
  __CFString *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v7 = objc_msgSend_length(self->_casdCertificate, a2, v2, v3, v4, v5);
  v8 = CFSTR("present");
  if (!v7)
    v8 = &stru_24D3CDE20;
  v9 = (void *)MEMORY[0x24BDD17C8];
  provisionDataBlob = self->_provisionDataBlob;
  v11 = v8;
  objc_msgSend_asHexString(provisionDataBlob, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v18, (uint64_t)CFSTR("{provisionDataBlob: %@, casdCertificate: %@}"), v19, v20, v21, v17, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *provisionDataBlob;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  provisionDataBlob = self->_provisionDataBlob;
  v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)provisionDataBlob, (uint64_t)CFSTR("provisionDataBlob"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v11, v8, (uint64_t)self->_casdCertificate, (uint64_t)CFSTR("casdCertificate"), v9, v10);

}

- (ORProvisionResult)initWithCoder:(id)a3
{
  id v4;
  ORProvisionResult *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSData *provisionDataBlob;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSData *casdCertificate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ORProvisionResult;
  v5 = -[ORProvisionResult init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("provisionDataBlob"), v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    provisionDataBlob = v5->_provisionDataBlob;
    v5->_provisionDataBlob = (NSData *)v10;

    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("casdCertificate"), v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    casdCertificate = v5->_casdCertificate;
    v5->_casdCertificate = (NSData *)v16;

  }
  return v5;
}

- (ORProvisionResult)initWithProvisionDataBlob:(id)a3 platformId:(id)a4 configId:(id)a5 transactionId:(id)a6 casdCertificate:(id)a7 casdSignature:(id)a8 authenticationTag:(id)a9 ephemeralPublicKey:(id)a10 formatVersion:(id)a11 keyIdentifier:(id)a12
{
  return (ORProvisionResult *)MEMORY[0x24BEDD108](self, sel_initWithProvisionDataBlob_casdCertificate_, a3, a7, a5, a6);
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
