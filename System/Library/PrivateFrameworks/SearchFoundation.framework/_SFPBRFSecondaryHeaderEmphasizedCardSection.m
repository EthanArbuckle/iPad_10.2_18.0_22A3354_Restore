@implementation _SFPBRFSecondaryHeaderEmphasizedCardSection

- (_SFPBRFSecondaryHeaderEmphasizedCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFSecondaryHeaderEmphasizedCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  _SFPBRFSecondaryHeaderEmphasizedCardSection *v10;

  v4 = a3;
  v5 = -[_SFPBRFSecondaryHeaderEmphasizedCardSection init](self, "init");
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
      -[_SFPBRFSecondaryHeaderEmphasizedCardSection setText_1:](v5, "setText_1:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSecondaryHeaderEmphasizedCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBRFSecondaryHeaderEmphasizedCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

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
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBRFSecondaryHeaderEmphasizedCardSection text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBRFSecondaryHeaderEmphasizedCardSection text](self, "text");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBRFSecondaryHeaderEmphasizedCardSection text](self, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
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
  return -[_SFPBRFTextProperty hash](self->_text_1, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_text_1)
  {
    -[_SFPBRFSecondaryHeaderEmphasizedCardSection text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("text1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("text1"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFSecondaryHeaderEmphasizedCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFSecondaryHeaderEmphasizedCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFSecondaryHeaderEmphasizedCardSection *v5;
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
    self = -[_SFPBRFSecondaryHeaderEmphasizedCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFSecondaryHeaderEmphasizedCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFSecondaryHeaderEmphasizedCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  _SFPBRFSecondaryHeaderEmphasizedCardSection *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBRFSecondaryHeaderEmphasizedCardSection;
  v5 = -[_SFPBRFSecondaryHeaderEmphasizedCardSection init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFSecondaryHeaderEmphasizedCardSection setText_1:](v5, "setText_1:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_1, 0);
}

@end
