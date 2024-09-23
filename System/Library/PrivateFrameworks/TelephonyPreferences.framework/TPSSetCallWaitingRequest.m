@implementation TPSSetCallWaitingRequest

- (TPSSetCallWaitingRequest)initWithSubscriptionContext:(id)a3
{
  -[TPSSetCallWaitingRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSSetCallWaitingRequest)initWithSubscriptionContext:(id)a3 enabled:(BOOL)a4
{
  TPSSetCallWaitingRequest *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSSetCallWaitingRequest;
  result = -[TPSCallWaitingRequest initWithSubscriptionContext:](&v6, sel_initWithSubscriptionContext_, a3);
  if (result)
    *((_BYTE *)&result->super.super._callClass + 4) = a4;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSSetCallWaitingRequest;
  result = -[TPSCallClassRequest copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_BYTE *)result + 20) = *((_BYTE *)&self->super.super._callClass + 4);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSSetCallWaitingRequest;
  v4 = a3;
  -[TPSCallClassRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = *((unsigned __int8 *)&self->super.super._callClass + 4);
  NSStringFromSelector(sel_enabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6, v7.receiver, v7.super_class);

}

- (TPSSetCallWaitingRequest)initWithCoder:(id)a3
{
  id v4;
  TPSSetCallWaitingRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSSetCallWaitingRequest;
  v5 = -[TPSCallWaitingRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_enabled);
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
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_subscriptionContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSRequest subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_callClass);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%u"), v6, -[TPSCallClassRequest callClass](self, "callClass"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_enabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TPSSetCallWaitingRequest enabled](self, "enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v7, v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSSetCallWaitingRequest;
  v3 = -[TPSCallClassRequest hash](&v5, sel_hash);
  return v3 ^ -[TPSSetCallWaitingRequest enabled](self, "enabled");
}

- (BOOL)isEqual:(id)a3
{
  TPSSetCallWaitingRequest *v4;
  BOOL v5;

  v4 = (TPSSetCallWaitingRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPSSetCallWaitingRequest isEqualToRequest:](self, "isEqualToRequest:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSSetCallWaitingRequest;
  v4 = -[TPSCallWaitingRequest isEqualToRequest:](&v6, sel_isEqualToRequest_, a3);
  if (v4)
    LOBYTE(v4) = -[TPSSetCallWaitingRequest enabled](self, "enabled");
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
  v9.super_class = (Class)&OBJC_METACLASS___TPSSetCallWaitingRequest;
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

- (BOOL)enabled
{
  return *((_BYTE *)&self->super.super._callClass + 4);
}

@end
