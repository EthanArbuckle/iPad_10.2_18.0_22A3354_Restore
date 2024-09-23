@implementation TPSCallWaitingResponse

- (TPSCallWaitingResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  -[TPSCallWaitingResponse doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (TPSCallWaitingResponse)initWithsubscriptionContext:(id)a3 error:(id)a4 enabled:(BOOL)a5
{
  TPSCallWaitingResponse *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCallWaitingResponse;
  result = -[TPSResponse initWithSubscriptionContext:error:](&v7, sel_initWithSubscriptionContext_error_, a3, a4);
  if (result)
    result->_enabled = a5;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCallWaitingResponse;
  result = -[TPSResponse copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_BYTE *)result + 24) = self->_enabled;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 enabled;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCallWaitingResponse;
  v4 = a3;
  -[TPSResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  enabled = self->_enabled;
  NSStringFromSelector(sel_enabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", enabled, v6, v7.receiver, v7.super_class);

}

- (TPSCallWaitingResponse)initWithCoder:(id)a3
{
  id v4;
  TPSCallWaitingResponse *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallWaitingResponse;
  v5 = -[TPSResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_enabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", v6);

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
  void *v10;

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
  NSStringFromSelector(sel_enabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TPSCallWaitingResponse enabled](self, "enabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v8, v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCallWaitingResponse;
  v3 = -[TPSResponse hash](&v5, sel_hash);
  return v3 ^ -[TPSCallWaitingResponse enabled](self, "enabled");
}

- (BOOL)isEqual:(id)a3
{
  TPSCallWaitingResponse *v4;
  BOOL v5;

  v4 = (TPSCallWaitingResponse *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPSCallWaitingResponse isEqualToResponse:](self, "isEqualToResponse:", v4);
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallWaitingResponse;
  if (-[TPSResponse isEqualToResponse:](&v8, sel_isEqualToResponse_, v4))
  {
    v5 = -[TPSCallWaitingResponse enabled](self, "enabled");
    v6 = v5 ^ objc_msgSend(v4, "enabled") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
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
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallWaitingResponse;
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

- (BOOL)enabled
{
  return self->_enabled;
}

@end
