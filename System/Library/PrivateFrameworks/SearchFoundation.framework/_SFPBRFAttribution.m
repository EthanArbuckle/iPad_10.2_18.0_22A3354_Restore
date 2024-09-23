@implementation _SFPBRFAttribution

- (_SFPBRFAttribution)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFAttribution *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  _SFPBRFTextProperty *v11;
  void *v12;
  _SFPBRFTextProperty *v13;
  void *v14;
  _SFPBRFVisualProperty *v15;
  void *v16;
  _SFPBRFVisualProperty *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _SFPBCommandReference *v27;
  void *v28;
  _SFPBCommandReference *v29;
  _SFPBRFAttribution *v30;

  v4 = a3;
  v5 = -[_SFPBRFAttribution init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBRFTextProperty initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFAttribution setTitle:](v5, "setTitle:", v9);

    }
    objc_msgSend(v4, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "subtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFTextProperty initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFAttribution setSubtitle:](v5, "setSubtitle:", v13);

    }
    objc_msgSend(v4, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBRFVisualProperty initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBRFAttribution setImage:](v5, "setImage:", v17);

    }
    objc_msgSend(v4, "index");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "index");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFAttribution setIndex:](v5, "setIndex:", objc_msgSend(v19, "intValue"));

    }
    objc_msgSend(v4, "localized_index");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "localized_index");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFAttribution setLocalized_index:](v5, "setLocalized_index:", v21);

    }
    objc_msgSend(v4, "localized_separator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "localized_separator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFAttribution setLocalized_separator:](v5, "setLocalized_separator:", v23);

    }
    objc_msgSend(v4, "locale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "locale");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFAttribution setLocale:](v5, "setLocale:", v25);

    }
    objc_msgSend(v4, "commandReference");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [_SFPBCommandReference alloc];
      objc_msgSend(v4, "commandReference");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_SFPBCommandReference initWithFacade:](v27, "initWithFacade:", v28);
      -[_SFPBRFAttribution setCommandReference:](v5, "setCommandReference:", v29);

    }
    v30 = v5;
  }

  return v5;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setIndex:(int)a3
{
  self->_index = a3;
}

- (void)setLocalized_index:(id)a3
{
  NSString *v4;
  NSString *localized_index;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localized_index = self->_localized_index;
  self->_localized_index = v4;

}

- (void)setLocalized_separator:(id)a3
{
  NSString *v4;
  NSString *localized_separator;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localized_separator = self->_localized_separator;
  self->_localized_separator = v4;

}

- (void)setLocale:(id)a3
{
  NSString *v4;
  NSString *locale;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  locale = self->_locale;
  self->_locale = v4;

}

- (void)setCommandReference:(id)a3
{
  objc_storeStrong((id *)&self->_commandReference, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFAttributionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_SFPBRFAttribution title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFAttribution subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFAttribution image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFAttribution index](self, "index"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRFAttribution localized_index](self, "localized_index");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBRFAttribution localized_separator](self, "localized_separator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteStringField();

  -[_SFPBRFAttribution locale](self, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteStringField();

  -[_SFPBRFAttribution commandReference](self, "commandReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
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
  int index;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  BOOL v43;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[_SFPBRFAttribution title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBRFAttribution title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFAttribution title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBRFAttribution subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBRFAttribution subtitle](self, "subtitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFAttribution subtitle](self, "subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBRFAttribution image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBRFAttribution image](self, "image");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFAttribution image](self, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_38;
  }
  else
  {

  }
  index = self->_index;
  if (index != objc_msgSend(v4, "index"))
    goto LABEL_38;
  -[_SFPBRFAttribution localized_index](self, "localized_index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localized_index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBRFAttribution localized_index](self, "localized_index");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBRFAttribution localized_index](self, "localized_index");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localized_index");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBRFAttribution localized_separator](self, "localized_separator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localized_separator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBRFAttribution localized_separator](self, "localized_separator");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_SFPBRFAttribution localized_separator](self, "localized_separator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localized_separator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBRFAttribution locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBRFAttribution locale](self, "locale");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_SFPBRFAttribution locale](self, "locale");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBRFAttribution commandReference](self, "commandReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_37:

    goto LABEL_38;
  }
  -[_SFPBRFAttribution commandReference](self, "commandReference");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
  {

LABEL_41:
    v43 = 1;
    goto LABEL_39;
  }
  v39 = (void *)v38;
  -[_SFPBRFAttribution commandReference](self, "commandReference");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandReference");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v40, "isEqual:", v41);

  if ((v42 & 1) != 0)
    goto LABEL_41;
