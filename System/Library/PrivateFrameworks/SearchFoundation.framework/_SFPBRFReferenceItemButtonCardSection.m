@implementation _SFPBRFReferenceItemButtonCardSection

- (_SFPBRFReferenceItemButtonCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFReferenceItemButtonCardSection *v5;
  void *v6;
  _SFPBButtonItem *v7;
  void *v8;
  _SFPBButtonItem *v9;
  _SFPBRFReferenceItemButtonCardSection *v10;

  v4 = a3;
  v5 = -[_SFPBRFReferenceItemButtonCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "button");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBButtonItem initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFReferenceItemButtonCardSection setButton_1:](v5, "setButton_1:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setButton_1:(id)a3
{
  objc_storeStrong((id *)&self->_button_1, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFReferenceItemButtonCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBRFReferenceItemButtonCardSection button](self, "button");
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
    -[_SFPBRFReferenceItemButtonCardSection button](self, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBRFReferenceItemButtonCardSection button](self, "button");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBRFReferenceItemButtonCardSection button](self, "button");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "button");
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
  return -[_SFPBButtonItem hash](self->_button_1, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_button_1)
  {
    -[_SFPBRFReferenceItemButtonCardSection button](self, "button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("button1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("button1"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFReferenceItemButtonCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFReferenceItemButtonCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFReferenceItemButtonCardSection *v5;
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
    self = -[_SFPBRFReferenceItemButtonCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFReferenceItemButtonCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFReferenceItemButtonCardSection *v5;
  void *v6;
  _SFPBButtonItem *v7;
  _SFPBRFReferenceItemButtonCardSection *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBRFReferenceItemButtonCardSection;
  v5 = -[_SFPBRFReferenceItemButtonCardSection init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v6);
      -[_SFPBRFReferenceItemButtonCardSection setButton_1:](v5, "setButton_1:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (_SFPBButtonItem)button_1
{
  return self->_button_1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button_1, 0);
}

@end
