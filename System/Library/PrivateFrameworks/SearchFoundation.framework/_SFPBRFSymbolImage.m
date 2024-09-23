@implementation _SFPBRFSymbolImage

- (_SFPBRFSymbolImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFSymbolImage *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBRFColor *v9;
  void *v10;
  _SFPBRFColor *v11;
  void *v12;
  _SFPBRFColor *v13;
  void *v14;
  _SFPBRFColor *v15;
  void *v16;
  _SFPBRFColor *v17;
  void *v18;
  _SFPBRFColor *v19;
  _SFPBRFSymbolImage *v20;

  v4 = a3;
  v5 = -[_SFPBRFSymbolImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFSymbolImage setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "primary_color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBRFColor alloc];
      objc_msgSend(v4, "primary_color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBRFColor initWithFacade:](v9, "initWithFacade:", v10);
      -[_SFPBRFSymbolImage setPrimary_color:](v5, "setPrimary_color:", v11);

    }
    objc_msgSend(v4, "secondary_color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBRFColor alloc];
      objc_msgSend(v4, "secondary_color");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBRFColor initWithFacade:](v13, "initWithFacade:", v14);
      -[_SFPBRFSymbolImage setSecondary_color:](v5, "setSecondary_color:", v15);

    }
    if (objc_msgSend(v4, "hasImage_style"))
      -[_SFPBRFSymbolImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    if (objc_msgSend(v4, "hasSymbol_rendering_mode"))
      -[_SFPBRFSymbolImage setSymbol_rendering_mode:](v5, "setSymbol_rendering_mode:", objc_msgSend(v4, "symbol_rendering_mode"));
    objc_msgSend(v4, "background_color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [_SFPBRFColor alloc];
      objc_msgSend(v4, "background_color");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_SFPBRFColor initWithFacade:](v17, "initWithFacade:", v18);
      -[_SFPBRFSymbolImage setBackground_color:](v5, "setBackground_color:", v19);

    }
    if (objc_msgSend(v4, "hasPunches_through_background"))
      -[_SFPBRFSymbolImage setPunches_through_background:](v5, "setPunches_through_background:", objc_msgSend(v4, "punches_through_background"));
    if (objc_msgSend(v4, "hasVibrancy"))
      -[_SFPBRFSymbolImage setVibrancy:](v5, "setVibrancy:", objc_msgSend(v4, "vibrancy"));
    if (objc_msgSend(v4, "hasCorner_rounding_mode"))
      -[_SFPBRFSymbolImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v4, "corner_rounding_mode"));
    v20 = v5;
  }

  return v5;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (void)setPrimary_color:(id)a3
{
  objc_storeStrong((id *)&self->_primary_color, a3);
}

- (void)setSecondary_color:(id)a3
{
  objc_storeStrong((id *)&self->_secondary_color, a3);
}

- (void)setImage_style:(int)a3
{
  self->_image_style = a3;
}

- (void)setSymbol_rendering_mode:(int)a3
{
  self->_symbol_rendering_mode = a3;
}

- (void)setBackground_color:(id)a3
{
  objc_storeStrong((id *)&self->_background_color, a3);
}

- (void)setPunches_through_background:(BOOL)a3
{
  self->_punches_through_background = a3;
}

- (void)setVibrancy:(int)a3
{
  self->_vibrancy = a3;
}

- (void)setCorner_rounding_mode:(int)a3
{
  self->_corner_rounding_mode = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSymbolImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_SFPBRFSymbolImage name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBRFSymbolImage primary_color](self, "primary_color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSymbolImage secondary_color](self, "secondary_color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFSymbolImage image_style](self, "image_style"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFSymbolImage symbol_rendering_mode](self, "symbol_rendering_mode"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRFSymbolImage background_color](self, "background_color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFSymbolImage punches_through_background](self, "punches_through_background"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRFSymbolImage vibrancy](self, "vibrancy"))
    PBDataWriterWriteInt32Field();
  v8 = -[_SFPBRFSymbolImage corner_rounding_mode](self, "corner_rounding_mode");
  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteInt32Field();
    v9 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int image_style;
  int symbol_rendering_mode;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  int punches_through_background;
  int vibrancy;
  int corner_rounding_mode;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[_SFPBRFSymbolImage name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[_SFPBRFSymbolImage name](self, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFSymbolImage name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_24;
  }
  else
  {

  }
  -[_SFPBRFSymbolImage primary_color](self, "primary_color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primary_color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[_SFPBRFSymbolImage primary_color](self, "primary_color");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFSymbolImage primary_color](self, "primary_color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primary_color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_24;
  }
  else
  {

  }
  -[_SFPBRFSymbolImage secondary_color](self, "secondary_color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondary_color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[_SFPBRFSymbolImage secondary_color](self, "secondary_color");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFSymbolImage secondary_color](self, "secondary_color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondary_color");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_24;
  }
  else
  {

  }
  image_style = self->_image_style;
  if (image_style != objc_msgSend(v4, "image_style"))
    goto LABEL_24;
  symbol_rendering_mode = self->_symbol_rendering_mode;
  if (symbol_rendering_mode != objc_msgSend(v4, "symbol_rendering_mode"))
    goto LABEL_24;
  -[_SFPBRFSymbolImage background_color](self, "background_color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "background_color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  -[_SFPBRFSymbolImage background_color](self, "background_color");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_SFPBRFSymbolImage background_color](self, "background_color");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "background_color");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_24;
  }
  else
  {

  }
  punches_through_background = self->_punches_through_background;
  if (punches_through_background == objc_msgSend(v4, "punches_through_background"))
  {
    vibrancy = self->_vibrancy;
    if (vibrancy == objc_msgSend(v4, "vibrancy"))
    {
      corner_rounding_mode = self->_corner_rounding_mode;
      v29 = corner_rounding_mode == objc_msgSend(v4, "corner_rounding_mode");
      goto LABEL_25;
    }
  }
