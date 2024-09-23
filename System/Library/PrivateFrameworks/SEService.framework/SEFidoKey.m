@implementation SEFidoKey

+ (id)withRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoPublicKey:(id)a5 fidoAttestation:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (_QWORD *)objc_opt_new();
  v14 = (void *)v13[1];
  v13[1] = v9;
  v15 = v9;

  v16 = (void *)v13[2];
  v13[2] = v10;
  v17 = v10;

  v18 = (void *)v13[4];
  v13[4] = v11;
  v19 = v11;

  v20 = (void *)v13[3];
  v13[3] = v12;

  return v13;
}

- (NSData)fidoKeyHash
{
  return (NSData *)-[NSData sha256](self->_fidoPublicKey, "sha256");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relyingParty;
  id v5;

  relyingParty = self->_relyingParty;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relyingParty, CFSTR("relyingParty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyAccountHash, CFSTR("relyingPartyAccountHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fidoPublicKey, CFSTR("fidoPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fidoAttestation, CFSTR("fidoAttestation"));

}

- (SEFidoKey)initWithCoder:(id)a3
{
  id v4;
  SEFidoKey *v5;
  uint64_t v6;
  NSString *relyingParty;
  uint64_t v8;
  NSString *relyingPartyAccountHash;
  uint64_t v10;
  NSData *fidoPublicKey;
  uint64_t v12;
  NSData *fidoAttestation;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SEFidoKey;
  v5 = -[SEFidoKey init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingParty"));
    v6 = objc_claimAutoreleasedReturnValue();
    relyingParty = v5->_relyingParty;
    v5->_relyingParty = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyAccountHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    relyingPartyAccountHash = v5->_relyingPartyAccountHash;
    v5->_relyingPartyAccountHash = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fidoPublicKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    fidoPublicKey = v5->_fidoPublicKey;
    v5->_fidoPublicKey = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fidoAttestation"));
    v12 = objc_claimAutoreleasedReturnValue();
    fidoAttestation = v5->_fidoAttestation;
    v5->_fidoAttestation = (NSData *)v12;

  }
  return v5;
}

- (NSString)relyingParty
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)relyingPartyAccountHash
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)fidoAttestation
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)fidoPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fidoPublicKey, 0);
  objc_storeStrong((id *)&self->_fidoAttestation, 0);
  objc_storeStrong((id *)&self->_relyingPartyAccountHash, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
}

@end
