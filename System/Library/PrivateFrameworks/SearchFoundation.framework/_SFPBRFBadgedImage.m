@implementation _SFPBRFBadgedImage

- (_SFPBRFBadgedImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFBadgedImage *v5;
  void *v6;
  _SFPBRFImageSource *v7;
  void *v8;
  _SFPBRFImageSource *v9;
  void *v10;
  _SFPBRFImageSource *v11;
  void *v12;
  _SFPBRFImageSource *v13;
  _SFPBRFBadgedImage *v14;

  v4 = a3;
  v5 = -[_SFPBRFBadgedImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBRFImageSource alloc];
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBRFImageSource initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFBadgedImage setImage:](v5, "setImage:", v9);

    }
    objc_msgSend(v4, "badge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFImageSource alloc];
      objc_msgSend(v4, "badge");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFImageSource initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFBadgedImage setBadge:](v5, "setBadge:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setBadge:(id)a3
{
  objc_storeStrong((id *)&self->_badge, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFBadgedImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRFBadgedImage image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFBadgedImage badge](self, "badge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBRFBadgedImage image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRFBadgedImage image](self, "image");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFBadgedImage image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBRFBadgedImage badge](self, "badge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "badge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFBadgedImage badge](self, "badge");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBRFBadgedImage badge](self, "badge");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "badge");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_SFPBRFImageSource hash](self->_image, "hash");
  return -[_SFPBRFImageSource hash](self->_badge, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_badge)
  {
    -[_SFPBRFBadgedImage badge](self, "badge");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("badge"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("badge"));

    }
  }
  if (self->_image)
  {
    -[_SFPBRFBadgedImage image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("image"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("image"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFBadgedImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFBadgedImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFBadgedImage *v5;
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
    self = -[_SFPBRFBadgedImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFBadgedImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFBadgedImage *v5;
  void *v6;
  _SFPBRFImageSource *v7;
  void *v8;
  _SFPBRFImageSource *v9;
  _SFPBRFBadgedImage *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFBadgedImage;
  v5 = -[_SFPBRFBadgedImage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFImageSource initWithDictionary:]([_SFPBRFImageSource alloc], "initWithDictionary:", v6);
      -[_SFPBRFBadgedImage setImage:](v5, "setImage:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("badge"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFImageSource initWithDictionary:]([_SFPBRFImageSource alloc], "initWithDictionary:", v8);
      -[_SFPBRFBadgedImage setBadge:](v5, "setBadge:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (_SFPBRFImageSource)image
{
  return self->_image;
}

- (_SFPBRFImageSource)badge
{
  return self->_badge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
