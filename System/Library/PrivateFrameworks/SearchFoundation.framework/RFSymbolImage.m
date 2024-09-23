@implementation RFSymbolImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setImage_style:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_image_style = a3;
}

- (BOOL)hasImage_style
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSymbol_rendering_mode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_symbol_rendering_mode = a3;
}

- (BOOL)hasSymbol_rendering_mode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPunches_through_background:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_punches_through_background = a3;
}

- (BOOL)hasPunches_through_background
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setVibrancy:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_vibrancy = a3;
}

- (BOOL)hasVibrancy
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

- (RFSymbolImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFSymbolImage *v6;
  RFSymbolImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFSymbolImage initWithData:]([_SFPBRFSymbolImage alloc], "initWithData:", v5);
  v7 = -[RFSymbolImage initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFSymbolImage *v6;

  v4 = a3;
  v6 = -[_SFPBRFSymbolImage initWithFacade:]([_SFPBRFSymbolImage alloc], "initWithFacade:", self);
  -[_SFPBRFSymbolImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSymbolImage *v2;
  void *v3;

  v2 = -[_SFPBRFSymbolImage initWithFacade:]([_SFPBRFSymbolImage alloc], "initWithFacade:", self);
  -[_SFPBRFSymbolImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSymbolImage *v2;
  void *v3;

  v2 = -[_SFPBRFSymbolImage initWithFacade:]([_SFPBRFSymbolImage alloc], "initWithFacade:", self);
  -[_SFPBRFSymbolImage jsonData](v2, "jsonData");
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
  -[RFSymbolImage name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setName:", v6);

  -[RFSymbolImage primary_color](self, "primary_color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPrimary_color:", v8);

  -[RFSymbolImage secondary_color](self, "secondary_color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSecondary_color:", v10);

  objc_msgSend(v4, "setImage_style:", -[RFSymbolImage image_style](self, "image_style"));
  objc_msgSend(v4, "setSymbol_rendering_mode:", -[RFSymbolImage symbol_rendering_mode](self, "symbol_rendering_mode"));
  -[RFSymbolImage background_color](self, "background_color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setBackground_color:", v12);

  objc_msgSend(v4, "setPunches_through_background:", -[RFSymbolImage punches_through_background](self, "punches_through_background"));
  objc_msgSend(v4, "setVibrancy:", -[RFSymbolImage vibrancy](self, "vibrancy"));
  objc_msgSend(v4, "setCorner_rounding_mode:", -[RFSymbolImage corner_rounding_mode](self, "corner_rounding_mode"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFSymbolImage *v5;
  RFSymbolImage *v6;
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
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v27;
  int v28;
  int v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v5 = (RFSymbolImage *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFSymbolImage isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFSymbolImage name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFSymbolImage name](v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_43:

        goto LABEL_44;
      }
      -[RFSymbolImage name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFSymbolImage name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSymbolImage name](v6, "name");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_41;
        }
        v46 = v10;
      }
      -[RFSymbolImage primary_color](self, "primary_color");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFSymbolImage primary_color](v6, "primary_color");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 == 0) != (v47 != 0))
      {
        -[RFSymbolImage primary_color](self, "primary_color");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[RFSymbolImage primary_color](self, "primary_color");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSymbolImage primary_color](v6, "primary_color");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v14;
          if (!objc_msgSend(v14, "isEqual:"))
          {
            v11 = 0;
            goto LABEL_38;
          }
          v43 = v12;
          v44 = v3;
          v15 = v13;
        }
        else
        {
          v43 = v12;
          v44 = v3;
          v15 = 0;
        }
        -[RFSymbolImage secondary_color](self, "secondary_color");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSymbolImage secondary_color](v6, "secondary_color");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v16 == 0) != (v17 != 0))
        {
          v39 = v17;
          -[RFSymbolImage secondary_color](self, "secondary_color");
          v13 = v15;
          v38 = objc_claimAutoreleasedReturnValue();
          v40 = v16;
          if (v38)
          {
            -[RFSymbolImage secondary_color](self, "secondary_color");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSymbolImage secondary_color](v6, "secondary_color");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v18;
            v3 = v44;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              v11 = 0;
              v12 = v43;
              v25 = (void *)v38;
LABEL_36:

LABEL_37:
              if (!v13)
              {
LABEL_39:

LABEL_40:
                v10 = v46;
                if (!v9)
                {
LABEL_42:

                  goto LABEL_43;
                }
LABEL_41:

                goto LABEL_42;
              }
LABEL_38:

              goto LABEL_39;
            }
            v37 = v13;
          }
          else
          {
            v37 = v15;
            v3 = v44;
          }
          v12 = v43;
          v19 = -[RFSymbolImage image_style](self, "image_style");
          if (v19 == -[RFSymbolImage image_style](v6, "image_style"))
          {
            v20 = -[RFSymbolImage symbol_rendering_mode](self, "symbol_rendering_mode");
            if (v20 == -[RFSymbolImage symbol_rendering_mode](v6, "symbol_rendering_mode"))
            {
              -[RFSymbolImage background_color](self, "background_color");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSymbolImage background_color](v6, "background_color");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v21 == 0) != (v22 != 0))
              {
                v45 = v22;
                -[RFSymbolImage background_color](self, "background_color");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v32 = v21;
                  -[RFSymbolImage background_color](self, "background_color");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFSymbolImage background_color](v6, "background_color");
                  v43 = v24;
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v24, "isEqual:"))
                  {
                    v11 = 0;
                    v21 = v32;
                    goto LABEL_53;
                  }
                  v33 = v23;
                  v21 = v32;
                }
                else
                {
                  v33 = 0;
                }
                v27 = -[RFSymbolImage punches_through_background](self, "punches_through_background");
                if (v27 == -[RFSymbolImage punches_through_background](v6, "punches_through_background")
                  && (v28 = -[RFSymbolImage vibrancy](self, "vibrancy"), v28 == -[RFSymbolImage vibrancy](v6, "vibrancy")))
                {
                  v29 = -[RFSymbolImage corner_rounding_mode](self, "corner_rounding_mode");
                  v11 = v29 == -[RFSymbolImage corner_rounding_mode](v6, "corner_rounding_mode");
                  v30 = v11;
                }
                else
                {
                  v11 = 0;
                  v30 = 0;
                }
                v23 = v33;
                if (!v33)
                {
                  v31 = v45;
                  v11 = v30;
LABEL_54:

LABEL_35:
                  v13 = v37;
                  v25 = (void *)v38;
                  if (!v38)
                    goto LABEL_37;
                  goto LABEL_36;
                }
