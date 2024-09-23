@implementation SFEntitySearchMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFEntitySearchMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBEntitySearchMetadata *v6;
  SFEntitySearchMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBEntitySearchMetadata initWithData:]([_SFPBEntitySearchMetadata alloc], "initWithData:", v5);
  v7 = -[SFEntitySearchMetadata initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBEntitySearchMetadata *v6;

  v4 = a3;
  v6 = -[_SFPBEntitySearchMetadata initWithFacade:]([_SFPBEntitySearchMetadata alloc], "initWithFacade:", self);
  -[_SFPBEntitySearchMetadata data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBEntitySearchMetadata *v2;
  void *v3;

  v2 = -[_SFPBEntitySearchMetadata initWithFacade:]([_SFPBEntitySearchMetadata alloc], "initWithFacade:", self);
  -[_SFPBEntitySearchMetadata dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBEntitySearchMetadata *v2;
  void *v3;

  v2 = -[_SFPBEntitySearchMetadata initWithFacade:]([_SFPBEntitySearchMetadata alloc], "initWithFacade:", self);
  -[_SFPBEntitySearchMetadata jsonData](v2, "jsonData");
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
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setEntitySearchQuery:", v6);

  -[SFEntitySearchMetadata tokenQuery](self, "tokenQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTokenQuery:", v8);

  -[SFEntitySearchMetadata entityIdentifier](self, "entityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setEntityIdentifier:", v10);

  -[SFEntitySearchMetadata viewConfigName](self, "viewConfigName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setViewConfigName:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFEntitySearchMetadata *v5;
  SFEntitySearchMetadata *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v5 = (SFEntitySearchMetadata *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFEntitySearchMetadata isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEntitySearchMetadata entitySearchQuery](v6, "entitySearchQuery");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      -[SFEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFEntitySearchMetadata entitySearchQuery](v6, "entitySearchQuery");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      -[SFEntitySearchMetadata tokenQuery](self, "tokenQuery");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEntitySearchMetadata tokenQuery](v6, "tokenQuery");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_34;
      }
      -[SFEntitySearchMetadata tokenQuery](self, "tokenQuery");
      v15 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v15;
      if (v15)
      {
        v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        -[SFEntitySearchMetadata tokenQuery](self, "tokenQuery");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFEntitySearchMetadata tokenQuery](v6, "tokenQuery");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v11 = 0;
          v12 = v17;
          v14 = v35;
          goto LABEL_32;
        }
        v39 = v3;
        v12 = v17;
        v14 = v35;
      }
      else
      {
        v39 = v3;
      }
      -[SFEntitySearchMetadata entityIdentifier](self, "entityIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEntitySearchMetadata entityIdentifier](v6, "entityIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 == 0) == (v20 != 0))
      {

        v11 = 0;
        v3 = v39;
        v16 = v40;
        if (!v40)
          goto LABEL_33;
        goto LABEL_32;
      }
      v33 = v20;
      v34 = v19;
      -[SFEntitySearchMetadata entityIdentifier](self, "entityIdentifier");
      v16 = v40;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36
        || (-[SFEntitySearchMetadata entityIdentifier](self, "entityIdentifier"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFEntitySearchMetadata entityIdentifier](v6, "entityIdentifier"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        -[SFEntitySearchMetadata viewConfigName](self, "viewConfigName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFEntitySearchMetadata viewConfigName](v6, "viewConfigName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v22 == 0) == (v23 != 0))
        {

          v11 = 0;
          v16 = v40;
        }
        else
        {
          v29 = v22;
          v30 = v23;
          -[SFEntitySearchMetadata viewConfigName](self, "viewConfigName");
          v24 = objc_claimAutoreleasedReturnValue();
          v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            -[SFEntitySearchMetadata viewConfigName](self, "viewConfigName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFEntitySearchMetadata viewConfigName](v6, "viewConfigName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v27, "isEqual:");

          }
          else
          {

            v11 = 1;
          }
        }
        v3 = v39;
        if (!v36)
        {
LABEL_31:

          if (!v16)
          {
LABEL_33:

LABEL_34:
            v10 = v41;
            if (!v9)
            {
LABEL_36:

              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        v11 = 0;
        v3 = v39;
      }

      goto LABEL_31;
    }
    v11 = 0;
  }
LABEL_38:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[SFEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFEntitySearchMetadata tokenQuery](self, "tokenQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFEntitySearchMetadata entityIdentifier](self, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFEntitySearchMetadata viewConfigName](self, "viewConfigName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)entitySearchQuery
{
  return self->_entitySearchQuery;
}

- (void)setEntitySearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)tokenQuery
{
  return self->_tokenQuery;
}

- (void)setTokenQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (void)setViewConfigName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConfigName, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_tokenQuery, 0);
  objc_storeStrong((id *)&self->_entitySearchQuery, 0);
}

- (SFEntitySearchMetadata)initWithProtobuf:(id)a3
{
  id v4;
  SFEntitySearchMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFEntitySearchMetadata *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFEntitySearchMetadata;
  v5 = -[SFEntitySearchMetadata init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "entitySearchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "entitySearchQuery");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEntitySearchMetadata setEntitySearchQuery:](v5, "setEntitySearchQuery:", v7);

    }
    objc_msgSend(v4, "tokenQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "tokenQuery");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEntitySearchMetadata setTokenQuery:](v5, "setTokenQuery:", v9);

    }
    objc_msgSend(v4, "entityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "entityIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEntitySearchMetadata setEntityIdentifier:](v5, "setEntityIdentifier:", v11);

    }
    objc_msgSend(v4, "viewConfigName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "viewConfigName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEntitySearchMetadata setViewConfigName:](v5, "setViewConfigName:", v13);

    }
    v14 = v5;
  }

  return v5;
}

@end
