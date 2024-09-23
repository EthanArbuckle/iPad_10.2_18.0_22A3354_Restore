@implementation SFButton

- (SFButton)initWithProtobuf:(id)a3
{
  id v4;
  SFButton *v5;
  void *v6;
  SFImage *v7;
  void *v8;
  SFImage *v9;
  void *v10;
  SFImage *v11;
  void *v12;
  SFImage *v13;
  SFButton *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFButton;
  v5 = -[SFButton init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFImage initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFButton setImage:](v5, "setImage:", v9);

    }
    objc_msgSend(v4, "selectedImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFImage alloc];
      objc_msgSend(v4, "selectedImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFImage initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFButton setSelectedImage:](v5, "setSelectedImage:", v13);

    }
    if (objc_msgSend(v4, "isSelected"))
      -[SFButton setIsSelected:](v5, "setIsSelected:", objc_msgSend(v4, "isSelected"));
    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsSelected:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSelected = a3;
}

- (BOOL)hasIsSelected
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFButton)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBButton *v6;
  SFButton *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBButton initWithData:]([_SFPBButton alloc], "initWithData:", v5);
  v7 = -[SFButton initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBButton *v6;

  v4 = a3;
  v6 = -[_SFPBButton initWithFacade:]([_SFPBButton alloc], "initWithFacade:", self);
  -[_SFPBButton data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBButton *v2;
  void *v3;

  v2 = -[_SFPBButton initWithFacade:]([_SFPBButton alloc], "initWithFacade:", self);
  -[_SFPBButton dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBButton *v2;
  void *v3;

  v2 = -[_SFPBButton initWithFacade:]([_SFPBButton alloc], "initWithFacade:", self);
  -[_SFPBButton jsonData](v2, "jsonData");
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
  -[SFButton image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setImage:", v6);

  -[SFButton selectedImage](self, "selectedImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSelectedImage:", v8);

  objc_msgSend(v4, "setIsSelected:", -[SFButton isSelected](self, "isSelected"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFButton *v5;
  SFButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = (SFButton *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[SFButton isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFButton image](self, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFButton image](v6, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[SFButton image](self, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFButton image](self, "image");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFButton image](v6, "image");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          LOBYTE(v11) = 0;
          goto LABEL_22;
        }
        v22 = v10;
      }
      -[SFButton selectedImage](self, "selectedImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFButton selectedImage](v6, "selectedImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        LOBYTE(v11) = 0;
        goto LABEL_21;
      }
      -[SFButton selectedImage](self, "selectedImage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v19 = v3;
        -[SFButton selectedImage](self, "selectedImage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFButton selectedImage](v6, "selectedImage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          LOBYTE(v11) = 0;
          v3 = v19;
LABEL_19:

LABEL_20:
LABEL_21:
          v10 = v22;
          if (!v9)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v3 = v19;
      }
      v17 = -[SFButton isSelected](self, "isSelected");
      v11 = v17 ^ -[SFButton isSelected](v6, "isSelected") ^ 1;
      if (!v15)
        goto LABEL_20;
      goto LABEL_19;
    }
    LOBYTE(v11) = 0;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[SFButton image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFButton selectedImage](self, "selectedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[SFButton isSelected](self, "isSelected");

  return v7;
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (SFImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedImage, a3);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
