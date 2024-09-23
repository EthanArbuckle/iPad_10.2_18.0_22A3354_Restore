@implementation _SFPBRFLongItemStandardCardSection

- (_SFPBRFLongItemStandardCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFLongItemStandardCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  _SFPBRFLongItemStandardCardSection *v10;

  v4 = a3;
  v5 = -[_SFPBRFLongItemStandardCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBRFTextProperty initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFLongItemStandardCardSection setText_1:](v5, "setText_1:", v9);

    }
    if (objc_msgSend(v4, "hasIs_quote"))
      -[_SFPBRFLongItemStandardCardSection setIs_quote:](v5, "setIs_quote:", objc_msgSend(v4, "is_quote"));
    if (objc_msgSend(v4, "hasHas_background_platter"))
      -[_SFPBRFLongItemStandardCardSection setHas_background_platter:](v5, "setHas_background_platter:", objc_msgSend(v4, "has_background_platter"));
    v10 = v5;
  }

  return v5;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (void)setIs_quote:(BOOL)a3
{
  self->_is_quote = a3;
}

- (void)setHas_background_platter:(BOOL)a3
{
  self->_has_background_platter = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFLongItemStandardCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBRFLongItemStandardCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFLongItemStandardCardSection is_quote](self, "is_quote"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRFLongItemStandardCardSection has_background_platter](self, "has_background_platter"))
    PBDataWriterWriteBOOLField();

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
  int is_quote;
  int has_background_platter;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[_SFPBRFLongItemStandardCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_10;
  }
  -[_SFPBRFLongItemStandardCardSection text](self, "text");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBRFLongItemStandardCardSection text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_10;
  }
  else
  {

  }
  is_quote = self->_is_quote;
  if (is_quote != objc_msgSend(v4, "is_quote"))
  {
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  has_background_platter = self->_has_background_platter;
  v15 = has_background_platter == objc_msgSend(v4, "has_background_platter");
LABEL_11:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[_SFPBRFTextProperty hash](self->_text_1, "hash");
  v4 = 2654435761;
  if (self->_is_quote)
    v5 = 2654435761;
  else
    v5 = 0;
  if (!self->_has_background_platter)
    v4 = 0;
  return v5 ^ v3 ^ v4;
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
  if (self->_has_background_platter)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFLongItemStandardCardSection has_background_platter](self, "has_background_platter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hasBackgroundPlatter"));

  }
  if (self->_is_quote)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFLongItemStandardCardSection is_quote](self, "is_quote"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isQuote"));

  }
  if (self->_text_1)
  {
    -[_SFPBRFLongItemStandardCardSection text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("text1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("text1"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFLongItemStandardCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFLongItemStandardCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFLongItemStandardCardSection *v5;
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
    self = -[_SFPBRFLongItemStandardCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFLongItemStandardCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFLongItemStandardCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  void *v9;
  _SFPBRFLongItemStandardCardSection *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFLongItemStandardCardSection;
  v5 = -[_SFPBRFLongItemStandardCardSection init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFLongItemStandardCardSection setText_1:](v5, "setText_1:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQuote"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFLongItemStandardCardSection setIs_quote:](v5, "setIs_quote:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBackgroundPlatter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFLongItemStandardCardSection setHas_background_platter:](v5, "setHas_background_platter:", objc_msgSend(v9, "BOOLValue"));
    v10 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (BOOL)is_quote
{
  return self->_is_quote;
}

- (BOOL)has_background_platter
{
  return self->_has_background_platter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_1, 0);
}

@end
