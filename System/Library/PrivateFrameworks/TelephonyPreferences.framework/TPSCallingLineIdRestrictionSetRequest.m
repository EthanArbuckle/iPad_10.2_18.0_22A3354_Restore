@implementation TPSCallingLineIdRestrictionSetRequest

- (TPSCallingLineIdRestrictionSetRequest)initWithSubscriptionContext:(id)a3
{
  -[TPSCallingLineIdRestrictionSetRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSCallingLineIdRestrictionSetRequest)initWithSubscriptionContext:(id)a3 state:(int64_t)a4
{
  TPSCallingLineIdRestrictionSetRequest *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  result = -[TPSCallingLineIdRestrictionRequest initWithSubscriptionContext:](&v6, sel_initWithSubscriptionContext_, a3);
  if (result)
    result->_state = a4;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  result = -[TPSRequest copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 2) = self->_state;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  v4 = a3;
  -[TPSRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = self->_state != 0;
  NSStringFromSelector(sel_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6, v7.receiver, v7.super_class);

}

- (TPSCallingLineIdRestrictionSetRequest)initWithCoder:(id)a3
{
  id v4;
  TPSCallingLineIdRestrictionSetRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  v5 = -[TPSCallingLineIdRestrictionRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_state);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeBoolForKey:", v6);

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

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_subscriptionContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSRequest subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "tps_stringWithTPSCallingLineIdRestrictionState:", -[TPSCallingLineIdRestrictionSetRequest state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  v3 = -[TPSRequest hash](&v5, sel_hash);
  return -[TPSCallingLineIdRestrictionSetRequest state](self, "state") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  TPSCallingLineIdRestrictionSetRequest *v4;
  BOOL v5;

  v4 = (TPSCallingLineIdRestrictionSetRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPSCallingLineIdRestrictionSetRequest isEqualToRequest:](self, "isEqualToRequest:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  v4 = -[TPSCallingLineIdRestrictionRequest isEqualToRequest:](&v6, sel_isEqualToRequest_, a3);
  if (v4)
    LOBYTE(v4) = -[TPSCallingLineIdRestrictionSetRequest state](self, "state") != 0;
  return v4;
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
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallingLineIdRestrictionSetRequest;
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

- (int64_t)state
{
  return self->_state;
}

@end
