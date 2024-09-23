@implementation _SFPBRFAppIconImage

- (_SFPBRFAppIconImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFAppIconImage *v5;
  void *v6;
  void *v7;
  _SFPBRFAppIconImage *v8;

  v4 = a3;
  v5 = -[_SFPBRFAppIconImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "application_bundle_identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "application_bundle_identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFAppIconImage setApplication_bundle_identifier:](v5, "setApplication_bundle_identifier:", v7);

    }
    if (objc_msgSend(v4, "hasImage_style"))
      -[_SFPBRFAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    v8 = v5;
  }

  return v5;
}

- (void)setApplication_bundle_identifier:(id)a3
{
  NSString *v4;
  NSString *application_bundle_identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  application_bundle_identifier = self->_application_bundle_identifier;
  self->_application_bundle_identifier = v4;

}

- (void)setImage_style:(int)a3
{
  self->_image_style = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFAppIconImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBRFAppIconImage application_bundle_identifier](self, "application_bundle_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  if (-[_SFPBRFAppIconImage image_style](self, "image_style"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  int image_style;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBRFAppIconImage application_bundle_identifier](self, "application_bundle_identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "application_bundle_identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBRFAppIconImage application_bundle_identifier](self, "application_bundle_identifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        image_style = self->_image_style;
        v13 = image_style == objc_msgSend(v4, "image_style");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBRFAppIconImage application_bundle_identifier](self, "application_bundle_identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "application_bundle_identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return (2654435761 * self->_image_style) ^ -[NSString hash](self->_application_bundle_identifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_application_bundle_identifier)
  {
    -[_SFPBRFAppIconImage application_bundle_identifier](self, "application_bundle_identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationBundleIdentifier"));

  }
  if (self->_image_style)
  {
    v6 = -[_SFPBRFAppIconImage image_style](self, "image_style");
    if (v6 < 0x2A && ((0x3FFDFFFFFFFuLL >> v6) & 1) != 0)
    {
      v7 = *(&off_1E4041EA0 + v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("imageStyle"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFAppIconImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFAppIconImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFAppIconImage *v5;
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
    self = -[_SFPBRFAppIconImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFAppIconImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFAppIconImage *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBRFAppIconImage *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBRFAppIconImage;
  v5 = -[_SFPBRFAppIconImage init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBRFAppIconImage setApplication_bundle_identifier:](v5, "setApplication_bundle_identifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)application_bundle_identifier
{
  return self->_application_bundle_identifier;
}

- (int)image_style
{
  return self->_image_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application_bundle_identifier, 0);
}

@end
