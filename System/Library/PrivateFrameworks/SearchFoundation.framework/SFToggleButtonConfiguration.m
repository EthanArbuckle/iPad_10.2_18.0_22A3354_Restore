@implementation SFToggleButtonConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFToggleButtonConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBToggleButtonConfiguration *v6;
  SFToggleButtonConfiguration *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBToggleButtonConfiguration initWithData:]([_SFPBToggleButtonConfiguration alloc], "initWithData:", v5);
  v7 = -[SFToggleButtonConfiguration initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBToggleButtonConfiguration *v6;

  v4 = a3;
  v6 = -[_SFPBToggleButtonConfiguration initWithFacade:]([_SFPBToggleButtonConfiguration alloc], "initWithFacade:", self);
  -[_SFPBToggleButtonConfiguration data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBToggleButtonConfiguration *v2;
  void *v3;

  v2 = -[_SFPBToggleButtonConfiguration initWithFacade:]([_SFPBToggleButtonConfiguration alloc], "initWithFacade:", self);
  -[_SFPBToggleButtonConfiguration dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBToggleButtonConfiguration *v2;
  void *v3;

  v2 = -[_SFPBToggleButtonConfiguration initWithFacade:]([_SFPBToggleButtonConfiguration alloc], "initWithFacade:", self);
  -[_SFPBToggleButtonConfiguration jsonData](v2, "jsonData");
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
  -[SFToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUntoggledTitle:", v6);

  -[SFToggleButtonConfiguration toggledTitle](self, "toggledTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setToggledTitle:", v8);

  -[SFToggleButtonConfiguration untoggledImage](self, "untoggledImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setUntoggledImage:", v10);

  -[SFToggleButtonConfiguration toggledImage](self, "toggledImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setToggledImage:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFToggleButtonConfiguration *v5;
  SFToggleButtonConfiguration *v6;
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

  v5 = (SFToggleButtonConfiguration *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFToggleButtonConfiguration isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFToggleButtonConfiguration untoggledTitle](v6, "untoggledTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      -[SFToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFToggleButtonConfiguration untoggledTitle](v6, "untoggledTitle");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      -[SFToggleButtonConfiguration toggledTitle](self, "toggledTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFToggleButtonConfiguration toggledTitle](v6, "toggledTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_34;
      }
      -[SFToggleButtonConfiguration toggledTitle](self, "toggledTitle");
      v15 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v15;
      if (v15)
      {
        v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        -[SFToggleButtonConfiguration toggledTitle](self, "toggledTitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFToggleButtonConfiguration toggledTitle](v6, "toggledTitle");
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
      -[SFToggleButtonConfiguration untoggledImage](self, "untoggledImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFToggleButtonConfiguration untoggledImage](v6, "untoggledImage");
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
      -[SFToggleButtonConfiguration untoggledImage](self, "untoggledImage");
      v16 = v40;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36
        || (-[SFToggleButtonConfiguration untoggledImage](self, "untoggledImage"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFToggleButtonConfiguration untoggledImage](v6, "untoggledImage"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        -[SFToggleButtonConfiguration toggledImage](self, "toggledImage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFToggleButtonConfiguration toggledImage](v6, "toggledImage");
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
          -[SFToggleButtonConfiguration toggledImage](self, "toggledImage");
          v24 = objc_claimAutoreleasedReturnValue();
          v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            -[SFToggleButtonConfiguration toggledImage](self, "toggledImage");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFToggleButtonConfiguration toggledImage](v6, "toggledImage");
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

  -[SFToggleButtonConfiguration untoggledTitle](self, "untoggledTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFToggleButtonConfiguration toggledTitle](self, "toggledTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFToggleButtonConfiguration untoggledImage](self, "untoggledImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFToggleButtonConfiguration toggledImage](self, "toggledImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)untoggledTitle
{
  return self->_untoggledTitle;
}

- (void)setUntoggledTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)toggledTitle
{
  return self->_toggledTitle;
}

- (void)setToggledTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SFImage)untoggledImage
{
  return self->_untoggledImage;
}

- (void)setUntoggledImage:(id)a3
{
  objc_storeStrong((id *)&self->_untoggledImage, a3);
}

- (SFImage)toggledImage
{
  return self->_toggledImage;
}

- (void)setToggledImage:(id)a3
{
  objc_storeStrong((id *)&self->_toggledImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggledImage, 0);
  objc_storeStrong((id *)&self->_untoggledImage, 0);
  objc_storeStrong((id *)&self->_toggledTitle, 0);
  objc_storeStrong((id *)&self->_untoggledTitle, 0);
}

- (SFToggleButtonConfiguration)initWithProtobuf:(id)a3
{
  id v4;
  SFToggleButtonConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFImage *v11;
  void *v12;
  SFImage *v13;
  void *v14;
  SFImage *v15;
  void *v16;
  SFImage *v17;
  SFToggleButtonConfiguration *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFToggleButtonConfiguration;
  v5 = -[SFToggleButtonConfiguration init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "untoggledTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "untoggledTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFToggleButtonConfiguration setUntoggledTitle:](v5, "setUntoggledTitle:", v7);

    }
    objc_msgSend(v4, "toggledTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "toggledTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFToggleButtonConfiguration setToggledTitle:](v5, "setToggledTitle:", v9);

    }
    objc_msgSend(v4, "untoggledImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFImage alloc];
      objc_msgSend(v4, "untoggledImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFImage initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFToggleButtonConfiguration setUntoggledImage:](v5, "setUntoggledImage:", v13);

    }
    objc_msgSend(v4, "toggledImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SFImage alloc];
      objc_msgSend(v4, "toggledImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SFImage initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[SFToggleButtonConfiguration setToggledImage:](v5, "setToggledImage:", v17);

    }
    v18 = v5;
  }

  return v5;
}

@end
