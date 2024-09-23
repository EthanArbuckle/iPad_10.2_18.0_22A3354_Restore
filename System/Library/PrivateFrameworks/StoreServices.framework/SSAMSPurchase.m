@implementation SSAMSPurchase

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSAMSPurchase;
  v4 = a3;
  -[AMSPurchase encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SSAMSPurchase accountIdentifier](self, "accountIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountIdentifier"));

  -[SSAMSPurchase mediaType](self, "mediaType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mediaType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SSAMSPurchase isPreauthenticated](self, "isPreauthenticated"), CFSTR("preauthenticated"));
}

- (SSAMSPurchase)initWithCoder:(id)a3
{
  id v4;
  SSAMSPurchase *v5;
  uint64_t v6;
  NSNumber *accountIdentifier;
  uint64_t v8;
  NSString *mediaType;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSAMSPurchase;
  v5 = -[AMSPurchase initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
    v8 = objc_claimAutoreleasedReturnValue();
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v8;

    v5->_preauthenticated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preauthenticated"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSAMSPurchase;
  v3 = -[AMSPurchase hash](&v10, sel_hash);
  -[SSAMSPurchase accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SSAMSPurchase mediaType](self, "mediaType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SSAMSPurchase isPreauthenticated](self, "isPreauthenticated") ^ v3;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SSAMSPurchase *v4;
  SSAMSPurchase *v5;
  BOOL v6;

  v4 = (SSAMSPurchase *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[SSAMSPurchase isEqualToPurchase:](self, "isEqualToPurchase:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToPurchase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;

  v4 = a3;
  -[AMSPurchase uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToNumber:", v6))
  {
    -[SSAMSPurchase accountIdentifier](self, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[SSAMSPurchase mediaType](self, "mediaType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        v11 = -[SSAMSPurchase isPreauthenticated](self, "isPreauthenticated");
        v12 = v11 ^ objc_msgSend(v4, "isPreauthenticated") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)isPreauthenticated
{
  return self->_preauthenticated;
}

- (void)setPreauthenticated:(BOOL)a3
{
  self->_preauthenticated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
