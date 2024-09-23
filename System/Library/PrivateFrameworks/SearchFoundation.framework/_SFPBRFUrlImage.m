@implementation _SFPBRFUrlImage

- (_SFPBRFUrlImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFUrlImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBRFSymbolImage *v11;
  void *v12;
  _SFPBRFSymbolImage *v13;
  void *v14;
  _SFPBRFAspectRatio *v15;
  void *v16;
  _SFPBRFAspectRatio *v17;
  void *v18;
  _SFPBRFColor *v19;
  void *v20;
  _SFPBRFColor *v21;
  void *v22;
  void *v23;
  _SFPBRFUrlImage *v24;

  v4 = a3;
  v5 = -[_SFPBRFUrlImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFUrlImage setUrl:](v5, "setUrl:", v7);

    }
    objc_msgSend(v4, "dark_mode_url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "dark_mode_url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFUrlImage setDark_mode_url:](v5, "setDark_mode_url:", v9);

    }
    if (objc_msgSend(v4, "hasSymbol_placeholder_image"))
    {
      objc_msgSend(v4, "symbol_placeholder_image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [_SFPBRFSymbolImage alloc];
        objc_msgSend(v4, "symbol_placeholder_image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[_SFPBRFSymbolImage initWithFacade:](v11, "initWithFacade:", v12);
        -[_SFPBRFUrlImage setSymbol_placeholder_image:](v5, "setSymbol_placeholder_image:", v13);

      }
    }
    if (objc_msgSend(v4, "hasImage_style"))
      -[_SFPBRFUrlImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    objc_msgSend(v4, "aspect_ratio");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBRFAspectRatio alloc];
      objc_msgSend(v4, "aspect_ratio");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBRFAspectRatio initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBRFUrlImage setAspect_ratio:](v5, "setAspect_ratio:", v17);

    }
    if (objc_msgSend(v4, "hasSizing_mode"))
      -[_SFPBRFUrlImage setSizing_mode:](v5, "setSizing_mode:", objc_msgSend(v4, "sizing_mode"));
    if (objc_msgSend(v4, "hasImage_rendering_mode"))
      -[_SFPBRFUrlImage setImage_rendering_mode:](v5, "setImage_rendering_mode:", objc_msgSend(v4, "image_rendering_mode"));
    objc_msgSend(v4, "background_color");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBRFColor alloc];
      objc_msgSend(v4, "background_color");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBRFColor initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBRFUrlImage setBackground_color:](v5, "setBackground_color:", v21);

    }
    if (objc_msgSend(v4, "hasCorner_rounding_mode"))
      -[_SFPBRFUrlImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v4, "corner_rounding_mode"));
    objc_msgSend(v4, "inset_padding");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "inset_padding");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      -[_SFPBRFUrlImage setInset_padding:](v5, "setInset_padding:");

    }
    v24 = v5;
  }

  return v5;
}

- (void)setUrl:(id)a3
{
  NSString *v4;
  NSString *url;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  url = self->_url;
  self->_url = v4;

}

- (void)setDark_mode_url:(id)a3
{
  NSString *v4;
  NSString *dark_mode_url;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  dark_mode_url = self->_dark_mode_url;
  self->_dark_mode_url = v4;

}

- (void)setSymbol_placeholder_image:(id)a3
{
  self->_whichPlaceholder_Image = a3 != 0;
  objc_storeStrong((id *)&self->_symbol_placeholder_image, a3);
}

- (_SFPBRFSymbolImage)symbol_placeholder_image
{
  if (self->_whichPlaceholder_Image == 1)
    return self->_symbol_placeholder_image;
  else
    return (_SFPBRFSymbolImage *)0;
}

- (void)setImage_style:(int)a3
{
  self->_image_style = a3;
}

- (void)setAspect_ratio:(id)a3
{
  objc_storeStrong((id *)&self->_aspect_ratio, a3);
}

- (void)setSizing_mode:(int)a3
{
  self->_sizing_mode = a3;
}

- (void)setImage_rendering_mode:(int)a3
{
  self->_image_rendering_mode = a3;
}

- (void)setBackground_color:(id)a3
{
  objc_storeStrong((id *)&self->_background_color, a3);
}

- (void)setCorner_rounding_mode:(int)a3
{
  self->_corner_rounding_mode = a3;
}

