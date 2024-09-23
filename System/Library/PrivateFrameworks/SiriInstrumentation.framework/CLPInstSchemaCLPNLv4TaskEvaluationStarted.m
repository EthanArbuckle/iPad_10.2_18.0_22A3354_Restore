@implementation CLPInstSchemaCLPNLv4TaskEvaluationStarted

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
  v16.super_class = (Class)CLPInstSchemaCLPNLv4TaskEvaluationStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted deleteNlv4AssetVersion](self, "deleteNlv4AssetVersion");
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted syntheticDatasetVersion](self, "syntheticDatasetVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted deleteSyntheticDatasetVersion](self, "deleteSyntheticDatasetVersion");
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted deleteNlv4AssetVersionOverride](self, "deleteNlv4AssetVersionOverride");

  return v5;
}

- (void)setEvaluationType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_evaluationType = a3;
}

- (BOOL)hasEvaluationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEvaluationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEvaluationType
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setEvaluationType:](self, "setEvaluationType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEvaluationEnvironment:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_evaluationEnvironment = a3;
}

- (BOOL)hasEvaluationEnvironment
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEvaluationEnvironment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEvaluationEnvironment
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setEvaluationEnvironment:](self, "setEvaluationEnvironment:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setExperimentType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_experimentType = a3;
}

- (BOOL)hasExperimentType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasExperimentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteExperimentType
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setExperimentType:](self, "setExperimentType:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setRecipeType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_recipeType = a3;
}

- (BOOL)hasRecipeType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasRecipeType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteRecipeType
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setRecipeType:](self, "setRecipeType:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasNlv4AssetVersion
{
  return self->_nlv4AssetVersion != 0;
}

- (void)deleteNlv4AssetVersion
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setNlv4AssetVersion:](self, "setNlv4AssetVersion:", 0);
}

- (void)setSampleCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_sampleCount = a3;
}

- (BOOL)hasSampleCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasSampleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteSampleCount
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setSampleCount:](self, "setSampleCount:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIsDebugTask:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isDebugTask = a3;
}

- (BOOL)hasIsDebugTask
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsDebugTask:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsDebugTask
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setIsDebugTask:](self, "setIsDebugTask:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)hasSyntheticDatasetVersion
{
  return self->_syntheticDatasetVersion != 0;
}

- (void)deleteSyntheticDatasetVersion
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setSyntheticDatasetVersion:](self, "setSyntheticDatasetVersion:", 0);
}

- (BOOL)hasNlv4AssetVersionOverride
{
  return self->_nlv4AssetVersionOverride != 0;
}

