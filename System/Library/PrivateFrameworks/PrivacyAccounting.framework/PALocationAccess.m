@implementation PALocationAccess

+ (id)eventStreamIdentifier
{
  return CFSTR("com.apple.privacy.accounting.stream.location");
}

- (id)category
{
  return CFSTR("location");
}

- (PALocationAccess)initWithProto:(id)a3
{
  id v4;
  void *v5;
  PALocationAccess *v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "access");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = self;
    v8.super_class = (Class)PALocationAccess;
    self = -[PAAccess initWithProto:](&v8, sel_initWithProto_, v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PALocationAccess)initWithProtoData:(id)a3
{
  id v4;
  PAPBLocationAccess *v5;
  PALocationAccess *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[PAPBLocationAccess initWithData:]([PAPBLocationAccess alloc], "initWithData:", v4);

    v6 = -[PALocationAccess initWithProto:](self, "initWithProto:", v5);
    self = v6;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)PALocationAccess;
  -[PAAccess proto](&v7, sel_proto);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setAccess:", v4);
    v5 = v3;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
