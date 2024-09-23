@implementation SESPrivacyKey

+ (id)withGroupIdentifier:(id)a3 keyIdentifier:(id)a4 publicKey:(id)a5 creationDate:(id)a6
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
  v14 = (void *)v13[3];
  v13[3] = v9;
  v15 = v9;

  v16 = (void *)v13[2];
  v13[2] = v10;
  v17 = v10;

  v18 = (void *)v13[1];
  v13[1] = v11;
  v19 = v11;

  v20 = (void *)v13[4];
  v13[4] = v12;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupIdentifier;
  id v5;

  groupIdentifier = self->_groupIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("keyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicKey, CFSTR("publicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));

}

- (SESPrivacyKey)initWithCoder:(id)a3
{
  id v4;
  SESPrivacyKey *v5;
  uint64_t v6;
  NSString *groupIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  uint64_t v10;
  NSData *publicKey;
  uint64_t v12;
  NSDate *creationDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SESPrivacyKey;
  v5 = -[SESPrivacyKey init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v12;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SESPrivacyKey: Group %@ Identifier %@ PublicKey %@ CreationDate %@"), self->_groupIdentifier, self->_keyIdentifier, self->_publicKey, self->_creationDate);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end
