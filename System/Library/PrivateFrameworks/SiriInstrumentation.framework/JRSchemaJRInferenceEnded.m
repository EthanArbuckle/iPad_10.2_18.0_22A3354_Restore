@implementation JRSchemaJRInferenceEnded

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
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)JRSchemaJRInferenceEnded;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JRSchemaJRInferenceEnded modelInputShapes](self, "modelInputShapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[JRSchemaJRInferenceEnded deleteModelInputShapes](self, "deleteModelInputShapes");
  -[JRSchemaJRInferenceEnded modelOutputs](self, "modelOutputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[JRSchemaJRInferenceEnded deleteModelOutputs](self, "deleteModelOutputs");
  -[JRSchemaJRInferenceEnded version](self, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[JRSchemaJRInferenceEnded deleteVersion](self, "deleteVersion");
  -[JRSchemaJRInferenceEnded riskProfile](self, "riskProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[JRSchemaJRInferenceEnded deleteRiskProfile](self, "deleteRiskProfile");

  return v5;
}

- (BOOL)hasModelInputShapes
{
  return self->_modelInputShapes != 0;
}

- (void)deleteModelInputShapes
{
  -[JRSchemaJRInferenceEnded setModelInputShapes:](self, "setModelInputShapes:", 0);
}

- (BOOL)hasModelOutputs
{
  return self->_modelOutputs != 0;
}

- (void)deleteModelOutputs
{
  -[JRSchemaJRInferenceEnded setModelOutputs:](self, "setModelOutputs:", 0);
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)deleteVersion
{
  -[JRSchemaJRInferenceEnded setVersion:](self, "setVersion:", 0);
}

- (void)setTrialDisambiguationRate:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_trialDisambiguationRate = a3;
}

- (BOOL)hasTrialDisambiguationRate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTrialDisambiguationRate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTrialDisambiguationRate
{
  double v2;

  LODWORD(v2) = 0;
  -[JRSchemaJRInferenceEnded setTrialDisambiguationRate:](self, "setTrialDisambiguationRate:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTrialConfirmationRate:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_trialConfirmationRate = a3;
}

- (BOOL)hasTrialConfirmationRate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTrialConfirmationRate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTrialConfirmationRate
{
  double v2;

  LODWORD(v2) = 0;
  -[JRSchemaJRInferenceEnded setTrialConfirmationRate:](self, "setTrialConfirmationRate:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasRiskProfile
{
  return self->_riskProfile != 0;
}

- (void)deleteRiskProfile
{
  -[JRSchemaJRInferenceEnded setRiskProfile:](self, "setRiskProfile:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return JRSchemaJRInferenceEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char has;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[JRSchemaJRInferenceEnded modelInputShapes](self, "modelInputShapes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[JRSchemaJRInferenceEnded modelInputShapes](self, "modelInputShapes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaJRInferenceEnded modelOutputs](self, "modelOutputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[JRSchemaJRInferenceEnded modelOutputs](self, "modelOutputs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaJRInferenceEnded version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[JRSchemaJRInferenceEnded version](self, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField();
  -[JRSchemaJRInferenceEnded riskProfile](self, "riskProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[JRSchemaJRInferenceEnded riskProfile](self, "riskProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v12 = v14;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  $8C52CD87DDAD5C1F54F4D6632678A20E has;
  unsigned int v23;
  float trialDisambiguationRate;
  float v25;
  int v26;
  float trialConfirmationRate;
  float v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[JRSchemaJRInferenceEnded modelInputShapes](self, "modelInputShapes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelInputShapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[JRSchemaJRInferenceEnded modelInputShapes](self, "modelInputShapes");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[JRSchemaJRInferenceEnded modelInputShapes](self, "modelInputShapes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelInputShapes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  else
  {

  }
  -[JRSchemaJRInferenceEnded modelOutputs](self, "modelOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelOutputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[JRSchemaJRInferenceEnded modelOutputs](self, "modelOutputs");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[JRSchemaJRInferenceEnded modelOutputs](self, "modelOutputs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelOutputs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_29;
  }
  else
  {

  }
  -[JRSchemaJRInferenceEnded version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[JRSchemaJRInferenceEnded version](self, "version");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[JRSchemaJRInferenceEnded version](self, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_29;
  }
  else
  {

  }
  has = self->_has;
  v23 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v23 & 1))
    goto LABEL_29;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    trialDisambiguationRate = self->_trialDisambiguationRate;
    objc_msgSend(v4, "trialDisambiguationRate");
    if (trialDisambiguationRate != v25)
      goto LABEL_29;
    has = self->_has;
    v23 = v4[48];
  }
  v26 = (*(unsigned int *)&has >> 1) & 1;
  if (v26 != ((v23 >> 1) & 1))
    goto LABEL_29;
  if (v26)
  {
    trialConfirmationRate = self->_trialConfirmationRate;
    objc_msgSend(v4, "trialConfirmationRate");
    if (trialConfirmationRate != v28)
      goto LABEL_29;
  }
  -[JRSchemaJRInferenceEnded riskProfile](self, "riskProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "riskProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  -[JRSchemaJRInferenceEnded riskProfile](self, "riskProfile");
  v29 = objc_claimAutoreleasedReturnValue();
  if (!v29)
  {

LABEL_32:
    v34 = 1;
    goto LABEL_30;
  }
  v30 = (void *)v29;
  -[JRSchemaJRInferenceEnded riskProfile](self, "riskProfile");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "riskProfile");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v31, "isEqual:", v32);

  if ((v33 & 1) != 0)
    goto LABEL_32;
LABEL_29:
  v34 = 0;
LABEL_30:

  return v34;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char has;
  unint64_t v7;
  float trialDisambiguationRate;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  float trialConfirmationRate;
  double v14;
  long double v15;
  double v16;

  v3 = -[JRSchemaJRModelInputShapes hash](self->_modelInputShapes, "hash");
  v4 = -[JRSchemaJRModelOutputs hash](self->_modelOutputs, "hash");
  v5 = -[SISchemaVersion hash](self->_version, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    trialDisambiguationRate = self->_trialDisambiguationRate;
    v9 = trialDisambiguationRate;
    if (trialDisambiguationRate < 0.0)
      v9 = -trialDisambiguationRate;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 2) != 0)
  {
    trialConfirmationRate = self->_trialConfirmationRate;
    v14 = trialConfirmationRate;
    if (trialConfirmationRate < 0.0)
      v14 = -trialConfirmationRate;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12 ^ -[JRSchemaRiskProfile hash](self->_riskProfile, "hash");
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
  char has;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_modelInputShapes)
  {
    -[JRSchemaJRInferenceEnded modelInputShapes](self, "modelInputShapes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("modelInputShapes"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("modelInputShapes"));

    }
  }
  if (self->_modelOutputs)
  {
    -[JRSchemaJRInferenceEnded modelOutputs](self, "modelOutputs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("modelOutputs"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("modelOutputs"));

    }
  }
  if (self->_riskProfile)
  {
    -[JRSchemaJRInferenceEnded riskProfile](self, "riskProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("riskProfile"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("riskProfile"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[JRSchemaJRInferenceEnded trialConfirmationRate](self, "trialConfirmationRate");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("trialConfirmationRate"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[JRSchemaJRInferenceEnded trialDisambiguationRate](self, "trialDisambiguationRate");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("trialDisambiguationRate"));

  }
  if (self->_version)
  {
    -[JRSchemaJRInferenceEnded version](self, "version");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("version"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("version"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[JRSchemaJRInferenceEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (JRSchemaJRInferenceEnded)initWithJSON:(id)a3
{
  void *v4;
  JRSchemaJRInferenceEnded *v5;
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
    self = -[JRSchemaJRInferenceEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (JRSchemaJRInferenceEnded)initWithDictionary:(id)a3
{
  id v4;
  JRSchemaJRInferenceEnded *v5;
  void *v6;
  JRSchemaJRModelInputShapes *v7;
  void *v8;
  JRSchemaJRModelOutputs *v9;
  void *v10;
  SISchemaVersion *v11;
  void *v12;
  void *v13;
  void *v14;
  JRSchemaRiskProfile *v15;
  JRSchemaJRInferenceEnded *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)JRSchemaJRInferenceEnded;
  v5 = -[JRSchemaJRInferenceEnded init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelInputShapes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[JRSchemaJRModelInputShapes initWithDictionary:]([JRSchemaJRModelInputShapes alloc], "initWithDictionary:", v6);
      -[JRSchemaJRInferenceEnded setModelInputShapes:](v5, "setModelInputShapes:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelOutputs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[JRSchemaJRModelOutputs initWithDictionary:]([JRSchemaJRModelOutputs alloc], "initWithDictionary:", v8);
      -[JRSchemaJRInferenceEnded setModelOutputs:](v5, "setModelOutputs:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v10);
      -[JRSchemaJRInferenceEnded setVersion:](v5, "setVersion:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialDisambiguationRate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[JRSchemaJRInferenceEnded setTrialDisambiguationRate:](v5, "setTrialDisambiguationRate:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialConfirmationRate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "floatValue");
      -[JRSchemaJRInferenceEnded setTrialConfirmationRate:](v5, "setTrialConfirmationRate:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("riskProfile"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[JRSchemaRiskProfile initWithDictionary:]([JRSchemaRiskProfile alloc], "initWithDictionary:", v14);
      -[JRSchemaJRInferenceEnded setRiskProfile:](v5, "setRiskProfile:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (JRSchemaJRModelInputShapes)modelInputShapes
{
  return self->_modelInputShapes;
}

- (void)setModelInputShapes:(id)a3
{
  objc_storeStrong((id *)&self->_modelInputShapes, a3);
}

- (JRSchemaJRModelOutputs)modelOutputs
{
  return self->_modelOutputs;
}

- (void)setModelOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_modelOutputs, a3);
}

- (SISchemaVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (float)trialDisambiguationRate
{
  return self->_trialDisambiguationRate;
}

- (float)trialConfirmationRate
{
  return self->_trialConfirmationRate;
}

- (JRSchemaRiskProfile)riskProfile
{
  return self->_riskProfile;
}

- (void)setRiskProfile:(id)a3
{
  objc_storeStrong((id *)&self->_riskProfile, a3);
}

- (void)setHasModelInputShapes:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasModelOutputs:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasRiskProfile:(BOOL)a3
{
  self->_hasModelInputShapes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_riskProfile, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_modelOutputs, 0);
  objc_storeStrong((id *)&self->_modelInputShapes, 0);
}

@end
