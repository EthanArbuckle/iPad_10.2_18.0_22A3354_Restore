@implementation SFURLShareItem

- (SFURLShareItem)initWithProtobuf:(id)a3
{
  id v4;
  SFURLShareItem *v5;
  void *v6;
  void *v7;
  void *v8;
  SFURLShareItem *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFURLShareItem;
  v5 = -[SFURLShareItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "urlValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "urlValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFURLShareItem setUrlValue:](v5, "setUrlValue:", v8);

    }
    v9 = v5;
  }

  return v5;
}

- (SFURLShareItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBURLShareItem *v6;
  SFURLShareItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBURLShareItem initWithData:]([_SFPBURLShareItem alloc], "initWithData:", v5);
  v7 = -[SFURLShareItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBURLShareItem *v6;

  v4 = a3;
  v6 = -[_SFPBURLShareItem initWithFacade:]([_SFPBURLShareItem alloc], "initWithFacade:", self);
  -[_SFPBURLShareItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBURLShareItem *v2;
  void *v3;

  v2 = -[_SFPBURLShareItem initWithFacade:]([_SFPBURLShareItem alloc], "initWithFacade:", self);
  -[_SFPBURLShareItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBURLShareItem *v2;
  void *v3;

  v2 = -[_SFPBURLShareItem initWithFacade:]([_SFPBURLShareItem alloc], "initWithFacade:", self);
  -[_SFPBURLShareItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFURLShareItem;
  v4 = -[SFShareItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFURLShareItem urlValue](self, "urlValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUrlValue:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFURLShareItem *v4;
  SFURLShareItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFURLShareItem *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFURLShareItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFURLShareItem,
             -[SFShareItem isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFURLShareItem urlValue](self, "urlValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFURLShareItem urlValue](v5, "urlValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFURLShareItem urlValue](self, "urlValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFURLShareItem urlValue](self, "urlValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFURLShareItem urlValue](v5, "urlValue");
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
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFURLShareItem;
  v3 = -[SFShareItem hash](&v7, sel_hash);
  -[SFURLShareItem urlValue](self, "urlValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSURL)urlValue
{
  return self->_urlValue;
}

- (void)setUrlValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
