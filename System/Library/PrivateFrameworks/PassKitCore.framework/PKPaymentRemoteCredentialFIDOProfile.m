@implementation PKPaymentRemoteCredentialFIDOProfile

- (PKPaymentRemoteCredentialFIDOProfile)init
{
  return -[PKPaymentRemoteCredentialFIDOProfile initWithDictionary:](self, "initWithDictionary:", 0);
}

- (PKPaymentRemoteCredentialFIDOProfile)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentRemoteCredentialFIDOProfile *v5;
  void *v6;
  uint64_t v7;
  NSString *relyingPartyIdentifier;
  void *v9;
  uint64_t v10;
  NSString *accountHash;
  void *v12;
  void *v13;
  uint64_t v14;
  NSData *keyHash;
  PKPaymentRemoteCredentialFIDOProfile *v16;
  objc_super v18;

  v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPaymentRemoteCredentialFIDOProfile;
    v5 = -[PKPaymentRemoteCredentialFIDOProfile init](&v18, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relyingPartyIdentifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      relyingPartyIdentifier = v5->_relyingPartyIdentifier;
      v5->_relyingPartyIdentifier = (NSString *)v7;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountHash"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      accountHash = v5->_accountHash;
      v5->_accountHash = (NSString *)v10;

      v12 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyHash"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataWithHexEncodedString:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      keyHash = v5->_keyHash;
      v5->_keyHash = (NSData *)v14;

    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentRemoteCredentialFIDOProfile *v4;
  PKPaymentRemoteCredentialFIDOProfile *v5;
  NSString *relyingPartyIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  char v11;
  NSString *accountHash;
  NSString *v13;
  _BOOL4 v14;
  NSData *keyHash;
  NSData *v17;
  objc_super v18;

  v4 = (PKPaymentRemoteCredentialFIDOProfile *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v18.receiver = self;
      v18.super_class = (Class)PKPaymentRemoteCredentialFIDOProfile;
      if (!-[PKPaymentRemoteCredentialFIDOProfile isEqual:](&v18, sel_isEqual_, v5))
        goto LABEL_18;
      relyingPartyIdentifier = v5->_relyingPartyIdentifier;
      v7 = self->_relyingPartyIdentifier;
      v8 = relyingPartyIdentifier;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        if (!v7 || !v8)
          goto LABEL_17;
        v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

        if (!v10)
          goto LABEL_18;
      }
      accountHash = v5->_accountHash;
      v7 = self->_accountHash;
      v13 = accountHash;
      if (v7 == v13)
      {

LABEL_22:
        keyHash = self->_keyHash;
        v17 = v5->_keyHash;
        if (keyHash && v17)
          v11 = -[NSData isEqual:](keyHash, "isEqual:");
        else
          v11 = keyHash == v17;
        goto LABEL_19;
      }
      v9 = v13;
      if (v7 && v13)
      {
        v14 = -[NSString isEqualToString:](v7, "isEqualToString:", v13);

        if (v14)
          goto LABEL_22;
LABEL_18:
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
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

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("relyingPartyIdentifier: '%@'; "), self->_relyingPartyIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountHash: '%@'; "), self->_accountHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("keyHash: '%@'; "), self->_keyHash);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSString)accountHash
{
  return self->_accountHash;
}

- (NSData)keyHash
{
  return self->_keyHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_accountHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end
