@implementation SFImageOption

- (SFImageOption)initWithProtobuf:(id)a3
{
  id v4;
  SFImageOption *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SFImageOption *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFImageOption;
  v5 = -[SFImageOption init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFImageOption setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "defaultValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "defaultValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFImageOption setDefaultValue:](v5, "setDefaultValue:", v9);

    }
    objc_msgSend(v4, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBStringDictionaryHandwrittenTranslator(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFImageOption setOptions:](v5, "setOptions:", v12);

    }
    v13 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFImageOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImageOption *v6;
  SFImageOption *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImageOption initWithData:]([_SFPBImageOption alloc], "initWithData:", v5);
  v7 = -[SFImageOption initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImageOption *v6;

  v4 = a3;
  v6 = -[_SFPBImageOption initWithFacade:]([_SFPBImageOption alloc], "initWithFacade:", self);
  -[_SFPBImageOption data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBImageOption *v2;
  void *v3;

  v2 = -[_SFPBImageOption initWithFacade:]([_SFPBImageOption alloc], "initWithFacade:", self);
  -[_SFPBImageOption dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBImageOption *v2;
  void *v3;

  v2 = -[_SFPBImageOption initWithFacade:]([_SFPBImageOption alloc], "initWithFacade:", self);
  -[_SFPBImageOption jsonData](v2, "jsonData");
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
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFImageOption name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setName:", v6);

  -[SFImageOption defaultValue](self, "defaultValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDefaultValue:", v8);

  -[SFImageOption options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setOptions:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFImageOption *v5;
  SFImageOption *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = (SFImageOption *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFImageOption isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFImageOption name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFImageOption name](v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[SFImageOption name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFImageOption name](self, "name");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFImageOption name](v6, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      -[SFImageOption defaultValue](self, "defaultValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFImageOption defaultValue](v6, "defaultValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_27;
      }
      -[SFImageOption defaultValue](self, "defaultValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v25 = v12;
        -[SFImageOption defaultValue](self, "defaultValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFImageOption defaultValue](v6, "defaultValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      -[SFImageOption options](self, "options");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFImageOption options](v6, "options");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v17 == 0) == (v18 != 0))
      {

        v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30)
          goto LABEL_26;
      }
      else
      {
        v24 = v17;
        v26 = v18;
        -[SFImageOption options](self, "options");
        v19 = objc_claimAutoreleasedReturnValue();
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          -[SFImageOption options](self, "options");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFImageOption options](v6, "options");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v22, "isEqual:");

        }
        else
        {

          v11 = 1;
        }
        v3 = v27;
        if (!v30)
          goto LABEL_26;
      }
LABEL_25:

LABEL_26:
LABEL_27:
      v10 = v31;
      if (!v9)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    v11 = 0;
  }
LABEL_31:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SFImageOption name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFImageOption defaultValue](self, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFImageOption options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
