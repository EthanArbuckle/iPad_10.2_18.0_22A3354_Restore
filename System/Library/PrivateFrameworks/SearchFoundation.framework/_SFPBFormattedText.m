@implementation _SFPBFormattedText

- (_SFPBFormattedText)initWithFacade:(id)a3
{
  id v4;
  _SFPBFormattedText *v5;
  _SFPBText *v6;
  void *v7;
  _SFPBImage *v8;
  void *v9;
  _SFPBImage *v10;
  _SFPBFormattedText *v11;

  v4 = a3;
  v5 = -[_SFPBFormattedText init](self, "init");
  if (v5)
  {
    v6 = -[_SFPBText initWithFacade:]([_SFPBText alloc], "initWithFacade:", v4);
    -[_SFPBFormattedText setText:](v5, "setText:", v6);

    objc_msgSend(v4, "glyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [_SFPBImage alloc];
      objc_msgSend(v4, "glyph");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[_SFPBImage initWithFacade:](v8, "initWithFacade:", v9);
      -[_SFPBFormattedText setGlyph:](v5, "setGlyph:", v10);

    }
    if (objc_msgSend(v4, "hasIsEmphasized"))
      -[_SFPBFormattedText setIsEmphasized:](v5, "setIsEmphasized:", objc_msgSend(v4, "isEmphasized"));
    if (objc_msgSend(v4, "hasIsBold"))
      -[_SFPBFormattedText setIsBold:](v5, "setIsBold:", objc_msgSend(v4, "isBold"));
    if (objc_msgSend(v4, "hasTextColor"))
      -[_SFPBFormattedText setTextColor:](v5, "setTextColor:", objc_msgSend(v4, "textColor"));
    if (objc_msgSend(v4, "hasEncapsulationStyle"))
      -[_SFPBFormattedText setEncapsulationStyle:](v5, "setEncapsulationStyle:", objc_msgSend(v4, "encapsulationStyle"));
    v11 = v5;
  }

  return v5;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (void)setGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_glyph, a3);
}

- (void)setIsEmphasized:(BOOL)a3
{
  self->_isEmphasized = a3;
}

- (void)setIsBold:(BOOL)a3
{
  self->_isBold = a3;
}

- (void)setTextColor:(int)a3
{
  self->_textColor = a3;
}

- (void)setEncapsulationStyle:(int)a3
{
  self->_encapsulationStyle = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBFormattedTextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBFormattedText text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBFormattedText glyph](self, "glyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBFormattedText isEmphasized](self, "isEmphasized"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBFormattedText isBold](self, "isBold"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBFormattedText textColor](self, "textColor"))
    PBDataWriterWriteInt32Field();
  v6 = -[_SFPBFormattedText encapsulationStyle](self, "encapsulationStyle");
  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
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
  BOOL v17;
  int isEmphasized;
  int isBold;
  int textColor;
  int encapsulationStyle;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBFormattedText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBFormattedText text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBFormattedText text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBFormattedText glyph](self, "glyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "glyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_SFPBFormattedText glyph](self, "glyph");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBFormattedText glyph](self, "glyph");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "glyph");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  isEmphasized = self->_isEmphasized;
  if (isEmphasized == objc_msgSend(v4, "isEmphasized"))
  {
    isBold = self->_isBold;
    if (isBold == objc_msgSend(v4, "isBold"))
    {
      textColor = self->_textColor;
      if (textColor == objc_msgSend(v4, "textColor"))
      {
        encapsulationStyle = self->_encapsulationStyle;
        v17 = encapsulationStyle == objc_msgSend(v4, "encapsulationStyle");
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[_SFPBText hash](self->_text, "hash");
  v4 = -[_SFPBImage hash](self->_glyph, "hash");
  if (self->_isEmphasized)
    v5 = 2654435761;
  else
    v5 = 0;
  if (self->_isBold)
    v6 = 2654435761;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ (2654435761 * self->_textColor) ^ (2654435761 * self->_encapsulationStyle);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_encapsulationStyle)
  {
    v4 = -[_SFPBFormattedText encapsulationStyle](self, "encapsulationStyle");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4042178 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("encapsulationStyle"));

  }
  if (self->_glyph)
  {
    -[_SFPBFormattedText glyph](self, "glyph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("glyph"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("glyph"));

    }
  }
  if (self->_isBold)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBFormattedText isBold](self, "isBold"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isBold"));

  }
  if (self->_isEmphasized)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBFormattedText isEmphasized](self, "isEmphasized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isEmphasized"));

  }
  if (self->_text)
  {
    -[_SFPBFormattedText text](self, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("text"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("text"));

    }
  }
  if (self->_textColor)
  {
    v14 = -[_SFPBFormattedText textColor](self, "textColor");
    if (v14 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E40420A0 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("textColor"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBFormattedText dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBFormattedText)initWithJSON:(id)a3
{
  void *v4;
  _SFPBFormattedText *v5;
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
    self = -[_SFPBFormattedText initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBFormattedText)initWithDictionary:(id)a3
{
  id v4;
  _SFPBFormattedText *v5;
  void *v6;
  _SFPBText *v7;
  void *v8;
  _SFPBImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBFormattedText *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBFormattedText;
  v5 = -[_SFPBFormattedText init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBText initWithDictionary:]([_SFPBText alloc], "initWithDictionary:", v6);
      -[_SFPBFormattedText setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("glyph"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v8);
      -[_SFPBFormattedText setGlyph:](v5, "setGlyph:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmphasized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBFormattedText setIsEmphasized:](v5, "setIsEmphasized:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isBold"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBFormattedText setIsBold:](v5, "setIsBold:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBFormattedText setTextColor:](v5, "setTextColor:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("encapsulationStyle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBFormattedText setEncapsulationStyle:](v5, "setEncapsulationStyle:", objc_msgSend(v13, "intValue"));
    v14 = v5;

  }
  return v5;
}

- (_SFPBText)text
{
  return self->_text;
}

- (_SFPBImage)glyph
{
  return self->_glyph;
}

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (BOOL)isBold
{
  return self->_isBold;
}

- (int)textColor
{
  return self->_textColor;
}

- (int)encapsulationStyle
{
  return self->_encapsulationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
