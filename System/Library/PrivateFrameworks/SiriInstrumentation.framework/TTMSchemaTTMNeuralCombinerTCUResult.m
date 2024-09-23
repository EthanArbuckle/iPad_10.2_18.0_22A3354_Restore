@implementation TTMSchemaTTMNeuralCombinerTCUResult

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TTMSchemaTTMNeuralCombinerTCUResult;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTMSchemaTTMNeuralCombinerTCUResult tcuId](self, "tcuId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[TTMSchemaTTMNeuralCombinerTCUResult deleteTcuId](self, "deleteTcuId");
  return v5;
}

- (BOOL)hasTcuId
{
  return self->_tcuId != 0;
}

- (void)deleteTcuId
{
  -[TTMSchemaTTMNeuralCombinerTCUResult setTcuId:](self, "setTcuId:", 0);
}

- (void)setNeuralCombinerScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_neuralCombinerScore = a3;
}

- (BOOL)hasNeuralCombinerScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNeuralCombinerScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNeuralCombinerScore
{
  double v2;

  LODWORD(v2) = 0;
  -[TTMSchemaTTMNeuralCombinerTCUResult setNeuralCombinerScore:](self, "setNeuralCombinerScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRecommendation:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recommendation = a3;
}

- (BOOL)hasRecommendation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRecommendation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRecommendation
{
  -[TTMSchemaTTMNeuralCombinerTCUResult setRecommendation:](self, "setRecommendation:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return TTMSchemaTTMNeuralCombinerTCUResultReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[TTMSchemaTTMNeuralCombinerTCUResult tcuId](self, "tcuId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TTMSchemaTTMNeuralCombinerTCUResult tcuId](self, "tcuId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $90987443D5534ED07836F941D8FF4079 has;
  unsigned int v14;
  float neuralCombinerScore;
  float v16;
  int v17;
  int recommendation;
  BOOL v19;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[TTMSchemaTTMNeuralCombinerTCUResult tcuId](self, "tcuId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tcuId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[TTMSchemaTTMNeuralCombinerTCUResult tcuId](self, "tcuId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[TTMSchemaTTMNeuralCombinerTCUResult tcuId](self, "tcuId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tcuId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    v19 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    neuralCombinerScore = self->_neuralCombinerScore;
    objc_msgSend(v4, "neuralCombinerScore");
    if (neuralCombinerScore == v16)
    {
      has = self->_has;
      v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v17 = (*(unsigned int *)&has >> 1) & 1;
  if (v17 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v17)
  {
    recommendation = self->_recommendation;
    if (recommendation != objc_msgSend(v4, "recommendation"))
      goto LABEL_16;
  }
  v19 = 1;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  float neuralCombinerScore;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;

  v3 = -[SISchemaUUID hash](self->_tcuId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    neuralCombinerScore = self->_neuralCombinerScore;
    v7 = neuralCombinerScore;
    if (neuralCombinerScore < 0.0)
      v7 = -neuralCombinerScore;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
    v10 = 2654435761 * self->_recommendation;
  else
    v10 = 0;
  return v5 ^ v3 ^ v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[TTMSchemaTTMNeuralCombinerTCUResult neuralCombinerScore](self, "neuralCombinerScore");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("neuralCombinerScore"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = -[TTMSchemaTTMNeuralCombinerTCUResult recommendation](self, "recommendation") - 1;
    if (v7 > 4)
      v8 = CFSTR("TTMTCUMITIGATIONDECISION_UNKNOWN");
    else
      v8 = off_1E5639C08[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("recommendation"));
  }
  if (self->_tcuId)
  {
    -[TTMSchemaTTMNeuralCombinerTCUResult tcuId](self, "tcuId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("tcuId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("tcuId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTMSchemaTTMNeuralCombinerTCUResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTMSchemaTTMNeuralCombinerTCUResult)initWithJSON:(id)a3
{
  void *v4;
  TTMSchemaTTMNeuralCombinerTCUResult *v5;
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
    self = -[TTMSchemaTTMNeuralCombinerTCUResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTMSchemaTTMNeuralCombinerTCUResult)initWithDictionary:(id)a3
{
  id v4;
  TTMSchemaTTMNeuralCombinerTCUResult *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  TTMSchemaTTMNeuralCombinerTCUResult *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TTMSchemaTTMNeuralCombinerTCUResult;
  v5 = -[TTMSchemaTTMNeuralCombinerTCUResult init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tcuId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[TTMSchemaTTMNeuralCombinerTCUResult setTcuId:](v5, "setTcuId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("neuralCombinerScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[TTMSchemaTTMNeuralCombinerTCUResult setNeuralCombinerScore:](v5, "setNeuralCombinerScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTMSchemaTTMNeuralCombinerTCUResult setRecommendation:](v5, "setRecommendation:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)tcuId
{
  return self->_tcuId;
}

- (void)setTcuId:(id)a3
{
  objc_storeStrong((id *)&self->_tcuId, a3);
}

- (float)neuralCombinerScore
{
  return self->_neuralCombinerScore;
}

- (int)recommendation
{
  return self->_recommendation;
}

- (void)setHasTcuId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tcuId, 0);
}

@end
