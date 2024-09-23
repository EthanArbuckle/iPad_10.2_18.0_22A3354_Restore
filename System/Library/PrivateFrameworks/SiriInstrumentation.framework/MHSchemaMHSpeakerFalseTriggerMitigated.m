@implementation MHSchemaMHSpeakerFalseTriggerMitigated

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelVersion
{
  -[MHSchemaMHSpeakerFalseTriggerMitigated setModelVersion:](self, "setModelVersion:", 0);
}

- (void)setSpeakerMatchScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_speakerMatchScore = a3;
}

- (BOOL)hasSpeakerMatchScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSpeakerMatchScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSpeakerMatchScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHSpeakerFalseTriggerMitigated setSpeakerMatchScore:](self, "setSpeakerMatchScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setThresholdScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_thresholdScore = a3;
}

- (BOOL)hasThresholdScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasThresholdScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteThresholdScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHSpeakerFalseTriggerMitigated setThresholdScore:](self, "setThresholdScore:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)deleteErrorMessage
{
  -[MHSchemaMHSpeakerFalseTriggerMitigated setErrorMessage:](self, "setErrorMessage:", 0);
}

- (void)setProcessedAudioDurationInNs:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_processedAudioDurationInNs = a3;
}

- (BOOL)hasProcessedAudioDurationInNs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasProcessedAudioDurationInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteProcessedAudioDurationInNs
{
  -[MHSchemaMHSpeakerFalseTriggerMitigated setProcessedAudioDurationInNs:](self, "setProcessedAudioDurationInNs:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteErrorCode
{
  -[MHSchemaMHSpeakerFalseTriggerMitigated setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHSpeakerFalseTriggerMitigatedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MHSchemaMHSpeakerFalseTriggerMitigated modelVersion](self, "modelVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField();
  -[MHSchemaMHSpeakerFalseTriggerMitigated errorMessage](self, "errorMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = (char)self->_has;
  v8 = v9;
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v8 = v9;
    v7 = (char)self->_has;
  }
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v8 = v9;
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
  $0E38E0F15C5ADC9421536E219AD28210 has;
  unsigned int v13;
  float speakerMatchScore;
  float v15;
  int v16;
  float thresholdScore;
  float v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  $0E38E0F15C5ADC9421536E219AD28210 v26;
  int v27;
  unsigned int v28;
  double processedAudioDurationInNs;
  double v30;
  int v31;
  unsigned int errorCode;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[MHSchemaMHSpeakerFalseTriggerMitigated modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_18;
  -[MHSchemaMHSpeakerFalseTriggerMitigated modelVersion](self, "modelVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MHSchemaMHSpeakerFalseTriggerMitigated modelVersion](self, "modelVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[44];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    speakerMatchScore = self->_speakerMatchScore;
    objc_msgSend(v4, "speakerMatchScore");
    if (speakerMatchScore != v15)
      goto LABEL_19;
    has = self->_has;
    v13 = v4[44];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v13 >> 1) & 1))
    goto LABEL_19;
  if (v16)
  {
    thresholdScore = self->_thresholdScore;
    objc_msgSend(v4, "thresholdScore");
    if (thresholdScore != v18)
      goto LABEL_19;
  }
  -[MHSchemaMHSpeakerFalseTriggerMitigated errorMessage](self, "errorMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[MHSchemaMHSpeakerFalseTriggerMitigated errorMessage](self, "errorMessage");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[MHSchemaMHSpeakerFalseTriggerMitigated errorMessage](self, "errorMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_19;
  }
  else
  {

  }
  v26 = self->_has;
  v27 = (*(unsigned int *)&v26 >> 2) & 1;
  v28 = v4[44];
  if (v27 == ((v28 >> 2) & 1))
  {
    if (v27)
    {
      processedAudioDurationInNs = self->_processedAudioDurationInNs;
      objc_msgSend(v4, "processedAudioDurationInNs");
      if (processedAudioDurationInNs != v30)
        goto LABEL_19;
      v26 = self->_has;
      v28 = v4[44];
    }
    v31 = (*(unsigned int *)&v26 >> 3) & 1;
    if (v31 == ((v28 >> 3) & 1))
    {
      if (!v31 || (errorCode = self->_errorCode, errorCode == objc_msgSend(v4, "errorCode")))
      {
        v24 = 1;
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  v24 = 0;
LABEL_20:

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  float speakerMatchScore;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float thresholdScore;
  double v12;
  long double v13;
  double v14;
  NSUInteger v15;
  char v16;
  unint64_t v17;
  double processedAudioDurationInNs;
  double v19;
  long double v20;
  double v21;
  uint64_t v22;

  v3 = -[NSString hash](self->_modelVersion, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    speakerMatchScore = self->_speakerMatchScore;
    v7 = speakerMatchScore;
    if (speakerMatchScore < 0.0)
      v7 = -speakerMatchScore;
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
  {
    thresholdScore = self->_thresholdScore;
    v12 = thresholdScore;
    if (thresholdScore < 0.0)
      v12 = -thresholdScore;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = -[NSString hash](self->_errorMessage, "hash");
  v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    processedAudioDurationInNs = self->_processedAudioDurationInNs;
    v19 = -processedAudioDurationInNs;
    if (processedAudioDurationInNs >= 0.0)
      v19 = self->_processedAudioDurationInNs;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  if ((v16 & 8) != 0)
    v22 = 2654435761 * self->_errorCode;
  else
    v22 = 0;
  return v5 ^ v3 ^ v10 ^ v15 ^ v17 ^ v22;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHSpeakerFalseTriggerMitigated errorCode](self, "errorCode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("errorCode"));

  }
  if (self->_errorMessage)
  {
    -[MHSchemaMHSpeakerFalseTriggerMitigated errorMessage](self, "errorMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorMessage"));

  }
  if (self->_modelVersion)
  {
    -[MHSchemaMHSpeakerFalseTriggerMitigated modelVersion](self, "modelVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("modelVersion"));

  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_13:
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHSpeakerFalseTriggerMitigated speakerMatchScore](self, "speakerMatchScore");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("speakerMatchScore"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHSpeakerFalseTriggerMitigated processedAudioDurationInNs](self, "processedAudioDurationInNs");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("processedAudioDurationInNs"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHSpeakerFalseTriggerMitigated thresholdScore](self, "thresholdScore");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("thresholdScore"));

  }
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHSpeakerFalseTriggerMitigated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHSpeakerFalseTriggerMitigated)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHSpeakerFalseTriggerMitigated *v5;
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
    self = -[MHSchemaMHSpeakerFalseTriggerMitigated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHSpeakerFalseTriggerMitigated)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHSpeakerFalseTriggerMitigated *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MHSchemaMHSpeakerFalseTriggerMitigated *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MHSchemaMHSpeakerFalseTriggerMitigated;
  v5 = -[MHSchemaMHSpeakerFalseTriggerMitigated init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHSpeakerFalseTriggerMitigated setModelVersion:](v5, "setModelVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speakerMatchScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[MHSchemaMHSpeakerFalseTriggerMitigated setSpeakerMatchScore:](v5, "setSpeakerMatchScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thresholdScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[MHSchemaMHSpeakerFalseTriggerMitigated setThresholdScore:](v5, "setThresholdScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[MHSchemaMHSpeakerFalseTriggerMitigated setErrorMessage:](v5, "setErrorMessage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processedAudioDurationInNs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      -[MHSchemaMHSpeakerFalseTriggerMitigated setProcessedAudioDurationInNs:](v5, "setProcessedAudioDurationInNs:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHSpeakerFalseTriggerMitigated setErrorCode:](v5, "setErrorCode:", objc_msgSend(v13, "unsignedIntValue"));
    v14 = v5;

  }
  return v5;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)speakerMatchScore
{
  return self->_speakerMatchScore;
}

- (float)thresholdScore
{
  return self->_thresholdScore;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)processedAudioDurationInNs
{
  return self->_processedAudioDurationInNs;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasErrorMessage:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end
