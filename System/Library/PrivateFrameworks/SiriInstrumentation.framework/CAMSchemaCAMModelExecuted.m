@implementation CAMSchemaCAMModelExecuted

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
  v13.super_class = (Class)CAMSchemaCAMModelExecuted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSchemaCAMModelExecuted modelId](self, "modelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CAMSchemaCAMModelExecuted deleteModelId](self, "deleteModelId");
  -[CAMSchemaCAMModelExecuted asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CAMSchemaCAMModelExecuted deleteAsset](self, "deleteAsset");

  return v5;
}

- (BOOL)hasModelId
{
  return self->_modelId != 0;
}

- (void)deleteModelId
{
  -[CAMSchemaCAMModelExecuted setModelId:](self, "setModelId:", 0);
}

- (void)setPrediction:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_prediction = a3;
}

- (BOOL)hasPrediction
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPrediction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePrediction
{
  -[CAMSchemaCAMModelExecuted setPrediction:](self, "setPrediction:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPredictionScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_predictionScore = a3;
}

- (BOOL)hasPredictionScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPredictionScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePredictionScore
{
  double v2;

  LODWORD(v2) = 0;
  -[CAMSchemaCAMModelExecuted setPredictionScore:](self, "setPredictionScore:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPredictionThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_predictionThreshold = a3;
}

- (BOOL)hasPredictionThreshold
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPredictionThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePredictionThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[CAMSchemaCAMModelExecuted setPredictionThreshold:](self, "setPredictionThreshold:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsShadowLog:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isShadowLog = a3;
}

- (BOOL)hasIsShadowLog
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsShadowLog:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsShadowLog
{
  -[CAMSchemaCAMModelExecuted setIsShadowLog:](self, "setIsShadowLog:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (void)deleteAsset
{
  -[CAMSchemaCAMModelExecuted setAsset:](self, "setAsset:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return CAMSchemaCAMModelExecutedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CAMSchemaCAMModelExecuted modelId](self, "modelId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAMSchemaCAMModelExecuted modelId](self, "modelId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:
  -[CAMSchemaCAMModelExecuted asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[CAMSchemaCAMModelExecuted asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $412F3D71AE4B812EAB84F2C81827393C has;
  unsigned int v13;
  unsigned int prediction;
  int v15;
  float predictionScore;
  float v17;
  int v18;
  float predictionThreshold;
  float v20;
  int v21;
  int isShadowLog;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[CAMSchemaCAMModelExecuted modelId](self, "modelId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[CAMSchemaCAMModelExecuted modelId](self, "modelId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CAMSchemaCAMModelExecuted modelId](self, "modelId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_27;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    prediction = self->_prediction;
    if (prediction != objc_msgSend(v4, "prediction"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[40];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_27;
  if (v15)
  {
    predictionScore = self->_predictionScore;
    objc_msgSend(v4, "predictionScore");
    if (predictionScore != v17)
      goto LABEL_27;
    has = self->_has;
    v13 = v4[40];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v13 >> 2) & 1))
    goto LABEL_27;
  if (v18)
  {
    predictionThreshold = self->_predictionThreshold;
    objc_msgSend(v4, "predictionThreshold");
    if (predictionThreshold != v20)
      goto LABEL_27;
    has = self->_has;
    v13 = v4[40];
  }
  v21 = (*(unsigned int *)&has >> 3) & 1;
  if (v21 != ((v13 >> 3) & 1))
    goto LABEL_27;
  if (v21)
  {
    isShadowLog = self->_isShadowLog;
    if (isShadowLog != objc_msgSend(v4, "isShadowLog"))
      goto LABEL_27;
  }
  -[CAMSchemaCAMModelExecuted asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  -[CAMSchemaCAMModelExecuted asset](self, "asset");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {

LABEL_30:
    v28 = 1;
    goto LABEL_28;
  }
  v24 = (void *)v23;
  -[CAMSchemaCAMModelExecuted asset](self, "asset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqual:", v26);

  if ((v27 & 1) != 0)
    goto LABEL_30;
LABEL_27:
  v28 = 0;
LABEL_28:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  uint64_t v5;
  float predictionScore;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  float predictionThreshold;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;

  v3 = -[CAMSchemaCAMModelId hash](self->_modelId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761 * self->_prediction;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  predictionScore = self->_predictionScore;
  v7 = predictionScore;
  if (predictionScore < 0.0)
    v7 = -predictionScore;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    predictionThreshold = self->_predictionThreshold;
    v13 = predictionThreshold;
    if (predictionThreshold < 0.0)
      v13 = -predictionThreshold;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 8) != 0)
    v16 = 2654435761 * self->_isShadowLog;
  else
    v16 = 0;
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ -[SISchemaAsset hash](self->_asset, "hash");
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
  char has;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_asset)
  {
    -[CAMSchemaCAMModelExecuted asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asset"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asset"));

    }
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAMSchemaCAMModelExecuted isShadowLog](self, "isShadowLog"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isShadowLog"));

  }
  if (self->_modelId)
  {
    -[CAMSchemaCAMModelExecuted modelId](self, "modelId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("modelId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("modelId"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_15;
LABEL_19:
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMSchemaCAMModelExecuted predictionScore](self, "predictionScore");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("predictionScore"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAMSchemaCAMModelExecuted prediction](self, "prediction"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("prediction"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_15:
  if ((has & 4) != 0)
  {
LABEL_16:
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMSchemaCAMModelExecuted predictionThreshold](self, "predictionThreshold");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("predictionThreshold"));

  }
LABEL_17:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAMSchemaCAMModelExecuted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAMSchemaCAMModelExecuted)initWithJSON:(id)a3
{
  void *v4;
  CAMSchemaCAMModelExecuted *v5;
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
    self = -[CAMSchemaCAMModelExecuted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAMSchemaCAMModelExecuted)initWithDictionary:(id)a3
{
  id v4;
  CAMSchemaCAMModelExecuted *v5;
  void *v6;
  CAMSchemaCAMModelId *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SISchemaAsset *v13;
  CAMSchemaCAMModelExecuted *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMSchemaCAMModelExecuted;
  v5 = -[CAMSchemaCAMModelExecuted init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CAMSchemaCAMModelId initWithDictionary:]([CAMSchemaCAMModelId alloc], "initWithDictionary:", v6);
      -[CAMSchemaCAMModelExecuted setModelId:](v5, "setModelId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prediction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAMSchemaCAMModelExecuted setPrediction:](v5, "setPrediction:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("predictionScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[CAMSchemaCAMModelExecuted setPredictionScore:](v5, "setPredictionScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("predictionThreshold"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[CAMSchemaCAMModelExecuted setPredictionThreshold:](v5, "setPredictionThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShadowLog"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAMSchemaCAMModelExecuted setIsShadowLog:](v5, "setIsShadowLog:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v12);
      -[CAMSchemaCAMModelExecuted setAsset:](v5, "setAsset:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (CAMSchemaCAMModelId)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
  objc_storeStrong((id *)&self->_modelId, a3);
}

- (unsigned)prediction
{
  return self->_prediction;
}

- (float)predictionScore
{
  return self->_predictionScore;
}

- (float)predictionThreshold
{
  return self->_predictionThreshold;
}

- (BOOL)isShadowLog
{
  return self->_isShadowLog;
}

- (SISchemaAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void)setHasModelId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAsset:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
}

@end
