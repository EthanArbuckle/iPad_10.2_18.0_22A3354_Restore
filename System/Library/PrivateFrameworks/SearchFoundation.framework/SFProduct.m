@implementation SFProduct

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setBuyable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_buyable = a3;
}

- (BOOL)hasBuyable
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFProduct)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBProduct *v6;
  SFProduct *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBProduct initWithData:]([_SFPBProduct alloc], "initWithData:", v5);
  v7 = -[SFProduct initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBProduct *v6;

  v4 = a3;
  v6 = -[_SFPBProduct initWithFacade:]([_SFPBProduct alloc], "initWithFacade:", self);
  -[_SFPBProduct data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBProduct *v2;
  void *v3;

  v2 = -[_SFPBProduct initWithFacade:]([_SFPBProduct alloc], "initWithFacade:", self);
  -[_SFPBProduct dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBProduct *v2;
  void *v3;

  v2 = -[_SFPBProduct initWithFacade:]([_SFPBProduct alloc], "initWithFacade:", self);
  -[_SFPBProduct jsonData](v2, "jsonData");
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
  -[SFProduct identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  -[SFProduct productIdentifier](self, "productIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setProductIdentifier:", v8);

  -[SFProduct availabilityURL](self, "availabilityURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setAvailabilityURL:", v10);

  -[SFProduct displayName](self, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setDisplayName:", v12);

  objc_msgSend(v4, "setBuyable:", -[SFProduct buyable](self, "buyable"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFProduct *v4;
  SFProduct *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v27;
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

  v4 = (SFProduct *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if (-[SFProduct isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[SFProduct identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProduct identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        LOBYTE(v10) = 0;
LABEL_37:

        goto LABEL_38;
      }
      -[SFProduct identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFProduct identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFProduct identifier](v5, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          LOBYTE(v10) = 0;
          goto LABEL_35;
        }
        v39 = v9;
      }
      -[SFProduct productIdentifier](self, "productIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProduct productIdentifier](v5, "productIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v41 == 0) != (v11 != 0))
      {
        -[SFProduct productIdentifier](self, "productIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          -[SFProduct productIdentifier](self, "productIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFProduct productIdentifier](v5, "productIdentifier");
          v36 = v14;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "isEqual:"))
          {
            LOBYTE(v10) = 0;
            v19 = v38;
            goto LABEL_32;
          }
          v37 = v13;
        }
        else
        {
          v37 = 0;
        }
        -[SFProduct availabilityURL](self, "availabilityURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFProduct availabilityURL](v5, "availabilityURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v15 == 0) != (v16 != 0))
        {
          v34 = v15;
          v35 = v16;
          -[SFProduct availabilityURL](self, "availabilityURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[SFProduct availabilityURL](self, "availabilityURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFProduct availabilityURL](v5, "availabilityURL");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v18;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              LOBYTE(v10) = 0;
              v13 = v37;
              v19 = v38;
              goto LABEL_30;
            }
          }
          -[SFProduct displayName](self, "displayName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;
          -[SFProduct displayName](v5, "displayName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 == (v22 != 0))
          {

            LOBYTE(v10) = 0;
            v13 = v37;
            v19 = v38;
            if (!v17)
              goto LABEL_31;
            goto LABEL_30;
          }
          v29 = v22;
          v30 = v20;
          -[SFProduct displayName](self, "displayName");
          v19 = v38;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v31
            || (-[SFProduct displayName](self, "displayName"),
                v23 = objc_claimAutoreleasedReturnValue(),
                -[SFProduct displayName](v5, "displayName"),
                v24 = objc_claimAutoreleasedReturnValue(),
                v28 = (void *)v23,
                v25 = (void *)v23,
                v21 = v24,
                objc_msgSend(v25, "isEqual:", v24)))
          {
            v27 = -[SFProduct buyable](self, "buyable");
            v10 = v27 ^ -[SFProduct buyable](v5, "buyable") ^ 1;
            if (!v31)
              goto LABEL_41;
          }
          else
          {
            LOBYTE(v10) = 0;
          }

LABEL_41:
          v13 = v37;
          if (!v17)
          {
LABEL_31:

            if (!v13)
            {
LABEL_33:

LABEL_34:
              v9 = v39;
              if (!v8)
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
LABEL_30:

          goto LABEL_31;
        }

        if (v37)
        {

        }
      }

      LOBYTE(v10) = 0;
      goto LABEL_34;
    }
    LOBYTE(v10) = 0;
  }
LABEL_38:

  return v10;
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
  uint64_t v10;
  unint64_t v11;

  -[SFProduct identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFProduct productIdentifier](self, "productIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFProduct availabilityURL](self, "availabilityURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFProduct displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = v10 ^ -[SFProduct buyable](self, "buyable");

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)availabilityURL
{
  return self->_availabilityURL;
}

- (void)setAvailabilityURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)buyable
{
  return self->_buyable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_availabilityURL, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SFProduct)initWithProtobuf:(id)a3
{
  id v4;
  SFProduct *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SFProduct *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFProduct;
  v5 = -[SFProduct init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProduct setIdentifier:](v5, "setIdentifier:", v7);

    }
    objc_msgSend(v4, "productIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "productIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProduct setProductIdentifier:](v5, "setProductIdentifier:", v9);

    }
    objc_msgSend(v4, "availabilityURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "availabilityURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProduct setAvailabilityURL:](v5, "setAvailabilityURL:", v12);

    }
    objc_msgSend(v4, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProduct setDisplayName:](v5, "setDisplayName:", v14);

    }
    if (objc_msgSend(v4, "buyable"))
      -[SFProduct setBuyable:](v5, "setBuyable:", objc_msgSend(v4, "buyable"));
    v15 = v5;
  }

  return v5;
}

@end
