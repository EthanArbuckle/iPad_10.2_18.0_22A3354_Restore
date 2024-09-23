@implementation SFLocationTypeInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFLocationTypeInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBLocationTypeInfo *v6;
  SFLocationTypeInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBLocationTypeInfo initWithData:]([_SFPBLocationTypeInfo alloc], "initWithData:", v5);
  v7 = -[SFLocationTypeInfo initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBLocationTypeInfo *v6;

  v4 = a3;
  v6 = -[_SFPBLocationTypeInfo initWithFacade:]([_SFPBLocationTypeInfo alloc], "initWithFacade:", self);
  -[_SFPBLocationTypeInfo data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBLocationTypeInfo *v2;
  void *v3;

  v2 = -[_SFPBLocationTypeInfo initWithFacade:]([_SFPBLocationTypeInfo alloc], "initWithFacade:", self);
  -[_SFPBLocationTypeInfo dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBLocationTypeInfo *v2;
  void *v3;

  v2 = -[_SFPBLocationTypeInfo initWithFacade:]([_SFPBLocationTypeInfo alloc], "initWithFacade:", self);
  -[_SFPBLocationTypeInfo jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFLocationTypeInfo address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAddress:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFLocationTypeInfo *v4;
  SFLocationTypeInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SFLocationTypeInfo *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFLocationTypeInfo isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SFLocationTypeInfo address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLocationTypeInfo address](v5, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFLocationTypeInfo address](self, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFLocationTypeInfo address](self, "address");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFLocationTypeInfo address](v5, "address");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SFLocationTypeInfo address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

- (SFLocationTypeInfo)initWithProtobuf:(id)a3
{
  id v4;
  SFLocationTypeInfo *v5;
  void *v6;
  void *v7;
  SFLocationTypeInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFLocationTypeInfo;
  v5 = -[SFLocationTypeInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "address");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFLocationTypeInfo setAddress:](v5, "setAddress:", v7);

    }
    v8 = v5;
  }

  return v5;
}

@end
