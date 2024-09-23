@implementation PLUSSchemaPLUSSuggestionMatchResult

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
  v13.super_class = (Class)PLUSSchemaPLUSSuggestionMatchResult;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggestionMatchResult suggestionId](self, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSSuggestionMatchResult deleteSuggestionId](self, "deleteSuggestionId");
  -[PLUSSchemaPLUSSuggestionMatchResult generatedSuggestion](self, "generatedSuggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSSuggestionMatchResult deleteGeneratedSuggestion](self, "deleteGeneratedSuggestion");

  return v5;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)deleteSuggestionId
{
  -[PLUSSchemaPLUSSuggestionMatchResult setSuggestionId:](self, "setSuggestionId:", 0);
}

- (BOOL)hasGeneratedSuggestion
{
  return self->_generatedSuggestion != 0;
}

- (void)deleteGeneratedSuggestion
{
  -[PLUSSchemaPLUSSuggestionMatchResult setGeneratedSuggestion:](self, "setGeneratedSuggestion:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionMatchResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PLUSSchemaPLUSSuggestionMatchResult suggestionId](self, "suggestionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSSuggestionMatchResult suggestionId](self, "suggestionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggestionMatchResult generatedSuggestion](self, "generatedSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSSuggestionMatchResult generatedSuggestion](self, "generatedSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[PLUSSchemaPLUSSuggestionMatchResult suggestionId](self, "suggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PLUSSchemaPLUSSuggestionMatchResult suggestionId](self, "suggestionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSSuggestionMatchResult suggestionId](self, "suggestionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggestionMatchResult generatedSuggestion](self, "generatedSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generatedSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSSuggestionMatchResult generatedSuggestion](self, "generatedSuggestion");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PLUSSchemaPLUSSuggestionMatchResult generatedSuggestion](self, "generatedSuggestion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedSuggestion");
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

  v3 = -[SISchemaUUID hash](self->_suggestionId, "hash");
  return -[PLUSSchemaPLUSSuggestion hash](self->_generatedSuggestion, "hash") ^ v3;
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
  if (self->_generatedSuggestion)
  {
    -[PLUSSchemaPLUSSuggestionMatchResult generatedSuggestion](self, "generatedSuggestion");
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
  if (self->_suggestionId)
  {
    -[PLUSSchemaPLUSSuggestionMatchResult suggestionId](self, "suggestionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("suggestionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("suggestionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggestionMatchResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggestionMatchResult)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggestionMatchResult *v5;
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
    self = -[PLUSSchemaPLUSSuggestionMatchResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggestionMatchResult)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggestionMatchResult *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  PLUSSchemaPLUSSuggestion *v9;
  PLUSSchemaPLUSSuggestionMatchResult *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSSuggestionMatchResult;
  v5 = -[PLUSSchemaPLUSSuggestionMatchResult init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSuggestionMatchResult setSuggestionId:](v5, "setSuggestionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("generatedSuggestion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PLUSSchemaPLUSSuggestion initWithDictionary:]([PLUSSchemaPLUSSuggestion alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSSuggestionMatchResult setGeneratedSuggestion:](v5, "setGeneratedSuggestion:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionId, a3);
}

- (PLUSSchemaPLUSSuggestion)generatedSuggestion
{
  return self->_generatedSuggestion;
}

- (void)setGeneratedSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_generatedSuggestion, a3);
}

- (void)setHasSuggestionId:(BOOL)a3
{
  self->_hasSuggestionId = a3;
}

- (void)setHasGeneratedSuggestion:(BOOL)a3
{
  self->_hasGeneratedSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

@end
