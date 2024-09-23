@implementation SFAppLink

- (SFAppLink)initWithProtobuf:(id)a3
{
  id v4;
  SFAppLink *v5;
  void *v6;
  void *v7;
  void *v8;
  SFPunchout *v9;
  void *v10;
  SFPunchout *v11;
  void *v12;
  SFImage *v13;
  void *v14;
  SFImage *v15;
  SFAppLink *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFAppLink;
  v5 = -[SFAppLink init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppLink setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "appPunchout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SFPunchout alloc];
      objc_msgSend(v4, "appPunchout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SFPunchout initWithProtobuf:](v9, "initWithProtobuf:", v10);
      -[SFAppLink setAppPunchout:](v5, "setAppPunchout:", v11);

    }
    objc_msgSend(v4, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SFImage initWithProtobuf:](v13, "initWithProtobuf:", v14);
      -[SFAppLink setImage:](v5, "setImage:", v15);

    }
    if (objc_msgSend(v4, "imageAlign"))
      -[SFAppLink setImageAlign:](v5, "setImageAlign:", objc_msgSend(v4, "imageAlign"));
    v16 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setImageAlign:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_imageAlign = a3;
}

- (BOOL)hasImageAlign
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFAppLink)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAppLink *v6;
  SFAppLink *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBAppLink initWithData:]([_SFPBAppLink alloc], "initWithData:", v5);
  v7 = -[SFAppLink initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAppLink *v6;

  v4 = a3;
  v6 = -[_SFPBAppLink initWithFacade:]([_SFPBAppLink alloc], "initWithFacade:", self);
  -[_SFPBAppLink data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAppLink *v2;
  void *v3;

  v2 = -[_SFPBAppLink initWithFacade:]([_SFPBAppLink alloc], "initWithFacade:", self);
  -[_SFPBAppLink dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAppLink *v2;
  void *v3;

  v2 = -[_SFPBAppLink initWithFacade:]([_SFPBAppLink alloc], "initWithFacade:", self);
  -[_SFPBAppLink jsonData](v2, "jsonData");
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
  -[SFAppLink title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  -[SFAppLink appPunchout](self, "appPunchout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAppPunchout:", v8);

  -[SFAppLink image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setImage:", v10);

  objc_msgSend(v4, "setImageAlign:", -[SFAppLink imageAlign](self, "imageAlign"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFAppLink *v5;
  SFAppLink *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
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
  void *v32;

  v5 = (SFAppLink *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFAppLink isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFAppLink title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppLink title](v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_32:

        goto LABEL_33;
      }
      -[SFAppLink title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFAppLink title](self, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAppLink title](v6, "title");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_30;
        }
        v32 = v10;
      }
      -[SFAppLink appPunchout](self, "appPunchout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppLink appPunchout](v6, "appPunchout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_29;
      }
      -[SFAppLink appPunchout](self, "appPunchout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v26 = v12;
        -[SFAppLink appPunchout](self, "appPunchout");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAppLink appPunchout](v6, "appPunchout");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v11 = 0;
          v12 = v26;
          goto LABEL_27;
        }
        v28 = v3;
        v31 = v15;
        v12 = v26;
      }
      else
      {
        v28 = v3;
        v31 = 0;
      }
      -[SFAppLink image](self, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppLink image](v6, "image");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v17 == 0) == (v18 != 0))
      {

        v11 = 0;
        v15 = v31;
        v3 = v28;
        if (!v31)
          goto LABEL_28;
        goto LABEL_27;
      }
      v24 = v18;
      v25 = v17;
      -[SFAppLink image](self, "image");
      v15 = v31;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27
        || (-[SFAppLink image](self, "image"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFAppLink image](v6, "image"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = v19,
            objc_msgSend(v19, "isEqual:")))
      {
        v3 = v28;
        v20 = -[SFAppLink imageAlign](self, "imageAlign");
        v11 = v20 == -[SFAppLink imageAlign](v6, "imageAlign");
        if (!v27)
          goto LABEL_26;
      }
      else
      {
        v11 = 0;
        v3 = v28;
      }

LABEL_26:
      if (!v31)
      {
LABEL_28:

LABEL_29:
        v10 = v32;
        if (!v9)
        {
LABEL_31:

          goto LABEL_32;
        }
LABEL_30:

        goto LABEL_31;
      }
LABEL_27:

      goto LABEL_28;
    }
    v11 = 0;
  }
LABEL_33:

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
  unint64_t v9;

  -[SFAppLink title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFAppLink appPunchout](self, "appPunchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFAppLink image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[SFAppLink imageAlign](self, "imageAlign");

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SFPunchout)appPunchout
{
  return self->_appPunchout;
}

- (void)setAppPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_appPunchout, a3);
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_appPunchout, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
