@implementation SFAppEntityAnnotation

- (SFAppEntityAnnotation)initWithProtobuf:(id)a3
{
  id v4;
  SFAppEntityAnnotation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFAppEntityAnnotation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFAppEntityAnnotation;
  v5 = -[SFAppEntityAnnotation init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "typeIdentifer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "typeIdentifer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppEntityAnnotation setTypeIdentifer:](v5, "setTypeIdentifer:", v7);

    }
    objc_msgSend(v4, "entityIdentifer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "entityIdentifer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppEntityAnnotation setEntityIdentifer:](v5, "setEntityIdentifer:", v9);

    }
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppEntityAnnotation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAppEntityAnnotation *v6;
  SFAppEntityAnnotation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBAppEntityAnnotation initWithData:]([_SFPBAppEntityAnnotation alloc], "initWithData:", v5);
  v7 = -[SFAppEntityAnnotation initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAppEntityAnnotation *v6;

  v4 = a3;
  v6 = -[_SFPBAppEntityAnnotation initWithFacade:]([_SFPBAppEntityAnnotation alloc], "initWithFacade:", self);
  -[_SFPBAppEntityAnnotation data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAppEntityAnnotation *v2;
  void *v3;

  v2 = -[_SFPBAppEntityAnnotation initWithFacade:]([_SFPBAppEntityAnnotation alloc], "initWithFacade:", self);
  -[_SFPBAppEntityAnnotation dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAppEntityAnnotation *v2;
  void *v3;

  v2 = -[_SFPBAppEntityAnnotation initWithFacade:]([_SFPBAppEntityAnnotation alloc], "initWithFacade:", self);
  -[_SFPBAppEntityAnnotation jsonData](v2, "jsonData");
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
  -[SFAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTypeIdentifer:", v6);

  -[SFAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setEntityIdentifer:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFAppEntityAnnotation *v5;
  SFAppEntityAnnotation *v6;
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

  v5 = (SFAppEntityAnnotation *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFAppEntityAnnotation isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppEntityAnnotation typeIdentifer](v6, "typeIdentifer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[SFAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAppEntityAnnotation typeIdentifer](v6, "typeIdentifer");
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
      -[SFAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppEntityAnnotation entityIdentifer](v6, "entityIdentifer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[SFAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[SFAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFAppEntityAnnotation entityIdentifer](v6, "entityIdentifer");
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

  -[SFAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)typeIdentifer
{
  return self->_typeIdentifer;
}

- (void)setTypeIdentifer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)entityIdentifer
{
  return self->_entityIdentifer;
}

- (void)setEntityIdentifer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifer, 0);
  objc_storeStrong((id *)&self->_typeIdentifer, 0);
}

@end
