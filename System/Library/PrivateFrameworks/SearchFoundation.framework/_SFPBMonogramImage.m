@implementation _SFPBMonogramImage

- (_SFPBMonogramImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBMonogramImage *v5;
  void *v6;
  void *v7;
  _SFPBMonogramImage *v8;

  v4 = a3;
  v5 = -[_SFPBMonogramImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "monogramLetters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "monogramLetters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMonogramImage setMonogramLetters:](v5, "setMonogramLetters:", v7);

    }
    if (objc_msgSend(v4, "hasMonogramStyle"))
      -[_SFPBMonogramImage setMonogramStyle:](v5, "setMonogramStyle:", objc_msgSend(v4, "monogramStyle"));
    v8 = v5;
  }

  return v5;
}

- (void)setMonogramLetters:(id)a3
{
  NSString *v4;
  NSString *monogramLetters;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  monogramLetters = self->_monogramLetters;
  self->_monogramLetters = v4;

}

- (void)setMonogramStyle:(int)a3
{
  self->_monogramStyle = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMonogramImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBMonogramImage monogramLetters](self, "monogramLetters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  if (-[_SFPBMonogramImage monogramStyle](self, "monogramStyle"))
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
  int monogramStyle;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBMonogramImage monogramLetters](self, "monogramLetters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "monogramLetters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBMonogramImage monogramLetters](self, "monogramLetters");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        monogramStyle = self->_monogramStyle;
        v13 = monogramStyle == objc_msgSend(v4, "monogramStyle");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBMonogramImage monogramLetters](self, "monogramLetters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "monogramLetters");
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
  return (2654435761 * self->_monogramStyle) ^ -[NSString hash](self->_monogramLetters, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_monogramLetters)
  {
    -[_SFPBMonogramImage monogramLetters](self, "monogramLetters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("monogramLetters"));

  }
  if (self->_monogramStyle)
  {
    v6 = -[_SFPBMonogramImage monogramStyle](self, "monogramStyle");
    if ((_DWORD)v6)
    {
      if ((_DWORD)v6 == 1)
      {
        v7 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("monogramStyle"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMonogramImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMonogramImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMonogramImage *v5;
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
    self = -[_SFPBMonogramImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMonogramImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMonogramImage *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBMonogramImage *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBMonogramImage;
  v5 = -[_SFPBMonogramImage init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("monogramLetters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBMonogramImage setMonogramLetters:](v5, "setMonogramLetters:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("monogramStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMonogramImage setMonogramStyle:](v5, "setMonogramStyle:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)monogramLetters
{
  return self->_monogramLetters;
}

- (int)monogramStyle
{
  return self->_monogramStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramLetters, 0);
}

@end