LABEL_38:
  v43 = 0;
LABEL_39:

  return v43;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[_SFPBRFTextProperty hash](self->_title, "hash");
  v4 = -[_SFPBRFTextProperty hash](self->_subtitle, "hash");
  v5 = -[_SFPBRFVisualProperty hash](self->_image, "hash");
  v6 = 2654435761 * self->_index;
  v7 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_localized_index, "hash");
  v8 = v7 ^ -[NSString hash](self->_localized_separator, "hash") ^ v6;
  v9 = -[NSString hash](self->_locale, "hash");
  return v8 ^ v9 ^ -[_SFPBCommandReference hash](self->_commandReference, "hash");
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_commandReference)
  {
    -[_SFPBRFAttribution commandReference](self, "commandReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commandReference"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commandReference"));

    }
  }
  if (self->_image)
  {
    -[_SFPBRFAttribution image](self, "image");
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
  if (self->_index)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBRFAttribution index](self, "index"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("index"));

  }
  if (self->_locale)
  {
    -[_SFPBRFAttribution locale](self, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("locale"));

  }
  if (self->_localized_index)
  {
    -[_SFPBRFAttribution localized_index](self, "localized_index");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("localizedIndex"));

  }
  if (self->_localized_separator)
  {
    -[_SFPBRFAttribution localized_separator](self, "localized_separator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("localizedSeparator"));

  }
  if (self->_subtitle)
  {
    -[_SFPBRFAttribution subtitle](self, "subtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("subtitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("subtitle"));

    }
  }
  if (self->_title)
  {
    -[_SFPBRFAttribution title](self, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("title"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("title"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFAttribution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFAttribution)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFAttribution *v5;
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
    self = -[_SFPBRFAttribution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFAttribution)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFAttribution *v5;
  uint64_t v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  _SFPBRFVisualProperty *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _SFPBCommandReference *v20;
  _SFPBRFAttribution *v21;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_SFPBRFAttribution;
  v5 = -[_SFPBRFAttribution init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFAttribution setTitle:](v5, "setTitle:", v7);

    }
    v23 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v8);
      -[_SFPBRFAttribution setSubtitle:](v5, "setSubtitle:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v10);
      -[_SFPBRFAttribution setImage:](v5, "setImage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFAttribution setIndex:](v5, "setIndex:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[_SFPBRFAttribution setLocalized_index:](v5, "setLocalized_index:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedSeparator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[_SFPBRFAttribution setLocalized_separator:](v5, "setLocalized_separator:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[_SFPBRFAttribution setLocale:](v5, "setLocale:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandReference"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[_SFPBCommandReference initWithDictionary:]([_SFPBCommandReference alloc], "initWithDictionary:", v19);
      -[_SFPBRFAttribution setCommandReference:](v5, "setCommandReference:", v20);

    }
    v21 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)title
{
  return self->_title;
}

- (_SFPBRFTextProperty)subtitle
{
  return self->_subtitle;
}

- (_SFPBRFVisualProperty)image
{
  return self->_image;
}

- (int)index
{
  return self->_index;
}

- (NSString)localized_index
{
  return self->_localized_index;
}

- (NSString)localized_separator
{
  return self->_localized_separator;
}

- (NSString)locale
{
  return self->_locale;
}

- (_SFPBCommandReference)commandReference
{
  return self->_commandReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReference, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localized_separator, 0);
  objc_storeStrong((id *)&self->_localized_index, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
