@implementation TPSSetCallForwardingRequest

- (TPSSetCallForwardingRequest)initWithSubscriptionContext:(id)a3
{
  -[TPSSetCallForwardingRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSSetCallForwardingRequest)initWithSubscriptionContext:(id)a3 value:(id)a4
{
  id v7;
  TPSSetCallForwardingRequest *v8;
  TPSSetCallForwardingRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TPSSetCallForwardingRequest;
  v8 = -[TPSRequest initWithSubscriptionContext:](&v11, sel_initWithSubscriptionContext_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_value, a4);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSSetCallForwardingRequest;
  v4 = -[TPSRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 2, self->_value);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CTCallForwardingValue *value;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSSetCallForwardingRequest;
  v4 = a3;
  -[TPSRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  value = self->_value;
  NSStringFromSelector(sel_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", value, v6, v7.receiver, v7.super_class);

}

- (TPSSetCallForwardingRequest)initWithCoder:(id)a3
{
  id v4;
  TPSSetCallForwardingRequest *v5;
  void *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSSetCallForwardingRequest;
  v5 = -[TPSRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_value);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "decodeObjectForKey:", v6);

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

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_subscriptionContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSRequest subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, self->_value);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSSetCallForwardingRequest;
  v3 = -[TPSRequest hash](&v7, sel_hash);
  -[TPSSetCallForwardingRequest value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  TPSSetCallForwardingRequest *v4;
  BOOL v5;

  v4 = (TPSSetCallForwardingRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPSSetCallForwardingRequest isEqualToRequest:](self, "isEqualToRequest:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSSetCallForwardingRequest;
  if (-[TPSRequest isEqualToRequest:](&v9, sel_isEqualToRequest_, v4))
  {
    -[TPSSetCallForwardingRequest value](self, "value");
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
  v9.super_class = (Class)&OBJC_METACLASS___TPSSetCallForwardingRequest;
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

- (CTCallForwardingValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
