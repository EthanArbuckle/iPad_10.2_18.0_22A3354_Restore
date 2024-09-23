@implementation TPSResponse

- (TPSResponse)init
{
  -[TPSResponse doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  TPSResponse *v9;
  TPSResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSResponse;
  v9 = -[TPSResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong((id *)&v10->_subscriptionContext, a3);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSubscriptionContext:error:", self->_subscriptionContext, self->_error);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  id v5;
  void *v6;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  id v8;

  error = self->_error;
  v5 = a3;
  NSStringFromSelector(sel_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", error, v6);

  subscriptionContext = self->_subscriptionContext;
  NSStringFromSelector(sel_subscriptionContext);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", subscriptionContext, v8);

}

- (TPSResponse)initWithCoder:(id)a3
{
  id v4;
  TPSResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSResponse;
  v5 = -[TPSResponse init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_subscriptionContext);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    subscriptionContext = v5->_subscriptionContext;
    v5->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v12;

  }
  return v5;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_subscriptionContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSResponse subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSResponse error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TPSResponse error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TPSResponse subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TPSResponse *v4;
  BOOL v5;

  v4 = (TPSResponse *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TPSResponse isEqualToResponse:](self, "isEqualToResponse:", v4);
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  -[TPSResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = (void *)v8;
  if (!(v7 | v8))
  {
LABEL_4:
    -[TPSResponse subscriptionContext](self, "subscriptionContext");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscriptionContext");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (v11 | v12) == 0;
    if (v12)
      v13 = objc_msgSend((id)v11, "isEqual:", v12);

    goto LABEL_8;
  }
  if (v8)
  {
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if (!v10)
    {
      v13 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  v13 = 0;
  v11 = v7;
LABEL_8:

LABEL_9:
  return v13;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
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

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
