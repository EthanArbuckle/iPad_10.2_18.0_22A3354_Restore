@implementation PLUSSchemaPLUSSuggestionGenerated

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
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLUSSchemaPLUSSuggestionGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggestionGenerated suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSSuggestionGenerated deleteSuggestionDomainMetadata](self, "deleteSuggestionDomainMetadata");
  -[PLUSSchemaPLUSSuggestionGenerated generatedSuggestion](self, "generatedSuggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSSuggestionGenerated deleteGeneratedSuggestion](self, "deleteGeneratedSuggestion");
  -[PLUSSchemaPLUSSuggestionGenerated suggestionChangeDataCaptureMetadata](self, "suggestionChangeDataCaptureMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PLUSSchemaPLUSSuggestionGenerated deleteSuggestionChangeDataCaptureMetadata](self, "deleteSuggestionChangeDataCaptureMetadata");

  return v5;
}

- (BOOL)hasSuggestionDomainMetadata
{
  return self->_suggestionDomainMetadata != 0;
}

- (void)deleteSuggestionDomainMetadata
{
  -[PLUSSchemaPLUSSuggestionGenerated setSuggestionDomainMetadata:](self, "setSuggestionDomainMetadata:", 0);
}

- (BOOL)hasGeneratedSuggestion
{
  return self->_generatedSuggestion != 0;
}

- (void)deleteGeneratedSuggestion
{
  -[PLUSSchemaPLUSSuggestionGenerated setGeneratedSuggestion:](self, "setGeneratedSuggestion:", 0);
}

- (BOOL)hasSuggestionChangeDataCaptureMetadata
{
  return self->_suggestionChangeDataCaptureMetadata != 0;
}

- (void)deleteSuggestionChangeDataCaptureMetadata
{
  -[PLUSSchemaPLUSSuggestionGenerated setSuggestionChangeDataCaptureMetadata:](self, "setSuggestionChangeDataCaptureMetadata:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PLUSSchemaPLUSSuggestionGenerated suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSSuggestionGenerated suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggestionGenerated generatedSuggestion](self, "generatedSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSSuggestionGenerated generatedSuggestion](self, "generatedSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggestionGenerated suggestionChangeDataCaptureMetadata](self, "suggestionChangeDataCaptureMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLUSSchemaPLUSSuggestionGenerated suggestionChangeDataCaptureMetadata](self, "suggestionChangeDataCaptureMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PLUSSchemaPLUSSuggestionGenerated suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSSuggestionGenerated suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSSuggestionGenerated suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionDomainMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggestionGenerated generatedSuggestion](self, "generatedSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generatedSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSSuggestionGenerated generatedSuggestion](self, "generatedSuggestion");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSSuggestionGenerated generatedSuggestion](self, "generatedSuggestion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedSuggestion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggestionGenerated suggestionChangeDataCaptureMetadata](self, "suggestionChangeDataCaptureMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionChangeDataCaptureMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSSuggestionGenerated suggestionChangeDataCaptureMetadata](self, "suggestionChangeDataCaptureMetadata");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PLUSSchemaPLUSSuggestionGenerated suggestionChangeDataCaptureMetadata](self, "suggestionChangeDataCaptureMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionChangeDataCaptureMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[PLUSSchemaPLUSSuggestionDomainMetadata hash](self->_suggestionDomainMetadata, "hash");
  v4 = -[PLUSSchemaPLUSSuggestion hash](self->_generatedSuggestion, "hash") ^ v3;
  return v4 ^ -[PLUSSchemaPLUSChangeDataCaptureMetadata hash](self->_suggestionChangeDataCaptureMetadata, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_generatedSuggestion)
  {
    -[PLUSSchemaPLUSSuggestionGenerated generatedSuggestion](self, "generatedSuggestion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("generatedSuggestion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("generatedSuggestion"));

    }
  }
  if (self->_suggestionChangeDataCaptureMetadata)
  {
    -[PLUSSchemaPLUSSuggestionGenerated suggestionChangeDataCaptureMetadata](self, "suggestionChangeDataCaptureMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("suggestionChangeDataCaptureMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("suggestionChangeDataCaptureMetadata"));

    }
  }
  if (self->_suggestionDomainMetadata)
  {
    -[PLUSSchemaPLUSSuggestionGenerated suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("suggestionDomainMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("suggestionDomainMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggestionGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggestionGenerated)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggestionGenerated *v5;
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
    self = -[PLUSSchemaPLUSSuggestionGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggestionGenerated)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggestionGenerated *v5;
  void *v6;
  PLUSSchemaPLUSSuggestionDomainMetadata *v7;
  void *v8;
  PLUSSchemaPLUSSuggestion *v9;
  void *v10;
  PLUSSchemaPLUSChangeDataCaptureMetadata *v11;
  PLUSSchemaPLUSSuggestionGenerated *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSSuggestionGenerated;
  v5 = -[PLUSSchemaPLUSSuggestionGenerated init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionDomainMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSSuggestionDomainMetadata initWithDictionary:]([PLUSSchemaPLUSSuggestionDomainMetadata alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSuggestionGenerated setSuggestionDomainMetadata:](v5, "setSuggestionDomainMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("generatedSuggestion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PLUSSchemaPLUSSuggestion initWithDictionary:]([PLUSSchemaPLUSSuggestion alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSSuggestionGenerated setGeneratedSuggestion:](v5, "setGeneratedSuggestion:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionChangeDataCaptureMetadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PLUSSchemaPLUSChangeDataCaptureMetadata initWithDictionary:]([PLUSSchemaPLUSChangeDataCaptureMetadata alloc], "initWithDictionary:", v10);
      -[PLUSSchemaPLUSSuggestionGenerated setSuggestionChangeDataCaptureMetadata:](v5, "setSuggestionChangeDataCaptureMetadata:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata
{
  return self->_suggestionDomainMetadata;
}

- (void)setSuggestionDomainMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, a3);
}

- (PLUSSchemaPLUSSuggestion)generatedSuggestion
{
  return self->_generatedSuggestion;
}

- (void)setGeneratedSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_generatedSuggestion, a3);
}

- (PLUSSchemaPLUSChangeDataCaptureMetadata)suggestionChangeDataCaptureMetadata
{
  return self->_suggestionChangeDataCaptureMetadata;
}

- (void)setSuggestionChangeDataCaptureMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionChangeDataCaptureMetadata, a3);
}

- (void)setHasSuggestionDomainMetadata:(BOOL)a3
{
  self->_hasSuggestionDomainMetadata = a3;
}

- (void)setHasGeneratedSuggestion:(BOOL)a3
{
  self->_hasGeneratedSuggestion = a3;
}

- (void)setHasSuggestionChangeDataCaptureMetadata:(BOOL)a3
{
  self->_hasSuggestionChangeDataCaptureMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionChangeDataCaptureMetadata, 0);
  objc_storeStrong((id *)&self->_generatedSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

@end
