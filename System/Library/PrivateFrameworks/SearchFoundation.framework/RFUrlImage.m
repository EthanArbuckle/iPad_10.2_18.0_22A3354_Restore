@implementation RFUrlImage

- (RFUrlImage)initWithProtobuf:(id)a3
{
  id v4;
  RFUrlImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RFSymbolImage *v11;
  void *v12;
  RFSymbolImage *v13;
  void *v14;
  RFAspectRatio *v15;
  void *v16;
  RFAspectRatio *v17;
  void *v18;
  RFColor *v19;
  void *v20;
  RFColor *v21;
  float v22;
  void *v23;
  void *v24;
  RFUrlImage *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)RFUrlImage;
  v5 = -[RFUrlImage init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFUrlImage setUrl:](v5, "setUrl:", v7);

    }
    objc_msgSend(v4, "dark_mode_url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "dark_mode_url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFUrlImage setDark_mode_url:](v5, "setDark_mode_url:", v9);

    }
    objc_msgSend(v4, "symbol_placeholder_image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFSymbolImage alloc];
      objc_msgSend(v4, "symbol_placeholder_image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFSymbolImage initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFUrlImage setSymbol_placeholder_image:](v5, "setSymbol_placeholder_image:", v13);

    }
    if (objc_msgSend(v4, "image_style"))
      -[RFUrlImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    objc_msgSend(v4, "aspect_ratio");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFAspectRatio alloc];
      objc_msgSend(v4, "aspect_ratio");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFAspectRatio initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFUrlImage setAspect_ratio:](v5, "setAspect_ratio:", v17);

    }
    if (objc_msgSend(v4, "sizing_mode"))
      -[RFUrlImage setSizing_mode:](v5, "setSizing_mode:", objc_msgSend(v4, "sizing_mode"));
    if (objc_msgSend(v4, "image_rendering_mode"))
      -[RFUrlImage setImage_rendering_mode:](v5, "setImage_rendering_mode:", objc_msgSend(v4, "image_rendering_mode"));
    objc_msgSend(v4, "background_color");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [RFColor alloc];
      objc_msgSend(v4, "background_color");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[RFColor initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFUrlImage setBackground_color:](v5, "setBackground_color:", v21);

    }
    if (objc_msgSend(v4, "corner_rounding_mode"))
      -[RFUrlImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v4, "corner_rounding_mode"));
    objc_msgSend(v4, "inset_padding");
    if (v22 != 0.0)
    {
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "inset_padding");
      objc_msgSend(v23, "numberWithFloat:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFUrlImage setInset_padding:](v5, "setInset_padding:", v24);

    }
    v25 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSymbol_placeholder_image:(id)a3
{
  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_symbol_placeholder_image, a3);
}

- (BOOL)hasSymbol_placeholder_image
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setImage_style:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_image_style = a3;
}

- (BOOL)hasImage_style
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSizing_mode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sizing_mode = a3;
}

- (BOOL)hasSizing_mode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setImage_rendering_mode:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_image_rendering_mode = a3;
}

- (BOOL)hasImage_rendering_mode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCorner_rounding_mode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_corner_rounding_mode = a3;
}

