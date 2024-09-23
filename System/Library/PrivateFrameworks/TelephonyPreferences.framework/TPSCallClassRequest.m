@implementation TPSCallClassRequest

- (TPSCallClassRequest)initWithSubscriptionContext:(id)a3
{
  -[TPSCallClassRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSCallClassRequest)initWithSubscriptionContext:(id)a3 callClass:(int)a4
{
  TPSCallClassRequest *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSCallClassRequest;
  result = -[TPSRequest initWithSubscriptionContext:](&v6, sel_initWithSubscriptionContext_, a3);
  if (result)
    result->_callClass = a4;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCallClassRequest;
  result = -[TPSRequest copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_DWORD *)result + 4) = self->_callClass;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t callClass;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCallClassRequest;
  v4 = a3;
  -[TPSRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  callClass = self->_callClass;
  NSStringFromSelector(sel_callClass);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", callClass, v6, v7.receiver, v7.super_class);

}

- (TPSCallClassRequest)initWithCoder:(id)a3
{
  id v4;
  TPSCallClassRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallClassRequest;
  v5 = -[TPSRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_callClass);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_callClass = objc_msgSend(v4, "decodeIntForKey:", v6);

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
  NSStringFromSelector(sel_callClass);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%u"), v6, -[TPSCallClassRequest callClass](self, "callClass"));

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCallClassRequest;
  v3 = -[TPSRequest hash](&v5, sel_hash);
  return v3 ^ -[TPSCallClassRequest callClass](self, "callClass");
}

- (BOOL)isEqual:(id)a3
{
  TPSCallClassRequest *v4;
  BOOL v5;

  v4 = (TPSCallClassRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TPSCallClassRequest isEqualToRequest:](self, "isEqualToRequest:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallClassRequest;
  if (-[TPSRequest isEqualToRequest:](&v8, sel_isEqualToRequest_, v4))
  {
    v5 = -[TPSCallClassRequest callClass](self, "callClass");
    v6 = v5 == objc_msgSend(v4, "callClass");
  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallClassRequest;
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

- (int)callClass
{
  return self->_callClass;
}

- (void)setCallClass:(int)a3
{
  self->_callClass = a3;
}

@end
