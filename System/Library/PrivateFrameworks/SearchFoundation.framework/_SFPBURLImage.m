@implementation _SFPBURLImage

- (_SFPBURLImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBURLImage *v5;
  void *v6;
  _SFPBURL *v7;
  void *v8;
  _SFPBURL *v9;
  void *v10;
  _SFPBURL *v11;
  void *v12;
  _SFPBURL *v13;
  _SFPBURLImage *v14;

  v4 = a3;
  v5 = -[_SFPBURLImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "urlValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBURL alloc];
      objc_msgSend(v4, "urlValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBURL initWithNSURL:](v7, "initWithNSURL:", v8);
      -[_SFPBURLImage setUrlValue:](v5, "setUrlValue:", v9);

    }
    objc_msgSend(v4, "darkUrlValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBURL alloc];
      objc_msgSend(v4, "darkUrlValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBURL initWithNSURL:](v11, "initWithNSURL:", v12);
      -[_SFPBURLImage setDarkUrlValue:](v5, "setDarkUrlValue:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setUrlValue:(id)a3
{
  objc_storeStrong((id *)&self->_urlValue, a3);
}

- (void)setDarkUrlValue:(id)a3
{
  objc_storeStrong((id *)&self->_darkUrlValue, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBURLImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBURLImage urlValue](self, "urlValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBURLImage darkUrlValue](self, "darkUrlValue");
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
  -[_SFPBURLImage urlValue](self, "urlValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBURLImage urlValue](self, "urlValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBURLImage urlValue](self, "urlValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBURLImage darkUrlValue](self, "darkUrlValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "darkUrlValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBURLImage darkUrlValue](self, "darkUrlValue");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBURLImage darkUrlValue](self, "darkUrlValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "darkUrlValue");
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

  v3 = -[_SFPBURL hash](self->_urlValue, "hash");
  return -[_SFPBURL hash](self->_darkUrlValue, "hash") ^ v3;
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
  if (self->_darkUrlValue)
  {
    -[_SFPBURLImage darkUrlValue](self, "darkUrlValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("darkUrlValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("darkUrlValue"));

    }
  }
  if (self->_urlValue)
  {
    -[_SFPBURLImage urlValue](self, "urlValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("urlValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("urlValue"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBURLImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBURLImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBURLImage *v5;
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
    self = -[_SFPBURLImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBURLImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBURLImage *v5;
  void *v6;
  _SFPBURL *v7;
  void *v8;
  _SFPBURL *v9;
  _SFPBURLImage *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBURLImage;
  v5 = -[_SFPBURLImage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("urlValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v6);
      -[_SFPBURLImage setUrlValue:](v5, "setUrlValue:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("darkUrlValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v8);
      -[_SFPBURLImage setDarkUrlValue:](v5, "setDarkUrlValue:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (_SFPBURL)urlValue
{
  return self->_urlValue;
}

- (_SFPBURL)darkUrlValue
{
  return self->_darkUrlValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkUrlValue, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
}

@end
