@implementation DODMLASRSchemaDODMLASRModelMetrics

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasConfigName
{
  return self->_configName != 0;
}

- (void)deleteConfigName
{
  -[DODMLASRSchemaDODMLASRModelMetrics setConfigName:](self, "setConfigName:", 0);
}

- (void)setTrainingDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_trainingDurationInMs = a3;
}

- (BOOL)hasTrainingDurationInMs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasTrainingDurationInMs:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteTrainingDurationInMs
{
  -[DODMLASRSchemaDODMLASRModelMetrics setTrainingDurationInMs:](self, "setTrainingDurationInMs:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setConversionDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_conversionDurationInMs = a3;
}

- (BOOL)hasConversionDurationInMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasConversionDurationInMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteConversionDurationInMs
{
  -[DODMLASRSchemaDODMLASRModelMetrics setConversionDurationInMs:](self, "setConversionDurationInMs:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setOptimizationDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_optimizationDurationInMs = a3;
}

- (BOOL)hasOptimizationDurationInMs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasOptimizationDurationInMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteOptimizationDurationInMs
{
  -[DODMLASRSchemaDODMLASRModelMetrics setOptimizationDurationInMs:](self, "setOptimizationDurationInMs:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setTotalDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_totalDurationInMs = a3;
}

- (BOOL)hasTotalDurationInMs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasTotalDurationInMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteTotalDurationInMs
{
  -[DODMLASRSchemaDODMLASRModelMetrics setTotalDurationInMs:](self, "setTotalDurationInMs:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setNgramOrder:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_ngramOrder = a3;
}

- (BOOL)hasNgramOrder
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNgramOrder:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteNgramOrder
{
  -[DODMLASRSchemaDODMLASRModelMetrics setNgramOrder:](self, "setNgramOrder:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setResidualAdaptationWeight:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_residualAdaptationWeight = a3;
}

- (BOOL)hasResidualAdaptationWeight
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasResidualAdaptationWeight:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteResidualAdaptationWeight
{
  double v2;

  LODWORD(v2) = 0;
  -[DODMLASRSchemaDODMLASRModelMetrics setResidualAdaptationWeight:](self, "setResidualAdaptationWeight:", v2);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setModelTrainingStatusCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_modelTrainingStatusCode = a3;
}

- (BOOL)hasModelTrainingStatusCode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasModelTrainingStatusCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteModelTrainingStatusCode
{
  -[DODMLASRSchemaDODMLASRModelMetrics setModelTrainingStatusCode:](self, "setModelTrainingStatusCode:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setNumFiniteStateTransducerArcs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numFiniteStateTransducerArcs = a3;
}

- (BOOL)hasNumFiniteStateTransducerArcs
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumFiniteStateTransducerArcs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteNumFiniteStateTransducerArcs
{
  -[DODMLASRSchemaDODMLASRModelMetrics setNumFiniteStateTransducerArcs:](self, "setNumFiniteStateTransducerArcs:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setNumFiniteStateTransducerStates:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numFiniteStateTransducerStates = a3;
}

- (BOOL)hasNumFiniteStateTransducerStates
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumFiniteStateTransducerStates:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteNumFiniteStateTransducerStates
{
  -[DODMLASRSchemaDODMLASRModelMetrics setNumFiniteStateTransducerStates:](self, "setNumFiniteStateTransducerStates:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return DODMLASRSchemaDODMLASRModelMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  __int16 has;
  void *v6;
  id v7;

  v7 = a3;
  -[DODMLASRSchemaDODMLASRModelMetrics configName](self, "configName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = v7;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  v6 = v7;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  v6 = v7;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  v6 = v7;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
LABEL_21:
    PBDataWriterWriteUint32Field();
    v6 = v7;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_21;
LABEL_12:
  if ((has & 0x100) != 0)
  {
LABEL_13:
    PBDataWriterWriteUint32Field();
    v6 = v7;
  }
LABEL_14:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $158CE04404E577B8922D1A958EF18294 has;
  unsigned int v14;
  unint64_t trainingDurationInMs;
  int v16;
  unint64_t conversionDurationInMs;
  int v18;
  unint64_t optimizationDurationInMs;
  int v20;
  unint64_t totalDurationInMs;
  int v22;
  unsigned int ngramOrder;
  int v24;
  float residualAdaptationWeight;
  float v26;
  int v27;
  unsigned int modelTrainingStatusCode;
  int v29;
  unsigned int numFiniteStateTransducerArcs;
  int v31;
  unsigned int numFiniteStateTransducerStates;
  BOOL v33;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[DODMLASRSchemaDODMLASRModelMetrics configName](self, "configName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_44;
  }
  -[DODMLASRSchemaDODMLASRModelMetrics configName](self, "configName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[DODMLASRSchemaDODMLASRModelMetrics configName](self, "configName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_44;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[34];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_44:
    v33 = 0;
    goto LABEL_45;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    trainingDurationInMs = self->_trainingDurationInMs;
    if (trainingDurationInMs != objc_msgSend(v4, "trainingDurationInMs"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[34];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_44;
  if (v16)
  {
    conversionDurationInMs = self->_conversionDurationInMs;
    if (conversionDurationInMs != objc_msgSend(v4, "conversionDurationInMs"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[34];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_44;
  if (v18)
  {
    optimizationDurationInMs = self->_optimizationDurationInMs;
    if (optimizationDurationInMs != objc_msgSend(v4, "optimizationDurationInMs"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[34];
  }
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_44;
  if (v20)
  {
    totalDurationInMs = self->_totalDurationInMs;
    if (totalDurationInMs != objc_msgSend(v4, "totalDurationInMs"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[34];
  }
  v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_44;
  if (v22)
  {
    ngramOrder = self->_ngramOrder;
    if (ngramOrder != objc_msgSend(v4, "ngramOrder"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[34];
  }
  v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1))
    goto LABEL_44;
  if (v24)
  {
    residualAdaptationWeight = self->_residualAdaptationWeight;
    objc_msgSend(v4, "residualAdaptationWeight");
    if (residualAdaptationWeight != v26)
      goto LABEL_44;
    has = self->_has;
    v14 = v4[34];
  }
  v27 = (*(unsigned int *)&has >> 6) & 1;
  if (v27 != ((v14 >> 6) & 1))
    goto LABEL_44;
  if (v27)
  {
    modelTrainingStatusCode = self->_modelTrainingStatusCode;
    if (modelTrainingStatusCode != objc_msgSend(v4, "modelTrainingStatusCode"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[34];
  }
  v29 = (*(unsigned int *)&has >> 7) & 1;
  if (v29 != ((v14 >> 7) & 1))
    goto LABEL_44;
  if (v29)
  {
    numFiniteStateTransducerArcs = self->_numFiniteStateTransducerArcs;
    if (numFiniteStateTransducerArcs == objc_msgSend(v4, "numFiniteStateTransducerArcs"))
    {
      has = self->_has;
      v14 = v4[34];
      goto LABEL_40;
    }
    goto LABEL_44;
  }
LABEL_40:
  v31 = (*(unsigned int *)&has >> 8) & 1;
  if (v31 != ((v14 >> 8) & 1))
    goto LABEL_44;
  if (v31)
  {
    numFiniteStateTransducerStates = self->_numFiniteStateTransducerStates;
    if (numFiniteStateTransducerStates != objc_msgSend(v4, "numFiniteStateTransducerStates"))
      goto LABEL_44;
  }
  v33 = 1;
LABEL_45:

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  float residualAdaptationWeight;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = -[NSString hash](self->_configName, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761u * self->_trainingDurationInMs;
    if ((has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761u * self->_conversionDurationInMs;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v5 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761u * self->_optimizationDurationInMs;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v8 = 2654435761u * self->_totalDurationInMs;
    if ((has & 0x10) != 0)
      goto LABEL_6;
LABEL_15:
    v9 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_7;
LABEL_16:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v8 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_15;
LABEL_6:
  v9 = 2654435761 * self->_ngramOrder;
  if ((has & 0x20) == 0)
    goto LABEL_16;
LABEL_7:
  residualAdaptationWeight = self->_residualAdaptationWeight;
  v11 = residualAdaptationWeight;
  if (residualAdaptationWeight < 0.0)
    v11 = -residualAdaptationWeight;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((has & 0x40) == 0)
  {
    v15 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_21;
LABEL_24:
    v16 = 0;
    if ((has & 0x100) != 0)
      goto LABEL_22;
LABEL_25:
    v17 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17;
  }
  v15 = 2654435761 * self->_modelTrainingStatusCode;
  if ((has & 0x80) == 0)
    goto LABEL_24;
LABEL_21:
  v16 = 2654435761 * self->_numFiniteStateTransducerArcs;
  if ((has & 0x100) == 0)
    goto LABEL_25;
LABEL_22:
  v17 = 2654435761 * self->_numFiniteStateTransducerStates;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  __int16 has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_configName)
  {
    -[DODMLASRSchemaDODMLASRModelMetrics configName](self, "configName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("configName"));

  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRModelMetrics conversionDurationInMs](self, "conversionDurationInMs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("conversionDurationInMs"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRModelMetrics modelTrainingStatusCode](self, "modelTrainingStatusCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("modelTrainingStatusCode"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRModelMetrics ngramOrder](self, "ngramOrder"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ngramOrder"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRModelMetrics numFiniteStateTransducerArcs](self, "numFiniteStateTransducerArcs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numFiniteStateTransducerArcs"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRModelMetrics numFiniteStateTransducerStates](self, "numFiniteStateTransducerStates"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numFiniteStateTransducerStates"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRModelMetrics optimizationDurationInMs](self, "optimizationDurationInMs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("optimizationDurationInMs"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRModelMetrics totalDurationInMs](self, "totalDurationInMs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("totalDurationInMs"));

    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_20:
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[DODMLASRSchemaDODMLASRModelMetrics residualAdaptationWeight](self, "residualAdaptationWeight");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("residualAdaptationWeight"));

  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_11:
  if ((has & 1) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRModelMetrics trainingDurationInMs](self, "trainingDurationInMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("trainingDurationInMs"));

  }
LABEL_13:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRModelMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRModelMetrics)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRModelMetrics *v5;
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
    self = -[DODMLASRSchemaDODMLASRModelMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRModelMetrics)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRModelMetrics *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  DODMLASRSchemaDODMLASRModelMetrics *v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DODMLASRSchemaDODMLASRModelMetrics;
  v5 = -[DODMLASRSchemaDODMLASRModelMetrics init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[DODMLASRSchemaDODMLASRModelMetrics setConfigName:](v5, "setConfigName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trainingDurationInMs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRModelMetrics setTrainingDurationInMs:](v5, "setTrainingDurationInMs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conversionDurationInMs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRModelMetrics setConversionDurationInMs:](v5, "setConversionDurationInMs:", objc_msgSend(v9, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("optimizationDurationInMs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRModelMetrics setOptimizationDurationInMs:](v5, "setOptimizationDurationInMs:", objc_msgSend(v10, "unsignedLongLongValue"));
    v20 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalDurationInMs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRModelMetrics setTotalDurationInMs:](v5, "setTotalDurationInMs:", objc_msgSend(v11, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ngramOrder"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRModelMetrics setNgramOrder:](v5, "setNgramOrder:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("residualAdaptationWeight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "floatValue");
      -[DODMLASRSchemaDODMLASRModelMetrics setResidualAdaptationWeight:](v5, "setResidualAdaptationWeight:");
    }
    v21 = v9;
    v22 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelTrainingStatusCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRModelMetrics setModelTrainingStatusCode:](v5, "setModelTrainingStatusCode:", objc_msgSend(v14, "unsignedIntValue"));
    v15 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numFiniteStateTransducerArcs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRModelMetrics setNumFiniteStateTransducerArcs:](v5, "setNumFiniteStateTransducerArcs:", objc_msgSend(v16, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numFiniteStateTransducerStates"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRModelMetrics setNumFiniteStateTransducerStates:](v5, "setNumFiniteStateTransducerStates:", objc_msgSend(v17, "unsignedIntValue"));
    v18 = v5;

  }
  return v5;
}

- (NSString)configName
{
  return self->_configName;
}

- (void)setConfigName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)trainingDurationInMs
{
  return self->_trainingDurationInMs;
}

- (unint64_t)conversionDurationInMs
{
  return self->_conversionDurationInMs;
}

- (unint64_t)optimizationDurationInMs
{
  return self->_optimizationDurationInMs;
}

- (unint64_t)totalDurationInMs
{
  return self->_totalDurationInMs;
}

- (unsigned)ngramOrder
{
  return self->_ngramOrder;
}

- (float)residualAdaptationWeight
{
  return self->_residualAdaptationWeight;
}

- (unsigned)modelTrainingStatusCode
{
  return self->_modelTrainingStatusCode;
}

- (unsigned)numFiniteStateTransducerArcs
{
  return self->_numFiniteStateTransducerArcs;
}

- (unsigned)numFiniteStateTransducerStates
{
  return self->_numFiniteStateTransducerStates;
}

- (void)setHasConfigName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configName, 0);
}

@end
