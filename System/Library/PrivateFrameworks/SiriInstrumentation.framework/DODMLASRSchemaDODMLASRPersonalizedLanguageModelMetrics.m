@implementation DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics

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
  v16.super_class = (Class)DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics transcriptionMetrics](self, "transcriptionMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics deleteTranscriptionMetrics](self, "deleteTranscriptionMetrics");
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics modelMetrics](self, "modelMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics deleteModelMetrics](self, "deleteModelMetrics");
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics evaluationMetrics](self, "evaluationMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics deleteEvaluationMetrics](self, "deleteEvaluationMetrics");

  return v5;
}

- (void)setUserLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_userLocale = a3;
}

- (BOOL)hasUserLocale
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUserLocale:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUserLocale
{
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics setUserLocale:](self, "setUserLocale:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasTranscriptionMetrics
{
  return self->_transcriptionMetrics != 0;
}

- (void)deleteTranscriptionMetrics
{
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics setTranscriptionMetrics:](self, "setTranscriptionMetrics:", 0);
}

- (BOOL)hasModelMetrics
{
  return self->_modelMetrics != 0;
}

- (void)deleteModelMetrics
{
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics setModelMetrics:](self, "setModelMetrics:", 0);
}

- (BOOL)hasEvaluationMetrics
{
  return self->_evaluationMetrics != 0;
}

- (void)deleteEvaluationMetrics
{
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics setEvaluationMetrics:](self, "setEvaluationMetrics:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics transcriptionMetrics](self, "transcriptionMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics transcriptionMetrics](self, "transcriptionMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics modelMetrics](self, "modelMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics modelMetrics](self, "modelMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics evaluationMetrics](self, "evaluationMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics evaluationMetrics](self, "evaluationMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int userLocale;
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
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    userLocale = self->_userLocale;
    if (userLocale != objc_msgSend(v4, "userLocale"))
      goto LABEL_20;
  }
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics transcriptionMetrics](self, "transcriptionMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptionMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics transcriptionMetrics](self, "transcriptionMetrics");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics transcriptionMetrics](self, "transcriptionMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transcriptionMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics modelMetrics](self, "modelMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics modelMetrics](self, "modelMetrics");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics modelMetrics](self, "modelMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics evaluationMetrics](self, "evaluationMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evaluationMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics evaluationMetrics](self, "evaluationMetrics");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics evaluationMetrics](self, "evaluationMetrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "evaluationMetrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_userLocale;
  else
    v3 = 0;
  v4 = -[DODMLASRSchemaDODMLASRTranscriptionMetrics hash](self->_transcriptionMetrics, "hash") ^ v3;
  v5 = -[DODMLASRSchemaDODMLASRModelMetrics hash](self->_modelMetrics, "hash");
  return v4 ^ v5 ^ -[DODMLASRSchemaDODMLASREvaluationMetrics hash](self->_evaluationMetrics, "hash");
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
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_evaluationMetrics)
  {
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics evaluationMetrics](self, "evaluationMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("evaluationMetrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("evaluationMetrics"));

    }
  }
  if (self->_modelMetrics)
  {
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics modelMetrics](self, "modelMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("modelMetrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("modelMetrics"));

    }
  }
  if (self->_transcriptionMetrics)
  {
    -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics transcriptionMetrics](self, "transcriptionMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("transcriptionMetrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("transcriptionMetrics"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v13 = -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics userLocale](self, "userLocale") - 1;
    if (v13 > 0x3D)
      v14 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v14 = off_1E562D1E0[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("userLocale"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *v5;
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
    self = -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *v5;
  void *v6;
  void *v7;
  DODMLASRSchemaDODMLASRTranscriptionMetrics *v8;
  void *v9;
  DODMLASRSchemaDODMLASRModelMetrics *v10;
  void *v11;
  DODMLASRSchemaDODMLASREvaluationMetrics *v12;
  DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics;
  v5 = -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics setUserLocale:](v5, "setUserLocale:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transcriptionMetrics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[DODMLASRSchemaDODMLASRTranscriptionMetrics initWithDictionary:]([DODMLASRSchemaDODMLASRTranscriptionMetrics alloc], "initWithDictionary:", v7);
      -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics setTranscriptionMetrics:](v5, "setTranscriptionMetrics:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelMetrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[DODMLASRSchemaDODMLASRModelMetrics initWithDictionary:]([DODMLASRSchemaDODMLASRModelMetrics alloc], "initWithDictionary:", v9);
      -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics setModelMetrics:](v5, "setModelMetrics:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluationMetrics"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[DODMLASRSchemaDODMLASREvaluationMetrics initWithDictionary:]([DODMLASRSchemaDODMLASREvaluationMetrics alloc], "initWithDictionary:", v11);
      -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics setEvaluationMetrics:](v5, "setEvaluationMetrics:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (int)userLocale
{
  return self->_userLocale;
}

- (DODMLASRSchemaDODMLASRTranscriptionMetrics)transcriptionMetrics
{
  return self->_transcriptionMetrics;
}

- (void)setTranscriptionMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionMetrics, a3);
}

- (DODMLASRSchemaDODMLASRModelMetrics)modelMetrics
{
  return self->_modelMetrics;
}

- (void)setModelMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_modelMetrics, a3);
}

- (DODMLASRSchemaDODMLASREvaluationMetrics)evaluationMetrics
{
  return self->_evaluationMetrics;
}

- (void)setEvaluationMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationMetrics, a3);
}

- (void)setHasTranscriptionMetrics:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasModelMetrics:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasEvaluationMetrics:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationMetrics, 0);
  objc_storeStrong((id *)&self->_modelMetrics, 0);
  objc_storeStrong((id *)&self->_transcriptionMetrics, 0);
}

@end
