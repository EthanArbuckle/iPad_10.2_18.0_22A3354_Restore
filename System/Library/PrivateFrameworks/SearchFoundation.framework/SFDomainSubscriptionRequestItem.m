@implementation SFDomainSubscriptionRequestItem

- (SFDomainSubscriptionRequestItem)initWithProtobuf:(id)a3
{
  id v4;
  SFDomainSubscriptionRequestItem *v5;
  void *v6;
  SFSportsSubscriptionRequestItem *v7;
  void *v8;
  SFDomainSubscriptionRequestItem *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFDomainSubscriptionRequestItem;
  v5 = -[SFDomainSubscriptionRequestItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sportsSubscriptionRequestItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFSportsSubscriptionRequestItem alloc];
      objc_msgSend(v4, "sportsSubscriptionRequestItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFSportsSubscriptionRequestItem initWithProtobuf:](v7, "initWithProtobuf:", v8);

    }
    else
    {
      v9 = v5;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFDomainSubscriptionRequestItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBDomainSubscriptionRequestItem *v6;
  SFDomainSubscriptionRequestItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBDomainSubscriptionRequestItem initWithData:]([_SFPBDomainSubscriptionRequestItem alloc], "initWithData:", v5);
  v7 = -[SFDomainSubscriptionRequestItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBDomainSubscriptionRequestItem *v6;

  v4 = a3;
  v6 = -[_SFPBDomainSubscriptionRequestItem initWithFacade:]([_SFPBDomainSubscriptionRequestItem alloc], "initWithFacade:", self);
  -[_SFPBDomainSubscriptionRequestItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBDomainSubscriptionRequestItem *v2;
  void *v3;

  v2 = -[_SFPBDomainSubscriptionRequestItem initWithFacade:]([_SFPBDomainSubscriptionRequestItem alloc], "initWithFacade:", self);
  -[_SFPBDomainSubscriptionRequestItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBDomainSubscriptionRequestItem *v2;
  void *v3;

  v2 = -[_SFPBDomainSubscriptionRequestItem initWithFacade:]([_SFPBDomainSubscriptionRequestItem alloc], "initWithFacade:", self);
  -[_SFPBDomainSubscriptionRequestItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  if (self == a3)
    return 1;
  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

@end