- (void)deleteNlv4AssetVersionOverride
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setNlv4AssetVersionOverride:](self, "setNlv4AssetVersionOverride:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPNLv4TaskEvaluationStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = (char)self->_has;
  }
  if ((v7 & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted syntheticDatasetVersion](self, "syntheticDatasetVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted syntheticDatasetVersion](self, "syntheticDatasetVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $71413F522521DC31F5CC1B6B89037ABE has;
  unsigned int v6;
  int evaluationType;
  int v8;
  int evaluationEnvironment;
  int v10;
  int experimentType;
  int v12;
  int recipeType;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  $71413F522521DC31F5CC1B6B89037ABE v21;
  int v22;
  unsigned int v23;
  unsigned int sampleCount;
  int v25;
  int isDebugTask;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  has = self->_has;
  v6 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_39;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    evaluationType = self->_evaluationType;
    if (evaluationType != objc_msgSend(v4, "evaluationType"))
      goto LABEL_39;
    has = self->_has;
    v6 = v4[56];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_39;
  if (v8)
  {
    evaluationEnvironment = self->_evaluationEnvironment;
    if (evaluationEnvironment != objc_msgSend(v4, "evaluationEnvironment"))
      goto LABEL_39;
    has = self->_has;
    v6 = v4[56];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_39;
  if (v10)
  {
    experimentType = self->_experimentType;
    if (experimentType != objc_msgSend(v4, "experimentType"))
      goto LABEL_39;
    has = self->_has;
    v6 = v4[56];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_39;
  if (v12)
  {
    recipeType = self->_recipeType;
    if (recipeType != objc_msgSend(v4, "recipeType"))
      goto LABEL_39;
  }
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlv4AssetVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_38;
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlv4AssetVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_39;
  }
  else
  {

  }
  v21 = self->_has;
  v22 = (*(unsigned int *)&v21 >> 4) & 1;
  v23 = v4[56];
  if (v22 != ((v23 >> 4) & 1))
    goto LABEL_39;
  if (v22)
  {
    sampleCount = self->_sampleCount;
    if (sampleCount != objc_msgSend(v4, "sampleCount"))
      goto LABEL_39;
    v21 = self->_has;
    v23 = v4[56];
  }
  v25 = (*(unsigned int *)&v21 >> 5) & 1;
  if (v25 != ((v23 >> 5) & 1))
    goto LABEL_39;
  if (v25)
  {
    isDebugTask = self->_isDebugTask;
    if (isDebugTask != objc_msgSend(v4, "isDebugTask"))
      goto LABEL_39;
  }
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted syntheticDatasetVersion](self, "syntheticDatasetVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syntheticDatasetVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_38;
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted syntheticDatasetVersion](self, "syntheticDatasetVersion");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted syntheticDatasetVersion](self, "syntheticDatasetVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syntheticDatasetVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_39;
  }
  else
  {

  }
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlv4AssetVersionOverride");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
  {
LABEL_38:

    goto LABEL_39;
  }
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

LABEL_42:
    v37 = 1;
    goto LABEL_40;
  }
  v33 = (void *)v32;
  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlv4AssetVersionOverride");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  if ((v36 & 1) != 0)
    goto LABEL_42;
LABEL_39:
  v37 = 0;