- (void)setInset_padding:(float)a3
{
  self->_inset_padding = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBRFUrlImageReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  id v11;

  v11 = a3;
  -[_SFPBRFUrlImage url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBRFUrlImage dark_mode_url](self, "dark_mode_url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBRFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFUrlImage image_style](self, "image_style"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRFUrlImage aspect_ratio](self, "aspect_ratio");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFUrlImage sizing_mode](self, "sizing_mode"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFUrlImage image_rendering_mode](self, "image_rendering_mode"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRFUrlImage background_color](self, "background_color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFUrlImage corner_rounding_mode](self, "corner_rounding_mode"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRFUrlImage inset_padding](self, "inset_padding");
  v9 = v11;
  if (v10 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v9 = v11;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int sizing_mode;
  int image_rendering_mode;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  BOOL v35;
  int corner_rounding_mode;
  float inset_padding;
  float v39;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[_SFPBRFUrlImage url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[_SFPBRFUrlImage url](self, "url");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFUrlImage url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[_SFPBRFUrlImage dark_mode_url](self, "dark_mode_url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dark_mode_url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[_SFPBRFUrlImage dark_mode_url](self, "dark_mode_url");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFUrlImage dark_mode_url](self, "dark_mode_url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dark_mode_url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  -[_SFPBRFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbol_placeholder_image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[_SFPBRFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbol_placeholder_image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_30;
  }
  else
  {

  }
  image_style = self->_image_style;
  if (image_style != objc_msgSend(v4, "image_style"))
    goto LABEL_30;
  -[_SFPBRFUrlImage aspect_ratio](self, "aspect_ratio");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aspect_ratio");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[_SFPBRFUrlImage aspect_ratio](self, "aspect_ratio");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBRFUrlImage aspect_ratio](self, "aspect_ratio");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aspect_ratio");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_30;
  }
  else
  {

  }
  sizing_mode = self->_sizing_mode;
  if (sizing_mode != objc_msgSend(v4, "sizing_mode"))
    goto LABEL_30;
  image_rendering_mode = self->_image_rendering_mode;
  if (image_rendering_mode != objc_msgSend(v4, "image_rendering_mode"))
    goto LABEL_30;
  -[_SFPBRFUrlImage background_color](self, "background_color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "background_color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_29:

    goto LABEL_30;
  }
  -[_SFPBRFUrlImage background_color](self, "background_color");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    -[_SFPBRFUrlImage background_color](self, "background_color");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "background_color");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (!v34)
      goto LABEL_30;
  }
  else
  {

  }
  corner_rounding_mode = self->_corner_rounding_mode;
  if (corner_rounding_mode == objc_msgSend(v4, "corner_rounding_mode"))
  {
    inset_padding = self->_inset_padding;
    objc_msgSend(v4, "inset_padding");
    v35 = inset_padding == v39;
    goto LABEL_31;
  }
LABEL_30:
  v35 = 0;
LABEL_31:

  return v35;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t image_style;
  unint64_t v7;
  uint64_t sizing_mode;
  uint64_t image_rendering_mode;
  unint64_t v10;
  uint64_t corner_rounding_mode;
  float inset_padding;
  BOOL v13;
  double v14;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;

  v3 = -[NSString hash](self->_url, "hash");
  v4 = -[NSString hash](self->_dark_mode_url, "hash");
  v5 = -[_SFPBRFSymbolImage hash](self->_symbol_placeholder_image, "hash");
  image_style = self->_image_style;
  v7 = -[_SFPBRFAspectRatio hash](self->_aspect_ratio, "hash");
  sizing_mode = self->_sizing_mode;
  image_rendering_mode = self->_image_rendering_mode;
  v10 = -[_SFPBRFColor hash](self->_background_color, "hash");
  corner_rounding_mode = self->_corner_rounding_mode;
  inset_padding = self->_inset_padding;
  v13 = inset_padding < 0.0;
  if (inset_padding == 0.0)
  {
    v18 = 0;
  }
  else
  {
    v14 = inset_padding;
    v15 = -v14;
    if (!v13)
      v15 = v14;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v18 += (unint64_t)v17;
    }
    else
    {
      v18 -= (unint64_t)fabs(v17);
    }
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ (2654435761 * image_style) ^ (2654435761 * sizing_mode) ^ (2654435761
                                                                                          * image_rendering_mode) ^ v10 ^ (2654435761 * corner_rounding_mode) ^ v18;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aspect_ratio)
  {
    -[_SFPBRFUrlImage aspect_ratio](self, "aspect_ratio");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aspectRatio"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("aspectRatio"));

    }
  }
  if (self->_background_color)
  {
    -[_SFPBRFUrlImage background_color](self, "background_color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("backgroundColor"));

    }
  }
  if (self->_corner_rounding_mode)
  {
    v10 = -[_SFPBRFUrlImage corner_rounding_mode](self, "corner_rounding_mode");
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_1E4042178 + v10);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cornerRoundingMode"));

  }
  if (self->_dark_mode_url)
  {
    -[_SFPBRFUrlImage dark_mode_url](self, "dark_mode_url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("darkModeUrl"));

  }
  if (self->_image_rendering_mode)
  {
    v14 = -[_SFPBRFUrlImage image_rendering_mode](self, "image_rendering_mode");
    if (v14 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E4042178 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("imageRenderingMode"));

  }
  if (self->_image_style)
  {
    v16 = -[_SFPBRFUrlImage image_style](self, "image_style");
    if (v16 < 0x2A && ((0x3FFDFFFFFFFuLL >> v16) & 1) != 0)
    {
      v17 = *(&off_1E4041EA0 + v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("imageStyle"));

  }
  if (self->_inset_padding != 0.0)
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFUrlImage inset_padding](self, "inset_padding");
    objc_msgSend(v18, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("insetPadding"));

  }
  if (self->_sizing_mode)
  {
    v20 = -[_SFPBRFUrlImage sizing_mode](self, "sizing_mode");
    if (v20 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = *(&off_1E4042178 + v20);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("sizingMode"));

  }
  if (self->_symbol_placeholder_image)
  {
    -[_SFPBRFUrlImage symbol_placeholder_image](self, "symbol_placeholder_image");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("symbolPlaceholderImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("symbolPlaceholderImage"));

    }
  }
  if (self->_url)
  {
    -[_SFPBRFUrlImage url](self, "url");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("url"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFUrlImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFUrlImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFUrlImage *v5;
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
    self = -[_SFPBRFUrlImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFUrlImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFUrlImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBRFSymbolImage *v11;
  void *v12;
  void *v13;
  _SFPBRFAspectRatio *v14;
  void *v15;
  void *v16;
  void *v17;
  _SFPBRFColor *v18;
  void *v19;
  void *v20;
  _SFPBRFUrlImage *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_SFPBRFUrlImage;
  v5 = -[_SFPBRFUrlImage init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBRFUrlImage setUrl:](v5, "setUrl:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("darkModeUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBRFUrlImage setDark_mode_url:](v5, "setDark_mode_url:", v9);

    }
    v23 = v8;
    v24 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symbolPlaceholderImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFSymbolImage initWithDictionary:]([_SFPBRFSymbolImage alloc], "initWithDictionary:", v10);
      -[_SFPBRFUrlImage setSymbol_placeholder_image:](v5, "setSymbol_placeholder_image:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFUrlImage setImage_style:](v5, "setImage_style:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aspectRatio"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[_SFPBRFAspectRatio initWithDictionary:]([_SFPBRFAspectRatio alloc], "initWithDictionary:", v13);
      -[_SFPBRFUrlImage setAspect_ratio:](v5, "setAspect_ratio:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sizingMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFUrlImage setSizing_mode:](v5, "setSizing_mode:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageRenderingMode"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFUrlImage setImage_rendering_mode:](v5, "setImage_rendering_mode:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[_SFPBRFColor initWithDictionary:]([_SFPBRFColor alloc], "initWithDictionary:", v17);
      -[_SFPBRFUrlImage setBackground_color:](v5, "setBackground_color:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cornerRoundingMode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFUrlImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v19, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("insetPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      -[_SFPBRFUrlImage setInset_padding:](v5, "setInset_padding:");
    }
    v21 = v5;

  }
  return v5;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)dark_mode_url
{
  return self->_dark_mode_url;
}

- (int)image_style
{
  return self->_image_style;
}

- (_SFPBRFAspectRatio)aspect_ratio
{
  return self->_aspect_ratio;
}

- (int)sizing_mode
{
  return self->_sizing_mode;
}

- (int)image_rendering_mode
{
  return self->_image_rendering_mode;
}

- (_SFPBRFColor)background_color
{
  return self->_background_color;
}

- (int)corner_rounding_mode
{
  return self->_corner_rounding_mode;
}

- (float)inset_padding
{
  return self->_inset_padding;
}

- (unint64_t)whichPlaceholder_Image
{
  return self->_whichPlaceholder_Image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background_color, 0);
  objc_storeStrong((id *)&self->_aspect_ratio, 0);
  objc_storeStrong((id *)&self->_symbol_placeholder_image, 0);
  objc_storeStrong((id *)&self->_dark_mode_url, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
