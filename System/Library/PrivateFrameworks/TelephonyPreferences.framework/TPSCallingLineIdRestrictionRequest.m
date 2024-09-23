@implementation TPSCallingLineIdRestrictionRequest

- (TPSCallingLineIdRestrictionRequest)initWithSubscriptionContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSCallingLineIdRestrictionRequest;
  return -[TPSRequest initWithSubscriptionContext:](&v4, sel_initWithSubscriptionContext_, a3);
}

- (TPSCallingLineIdRestrictionRequest)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSCallingLineIdRestrictionRequest;
  return -[TPSRequest initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (BOOL)isEqual:(id)a3
{
  TPSCallingLineIdRestrictionRequest *v4;
  BOOL v5;

  v4 = (TPSCallingLineIdRestrictionRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPSCallingLineIdRestrictionRequest isEqualToRequest:](self, "isEqualToRequest:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSCallingLineIdRestrictionRequest;
  return -[TPSRequest isEqualToRequest:](&v4, sel_isEqualToRequest_, a3);
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
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallingLineIdRestrictionRequest;
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

@end