LABEL_40:

  return v37;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_evaluationType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_evaluationEnvironment;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_experimentType;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_recipeType;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[SISchemaAsset hash](self->_nlv4AssetVersion, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v8 = 2654435761 * self->_sampleCount;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_12;
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_12:
  v9 = 2654435761 * self->_isDebugTask;
LABEL_15:
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7;
  v11 = -[SISchemaAsset hash](self->_syntheticDatasetVersion, "hash");
  return v10 ^ v11 ^ -[SISchemaAsset hash](self->_nlv4AssetVersionOverride, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[CLPInstSchemaCLPNLv4TaskEvaluationStarted evaluationEnvironment](self, "evaluationEnvironment") - 1;
    if (v5 > 2)
      v6 = CFSTR("CLPEVALUATIONENVIRONMENT_UNKNOWN");
    else
      v6 = off_1E562BFA8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("evaluationEnvironment"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  if (-[CLPInstSchemaCLPNLv4TaskEvaluationStarted evaluationType](self, "evaluationType") == 1)
    v7 = CFSTR("CLPEVALUATIONTYPE_NLV4");
  else
    v7 = CFSTR("CLPEVALUATIONTYPE_UNKNOWN");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("evaluationType"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
LABEL_13:
    v8 = -[CLPInstSchemaCLPNLv4TaskEvaluationStarted experimentType](self, "experimentType") - 1;
    if (v8 > 2)
      v9 = CFSTR("CLPEXPERIMENTTYPE_UNKNOWN");
    else
      v9 = off_1E562BFC0[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("experimentType"));
    has = (char)self->_has;
  }
LABEL_17:
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaCLPNLv4TaskEvaluationStarted isDebugTask](self, "isDebugTask"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isDebugTask"));

  }
  if (self->_nlv4AssetVersion)
  {
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersion](self, "nlv4AssetVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("nlv4AssetVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("nlv4AssetVersion"));

    }
  }
  if (self->_nlv4AssetVersionOverride)
  {
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted nlv4AssetVersionOverride](self, "nlv4AssetVersionOverride");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("nlv4AssetVersionOverride"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("nlv4AssetVersionOverride"));

    }
  }
  v17 = (char)self->_has;
  if ((v17 & 8) != 0)
  {
    v18 = -[CLPInstSchemaCLPNLv4TaskEvaluationStarted recipeType](self, "recipeType");
    v19 = CFSTR("CLPRECIPETYPE_UNKNOWN");
    if (v18 == 1)
      v19 = CFSTR("CLPRECIPETYPE_FULL_RECIPE");
    if (v18 == 2)
      v20 = CFSTR("CLPRECIPETYPE_DEBUG_RECIPE");
    else
      v20 = v19;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("recipeType"));
    v17 = (char)self->_has;
  }
  if ((v17 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CLPInstSchemaCLPNLv4TaskEvaluationStarted sampleCount](self, "sampleCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("sampleCount"));

  }
  if (self->_syntheticDatasetVersion)
  {
    -[CLPInstSchemaCLPNLv4TaskEvaluationStarted syntheticDatasetVersion](self, "syntheticDatasetVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("syntheticDatasetVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("syntheticDatasetVersion"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPNLv4TaskEvaluationStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPNLv4TaskEvaluationStarted)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPNLv4TaskEvaluationStarted *v5;
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
    self = -[CLPInstSchemaCLPNLv4TaskEvaluationStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPNLv4TaskEvaluationStarted)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPNLv4TaskEvaluationStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaAsset *v11;
  void *v12;
  void *v13;
  void *v14;
  SISchemaAsset *v15;
  void *v16;
  SISchemaAsset *v17;
  CLPInstSchemaCLPNLv4TaskEvaluationStarted *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLPInstSchemaCLPNLv4TaskEvaluationStarted;
  v5 = -[CLPInstSchemaCLPNLv4TaskEvaluationStarted init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluationType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setEvaluationType:](v5, "setEvaluationType:", objc_msgSend(v6, "intValue"));
    v21 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluationEnvironment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setEvaluationEnvironment:](v5, "setEvaluationEnvironment:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentType"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setExperimentType:](v5, "setExperimentType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recipeType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setRecipeType:](v5, "setRecipeType:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlv4AssetVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v10);
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setNlv4AssetVersion:](v5, "setNlv4AssetVersion:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampleCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setSampleCount:](v5, "setSampleCount:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDebugTask"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setIsDebugTask:](v5, "setIsDebugTask:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syntheticDatasetVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v14);
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setSyntheticDatasetVersion:](v5, "setSyntheticDatasetVersion:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlv4AssetVersionOverride"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v16);
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setNlv4AssetVersionOverride:](v5, "setNlv4AssetVersionOverride:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (int)evaluationType
{
  return self->_evaluationType;
}

- (int)evaluationEnvironment
{
  return self->_evaluationEnvironment;
}

- (int)experimentType
{
  return self->_experimentType;
}

- (int)recipeType
{
  return self->_recipeType;
}

- (SISchemaAsset)nlv4AssetVersion
{
  return self->_nlv4AssetVersion;
}

- (void)setNlv4AssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_nlv4AssetVersion, a3);
}

- (unsigned)sampleCount
{
  return self->_sampleCount;
}

- (BOOL)isDebugTask
{
  return self->_isDebugTask;
}

- (SISchemaAsset)syntheticDatasetVersion
{
  return self->_syntheticDatasetVersion;
}

- (void)setSyntheticDatasetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_syntheticDatasetVersion, a3);
}

- (SISchemaAsset)nlv4AssetVersionOverride
{
  return self->_nlv4AssetVersionOverride;
}

- (void)setNlv4AssetVersionOverride:(id)a3
{
  objc_storeStrong((id *)&self->_nlv4AssetVersionOverride, a3);
}

- (void)setHasNlv4AssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSyntheticDatasetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasNlv4AssetVersionOverride:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlv4AssetVersionOverride, 0);
  objc_storeStrong((id *)&self->_syntheticDatasetVersion, 0);
  objc_storeStrong((id *)&self->_nlv4AssetVersion, 0);
}

@end