- (BOOL)hasCorner_rounding_mode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (RFUrlImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFUrlImage *v6;
  RFUrlImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFUrlImage initWithData:]([_SFPBRFUrlImage alloc], "initWithData:", v5);
  v7 = -[RFUrlImage initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFUrlImage *v6;

  v4 = a3;
  v6 = -[_SFPBRFUrlImage initWithFacade:]([_SFPBRFUrlImage alloc], "initWithFacade:", self);
  -[_SFPBRFUrlImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFUrlImage *v2;
  void *v3;

  v2 = -[_SFPBRFUrlImage initWithFacade:]([_SFPBRFUrlImage alloc], "initWithFacade:", self);
  -[_SFPBRFUrlImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFUrlImage *v2;
  void *v3;

  v2 = -[_SFPBRFUrlImage initWithFacade:]([_SFPBRFUrlImage alloc], "initWithFacade:", self);
  -[_SFPBRFUrlImage jsonData](v2, "jsonData");
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFUrlImage url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUrl:", v6);

  -[RFUrlImage dark_mode_url](self, "dark_mode_url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDark_mode_url:", v8);

  if (-[RFUrlImage hasSymbol_placeholder_image](self, "hasSymbol_placeholder_image"))
  {
    -[RFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setSymbol_placeholder_image:", v10);

  }
  objc_msgSend(v4, "setImage_style:", -[RFUrlImage image_style](self, "image_style"));
  -[RFUrlImage aspect_ratio](self, "aspect_ratio");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setAspect_ratio:", v12);

  objc_msgSend(v4, "setSizing_mode:", -[RFUrlImage sizing_mode](self, "sizing_mode"));
  objc_msgSend(v4, "setImage_rendering_mode:", -[RFUrlImage image_rendering_mode](self, "image_rendering_mode"));
  -[RFUrlImage background_color](self, "background_color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackground_color:", v14);

  objc_msgSend(v4, "setCorner_rounding_mode:", -[RFUrlImage corner_rounding_mode](self, "corner_rounding_mode"));
  -[RFUrlImage inset_padding](self, "inset_padding");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setInset_padding:", v16);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFUrlImage *v4;
  RFUrlImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v4 = (RFUrlImage *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[RFUrlImage isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[RFUrlImage url](self, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFUrlImage url](v5, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v10 = 0;
LABEL_39:

        goto LABEL_40;
      }
      -[RFUrlImage url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[RFUrlImage url](self, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFUrlImage url](v5, "url");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_37;
        }
        v60 = v9;
      }
      -[RFUrlImage dark_mode_url](self, "dark_mode_url");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFUrlImage dark_mode_url](v5, "dark_mode_url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v61 == 0) == (v11 != 0))
        goto LABEL_35;
      -[RFUrlImage dark_mode_url](self, "dark_mode_url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[RFUrlImage dark_mode_url](self, "dark_mode_url");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFUrlImage dark_mode_url](v5, "dark_mode_url");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
        {

LABEL_34:
LABEL_35:

          v10 = 0;
          goto LABEL_36;
        }
        v59 = v14;
        v57 = v13;
        v58 = v7;
        v15 = v62;
        v16 = v12;
      }
      else
      {
        v58 = v7;
        v15 = v62;
        v16 = 0;
      }
      v62 = v15;
      -[RFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFUrlImage symbol_placeholder_image](v5, "symbol_placeholder_image");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      v7 = v58;
      v19 = v59;
      if ((v17 == 0) != (v18 != 0))
      {
        v56 = v18;
        v54 = v17;
        -[RFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          -[RFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFUrlImage symbol_placeholder_image](v5, "symbol_placeholder_image");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v20;
          if (!objc_msgSend(v20, "isEqual:"))
          {
            v10 = 0;
            v26 = v55;
            goto LABEL_55;
          }
          v53 = v12;
          v19 = v59;
        }
        else
        {
          v53 = v12;
        }
        v21 = -[RFUrlImage image_style](self, "image_style");
        if (v21 != -[RFUrlImage image_style](v5, "image_style"))
        {
          v59 = v19;
          v10 = 0;
          v12 = v53;
          goto LABEL_54;
        }
        -[RFUrlImage aspect_ratio](self, "aspect_ratio");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFUrlImage aspect_ratio](v5, "aspect_ratio");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v22 == 0) != (v23 != 0))
        {
          v50 = v23;
          -[RFUrlImage aspect_ratio](self, "aspect_ratio");
          v24 = objc_claimAutoreleasedReturnValue();
          v59 = v19;
          v49 = v22;
          if (v24)
          {
            -[RFUrlImage aspect_ratio](self, "aspect_ratio");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFUrlImage aspect_ratio](v5, "aspect_ratio");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v25;
            if (!objc_msgSend(v25, "isEqual:"))
            {
              v10 = 0;
              v33 = (void *)v24;
              v12 = v53;
              v17 = v54;
              goto LABEL_52;
            }
            v48 = (void *)v24;
          }
          else
          {
            v48 = 0;
          }
          v28 = -[RFUrlImage sizing_mode](self, "sizing_mode");
          if (v28 == -[RFUrlImage sizing_mode](v5, "sizing_mode"))
          {
            v29 = -[RFUrlImage image_rendering_mode](self, "image_rendering_mode");
            if (v29 == -[RFUrlImage image_rendering_mode](v5, "image_rendering_mode"))
            {
              -[RFUrlImage background_color](self, "background_color");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFUrlImage background_color](v5, "background_color");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v30 == 0) != (v31 != 0))
              {
                v43 = v31;
                v44 = v30;
                -[RFUrlImage background_color](self, "background_color");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (v45)
                {
                  -[RFUrlImage background_color](self, "background_color");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFUrlImage background_color](v5, "background_color");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = v32;
                  if (!objc_msgSend(v32, "isEqual:"))
                  {
                    v10 = 0;
                    v12 = v53;
                    v17 = v54;
                    goto LABEL_68;
                  }
                }
                v34 = -[RFUrlImage corner_rounding_mode](self, "corner_rounding_mode");
                if (v34 == -[RFUrlImage corner_rounding_mode](v5, "corner_rounding_mode"))
                {
                  -[RFUrlImage inset_padding](self, "inset_padding");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFUrlImage inset_padding](v5, "inset_padding");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v35 == 0) != (v40 != 0))
                  {
                    -[RFUrlImage inset_padding](self, "inset_padding");
                    v36 = objc_claimAutoreleasedReturnValue();
                    if (v36)
                    {
                      v37 = (void *)v36;
                      -[RFUrlImage inset_padding](self, "inset_padding");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RFUrlImage inset_padding](v5, "inset_padding");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      v10 = objc_msgSend(v38, "isEqual:", v39);

                    }
                    else
                    {

                      v10 = 1;
                    }
                    v12 = v53;
                    v7 = v58;
