@implementation SFKeyValueTuple

- (SFKeyValueTuple)initWithProtobuf:(id)a3
{
  id v4;
  SFKeyValueTuple *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFKeyValueTuple *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFKeyValueTuple;
  v5 = -[SFKeyValueTuple init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFKeyValueTuple setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFKeyValueTuple setValue:](v5, "setValue:", v9);

    }
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFKeyValueTuple)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBKeyValueTuple *v6;
  SFKeyValueTuple *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBKeyValueTuple initWithData:]([_SFPBKeyValueTuple alloc], "initWithData:", v5);
  v7 = -[SFKeyValueTuple initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBKeyValueTuple *v6;

  v4 = a3;
  v6 = -[_SFPBKeyValueTuple initWithFacade:]([_SFPBKeyValueTuple alloc], "initWithFacade:", self);
  -[_SFPBKeyValueTuple data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBKeyValueTuple *v2;
  void *v3;

  v2 = -[_SFPBKeyValueTuple initWithFacade:]([_SFPBKeyValueTuple alloc], "initWithFacade:", self);
  -[_SFPBKeyValueTuple dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBKeyValueTuple *v2;
  void *v3;

  v2 = -[_SFPBKeyValueTuple initWithFacade:]([_SFPBKeyValueTuple alloc], "initWithFacade:", self);
  -[_SFPBKeyValueTuple jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFKeyValueTuple key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setKey:", v6);

  -[SFKeyValueTuple value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setValue:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFKeyValueTuple *v5;
  SFKeyValueTuple *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v5 = (SFKeyValueTuple *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFKeyValueTuple isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFKeyValueTuple key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFKeyValueTuple key](v6, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[SFKeyValueTuple key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFKeyValueTuple key](self, "key");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFKeyValueTuple key](v6, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      -[SFKeyValueTuple value](self, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFKeyValueTuple value](v6, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[SFKeyValueTuple value](self, "value");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[SFKeyValueTuple value](self, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFKeyValueTuple value](v6, "value");
          v20 = v3;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v19, "isEqual:", v17);

          v3 = v20;
        }
        else
        {

          v11 = 1;
        }
      }
      v10 = v21;
      if (!v9)
        goto LABEL_18;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SFKeyValueTuple key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFKeyValueTuple value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
