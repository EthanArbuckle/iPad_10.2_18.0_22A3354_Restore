@implementation SISchemaUEIDictationEuclidAlternativesEventTier1

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUEIDictationEuclidAlternativesEventTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[SISchemaUEIDictationEuclidAlternativesEventTier1 deleteConfusionPair](self, "deleteConfusionPair");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[SISchemaUEIDictationEuclidAlternativesEventTier1 deleteConfusionPair](self, "deleteConfusionPair");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[SISchemaUEIDictationEuclidAlternativesEventTier1 deleteConfusionPair](self, "deleteConfusionPair");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[SISchemaUEIDictationEuclidAlternativesEventTier1 deleteConfusionPair](self, "deleteConfusionPair");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[SISchemaUEIDictationEuclidAlternativesEventTier1 deleteConfusionPair](self, "deleteConfusionPair");
  -[SISchemaUEIDictationEuclidAlternativesEventTier1 confusionPair](self, "confusionPair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaUEIDictationEuclidAlternativesEventTier1 deleteConfusionPair](self, "deleteConfusionPair");

  return v5;
}

- (BOOL)hasConfusionPair
{
  return self->_confusionPair != 0;
}

- (void)deleteConfusionPair
{
  -[SISchemaUEIDictationEuclidAlternativesEventTier1 setConfusionPair:](self, "setConfusionPair:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationEuclidAlternativesEventTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SISchemaUEIDictationEuclidAlternativesEventTier1 confusionPair](self, "confusionPair");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaUEIDictationEuclidAlternativesEventTier1 confusionPair](self, "confusionPair");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
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
    -[SISchemaUEIDictationEuclidAlternativesEventTier1 confusionPair](self, "confusionPair");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "confusionPair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[SISchemaUEIDictationEuclidAlternativesEventTier1 confusionPair](self, "confusionPair");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[SISchemaUEIDictationEuclidAlternativesEventTier1 confusionPair](self, "confusionPair");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "confusionPair");
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
  return -[SISchemaEuclidConfusionPair hash](self->_confusionPair, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_confusionPair)
  {
    -[SISchemaUEIDictationEuclidAlternativesEventTier1 confusionPair](self, "confusionPair");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confusionPair"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("confusionPair"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIDictationEuclidAlternativesEventTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIDictationEuclidAlternativesEventTier1)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIDictationEuclidAlternativesEventTier1 *v5;
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
    self = -[SISchemaUEIDictationEuclidAlternativesEventTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIDictationEuclidAlternativesEventTier1)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIDictationEuclidAlternativesEventTier1 *v5;
  void *v6;
  SISchemaEuclidConfusionPair *v7;
  SISchemaUEIDictationEuclidAlternativesEventTier1 *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUEIDictationEuclidAlternativesEventTier1;
  v5 = -[SISchemaUEIDictationEuclidAlternativesEventTier1 init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confusionPair"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaEuclidConfusionPair initWithDictionary:]([SISchemaEuclidConfusionPair alloc], "initWithDictionary:", v6);
      -[SISchemaUEIDictationEuclidAlternativesEventTier1 setConfusionPair:](v5, "setConfusionPair:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (SISchemaEuclidConfusionPair)confusionPair
{
  return self->_confusionPair;
}

- (void)setConfusionPair:(id)a3
{
  objc_storeStrong((id *)&self->_confusionPair, a3);
}

- (void)setHasConfusionPair:(BOOL)a3
{
  self->_hasConfusionPair = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confusionPair, 0);
}

@end
