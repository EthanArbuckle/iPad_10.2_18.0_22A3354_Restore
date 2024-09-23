@implementation SISchemaUUFRSelected

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUUFRSelected;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaUUFRSelected casinoCardSelected](self, "casinoCardSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaUUFRSelected deleteCasinoCardSelected](self, "deleteCasinoCardSelected");
  -[SISchemaUUFRSelected snippetViewSelected](self, "snippetViewSelected");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaUUFRSelected deleteSnippetViewSelected](self, "deleteSnippetViewSelected");

  return v5;
}

- (void)setCasinoCardSelected:(id)a3
{
  SISchemaUUFRCasinoCardSelected *v4;
  SISchemaUUFRSnippetViewSelected *snippetViewSelected;
  SISchemaUUFRCasinoCardSelected *casinoCardSelected;

  v4 = (SISchemaUUFRCasinoCardSelected *)a3;
  snippetViewSelected = self->_snippetViewSelected;
  self->_snippetViewSelected = 0;

  self->_whichSelectionevent = v4 != 0;
  casinoCardSelected = self->_casinoCardSelected;
  self->_casinoCardSelected = v4;

}

- (SISchemaUUFRCasinoCardSelected)casinoCardSelected
{
  if (self->_whichSelectionevent == 1)
    return self->_casinoCardSelected;
  else
    return (SISchemaUUFRCasinoCardSelected *)0;
}

- (void)deleteCasinoCardSelected
{
  SISchemaUUFRCasinoCardSelected *casinoCardSelected;

  if (self->_whichSelectionevent == 1)
  {
    self->_whichSelectionevent = 0;
    casinoCardSelected = self->_casinoCardSelected;
    self->_casinoCardSelected = 0;

  }
}

- (void)setSnippetViewSelected:(id)a3
{
  SISchemaUUFRSnippetViewSelected *v4;
  SISchemaUUFRCasinoCardSelected *casinoCardSelected;
  SISchemaUUFRSnippetViewSelected *snippetViewSelected;

  v4 = (SISchemaUUFRSnippetViewSelected *)a3;
  casinoCardSelected = self->_casinoCardSelected;
  self->_casinoCardSelected = 0;

  self->_whichSelectionevent = 2 * (v4 != 0);
  snippetViewSelected = self->_snippetViewSelected;
  self->_snippetViewSelected = v4;

}

- (SISchemaUUFRSnippetViewSelected)snippetViewSelected
{
  if (self->_whichSelectionevent == 2)
    return self->_snippetViewSelected;
  else
    return (SISchemaUUFRSnippetViewSelected *)0;
}

- (void)deleteSnippetViewSelected
{
  SISchemaUUFRSnippetViewSelected *snippetViewSelected;

  if (self->_whichSelectionevent == 2)
  {
    self->_whichSelectionevent = 0;
    snippetViewSelected = self->_snippetViewSelected;
    self->_snippetViewSelected = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRSelectedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaUUFRSelected casinoCardSelected](self, "casinoCardSelected");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaUUFRSelected casinoCardSelected](self, "casinoCardSelected");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaUUFRSelected snippetViewSelected](self, "snippetViewSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaUUFRSelected snippetViewSelected](self, "snippetViewSelected");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichSelectionevent;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichSelectionevent = self->_whichSelectionevent;
  if (whichSelectionevent != objc_msgSend(v4, "whichSelectionevent"))
    goto LABEL_13;
  -[SISchemaUUFRSelected casinoCardSelected](self, "casinoCardSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "casinoCardSelected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[SISchemaUUFRSelected casinoCardSelected](self, "casinoCardSelected");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaUUFRSelected casinoCardSelected](self, "casinoCardSelected");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "casinoCardSelected");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[SISchemaUUFRSelected snippetViewSelected](self, "snippetViewSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snippetViewSelected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SISchemaUUFRSelected snippetViewSelected](self, "snippetViewSelected");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[SISchemaUUFRSelected snippetViewSelected](self, "snippetViewSelected");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snippetViewSelected");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SISchemaUUFRCasinoCardSelected hash](self->_casinoCardSelected, "hash");
  return -[SISchemaUUFRSnippetViewSelected hash](self->_snippetViewSelected, "hash") ^ v3;
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
  if (self->_casinoCardSelected)
  {
    -[SISchemaUUFRSelected casinoCardSelected](self, "casinoCardSelected");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("casinoCardSelected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("casinoCardSelected"));

    }
  }
  if (self->_snippetViewSelected)
  {
    -[SISchemaUUFRSelected snippetViewSelected](self, "snippetViewSelected");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("snippetViewSelected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("snippetViewSelected"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUUFRSelected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUUFRSelected)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUUFRSelected *v5;
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
    self = -[SISchemaUUFRSelected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUUFRSelected)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUUFRSelected *v5;
  void *v6;
  SISchemaUUFRCasinoCardSelected *v7;
  void *v8;
  SISchemaUUFRSnippetViewSelected *v9;
  SISchemaUUFRSelected *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaUUFRSelected;
  v5 = -[SISchemaUUFRSelected init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("casinoCardSelected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUFRCasinoCardSelected initWithDictionary:]([SISchemaUUFRCasinoCardSelected alloc], "initWithDictionary:", v6);
      -[SISchemaUUFRSelected setCasinoCardSelected:](v5, "setCasinoCardSelected:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snippetViewSelected"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUFRSnippetViewSelected initWithDictionary:]([SISchemaUUFRSnippetViewSelected alloc], "initWithDictionary:", v8);
      -[SISchemaUUFRSelected setSnippetViewSelected:](v5, "setSnippetViewSelected:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichSelectionevent
{
  return self->_whichSelectionevent;
}

- (BOOL)hasCasinoCardSelected
{
  return self->_hasCasinoCardSelected;
}

- (void)setHasCasinoCardSelected:(BOOL)a3
{
  self->_hasCasinoCardSelected = a3;
}

- (BOOL)hasSnippetViewSelected
{
  return self->_hasSnippetViewSelected;
}

- (void)setHasSnippetViewSelected:(BOOL)a3
{
  self->_hasSnippetViewSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetViewSelected, 0);
  objc_storeStrong((id *)&self->_casinoCardSelected, 0);
}

@end