LABEL_67:
                    v17 = v54;
                    if (!v45)
                    {
LABEL_69:

LABEL_51:
                      v33 = v48;
                      if (!v48)
                      {
LABEL_53:

LABEL_54:
                        v26 = v55;
                        if (!v55)
                        {
LABEL_56:

                          if (v12)
                          {

                          }
LABEL_36:
                          v9 = v60;
                          if (!v8)
                          {
LABEL_38:

                            goto LABEL_39;
                          }
LABEL_37:

                          goto LABEL_38;
                        }
LABEL_55:

                        goto LABEL_56;
                      }
LABEL_52:

                      goto LABEL_53;
                    }
LABEL_68:

                    goto LABEL_69;
                  }

                }
                v10 = 0;
                v12 = v53;
                goto LABEL_67;
              }

            }
          }
          v10 = 0;
          v12 = v53;
          v17 = v54;
          goto LABEL_51;
        }

        v12 = v53;
        if (v55)
        {

        }
        v17 = v54;
        v18 = v56;
      }

      if (v12)
      {

      }
      goto LABEL_34;
    }
    v10 = 0;
  }
LABEL_40:

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
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[RFUrlImage url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFUrlImage dark_mode_url](self, "dark_mode_url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[RFUrlImage image_style](self, "image_style");
  -[RFUrlImage aspect_ratio](self, "aspect_ratio");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v11 ^ -[RFUrlImage sizing_mode](self, "sizing_mode");
  v13 = v9 ^ v12 ^ -[RFUrlImage image_rendering_mode](self, "image_rendering_mode");
  -[RFUrlImage background_color](self, "background_color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  v16 = v15 ^ -[RFUrlImage corner_rounding_mode](self, "corner_rounding_mode");
  -[RFUrlImage inset_padding](self, "inset_padding");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13 ^ v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)dark_mode_url
{
  return self->_dark_mode_url;
}

- (void)setDark_mode_url:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (RFSymbolImage)symbol_placeholder_image
{
  return self->_symbol_placeholder_image;
}

- (int)image_style
{
  return self->_image_style;
}

- (RFAspectRatio)aspect_ratio
{
  return self->_aspect_ratio;
}

- (void)setAspect_ratio:(id)a3
{
  objc_storeStrong((id *)&self->_aspect_ratio, a3);
}

- (int)sizing_mode
{
  return self->_sizing_mode;
}

- (int)image_rendering_mode
{
  return self->_image_rendering_mode;
}

- (RFColor)background_color
{
  return self->_background_color;
}

- (void)setBackground_color:(id)a3
{
  objc_storeStrong((id *)&self->_background_color, a3);
}

- (int)corner_rounding_mode
{
  return self->_corner_rounding_mode;
}

- (NSNumber)inset_padding
{
  return self->_inset_padding;
}

- (void)setInset_padding:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inset_padding, 0);
  objc_storeStrong((id *)&self->_background_color, 0);
  objc_storeStrong((id *)&self->_aspect_ratio, 0);
  objc_storeStrong((id *)&self->_symbol_placeholder_image, 0);
  objc_storeStrong((id *)&self->_dark_mode_url, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
