@implementation _SFPBButtonItemAppearance

- (_SFPBButtonItemAppearance)initWithFacade:(id)a3
{
  id v4;
  _SFPBButtonItemAppearance *v5;
  void *v6;
  _SFPBColor *v7;
  void *v8;
  _SFPBColor *v9;
  _SFPBButtonItemAppearance *v10;

  v4 = a3;
  v5 = -[_SFPBButtonItemAppearance init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasStyle"))
      -[_SFPBButtonItemAppearance setStyle:](v5, "setStyle:", objc_msgSend(v4, "style"));
    if (objc_msgSend(v4, "hasRole"))
      -[_SFPBButtonItemAppearance setRole:](v5, "setRole:", objc_msgSend(v4, "role"));
    objc_msgSend(v4, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBColor alloc];
      objc_msgSend(v4, "tintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBColor initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBButtonItemAppearance setTintColor:](v5, "setTintColor:", v9);

    }
    if (objc_msgSend(v4, "hasRenderingMode"))
      -[_SFPBButtonItemAppearance setRenderingMode:](v5, "setRenderingMode:", objc_msgSend(v4, "renderingMode"));
    if (objc_msgSend(v4, "hasPreferNoFallbackImage"))
      -[_SFPBButtonItemAppearance setPreferNoFallbackImage:](v5, "setPreferNoFallbackImage:", objc_msgSend(v4, "preferNoFallbackImage"));
    v10 = v5;
  }

  return v5;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (void)setRole:(int)a3
{
  self->_role = a3;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setRenderingMode:(int)a3
{
  self->_renderingMode = a3;
}

- (void)setPreferNoFallbackImage:(BOOL)a3
{
  self->_preferNoFallbackImage = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBButtonItemAppearanceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_SFPBButtonItemAppearance style](self, "style"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBButtonItemAppearance role](self, "role"))
    PBDataWriterWriteInt32Field();
  -[_SFPBButtonItemAppearance tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBButtonItemAppearance renderingMode](self, "renderingMode"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBButtonItemAppearance preferNoFallbackImage](self, "preferNoFallbackImage"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int style;
  int role;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int renderingMode;
  int preferNoFallbackImage;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  style = self->_style;
  if (style != objc_msgSend(v4, "style"))
    goto LABEL_12;
  role = self->_role;
  if (role != objc_msgSend(v4, "role"))
    goto LABEL_12;
  -[_SFPBButtonItemAppearance tintColor](self, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 == 0) == (v8 != 0))
  {

    goto LABEL_12;
  }
  -[_SFPBButtonItemAppearance tintColor](self, "tintColor");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[_SFPBButtonItemAppearance tintColor](self, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_12;
  }
  else
  {

  }
  renderingMode = self->_renderingMode;
  if (renderingMode != objc_msgSend(v4, "renderingMode"))
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  preferNoFallbackImage = self->_preferNoFallbackImage;
  v17 = preferNoFallbackImage == objc_msgSend(v4, "preferNoFallbackImage");
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = 2654435761 * self->_style;
  v4 = 2654435761 * self->_role;
  v5 = -[_SFPBColor hash](self->_tintColor, "hash");
  if (self->_preferNoFallbackImage)
    v6 = 2654435761;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ (2654435761 * self->_renderingMode) ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_preferNoFallbackImage)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBButtonItemAppearance preferNoFallbackImage](self, "preferNoFallbackImage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("preferNoFallbackImage"));

  }
  if (self->_renderingMode)
  {
    v5 = -[_SFPBButtonItemAppearance renderingMode](self, "renderingMode");
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = *(&off_1E4042178 + v5);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("renderingMode"));

  }
  if (self->_role)
  {
    v7 = -[_SFPBButtonItemAppearance role](self, "role");
    if (v7 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = *(&off_1E4042078 + v7);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("role"));

  }
  if (self->_style)
  {
    v9 = -[_SFPBButtonItemAppearance style](self, "style");
    if (v9 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_1E4042078 + v9);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("style"));

  }
  if (self->_tintColor)
  {
    -[_SFPBButtonItemAppearance tintColor](self, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("tintColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("tintColor"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBButtonItemAppearance dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBButtonItemAppearance)initWithJSON:(id)a3
{
  void *v4;
  _SFPBButtonItemAppearance *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBButtonItemAppearance initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBButtonItemAppearance)initWithDictionary:(id)a3
{
  id v4;
  _SFPBButtonItemAppearance *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBColor *v9;
  void *v10;
  void *v11;
  _SFPBButtonItemAppearance *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBButtonItemAppearance;
  v5 = -[_SFPBButtonItemAppearance init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("style"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBButtonItemAppearance setStyle:](v5, "setStyle:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("role"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBButtonItemAppearance setRole:](v5, "setRole:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tintColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v8);
      -[_SFPBButtonItemAppearance setTintColor:](v5, "setTintColor:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("renderingMode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBButtonItemAppearance setRenderingMode:](v5, "setRenderingMode:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preferNoFallbackImage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBButtonItemAppearance setPreferNoFallbackImage:](v5, "setPreferNoFallbackImage:", objc_msgSend(v11, "BOOLValue"));
    v12 = v5;

  }
  return v5;
}

- (int)style
{
  return self->_style;
}

- (int)role
{
  return self->_role;
}

- (_SFPBColor)tintColor
{
  return self->_tintColor;
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

@end
