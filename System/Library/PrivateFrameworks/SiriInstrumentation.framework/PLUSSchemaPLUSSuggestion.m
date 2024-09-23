@implementation PLUSSchemaPLUSSuggestion

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
  v13.super_class = (Class)PLUSSchemaPLUSSuggestion;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggestion suggestionMetadata](self, "suggestionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSSuggestion deleteSuggestionMetadata](self, "deleteSuggestionMetadata");
  -[PLUSSchemaPLUSSuggestion suggestionValue](self, "suggestionValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSSuggestion deleteSuggestionValue](self, "deleteSuggestionValue");

  return v5;
}

- (BOOL)hasSuggestionMetadata
{
  return self->_suggestionMetadata != 0;
}

- (void)deleteSuggestionMetadata
{
  -[PLUSSchemaPLUSSuggestion setSuggestionMetadata:](self, "setSuggestionMetadata:", 0);
}

- (BOOL)hasSuggestionValue
{
  return self->_suggestionValue != 0;
}

- (void)deleteSuggestionValue
{
  -[PLUSSchemaPLUSSuggestion setSuggestionValue:](self, "setSuggestionValue:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PLUSSchemaPLUSSuggestion suggestionMetadata](self, "suggestionMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSSuggestion suggestionMetadata](self, "suggestionMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggestion suggestionValue](self, "suggestionValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSSuggestion suggestionValue](self, "suggestionValue");
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
  -[PLUSSchemaPLUSSuggestion suggestionMetadata](self, "suggestionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PLUSSchemaPLUSSuggestion suggestionMetadata](self, "suggestionMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSSuggestion suggestionMetadata](self, "suggestionMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggestion suggestionValue](self, "suggestionValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSSuggestion suggestionValue](self, "suggestionValue");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PLUSSchemaPLUSSuggestion suggestionValue](self, "suggestionValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionValue");
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

  v3 = -[PLUSSchemaPLUSSuggestionMetadata hash](self->_suggestionMetadata, "hash");
  return -[PLUSSchemaPLUSSuggestionValue hash](self->_suggestionValue, "hash") ^ v3;
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
  if (self->_suggestionMetadata)
  {
    -[PLUSSchemaPLUSSuggestion suggestionMetadata](self, "suggestionMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("suggestionMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("suggestionMetadata"));

    }
  }
  if (self->_suggestionValue)
  {
    -[PLUSSchemaPLUSSuggestion suggestionValue](self, "suggestionValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("suggestionValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("suggestionValue"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggestion)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggestion *v5;
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
    self = -[PLUSSchemaPLUSSuggestion initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggestion)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggestion *v5;
  void *v6;
  PLUSSchemaPLUSSuggestionMetadata *v7;
  void *v8;
  PLUSSchemaPLUSSuggestionValue *v9;
  PLUSSchemaPLUSSuggestion *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSSuggestion;
  v5 = -[PLUSSchemaPLUSSuggestion init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSSuggestionMetadata initWithDictionary:]([PLUSSchemaPLUSSuggestionMetadata alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSuggestion setSuggestionMetadata:](v5, "setSuggestionMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PLUSSchemaPLUSSuggestionValue initWithDictionary:]([PLUSSchemaPLUSSuggestionValue alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSSuggestion setSuggestionValue:](v5, "setSuggestionValue:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (PLUSSchemaPLUSSuggestionMetadata)suggestionMetadata
{
  return self->_suggestionMetadata;
}

- (void)setSuggestionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionMetadata, a3);
}

- (PLUSSchemaPLUSSuggestionValue)suggestionValue
{
  return self->_suggestionValue;
}

- (void)setSuggestionValue:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionValue, a3);
}

- (void)setHasSuggestionMetadata:(BOOL)a3
{
  self->_hasSuggestionMetadata = a3;
}

- (void)setHasSuggestionValue:(BOOL)a3
{
  self->_hasSuggestionValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionValue, 0);
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
}

@end
