@implementation SESLegacyKeySignResponse

+ (id)withSignature:(id)a3 localValidationVerified:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setSignature:", v6);

  objc_msgSend(v7, "setLocalValidationVerified:", v5);
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SESLegacyKeySignResponse signature](self, "signature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESLegacyKeySignResponse localValidationVerified](self, "localValidationVerified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\n\tsignature : %@,\n\tlocalValidationVerified : %d,\n}"), v5, objc_msgSend(v6, "intValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SESLegacyKeySignResponse signature](self, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("signature"));

  -[SESLegacyKeySignResponse localValidationVerified](self, "localValidationVerified");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localValidationVerified"));

}

- (SESLegacyKeySignResponse)initWithCoder:(id)a3
{
  id v4;
  SESLegacyKeySignResponse *v5;
  SESLegacyKeySignResponse *v6;
  void *v7;
  uint64_t v8;
  NSData *signature;
  void *v10;
  uint64_t v11;
  NSNumber *localValidationVerified;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SESLegacyKeySignResponse;
  v5 = -[SESLegacyKeySignResponse init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SESLegacyKeySignResponse signature](v5, "signature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v8 = objc_claimAutoreleasedReturnValue();
    signature = v6->_signature;
    v6->_signature = (NSData *)v8;

    -[SESLegacyKeySignResponse localValidationVerified](v6, "localValidationVerified");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localValidationVerified"));
    v11 = objc_claimAutoreleasedReturnValue();
    localValidationVerified = v6->_localValidationVerified;
    v6->_localValidationVerified = (NSNumber *)v11;

  }
  return v6;
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSNumber)localValidationVerified
{
  return self->_localValidationVerified;
}

- (void)setLocalValidationVerified:(id)a3
{
  objc_storeStrong((id *)&self->_localValidationVerified, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localValidationVerified, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
