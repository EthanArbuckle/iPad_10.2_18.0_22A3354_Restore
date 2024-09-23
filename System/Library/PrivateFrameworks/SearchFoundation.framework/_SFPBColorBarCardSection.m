@implementation _SFPBColorBarCardSection

- (_SFPBColorBarCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBColorBarCardSection *v5;
  void *v6;
  _SFPBColor *v7;
  void *v8;
  _SFPBColor *v9;
  void *v10;
  _SFPBRichText *v11;
  void *v12;
  _SFPBRichText *v13;
  void *v14;
  _SFPBRichText *v15;
  void *v16;
  _SFPBRichText *v17;
  void *v18;
  _SFPBRichText *v19;
  void *v20;
  _SFPBRichText *v21;
  _SFPBColorBarCardSection *v22;

  v4 = a3;
  v5 = -[_SFPBColorBarCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "barColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBColor alloc];
      objc_msgSend(v4, "barColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBColor initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBColorBarCardSection setBarColor:](v5, "setBarColor:", v9);

    }
    objc_msgSend(v4, "topText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRichText alloc];
      objc_msgSend(v4, "topText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRichText initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBColorBarCardSection setTopText:](v5, "setTopText:", v13);

    }
    objc_msgSend(v4, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBRichText alloc];
      objc_msgSend(v4, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBRichText initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBColorBarCardSection setTitle:](v5, "setTitle:", v17);

    }
    objc_msgSend(v4, "subtitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBRichText alloc];
      objc_msgSend(v4, "subtitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBRichText initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBColorBarCardSection setSubtitle:](v5, "setSubtitle:", v21);

    }
    v22 = v5;
  }

  return v5;
}

- (void)setBarColor:(id)a3
{
  objc_storeStrong((id *)&self->_barColor, a3);
}

- (void)setTopText:(id)a3
{
  objc_storeStrong((id *)&self->_topText, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBColorBarCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBColorBarCardSection barColor](self, "barColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBColorBarCardSection topText](self, "topText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBColorBarCardSection title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBColorBarCardSection subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_SFPBColorBarCardSection barColor](self, "barColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "barColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBColorBarCardSection barColor](self, "barColor");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBColorBarCardSection barColor](self, "barColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "barColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBColorBarCardSection topText](self, "topText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBColorBarCardSection topText](self, "topText");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBColorBarCardSection topText](self, "topText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBColorBarCardSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBColorBarCardSection title](self, "title");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBColorBarCardSection title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBColorBarCardSection subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBColorBarCardSection subtitle](self, "subtitle");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_SFPBColorBarCardSection subtitle](self, "subtitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[_SFPBColor hash](self->_barColor, "hash");
  v4 = -[_SFPBRichText hash](self->_topText, "hash") ^ v3;
  v5 = -[_SFPBRichText hash](self->_title, "hash");
  return v4 ^ v5 ^ -[_SFPBRichText hash](self->_subtitle, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_barColor)
  {
    -[_SFPBColorBarCardSection barColor](self, "barColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("barColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("barColor"));

    }
  }
  if (self->_subtitle)
  {
    -[_SFPBColorBarCardSection subtitle](self, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("subtitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("subtitle"));

    }
  }
  if (self->_title)
  {
    -[_SFPBColorBarCardSection title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("title"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("title"));

    }
  }
  if (self->_topText)
  {
    -[_SFPBColorBarCardSection topText](self, "topText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("topText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("topText"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBColorBarCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBColorBarCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBColorBarCardSection *v5;
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
    self = -[_SFPBColorBarCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBColorBarCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBColorBarCardSection *v5;
  void *v6;
  _SFPBColor *v7;
  void *v8;
  _SFPBRichText *v9;
  void *v10;
  _SFPBRichText *v11;
  void *v12;
  _SFPBRichText *v13;
  _SFPBColorBarCardSection *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBColorBarCardSection;
  v5 = -[_SFPBColorBarCardSection init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("barColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v6);
      -[_SFPBColorBarCardSection setBarColor:](v5, "setBarColor:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v8);
      -[_SFPBColorBarCardSection setTopText:](v5, "setTopText:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v10);
      -[_SFPBColorBarCardSection setTitle:](v5, "setTitle:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v12);
      -[_SFPBColorBarCardSection setSubtitle:](v5, "setSubtitle:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (_SFPBColor)barColor
{
  return self->_barColor;
}

- (_SFPBRichText)topText
{
  return self->_topText;
}

- (_SFPBRichText)title
{
  return self->_title;
}

- (_SFPBRichText)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
}

@end
