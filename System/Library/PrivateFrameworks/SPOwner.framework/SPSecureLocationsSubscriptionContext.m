@implementation SPSecureLocationsSubscriptionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSecureLocationsSubscriptionContext)init
{
  SPSecureLocationsSubscriptionContext *v2;
  SPSecureLocationsSubscriptionContext *v3;
  NSString *clientApp;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPSecureLocationsSubscriptionContext;
  v2 = -[SPSecureLocationsSubscriptionContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    clientApp = v2->_clientApp;
    v2->_subscriptionMode = 0;
    v2->_clientApp = (NSString *)CFSTR("searchpartyd");

    v3->_fetchMode = 1;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPSecureLocationsSubscriptionContext *v4;
  void *v5;

  v4 = objc_alloc_init(SPSecureLocationsSubscriptionContext);
  -[SPSecureLocationsSubscriptionContext clientApp](self, "clientApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSecureLocationsSubscriptionContext setClientApp:](v4, "setClientApp:", v5);

  -[SPSecureLocationsSubscriptionContext setSubscriptionMode:](v4, "setSubscriptionMode:", -[SPSecureLocationsSubscriptionContext subscriptionMode](self, "subscriptionMode"));
  -[SPSecureLocationsSubscriptionContext setFetchMode:](v4, "setFetchMode:", -[SPSecureLocationsSubscriptionContext fetchMode](self, "fetchMode"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientApp;
  id v5;

  clientApp = self->_clientApp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientApp, CFSTR("clientApp"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_subscriptionMode, CFSTR("subscriptionMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fetchMode, CFSTR("fetchMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushIdentifiers, CFSTR("pushIdentifiers"));

}

- (SPSecureLocationsSubscriptionContext)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *clientApp;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *pushIdentifiers;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientApp"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  clientApp = self->_clientApp;
  self->_clientApp = v5;

  self->_subscriptionMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("subscriptionMode"));
  self->_fetchMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fetchMode"));
  v7 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("pushIdentifiers"));
  v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  pushIdentifiers = self->_pushIdentifiers;
  self->_pushIdentifiers = v10;

  return self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SPSecureLocationsSubscriptionContext clientApp](self, "clientApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<clientApp %@, subMode %ld, fetchMode %ld>"), v4, -[SPSecureLocationsSubscriptionContext subscriptionMode](self, "subscriptionMode"), -[SPSecureLocationsSubscriptionContext fetchMode](self, "fetchMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)subscriptionMode
{
  return self->_subscriptionMode;
}

- (void)setSubscriptionMode:(int64_t)a3
{
  self->_subscriptionMode = a3;
}

- (NSString)clientApp
{
  return self->_clientApp;
}

- (void)setClientApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)fetchMode
{
  return self->_fetchMode;
}

- (void)setFetchMode:(int64_t)a3
{
  self->_fetchMode = a3;
}

- (NSDictionary)pushIdentifiers
{
  return self->_pushIdentifiers;
}

- (void)setPushIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_pushIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientApp, 0);
}

@end