LABEL_53:

                v31 = v45;
                goto LABEL_54;
              }

            }
          }
          v11 = 0;
          goto LABEL_35;
        }

        if (v15)
        {

        }
        v12 = v43;
        v3 = v44;
      }

      v11 = 0;
      goto LABEL_40;
    }
    v11 = 0;
  }
LABEL_44:

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
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  -[RFSymbolImage name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFSymbolImage primary_color](self, "primary_color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFSymbolImage secondary_color](self, "secondary_color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[RFSymbolImage image_style](self, "image_style");
  v10 = -[RFSymbolImage symbol_rendering_mode](self, "symbol_rendering_mode");
  -[RFSymbolImage background_color](self, "background_color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  v13 = v9 ^ v12 ^ -[RFSymbolImage punches_through_background](self, "punches_through_background");
  v14 = -[RFSymbolImage vibrancy](self, "vibrancy");
  v15 = v13 ^ v14 ^ -[RFSymbolImage corner_rounding_mode](self, "corner_rounding_mode");

  return v15;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (RFColor)primary_color
{
  return self->_primary_color;
}

- (void)setPrimary_color:(id)a3
{
  objc_storeStrong((id *)&self->_primary_color, a3);
}

- (RFColor)secondary_color
{
  return self->_secondary_color;
}

- (void)setSecondary_color:(id)a3
{
  objc_storeStrong((id *)&self->_secondary_color, a3);
}

- (int)image_style
{
  return self->_image_style;
}

- (int)symbol_rendering_mode
{
  return self->_symbol_rendering_mode;
}

- (RFColor)background_color
{
  return self->_background_color;
}

- (void)setBackground_color:(id)a3
{
  objc_storeStrong((id *)&self->_background_color, a3);
}

- (BOOL)punches_through_background
{
  return self->_punches_through_background;
}

- (int)vibrancy
{
  return self->_vibrancy;
}

- (int)corner_rounding_mode
{
  return self->_corner_rounding_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background_color, 0);
  objc_storeStrong((id *)&self->_secondary_color, 0);
  objc_storeStrong((id *)&self->_primary_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (RFSymbolImage)initWithProtobuf:(id)a3
{
  id v4;
  RFSymbolImage *v5;
  void *v6;
  void *v7;
  void *v8;
  RFColor *v9;
  void *v10;
  RFColor *v11;
  void *v12;
  RFColor *v13;
  void *v14;
  RFColor *v15;
  void *v16;
  RFColor *v17;
  void *v18;
  RFColor *v19;
  RFSymbolImage *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RFSymbolImage;
  v5 = -[RFSymbolImage init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFSymbolImage setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "primary_color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [RFColor alloc];
      objc_msgSend(v4, "primary_color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[RFColor initWithProtobuf:](v9, "initWithProtobuf:", v10);
      -[RFSymbolImage setPrimary_color:](v5, "setPrimary_color:", v11);

    }
    objc_msgSend(v4, "secondary_color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [RFColor alloc];
      objc_msgSend(v4, "secondary_color");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[RFColor initWithProtobuf:](v13, "initWithProtobuf:", v14);
      -[RFSymbolImage setSecondary_color:](v5, "setSecondary_color:", v15);

    }
    if (objc_msgSend(v4, "image_style"))
      -[RFSymbolImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    if (objc_msgSend(v4, "symbol_rendering_mode"))
      -[RFSymbolImage setSymbol_rendering_mode:](v5, "setSymbol_rendering_mode:", objc_msgSend(v4, "symbol_rendering_mode"));
    objc_msgSend(v4, "background_color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [RFColor alloc];
      objc_msgSend(v4, "background_color");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[RFColor initWithProtobuf:](v17, "initWithProtobuf:", v18);
      -[RFSymbolImage setBackground_color:](v5, "setBackground_color:", v19);

    }
    if (objc_msgSend(v4, "punches_through_background"))
      -[RFSymbolImage setPunches_through_background:](v5, "setPunches_through_background:", objc_msgSend(v4, "punches_through_background"));
    if (objc_msgSend(v4, "vibrancy"))
      -[RFSymbolImage setVibrancy:](v5, "setVibrancy:", objc_msgSend(v4, "vibrancy"));
    if (objc_msgSend(v4, "corner_rounding_mode"))
      -[RFSymbolImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v4, "corner_rounding_mode"));
    v20 = v5;
  }

  return v5;
}

@end