LABEL_24:
  v29 = 0;
LABEL_25:

  return v29;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[_SFPBRFColor hash](self->_primary_color, "hash");
  v5 = -[_SFPBRFColor hash](self->_secondary_color, "hash");
  v6 = 2654435761 * self->_image_style;
  v7 = 2654435761 * self->_symbol_rendering_mode;
  v8 = -[_SFPBRFColor hash](self->_background_color, "hash");
  if (self->_punches_through_background)
    v9 = 2654435761;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ (2654435761 * self->_vibrancy) ^ (2654435761
                                                                              * self->_corner_rounding_mode);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_background_color)
  {
    -[_SFPBRFSymbolImage background_color](self, "background_color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("backgroundColor"));

    }
  }
  if (self->_corner_rounding_mode)
  {
    v7 = -[_SFPBRFSymbolImage corner_rounding_mode](self, "corner_rounding_mode");
    if (v7 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = *(&off_1E4042178 + v7);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cornerRoundingMode"));

  }
  if (self->_image_style)
  {
    v9 = -[_SFPBRFSymbolImage image_style](self, "image_style");
    if (v9 < 0x2A && ((0x3FFDFFFFFFFuLL >> v9) & 1) != 0)
    {
      v10 = *(&off_1E4041EA0 + v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("imageStyle"));

  }
  if (self->_name)
  {
    -[_SFPBRFSymbolImage name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("name"));

  }
  if (self->_primary_color)
  {
    -[_SFPBRFSymbolImage primary_color](self, "primary_color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("primaryColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("primaryColor"));

    }
  }
  if (self->_punches_through_background)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFSymbolImage punches_through_background](self, "punches_through_background"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("punchesThroughBackground"));

  }
  if (self->_secondary_color)
  {
    -[_SFPBRFSymbolImage secondary_color](self, "secondary_color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("secondaryColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("secondaryColor"));

    }
  }
  if (self->_symbol_rendering_mode)
  {
    v20 = -[_SFPBRFSymbolImage symbol_rendering_mode](self, "symbol_rendering_mode");
    if (v20 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = *(&off_1E4042078 + v20);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("symbolRenderingMode"));

  }
  if (self->_vibrancy)
  {
    v22 = -[_SFPBRFSymbolImage vibrancy](self, "vibrancy");
    if (v22 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = *(&off_1E4042178 + v22);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("vibrancy"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFSymbolImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFSymbolImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFSymbolImage *v5;
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
    self = -[_SFPBRFSymbolImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFSymbolImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFSymbolImage *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _SFPBRFColor *v9;
  void *v10;
  _SFPBRFColor *v11;
  void *v12;
  void *v13;
  void *v14;
  _SFPBRFColor *v15;
  void *v16;
  void *v17;
  void *v18;
  _SFPBRFSymbolImage *v19;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_SFPBRFSymbolImage;
  v5 = -[_SFPBRFSymbolImage init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBRFSymbolImage setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFColor initWithDictionary:]([_SFPBRFColor alloc], "initWithDictionary:", v8);
      -[_SFPBRFSymbolImage setPrimary_color:](v5, "setPrimary_color:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryColor"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFColor initWithDictionary:]([_SFPBRFColor alloc], "initWithDictionary:", v10);
      -[_SFPBRFSymbolImage setSecondary_color:](v5, "setSecondary_color:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFSymbolImage setImage_style:](v5, "setImage_style:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symbolRenderingMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFSymbolImage setSymbol_rendering_mode:](v5, "setSymbol_rendering_mode:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBRFColor initWithDictionary:]([_SFPBRFColor alloc], "initWithDictionary:", v14);
      -[_SFPBRFSymbolImage setBackground_color:](v5, "setBackground_color:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchesThroughBackground"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFSymbolImage setPunches_through_background:](v5, "setPunches_through_background:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vibrancy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFSymbolImage setVibrancy:](v5, "setVibrancy:", objc_msgSend(v17, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cornerRoundingMode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFSymbolImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v18, "intValue"));
    v19 = v5;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (_SFPBRFColor)primary_color
{
  return self->_primary_color;
}

- (_SFPBRFColor)secondary_color
{
  return self->_secondary_color;
}

- (int)image_style
{
  return self->_image_style;
}

- (int)symbol_rendering_mode
{
  return self->_symbol_rendering_mode;
}

- (_SFPBRFColor)background_color
{
  return self->_background_color;
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

@end
