@implementation PKLongTermPrivacyKey

- (PKLongTermPrivacyKey)initWithSESPrivacyKey:(id)a3
{
  id v4;
  PKLongTermPrivacyKey *v5;
  uint64_t v6;
  NSString *keyIdentifier;
  uint64_t v8;
  NSData *publicKey;
  uint64_t v10;
  NSDate *creationDate;
  uint64_t v12;
  NSString *groupIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKLongTermPrivacyKey;
  v5 = -[PKLongTermPrivacyKey init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "keyIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v6;

    objc_msgSend(v4, "publicKey");
    v8 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v8;

    objc_msgSend(v4, "creationDate");
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    objc_msgSend(v4, "groupIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("keyIdentifier: '%@'; "), self->_keyIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("publicKey: '%@'; "), self->_publicKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("creationDate: '%@'; "), self->_creationDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("groupIdentifier: '%@'; "), self->_groupIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
