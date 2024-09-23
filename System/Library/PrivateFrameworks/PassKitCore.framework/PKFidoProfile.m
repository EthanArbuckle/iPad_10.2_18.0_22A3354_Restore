@implementation PKFidoProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_accountHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

- (PKFidoProfile)initWithDictionary:(id)a3
{
  id v4;
  PKFidoProfile *v5;
  uint64_t v6;
  NSString *relyingPartyIdentifier;
  uint64_t v8;
  NSString *accountHash;
  uint64_t v10;
  NSString *keyHash;
  PKFidoProfile *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)PKFidoProfile;
    v5 = -[PKFidoProfile init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("relyingPartyIdentifier"));
      v6 = objc_claimAutoreleasedReturnValue();
      relyingPartyIdentifier = v5->_relyingPartyIdentifier;
      v5->_relyingPartyIdentifier = (NSString *)v6;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("accountHash"));
      v8 = objc_claimAutoreleasedReturnValue();
      accountHash = v5->_accountHash;
      v5->_accountHash = (NSString *)v8;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("keyHash"));
      v10 = objc_claimAutoreleasedReturnValue();
      keyHash = v5->_keyHash;
      v5->_keyHash = (NSString *)v10;

    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PKFidoProfile)initWithCoder:(id)a3
{
  id v4;
  PKFidoProfile *v5;
  uint64_t v6;
  NSString *relyingPartyIdentifier;
  uint64_t v8;
  NSString *accountHash;
  uint64_t v10;
  NSString *keyHash;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFidoProfile;
  v5 = -[PKFidoProfile init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountHash = v5->_accountHash;
    v5->_accountHash = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    keyHash = v5->_keyHash;
    v5->_keyHash = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relyingPartyIdentifier;
  id v5;

  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountHash, CFSTR("accountHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyHash, CFSTR("keyHash"));

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("relyingPartyIdentifier: %@; "), self->_relyingPartyIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountHash: %@; "), self->_accountHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("keyHash: %@; "), self->_keyHash);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PKFidoProfile *v4;
  PKFidoProfile *v5;
  BOOL v6;

  v4 = (PKFidoProfile *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKFidoProfile isEqualToProfile:](self, "isEqualToProfile:", v5);

  return v6;
}

- (BOOL)isEqualToProfile:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  NSString *keyHash;
  void *v14;
  NSString *v15;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_relyingPartyIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    LOBYTE(v10) = 0;
    goto LABEL_21;
  }
  v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

  if (v10)
  {
LABEL_10:
    v11 = (void *)v4[2];
    v6 = self->_accountHash;
    v12 = v11;
    if (v6 == v12)
    {

LABEL_16:
      keyHash = self->_keyHash;
      v14 = (void *)v4[3];
      v6 = keyHash;
      v15 = v14;
      if (v6 == v15)
      {
        LOBYTE(v10) = 1;
        v8 = v6;
      }
      else
      {
        v8 = v15;
        LOBYTE(v10) = 0;
        if (v6 && v15)
          LOBYTE(v10) = -[NSString isEqualToString:](v6, "isEqualToString:", v15);
      }
      goto LABEL_21;
    }
    v8 = v12;
    LOBYTE(v10) = 0;
    if (v6 && v12)
    {
      v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

      if (!v10)
        goto LABEL_22;
      goto LABEL_16;
    }
LABEL_21:

  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_relyingPartyIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_accountHash);
  objc_msgSend(v3, "safelyAddObject:", self->_keyHash);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKFidoProfile *v5;
  uint64_t v6;
  NSString *relyingPartyIdentifier;
  uint64_t v8;
  NSString *accountHash;
  uint64_t v10;
  NSString *keyHash;

  v5 = -[PKFidoProfile init](+[PKFidoProfile allocWithZone:](PKFidoProfile, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_relyingPartyIdentifier, "copyWithZone:", a3);
  relyingPartyIdentifier = v5->_relyingPartyIdentifier;
  v5->_relyingPartyIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_accountHash, "copyWithZone:", a3);
  accountHash = v5->_accountHash;
  v5->_accountHash = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_keyHash, "copyWithZone:", a3);
  keyHash = v5->_keyHash;
  v5->_keyHash = (NSString *)v10;

  return v5;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, a3);
}

- (NSString)accountHash
{
  return self->_accountHash;
}

- (void)setAccountHash:(id)a3
{
  objc_storeStrong((id *)&self->_accountHash, a3);
}

- (NSString)keyHash
{
  return self->_keyHash;
}

- (void)setKeyHash:(id)a3
{
  objc_storeStrong((id *)&self->_keyHash, a3);
}

@end
