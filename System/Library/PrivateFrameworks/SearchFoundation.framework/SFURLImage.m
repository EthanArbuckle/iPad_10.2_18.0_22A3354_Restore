@implementation SFURLImage

- (SFURLImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFURLImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFURLImage;
  v7 = -[SFImage initWithProtobuf:](&v9, sel_initWithProtobuf_, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;

  v4 = a3;
  v6 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBURLImage *v2;
  void *v3;

  v2 = -[_SFPBURLImage initWithFacade:]([_SFPBURLImage alloc], "initWithFacade:", self);
  -[_SFPBURLImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBURLImage *v2;
  void *v3;

  v2 = -[_SFPBURLImage initWithFacade:]([_SFPBURLImage alloc], "initWithFacade:", self);
  -[_SFPBURLImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFURLImage;
  v4 = -[SFImage copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFURLImage urlValue](self, "urlValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUrlValue:", v6);

  -[SFURLImage darkUrlValue](self, "darkUrlValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDarkUrlValue:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFURLImage *v5;
  SFURLImage *v6;
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
  objc_super v22;

  v5 = (SFURLImage *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFURLImage isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)SFURLImage;
      if (-[SFImage isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFURLImage urlValue](self, "urlValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFURLImage urlValue](v6, "urlValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFURLImage urlValue](self, "urlValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFURLImage urlValue](self, "urlValue");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFURLImage urlValue](v6, "urlValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        -[SFURLImage darkUrlValue](self, "darkUrlValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFURLImage darkUrlValue](v6, "darkUrlValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFURLImage darkUrlValue](self, "darkUrlValue");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            -[SFURLImage darkUrlValue](self, "darkUrlValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFURLImage darkUrlValue](v6, "darkUrlValue");
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
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    v11 = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFURLImage;
  v3 = -[SFImage hash](&v9, sel_hash);
  -[SFURLImage urlValue](self, "urlValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFURLImage darkUrlValue](self, "darkUrlValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (NSURL)urlValue
{
  return self->_urlValue;
}

- (void)setUrlValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSURL)darkUrlValue
{
  return self->_darkUrlValue;
}

- (void)setDarkUrlValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkUrlValue, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFURLImage)initWithProtobuf:(id)a3
{
  id v4;
  SFURLImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFURLImage *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFURLImage;
  v5 = -[SFURLImage init](&v14, sel_init);
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
      -[SFURLImage setUrlValue:](v5, "setUrlValue:", v8);

    }
    objc_msgSend(v4, "darkUrlValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "darkUrlValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFURLImage setDarkUrlValue:](v5, "setDarkUrlValue:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (SFURLImage)initWithURL:(id)a3
{
  id v4;
  SFURLImage *v5;
  SFURLImage *v6;
  SFURLImage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFURLImage;
  v5 = -[SFURLImage init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SFURLImage setUrlValue:](v5, "setUrlValue:", v4);
    v7 = v6;
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SFURLImage;
  -[SFURLImage description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLImage urlValue](self, "urlValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

@end
