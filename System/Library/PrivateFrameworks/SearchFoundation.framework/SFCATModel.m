@implementation SFCATModel

- (SFCATModel)initWithProtobuf:(id)a3
{
  id v4;
  SFCATModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFCATModel *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFCATModel;
  v5 = -[SFCATModel init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "catIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "catIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCATModel setCatIdentifier:](v5, "setCatIdentifier:", v7);

    }
    objc_msgSend(v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCATModel setBundleIdentifier:](v5, "setBundleIdentifier:", v9);

    }
    objc_msgSend(v4, "params");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "params");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCATModel setParams:](v5, "setParams:", v11);

    }
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCATModel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCATModel *v6;
  SFCATModel *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCATModel initWithData:]([_SFPBCATModel alloc], "initWithData:", v5);
  v7 = -[SFCATModel initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCATModel *v6;

  v4 = a3;
  v6 = -[_SFPBCATModel initWithFacade:]([_SFPBCATModel alloc], "initWithFacade:", self);
  -[_SFPBCATModel data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCATModel *v2;
  void *v3;

  v2 = -[_SFPBCATModel initWithFacade:]([_SFPBCATModel alloc], "initWithFacade:", self);
  -[_SFPBCATModel dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCATModel *v2;
  void *v3;

  v2 = -[_SFPBCATModel initWithFacade:]([_SFPBCATModel alloc], "initWithFacade:", self);
  -[_SFPBCATModel jsonData](v2, "jsonData");
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
  -[SFCATModel catIdentifier](self, "catIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCatIdentifier:", v6);

  -[SFCATModel bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setBundleIdentifier:", v8);

  -[SFCATModel params](self, "params");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setParams:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFCATModel *v5;
  SFCATModel *v6;
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

  v5 = (SFCATModel *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFCATModel isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFCATModel catIdentifier](self, "catIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCATModel catIdentifier](v6, "catIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[SFCATModel catIdentifier](self, "catIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFCATModel catIdentifier](self, "catIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCATModel catIdentifier](v6, "catIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      -[SFCATModel bundleIdentifier](self, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCATModel bundleIdentifier](v6, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_27;
      }
      -[SFCATModel bundleIdentifier](self, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v25 = v12;
        -[SFCATModel bundleIdentifier](self, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCATModel bundleIdentifier](v6, "bundleIdentifier");
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
      -[SFCATModel params](self, "params");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCATModel params](v6, "params");
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
        -[SFCATModel params](self, "params");
        v19 = objc_claimAutoreleasedReturnValue();
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          -[SFCATModel params](self, "params");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCATModel params](v6, "params");
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

  -[SFCATModel catIdentifier](self, "catIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFCATModel bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFCATModel params](self, "params");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)catIdentifier
{
  return self->_catIdentifier;
}

- (void)setCatIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_catIdentifier, 0);
}

@end
