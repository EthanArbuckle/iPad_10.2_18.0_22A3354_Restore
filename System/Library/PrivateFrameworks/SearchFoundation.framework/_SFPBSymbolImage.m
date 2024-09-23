@implementation _SFPBSymbolImage

- (_SFPBSymbolImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBSymbolImage *v5;
  void *v6;
  void *v7;
  _SFPBSymbolImage *v8;

  v4 = a3;
  v5 = -[_SFPBSymbolImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "symbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "symbolName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSymbolImage setSymbolName:](v5, "setSymbolName:", v7);

    }
    if (objc_msgSend(v4, "hasPunchThroughBackground"))
      -[_SFPBSymbolImage setPunchThroughBackground:](v5, "setPunchThroughBackground:", objc_msgSend(v4, "punchThroughBackground"));
    if (objc_msgSend(v4, "hasBackgroundColor"))
      -[_SFPBSymbolImage setBackgroundColor:](v5, "setBackgroundColor:", objc_msgSend(v4, "backgroundColor"));
    if (objc_msgSend(v4, "hasPrimaryColor"))
      -[_SFPBSymbolImage setPrimaryColor:](v5, "setPrimaryColor:", objc_msgSend(v4, "primaryColor"));
    if (objc_msgSend(v4, "hasSecondaryColor"))
      -[_SFPBSymbolImage setSecondaryColor:](v5, "setSecondaryColor:", objc_msgSend(v4, "secondaryColor"));
    if (objc_msgSend(v4, "hasFillStyle"))
      -[_SFPBSymbolImage setFillStyle:](v5, "setFillStyle:", objc_msgSend(v4, "fillStyle"));
    v8 = v5;
  }

  return v5;
}

- (void)setSymbolName:(id)a3
{
  NSString *v4;
  NSString *symbolName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  symbolName = self->_symbolName;
  self->_symbolName = v4;

}

- (void)setPunchThroughBackground:(BOOL)a3
{
  self->_punchThroughBackground = a3;
}

- (void)setBackgroundColor:(int)a3
{
  self->_backgroundColor = a3;
}

- (void)setPrimaryColor:(int)a3
{
  self->_primaryColor = a3;
}

- (void)setSecondaryColor:(int)a3
{
  self->_secondaryColor = a3;
}

- (void)setFillStyle:(int)a3
{
  self->_fillStyle = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSymbolImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBSymbolImage symbolName](self, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  if (-[_SFPBSymbolImage punchThroughBackground](self, "punchThroughBackground"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBSymbolImage backgroundColor](self, "backgroundColor"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBSymbolImage primaryColor](self, "primaryColor"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBSymbolImage secondaryColor](self, "secondaryColor"))
    PBDataWriterWriteInt32Field();
  v5 = -[_SFPBSymbolImage fillStyle](self, "fillStyle");
  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

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
  int punchThroughBackground;
  int backgroundColor;
  int primaryColor;
  int secondaryColor;
  int fillStyle;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[_SFPBSymbolImage symbolName](self, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  -[_SFPBSymbolImage symbolName](self, "symbolName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBSymbolImage symbolName](self, "symbolName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbolName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  punchThroughBackground = self->_punchThroughBackground;
  if (punchThroughBackground != objc_msgSend(v4, "punchThroughBackground"))
    goto LABEL_13;
  backgroundColor = self->_backgroundColor;
  if (backgroundColor != objc_msgSend(v4, "backgroundColor"))
    goto LABEL_13;
  primaryColor = self->_primaryColor;
  if (primaryColor != objc_msgSend(v4, "primaryColor"))
    goto LABEL_13;
  secondaryColor = self->_secondaryColor;
  if (secondaryColor != objc_msgSend(v4, "secondaryColor"))
    goto LABEL_13;
  fillStyle = self->_fillStyle;
  v18 = fillStyle == objc_msgSend(v4, "fillStyle");
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_symbolName, "hash");
  if (self->_punchThroughBackground)
    v4 = 2654435761;
  else
    v4 = 0;
  return v4 ^ v3 ^ (2654435761 * self->_backgroundColor) ^ (2654435761 * self->_primaryColor) ^ (2654435761 * self->_secondaryColor) ^ (2654435761 * self->_fillStyle);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    v4 = -[_SFPBSymbolImage backgroundColor](self, "backgroundColor");
    if (v4 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E40420A0 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("backgroundColor"));

  }
  if (self->_fillStyle)
  {
    v6 = -[_SFPBSymbolImage fillStyle](self, "fillStyle");
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E4042178 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fillStyle"));

  }
  if (self->_primaryColor)
  {
    v8 = -[_SFPBSymbolImage primaryColor](self, "primaryColor");
    if (v8 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = *(&off_1E40420A0 + v8);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("primaryColor"));

  }
  if (self->_punchThroughBackground)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSymbolImage punchThroughBackground](self, "punchThroughBackground"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("punchThroughBackground"));

  }
  if (self->_secondaryColor)
  {
    v11 = -[_SFPBSymbolImage secondaryColor](self, "secondaryColor");
    if (v11 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = *(&off_1E40420A0 + v11);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("secondaryColor"));

  }
  if (self->_symbolName)
  {
    -[_SFPBSymbolImage symbolName](self, "symbolName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("symbolName"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSymbolImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBSymbolImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSymbolImage *v5;
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
    self = -[_SFPBSymbolImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSymbolImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSymbolImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBSymbolImage *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBSymbolImage;
  v5 = -[_SFPBSymbolImage init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symbolName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBSymbolImage setSymbolName:](v5, "setSymbolName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchThroughBackground"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSymbolImage setPunchThroughBackground:](v5, "setPunchThroughBackground:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSymbolImage setBackgroundColor:](v5, "setBackgroundColor:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSymbolImage setPrimaryColor:](v5, "setPrimaryColor:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSymbolImage setSecondaryColor:](v5, "setSecondaryColor:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fillStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSymbolImage setFillStyle:](v5, "setFillStyle:", objc_msgSend(v12, "intValue"));
    v13 = v5;

  }
  return v5;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (BOOL)punchThroughBackground
{
  return self->_punchThroughBackground;
}

- (int)backgroundColor
{
  return self->_backgroundColor;
}

- (int)primaryColor
{
  return self->_primaryColor;
}

- (int)secondaryColor
{
  return self->_secondaryColor;
}

- (int)fillStyle
{
  return self->_fillStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
