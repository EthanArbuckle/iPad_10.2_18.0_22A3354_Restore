@implementation _SFPBMediaDetail

- (_SFPBMediaDetail)initWithFacade:(id)a3
{
  id v4;
  _SFPBMediaDetail *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBText *v9;
  void *v10;
  _SFPBText *v11;
  _SFPBMediaDetail *v12;

  v4 = a3;
  v5 = -[_SFPBMediaDetail init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaDetail setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBText alloc];
      objc_msgSend(v4, "content");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBText initWithFacade:](v9, "initWithFacade:", v10);
      -[_SFPBMediaDetail setContent:](v5, "setContent:", v11);

    }
    v12 = v5;
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

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaDetailReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBMediaDetail title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBMediaDetail content](self, "content");
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
  -[_SFPBMediaDetail title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBMediaDetail title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBMediaDetail title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBMediaDetail content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBMediaDetail content](self, "content");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBMediaDetail content](self, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_title, "hash");
  return -[_SFPBText hash](self->_content, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_content)
  {
    -[_SFPBMediaDetail content](self, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("content"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("content"));

    }
  }
  if (self->_title)
  {
    -[_SFPBMediaDetail title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("title"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMediaDetail dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMediaDetail)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMediaDetail *v5;
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
    self = -[_SFPBMediaDetail initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMediaDetail)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMediaDetail *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBText *v9;
  _SFPBMediaDetail *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBMediaDetail;
  v5 = -[_SFPBMediaDetail init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBMediaDetail setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBText initWithDictionary:]([_SFPBText alloc], "initWithDictionary:", v8);
      -[_SFPBMediaDetail setContent:](v5, "setContent:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBText)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
