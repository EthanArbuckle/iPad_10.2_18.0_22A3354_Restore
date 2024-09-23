@implementation SKSubscriptionValidationTokens

- (SKSubscriptionValidationTokens)initWithSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4
{
  id v6;
  id v7;
  SKSubscriptionValidationTokens *v8;
  uint64_t v9;
  NSString *subscriptionValidationToken;
  uint64_t v11;
  NSString *encryptionValidationToken;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SKSubscriptionValidationTokens;
  v8 = -[SKSubscriptionValidationTokens init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    subscriptionValidationToken = v8->_subscriptionValidationToken;
    v8->_subscriptionValidationToken = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    encryptionValidationToken = v8->_encryptionValidationToken;
    v8->_encryptionValidationToken = (NSString *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKSubscriptionValidationTokens subscriptionValidationToken](self, "subscriptionValidationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSubscriptionValidationTokens encryptionValidationToken](self, "encryptionValidationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; subscriptionValidationToken = \"%@\", encryptionValidationToken = \"%@\">"),
    v4,
    self,
    v5,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SKSubscriptionValidationTokens isEqualToSubscriptionValidationTokens:](self, "isEqualToSubscriptionValidationTokens:", v4);

  return v5;
}

- (BOOL)isEqualToSubscriptionValidationTokens:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "subscriptionValidationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 || self->_subscriptionValidationToken)
    && (objc_msgSend(v4, "subscriptionValidationToken"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", self->_subscriptionValidationToken),
        v6,
        v5,
        !v7))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "encryptionValidationToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || self->_encryptionValidationToken)
    {
      objc_msgSend(v4, "encryptionValidationToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", self->_encryptionValidationToken);

    }
    else
    {
      v10 = 1;
    }

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SKSubscriptionValidationTokens subscriptionValidationToken](self, "subscriptionValidationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SKSubscriptionValidationTokens encryptionValidationToken](self, "encryptionValidationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *subscriptionValidationToken;
  id v5;

  subscriptionValidationToken = self->_subscriptionValidationToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subscriptionValidationToken, CFSTR("subscriptionToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptionValidationToken, CFSTR("encryptionToken"));

}

- (SKSubscriptionValidationTokens)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SKSubscriptionValidationTokens *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SKSubscriptionValidationTokens initWithSubscriptionValidationToken:encryptionValidationToken:](self, "initWithSubscriptionValidationToken:encryptionValidationToken:", v5, v6);
  return v7;
}

- (NSString)subscriptionValidationToken
{
  return self->_subscriptionValidationToken;
}

- (NSString)encryptionValidationToken
{
  return self->_encryptionValidationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionValidationToken, 0);
  objc_storeStrong((id *)&self->_subscriptionValidationToken, 0);
}

@end
