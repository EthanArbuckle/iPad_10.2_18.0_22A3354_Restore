@implementation TPSRequest

- (TPSRequest)init
{
  -[TPSRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSRequest)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSRequest *v6;
  TPSRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSRequest;
  v6 = -[TPSRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSubscriptionContext:", self->_subscriptionContext);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CTXPCServiceSubscriptionContext *subscriptionContext;
  id v4;
  id v5;

  subscriptionContext = self->_subscriptionContext;
  v4 = a3;
  NSStringFromSelector(sel_subscriptionContext);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", subscriptionContext, v5);

}

- (TPSRequest)initWithCoder:(id)a3
{
  id v4;
  TPSRequest *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSRequest;
  v5 = -[TPSRequest init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_subscriptionContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    subscriptionContext = v5->_subscriptionContext;
    v5->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v8;

  }
  return v5;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_subscriptionContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSRequest subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TPSRequest subscriptionContext](self, "subscriptionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  TPSRequest *v4;
  BOOL v5;

  v4 = (TPSRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TPSRequest isEqualToRequest:](self, "isEqualToRequest:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  -[TPSRequest subscriptionContext](self, "subscriptionContext");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContext");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (v5 | v6) == 0;
  if (v6)
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

  return v7;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
