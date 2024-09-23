@implementation SEFidoKeySearchParameters

+ (id)withRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (_QWORD *)objc_opt_new();
  v11 = (void *)v10[1];
  v10[1] = v7;
  v12 = v7;

  v13 = (void *)v10[2];
  v10[2] = v8;
  v14 = v8;

  v15 = (void *)v10[3];
  v10[3] = v9;

  return v10;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_fidoKeyHash, CFSTR("fidoKeyHash"));

}

- (SEFidoKeySearchParameters)initWithCoder:(id)a3
{
  id v4;
  SEFidoKeySearchParameters *v5;
  uint64_t v6;
  NSString *relyingParty;
  uint64_t v8;
  NSString *relyingPartyAccountHash;
  uint64_t v10;
  NSData *fidoKeyHash;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SEFidoKeySearchParameters;
  v5 = -[SEFidoKeySearchParameters init](&v13, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fidoKeyHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    fidoKeyHash = v5->_fidoKeyHash;
    v5->_fidoKeyHash = (NSData *)v10;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("relyingParty %@ rpAccountHash %@ keyHash %@"), self->_relyingParty, self->_relyingPartyAccountHash, self->_fidoKeyHash);
}

- (NSString)relyingParty
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)relyingPartyAccountHash
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)fidoKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fidoKeyHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyAccountHash, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
}

@end
