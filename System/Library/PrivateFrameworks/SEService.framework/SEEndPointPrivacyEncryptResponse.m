@implementation SEEndPointPrivacyEncryptResponse

+ (SEEndPointPrivacyEncryptResponse)responseWithCipherText:(id)a3 ephemeralPublicKeyData:(id)a4 receiverPublicKeyHash:(id)a5
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
    objc_msgSend(v10, "setVersion:", CFSTR("ECIES_V1"));
    objc_msgSend(v11, "setCipherText:", v7);
    objc_msgSend(v11, "setEphemeralPublicKeydata:", v8);
    objc_msgSend(v11, "setReceiverPublicKeyHash:", v9);
  }

  return (SEEndPointPrivacyEncryptResponse *)v11;
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
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SEEndPointPrivacyEncryptResponse version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointPrivacyEncryptResponse cipherText](self, "cipherText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointPrivacyEncryptResponse ephemeralPublicKeydata](self, "ephemeralPublicKeydata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asHexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointPrivacyEncryptResponse receiverPublicKeyHash](self, "receiverPublicKeyHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "asHexString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\n\tversion : %@,\n\tcipherText : %@,\n\tephemeralPublicKeydata : %@\n\treceiverPublicKeyHash : %@\n}"), v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  void *v7;
  id v8;

  v4 = a3;
  -[SEEndPointPrivacyEncryptResponse version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("version"));

  -[SEEndPointPrivacyEncryptResponse cipherText](self, "cipherText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("cipherText"));

  -[SEEndPointPrivacyEncryptResponse ephemeralPublicKeydata](self, "ephemeralPublicKeydata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ephemeralPublicKeydata"));

  -[SEEndPointPrivacyEncryptResponse receiverPublicKeyHash](self, "receiverPublicKeyHash");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("receiverPublicKeyHash"));

}

- (SEEndPointPrivacyEncryptResponse)initWithCoder:(id)a3
{
  id v4;
  SEEndPointPrivacyEncryptResponse *v5;
  uint64_t v6;
  NSString *version;
  uint64_t v8;
  NSData *cipherText;
  uint64_t v10;
  NSData *ephemeralPublicKeydata;
  uint64_t v12;
  NSData *receiverPublicKeyHash;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SEEndPointPrivacyEncryptResponse;
  v5 = -[SEEndPointPrivacyEncryptResponse init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cipherText"));
    v8 = objc_claimAutoreleasedReturnValue();
    cipherText = v5->_cipherText;
    v5->_cipherText = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralPublicKeydata"));
    v10 = objc_claimAutoreleasedReturnValue();
    ephemeralPublicKeydata = v5->_ephemeralPublicKeydata;
    v5->_ephemeralPublicKeydata = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiverPublicKeyHash"));
    v12 = objc_claimAutoreleasedReturnValue();
    receiverPublicKeyHash = v5->_receiverPublicKeyHash;
    v5->_receiverPublicKeyHash = (NSData *)v12;

  }
  return v5;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSData)cipherText
{
  return self->_cipherText;
}

- (void)setCipherText:(id)a3
{
  objc_storeStrong((id *)&self->_cipherText, a3);
}

- (NSData)ephemeralPublicKeydata
{
  return self->_ephemeralPublicKeydata;
}

- (void)setEphemeralPublicKeydata:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralPublicKeydata, a3);
}

- (NSData)receiverPublicKeyHash
{
  return self->_receiverPublicKeyHash;
}

- (void)setReceiverPublicKeyHash:(id)a3
{
  objc_storeStrong((id *)&self->_receiverPublicKeyHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverPublicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKeydata, 0);
  objc_storeStrong((id *)&self->_cipherText, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
