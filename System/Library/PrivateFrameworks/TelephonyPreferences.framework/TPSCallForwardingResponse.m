@implementation TPSCallForwardingResponse

- (TPSCallForwardingResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  -[TPSCallForwardingResponse doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (TPSCallForwardingResponse)initWithSubscriptionContext:(id)a3 error:(id)a4 value:(id)a5
{
  id v9;
  TPSCallForwardingResponse *v10;
  TPSCallForwardingResponse *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TPSCallForwardingResponse;
  v10 = -[TPSResponse initWithSubscriptionContext:error:](&v13, sel_initWithSubscriptionContext_error_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_value, a5);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSCallForwardingResponse;
  v4 = -[TPSResponse copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 3, self->_value);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CTCallForwardingValue *value;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCallForwardingResponse;
  v4 = a3;
  -[TPSResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  value = self->_value;
  NSStringFromSelector(sel_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", value, v6, v7.receiver, v7.super_class);

}

- (TPSCallForwardingResponse)initWithCoder:(id)a3
{
  id v4;
  TPSCallForwardingResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CTCallForwardingValue *value;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSCallForwardingResponse;
  v5 = -[TPSResponse initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_value);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (CTCallForwardingValue *)v8;

  }
  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

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

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v8, self->_value);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCallForwardingResponse;
  v3 = -[TPSResponse hash](&v7, sel_hash);
  -[TPSCallForwardingResponse value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  TPSCallForwardingResponse *v4;
  BOOL v5;

  v4 = (TPSCallForwardingResponse *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPSCallForwardingResponse isEqualToResponse:](self, "isEqualToResponse:", v4);
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCallForwardingResponse;
  if (-[TPSResponse isEqualToResponse:](&v9, sel_isEqualToResponse_, v4))
  {
    -[TPSCallForwardingResponse value](self, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (v5 | v6) == 0;
    if (v6)
      v7 = objc_msgSend((id)v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallForwardingResponse;
  objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSet:", v4);

  v10[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
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

- (CTCallForwardingValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
