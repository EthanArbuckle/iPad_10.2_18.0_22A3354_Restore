@implementation _SFPBRFDefaultBrowserAppIconImage

- (_SFPBRFDefaultBrowserAppIconImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFDefaultBrowserAppIconImage *v5;
  _SFPBRFDefaultBrowserAppIconImage *v6;

  v4 = a3;
  v5 = -[_SFPBRFDefaultBrowserAppIconImage init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasImage_style"))
      -[_SFPBRFDefaultBrowserAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    v6 = v5;
  }

  return v5;
}

- (void)setImage_style:(int)a3
{
  self->_image_style = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFDefaultBrowserAppIconImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBRFDefaultBrowserAppIconImage image_style](self, "image_style"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int image_style;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    image_style = self->_image_style;
    v6 = image_style == objc_msgSend(v4, "image_style");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 2654435761 * self->_image_style;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_image_style)
  {
    v4 = -[_SFPBRFDefaultBrowserAppIconImage image_style](self, "image_style");
    if (v4 < 0x2A && ((0x3FFDFFFFFFFuLL >> v4) & 1) != 0)
    {
      v5 = *(&off_1E4041EA0 + v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("imageStyle"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFDefaultBrowserAppIconImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFDefaultBrowserAppIconImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFDefaultBrowserAppIconImage *v5;
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
    self = -[_SFPBRFDefaultBrowserAppIconImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFDefaultBrowserAppIconImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFDefaultBrowserAppIconImage *v5;
  void *v6;
  _SFPBRFDefaultBrowserAppIconImage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBRFDefaultBrowserAppIconImage;
  v5 = -[_SFPBRFDefaultBrowserAppIconImage init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFDefaultBrowserAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)image_style
{
  return self->_image_style;
}

@end
