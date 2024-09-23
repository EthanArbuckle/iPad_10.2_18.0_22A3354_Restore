@implementation _SFPBAppLink

- (_SFPBAppLink)initWithFacade:(id)a3
{
  id v4;
  _SFPBAppLink *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBPunchout *v9;
  void *v10;
  _SFPBPunchout *v11;
  void *v12;
  _SFPBImage *v13;
  void *v14;
  _SFPBImage *v15;
  _SFPBAppLink *v16;

  v4 = a3;
  v5 = -[_SFPBAppLink init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAppLink setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "appPunchout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBPunchout alloc];
      objc_msgSend(v4, "appPunchout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBPunchout initWithFacade:](v9, "initWithFacade:", v10);
      -[_SFPBAppLink setAppPunchout:](v5, "setAppPunchout:", v11);

    }
    objc_msgSend(v4, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBImage alloc];
      objc_msgSend(v4, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBImage initWithFacade:](v13, "initWithFacade:", v14);
      -[_SFPBAppLink setImage:](v5, "setImage:", v15);

    }
    if (objc_msgSend(v4, "hasImageAlign"))
      -[_SFPBAppLink setImageAlign:](v5, "setImageAlign:", objc_msgSend(v4, "imageAlign"));
    v16 = v5;
  }

  return v5;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setAppPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_appPunchout, a3);
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setImageAlign:(int)a3
{
  self->_imageAlign = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAppLinkReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFPBAppLink title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBAppLink appPunchout](self, "appPunchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBAppLink image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  v7 = -[_SFPBAppLink imageAlign](self, "imageAlign");
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteInt32Field();
    v8 = v9;
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
  BOOL v22;
  int imageAlign;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBAppLink title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBAppLink title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBAppLink title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBAppLink appPunchout](self, "appPunchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appPunchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBAppLink appPunchout](self, "appPunchout");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBAppLink appPunchout](self, "appPunchout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appPunchout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBAppLink image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBAppLink image](self, "image");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      imageAlign = self->_imageAlign;
      v22 = imageAlign == objc_msgSend(v4, "imageAlign");
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBAppLink image](self, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[_SFPBPunchout hash](self->_appPunchout, "hash");
  return v4 ^ v3 ^ -[_SFPBImage hash](self->_image, "hash") ^ (2654435761 * self->_imageAlign);
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appPunchout)
  {
    -[_SFPBAppLink appPunchout](self, "appPunchout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appPunchout"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appPunchout"));

    }
  }
  if (self->_image)
  {
    -[_SFPBAppLink image](self, "image");
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
  if (self->_imageAlign)
  {
    v10 = -[_SFPBAppLink imageAlign](self, "imageAlign");
    if (v10 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_1E4042078 + v10);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("imageAlign"));

  }
  if (self->_title)
  {
    -[_SFPBAppLink title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("title"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBAppLink dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBAppLink)initWithJSON:(id)a3
{
  void *v4;
  _SFPBAppLink *v5;
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
    self = -[_SFPBAppLink initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBAppLink)initWithDictionary:(id)a3
{
  id v4;
  _SFPBAppLink *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBPunchout *v9;
  void *v10;
  _SFPBImage *v11;
  void *v12;
  _SFPBAppLink *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBAppLink;
  v5 = -[_SFPBAppLink init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBAppLink setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appPunchout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v8);
      -[_SFPBAppLink setAppPunchout:](v5, "setAppPunchout:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v10);
      -[_SFPBAppLink setImage:](v5, "setImage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageAlign"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAppLink setImageAlign:](v5, "setImageAlign:", objc_msgSend(v12, "intValue"));
    v13 = v5;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBPunchout)appPunchout
{
  return self->_appPunchout;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_appPunchout, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
