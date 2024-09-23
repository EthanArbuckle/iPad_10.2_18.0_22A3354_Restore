@implementation SFShareItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShareItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBShareItem *v6;
  SFShareItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBShareItem initWithData:]([_SFPBShareItem alloc], "initWithData:", v5);
  v7 = -[SFShareItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBShareItem *v6;

  v4 = a3;
  v6 = -[_SFPBShareItem initWithFacade:]([_SFPBShareItem alloc], "initWithFacade:", self);
  -[_SFPBShareItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBShareItem *v2;
  void *v3;

  v2 = -[_SFPBShareItem initWithFacade:]([_SFPBShareItem alloc], "initWithFacade:", self);
  -[_SFPBShareItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBShareItem *v2;
  void *v3;

  v2 = -[_SFPBShareItem initWithFacade:]([_SFPBShareItem alloc], "initWithFacade:", self);
  -[_SFPBShareItem jsonData](v2, "jsonData");
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

- (SFShareItem)initWithProtobuf:(id)a3
{
  id v4;
  SFShareItem *v5;
  void *v6;
  SFURLShareItem *v7;
  uint64_t v8;
  SFShareItem *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFShareItem;
  v5 = -[SFShareItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "urlShareItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFURLShareItem alloc];
      objc_msgSend(v4, "urlShareItem");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "spotlightShareItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v9 = v5;
        goto LABEL_8;
      }
      v7 = [SFCoreSpotlightShareItem alloc];
      objc_msgSend(v4, "spotlightShareItem");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v8;
    v9 = -[SFURLShareItem initWithProtobuf:](v7, "initWithProtobuf:", v8);

  }
  else
  {
    v9 = 0;
  }
LABEL_8:

  return v9;
}

@end
