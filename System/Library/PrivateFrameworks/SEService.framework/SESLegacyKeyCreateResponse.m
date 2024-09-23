@implementation SESLegacyKeyCreateResponse

+ (id)withPublicKeyData:(id)a3 CASDSignature:(id)a4 keySlot:(id)a5 legacyKeyAttestation:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setLegacyKeyAttestation:", v9);

  objc_msgSend(v13, "setPublicKeyData:", v12);
  objc_msgSend(v13, "setCASDSignature:", v11);

  objc_msgSend(v13, "setKeySlot:", v10);
  return v13;
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
  -[SESLegacyKeyCreateResponse legacyKeyAttestation](self, "legacyKeyAttestation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESLegacyKeyCreateResponse publicKeyData](self, "publicKeyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asHexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESLegacyKeyCreateResponse CASDSignature](self, "CASDSignature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asHexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESLegacyKeyCreateResponse keySlot](self, "keySlot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\n\tlegacyKeyAttestation : %@,\n\tpublicKeyData : %@,\n\tCASDSignature : %@,\n\tkeySlot : %d\n}"), v5, v7, v9, objc_msgSend(v10, "unsignedShortValue"));
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
  -[SESLegacyKeyCreateResponse legacyKeyAttestation](self, "legacyKeyAttestation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("legacyKeyAttestation"));

  -[SESLegacyKeyCreateResponse publicKeyData](self, "publicKeyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("publicKeyData"));

  -[SESLegacyKeyCreateResponse CASDSignature](self, "CASDSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CASDSignature"));

  -[SESLegacyKeyCreateResponse keySlot](self, "keySlot");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("keySlot"));

}

- (SESLegacyKeyCreateResponse)initWithCoder:(id)a3
{
  id v4;
  SESLegacyKeyCreateResponse *v5;
  SESLegacyKeyCreateResponse *v6;
  void *v7;
  uint64_t v8;
  NSData *legacyKeyAttestation;
  void *v10;
  uint64_t v11;
  NSData *publicKeyData;
  void *v13;
  uint64_t v14;
  NSData *CASDSignature;
  void *v16;
  uint64_t v17;
  NSNumber *keySlot;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SESLegacyKeyCreateResponse;
  v5 = -[SESLegacyKeyCreateResponse init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SESLegacyKeyCreateResponse legacyKeyAttestation](v5, "legacyKeyAttestation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("legacyKeyAttestation"));
    v8 = objc_claimAutoreleasedReturnValue();
    legacyKeyAttestation = v6->_legacyKeyAttestation;
    v6->_legacyKeyAttestation = (NSData *)v8;

    -[SESLegacyKeyCreateResponse publicKeyData](v6, "publicKeyData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyData"));
    v11 = objc_claimAutoreleasedReturnValue();
    publicKeyData = v6->_publicKeyData;
    v6->_publicKeyData = (NSData *)v11;

    -[SESLegacyKeyCreateResponse CASDSignature](v6, "CASDSignature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CASDSignature"));
    v14 = objc_claimAutoreleasedReturnValue();
    CASDSignature = v6->_CASDSignature;
    v6->_CASDSignature = (NSData *)v14;

    -[SESLegacyKeyCreateResponse keySlot](v6, "keySlot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keySlot"));
    v17 = objc_claimAutoreleasedReturnValue();
    keySlot = v6->_keySlot;
    v6->_keySlot = (NSNumber *)v17;

  }
  return v6;
}

- (NSNumber)keySlot
{
  return self->_keySlot;
}

- (void)setKeySlot:(id)a3
{
  objc_storeStrong((id *)&self->_keySlot, a3);
}

- (NSData)publicKeyData
{
  return self->_publicKeyData;
}

- (void)setPublicKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_publicKeyData, a3);
}

- (NSData)CASDSignature
{
  return self->_CASDSignature;
}

- (void)setCASDSignature:(id)a3
{
  objc_storeStrong((id *)&self->_CASDSignature, a3);
}

- (NSData)legacyKeyAttestation
{
  return self->_legacyKeyAttestation;
}

- (void)setLegacyKeyAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_legacyKeyAttestation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyKeyAttestation, 0);
  objc_storeStrong((id *)&self->_CASDSignature, 0);
  objc_storeStrong((id *)&self->_publicKeyData, 0);
  objc_storeStrong((id *)&self->_keySlot, 0);
}

@end
