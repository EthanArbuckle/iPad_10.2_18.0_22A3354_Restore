@implementation SFButtonItemAppearance

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_style = a3;
}

- (BOOL)hasStyle
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRole:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_role = a3;
}

- (BOOL)hasRole
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRenderingMode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_renderingMode = a3;
}

- (BOOL)hasRenderingMode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPreferNoFallbackImage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_preferNoFallbackImage = a3;
}

- (BOOL)hasPreferNoFallbackImage
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFButtonItemAppearance)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBButtonItemAppearance *v6;
  SFButtonItemAppearance *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBButtonItemAppearance initWithData:]([_SFPBButtonItemAppearance alloc], "initWithData:", v5);
  v7 = -[SFButtonItemAppearance initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBButtonItemAppearance *v6;

  v4 = a3;
  v6 = -[_SFPBButtonItemAppearance initWithFacade:]([_SFPBButtonItemAppearance alloc], "initWithFacade:", self);
  -[_SFPBButtonItemAppearance data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBButtonItemAppearance *v2;
  void *v3;

  v2 = -[_SFPBButtonItemAppearance initWithFacade:]([_SFPBButtonItemAppearance alloc], "initWithFacade:", self);
  -[_SFPBButtonItemAppearance dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBButtonItemAppearance *v2;
  void *v3;

  v2 = -[_SFPBButtonItemAppearance initWithFacade:]([_SFPBButtonItemAppearance alloc], "initWithFacade:", self);
  -[_SFPBButtonItemAppearance jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStyle:", -[SFButtonItemAppearance style](self, "style"));
  objc_msgSend(v4, "setRole:", -[SFButtonItemAppearance role](self, "role"));
  -[SFButtonItemAppearance tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTintColor:", v6);

  objc_msgSend(v4, "setRenderingMode:", -[SFButtonItemAppearance renderingMode](self, "renderingMode"));
  objc_msgSend(v4, "setPreferNoFallbackImage:", -[SFButtonItemAppearance preferNoFallbackImage](self, "preferNoFallbackImage"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFButtonItemAppearance *v6;
  SFButtonItemAppearance *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  _BOOL4 v15;

  v6 = (SFButtonItemAppearance *)a3;
  if (self == v6)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    if (-[SFButtonItemAppearance isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      v8 = -[SFButtonItemAppearance style](self, "style");
      if (v8 != -[SFButtonItemAppearance style](v7, "style")
        || (v9 = -[SFButtonItemAppearance role](self, "role"), v9 != -[SFButtonItemAppearance role](v7, "role")))
      {
        LOBYTE(v13) = 0;
LABEL_20:

        goto LABEL_21;
      }
      -[SFButtonItemAppearance tintColor](self, "tintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFButtonItemAppearance tintColor](v7, "tintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v10 == 0) == (v11 != 0))
      {
        LOBYTE(v13) = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[SFButtonItemAppearance tintColor](self, "tintColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12
        || (-[SFButtonItemAppearance tintColor](self, "tintColor"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFButtonItemAppearance tintColor](v7, "tintColor"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v14 = -[SFButtonItemAppearance renderingMode](self, "renderingMode");
        if (v14 == -[SFButtonItemAppearance renderingMode](v7, "renderingMode"))
        {
          v15 = -[SFButtonItemAppearance preferNoFallbackImage](self, "preferNoFallbackImage");
          v13 = v15 ^ -[SFButtonItemAppearance preferNoFallbackImage](v7, "preferNoFallbackImage") ^ 1;
          if (!v12)
            goto LABEL_18;
        }
        else
        {
          LOBYTE(v13) = 0;
          if (!v12)
          {
LABEL_18:

            goto LABEL_19;
          }
        }
      }
      else
      {
        LOBYTE(v13) = 0;
      }

      goto LABEL_18;
    }
    LOBYTE(v13) = 0;
  }
LABEL_21:

  return v13;
}

- (unint64_t)hash
{
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[SFButtonItemAppearance style](self, "style");
  v4 = -[SFButtonItemAppearance role](self, "role") ^ v3;
  -[SFButtonItemAppearance tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v6 ^ -[SFButtonItemAppearance renderingMode](self, "renderingMode") ^ v4;
  v8 = v7 ^ -[SFButtonItemAppearance preferNoFallbackImage](self, "preferNoFallbackImage");

  return v8;
}

- (int)style
{
  return self->_style;
}

- (int)role
{
  return self->_role;
}

- (SFColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (int)renderingMode
{
  return self->_renderingMode;
}

- (BOOL)preferNoFallbackImage
{
  return self->_preferNoFallbackImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (SFButtonItemAppearance)initWithProtobuf:(id)a3
{
  id v4;
  SFButtonItemAppearance *v5;
  void *v6;
  SFColor *v7;
  void *v8;
  SFColor *v9;
  SFButtonItemAppearance *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFButtonItemAppearance;
  v5 = -[SFButtonItemAppearance init](&v12, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "style"))
      -[SFButtonItemAppearance setStyle:](v5, "setStyle:", objc_msgSend(v4, "style"));
    if (objc_msgSend(v4, "role"))
      -[SFButtonItemAppearance setRole:](v5, "setRole:", objc_msgSend(v4, "role"));
    objc_msgSend(v4, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFColor alloc];
      objc_msgSend(v4, "tintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFColor initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFButtonItemAppearance setTintColor:](v5, "setTintColor:", v9);

    }
    if (objc_msgSend(v4, "renderingMode"))
      -[SFButtonItemAppearance setRenderingMode:](v5, "setRenderingMode:", objc_msgSend(v4, "renderingMode"));
    if (objc_msgSend(v4, "preferNoFallbackImage"))
      -[SFButtonItemAppearance setPreferNoFallbackImage:](v5, "setPreferNoFallbackImage:", objc_msgSend(v4, "preferNoFallbackImage"));
    v10 = v5;
  }

  return v5;
}

@end
