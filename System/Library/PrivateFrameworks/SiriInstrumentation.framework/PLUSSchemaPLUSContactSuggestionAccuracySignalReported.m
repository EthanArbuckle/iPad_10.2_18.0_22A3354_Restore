@implementation PLUSSchemaPLUSContactSuggestionAccuracySignalReported

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
  v16.super_class = (Class)PLUSSchemaPLUSContactSuggestionAccuracySignalReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported originalPlusId](self, "originalPlusId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported deleteOriginalPlusId](self, "deleteOriginalPlusId");
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported suggestionId](self, "suggestionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported deleteSuggestionId](self, "deleteSuggestionId");
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported accuracySignal](self, "accuracySignal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported deleteAccuracySignal](self, "deleteAccuracySignal");

  return v5;
}

- (BOOL)hasOriginalPlusId
{
  return self->_originalPlusId != 0;
}

- (void)deleteOriginalPlusId
{
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported setOriginalPlusId:](self, "setOriginalPlusId:", 0);
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)deleteSuggestionId
{
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported setSuggestionId:](self, "setSuggestionId:", 0);
}

- (BOOL)hasAccuracySignal
{
  return self->_accuracySignal != 0;
}

- (void)deleteAccuracySignal
{
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported setAccuracySignal:](self, "setAccuracySignal:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionAccuracySignalReportedReadFrom(self, (uint64_t)a3);
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
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported originalPlusId](self, "originalPlusId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported originalPlusId](self, "originalPlusId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported suggestionId](self, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported suggestionId](self, "suggestionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported accuracySignal](self, "accuracySignal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported accuracySignal](self, "accuracySignal");
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
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported originalPlusId](self, "originalPlusId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalPlusId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported originalPlusId](self, "originalPlusId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported originalPlusId](self, "originalPlusId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalPlusId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported suggestionId](self, "suggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported suggestionId](self, "suggestionId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported suggestionId](self, "suggestionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported accuracySignal](self, "accuracySignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accuracySignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported accuracySignal](self, "accuracySignal");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported accuracySignal](self, "accuracySignal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accuracySignal");
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

  v3 = -[SISchemaUUID hash](self->_originalPlusId, "hash");
  v4 = -[SISchemaUUID hash](self->_suggestionId, "hash") ^ v3;
  return v4 ^ -[PLUSSchemaPLUSSuggestionAccuracySignal hash](self->_accuracySignal, "hash");
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
  if (self->_accuracySignal)
  {
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported accuracySignal](self, "accuracySignal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accuracySignal"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accuracySignal"));

    }
  }
  if (self->_originalPlusId)
  {
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported originalPlusId](self, "originalPlusId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originalPlusId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originalPlusId"));

    }
  }
  if (self->_suggestionId)
  {
    -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported suggestionId](self, "suggestionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("suggestionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("suggestionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSContactSuggestionAccuracySignalReported)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *v5;
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
    self = -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSContactSuggestionAccuracySignalReported)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  PLUSSchemaPLUSSuggestionAccuracySignal *v11;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSContactSuggestionAccuracySignalReported;
  v5 = -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalPlusId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported setOriginalPlusId:](v5, "setOriginalPlusId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported setSuggestionId:](v5, "setSuggestionId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accuracySignal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PLUSSchemaPLUSSuggestionAccuracySignal initWithDictionary:]([PLUSSchemaPLUSSuggestionAccuracySignal alloc], "initWithDictionary:", v10);
      -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported setAccuracySignal:](v5, "setAccuracySignal:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalPlusId
{
  return self->_originalPlusId;
}

- (void)setOriginalPlusId:(id)a3
{
  objc_storeStrong((id *)&self->_originalPlusId, a3);
}

- (SISchemaUUID)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionId, a3);
}

- (PLUSSchemaPLUSSuggestionAccuracySignal)accuracySignal
{
  return self->_accuracySignal;
}

- (void)setAccuracySignal:(id)a3
{
  objc_storeStrong((id *)&self->_accuracySignal, a3);
}

- (void)setHasOriginalPlusId:(BOOL)a3
{
  self->_hasOriginalPlusId = a3;
}

- (void)setHasSuggestionId:(BOOL)a3
{
  self->_hasSuggestionId = a3;
}

- (void)setHasAccuracySignal:(BOOL)a3
{
  self->_hasAccuracySignal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accuracySignal, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
  objc_storeStrong((id *)&self->_originalPlusId, 0);
}

@end
