@implementation _SFPBRFBinaryButtonCardSection

- (_SFPBRFBinaryButtonCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFBinaryButtonCardSection *v5;
  void *v6;
  _SFPBButtonItem *v7;
  void *v8;
  _SFPBButtonItem *v9;
  void *v10;
  _SFPBButtonItem *v11;
  void *v12;
  _SFPBButtonItem *v13;
  _SFPBRFBinaryButtonCardSection *v14;

  v4 = a3;
  v5 = -[_SFPBRFBinaryButtonCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "primary_button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "primary_button");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBButtonItem initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFBinaryButtonCardSection setPrimary_button:](v5, "setPrimary_button:", v9);

    }
    objc_msgSend(v4, "secondary_button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "secondary_button");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBButtonItem initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFBinaryButtonCardSection setSecondary_button:](v5, "setSecondary_button:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setPrimary_button:(id)a3
{
  objc_storeStrong((id *)&self->_primary_button, a3);
}

- (void)setSecondary_button:(id)a3
{
  objc_storeStrong((id *)&self->_secondary_button, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFBinaryButtonCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRFBinaryButtonCardSection primary_button](self, "primary_button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFBinaryButtonCardSection secondary_button](self, "secondary_button");
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
  -[_SFPBRFBinaryButtonCardSection primary_button](self, "primary_button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primary_button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRFBinaryButtonCardSection primary_button](self, "primary_button");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFBinaryButtonCardSection primary_button](self, "primary_button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primary_button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBRFBinaryButtonCardSection secondary_button](self, "secondary_button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondary_button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFBinaryButtonCardSection secondary_button](self, "secondary_button");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBRFBinaryButtonCardSection secondary_button](self, "secondary_button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondary_button");
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

  v3 = -[_SFPBButtonItem hash](self->_primary_button, "hash");
  return -[_SFPBButtonItem hash](self->_secondary_button, "hash") ^ v3;
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
  if (self->_primary_button)
  {
    -[_SFPBRFBinaryButtonCardSection primary_button](self, "primary_button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("primaryButton"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("primaryButton"));

    }
  }
  if (self->_secondary_button)
  {
    -[_SFPBRFBinaryButtonCardSection secondary_button](self, "secondary_button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("secondaryButton"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("secondaryButton"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFBinaryButtonCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFBinaryButtonCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFBinaryButtonCardSection *v5;
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
    self = -[_SFPBRFBinaryButtonCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFBinaryButtonCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFBinaryButtonCardSection *v5;
  void *v6;
  _SFPBButtonItem *v7;
  void *v8;
  _SFPBButtonItem *v9;
  _SFPBRFBinaryButtonCardSection *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFBinaryButtonCardSection;
  v5 = -[_SFPBRFBinaryButtonCardSection init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v6);
      -[_SFPBRFBinaryButtonCardSection setPrimary_button:](v5, "setPrimary_button:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v8);
      -[_SFPBRFBinaryButtonCardSection setSecondary_button:](v5, "setSecondary_button:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (_SFPBButtonItem)primary_button
{
  return self->_primary_button;
}

- (_SFPBButtonItem)secondary_button
{
  return self->_secondary_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary_button, 0);
  objc_storeStrong((id *)&self->_primary_button, 0);
}

@end
