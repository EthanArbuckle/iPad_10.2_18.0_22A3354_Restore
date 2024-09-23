@implementation SEEndPointAuthorizeResponse

+ (id)responseWithEndPointAttestationData:(id)a3 encryptionPublicKeyData:(id)a4 encryptedData:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setEndPointAttestationData:", v7);
    objc_msgSend(v11, "setEncryptionPublicKeyData:", v8);
    objc_msgSend(v11, "setEncryptedData:", v9);
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SEEndPointAuthorizeResponse endPointAttestationData](self, "endPointAttestationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointAuthorizeResponse encryptionPublicKeyData](self, "encryptionPublicKeyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asHexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointAuthorizeResponse encryptedData](self, "encryptedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asHexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\n\tendPointAttestation : %@,\n\tencryptionPublicKey : %@,\n\tencryptedData : %@\n}"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SEEndPointAuthorizeResponse endPointAttestationData](self, "endPointAttestationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("endPointAttestationData"));

  -[SEEndPointAuthorizeResponse encryptionPublicKeyData](self, "encryptionPublicKeyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("encryptionPublicKeyData"));

  -[SEEndPointAuthorizeResponse encryptedData](self, "encryptedData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("encryptedData"));

}

- (SEEndPointAuthorizeResponse)initWithCoder:(id)a3
{
  id v4;
  SEEndPointAuthorizeResponse *v5;
  SEEndPointAuthorizeResponse *v6;
  void *v7;
  uint64_t v8;
  NSData *endPointAttestationData;
  void *v10;
  uint64_t v11;
  NSData *encryptionPublicKeyData;
  void *v13;
  uint64_t v14;
  NSData *encryptedData;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SEEndPointAuthorizeResponse;
  v5 = -[SEEndPointAuthorizeResponse init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SEEndPointAuthorizeResponse endPointAttestationData](v5, "endPointAttestationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endPointAttestationData"));
    v8 = objc_claimAutoreleasedReturnValue();
    endPointAttestationData = v6->_endPointAttestationData;
    v6->_endPointAttestationData = (NSData *)v8;

    -[SEEndPointAuthorizeResponse encryptionPublicKeyData](v6, "encryptionPublicKeyData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionPublicKeyData"));
    v11 = objc_claimAutoreleasedReturnValue();
    encryptionPublicKeyData = v6->_encryptionPublicKeyData;
    v6->_encryptionPublicKeyData = (NSData *)v11;

    -[SEEndPointAuthorizeResponse encryptedData](v6, "encryptedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedData"));
    v14 = objc_claimAutoreleasedReturnValue();
    encryptedData = v6->_encryptedData;
    v6->_encryptedData = (NSData *)v14;

  }
  return v6;
}

- (NSData)endPointAttestationData
{
  return self->_endPointAttestationData;
}

- (void)setEndPointAttestationData:(id)a3
{
  objc_storeStrong((id *)&self->_endPointAttestationData, a3);
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedData, a3);
}

- (NSData)encryptionPublicKeyData
{
  return self->_encryptionPublicKeyData;
}

- (void)setEncryptionPublicKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionPublicKeyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionPublicKeyData, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_endPointAttestationData, 0);
}

@end
