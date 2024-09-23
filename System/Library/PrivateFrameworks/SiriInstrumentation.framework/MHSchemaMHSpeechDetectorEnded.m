@implementation MHSchemaMHSpeechDetectorEnded

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
  v9.super_class = (Class)MHSchemaMHSpeechDetectorEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHSpeechDetectorEnded previousRequestId](self, "previousRequestId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[MHSchemaMHSpeechDetectorEnded deletePreviousRequestId](self, "deletePreviousRequestId");
  return v5;
}

- (BOOL)hasPreviousRequestId
{
  return self->_previousRequestId != 0;
}

- (void)deletePreviousRequestId
{
  -[MHSchemaMHSpeechDetectorEnded setPreviousRequestId:](self, "setPreviousRequestId:", 0);
}

- (void)setTimeSinceLastAcceptedRequestInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeSinceLastAcceptedRequestInNs = a3;
}

- (BOOL)hasTimeSinceLastAcceptedRequestInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTimeSinceLastAcceptedRequestInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTimeSinceLastAcceptedRequestInNs
{
  -[MHSchemaMHSpeechDetectorEnded setTimeSinceLastAcceptedRequestInNs:](self, "setTimeSinceLastAcceptedRequestInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAmountOfSpeechDetectedInMs:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_amountOfSpeechDetectedInMs = a3;
}

- (BOOL)hasAmountOfSpeechDetectedInMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAmountOfSpeechDetectedInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAmountOfSpeechDetectedInMs
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHSpeechDetectorEnded setAmountOfSpeechDetectedInMs:](self, "setAmountOfSpeechDetectedInMs:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setStartSpeechDetectionThresholdInMs:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startSpeechDetectionThresholdInMs = a3;
}

- (BOOL)hasStartSpeechDetectionThresholdInMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasStartSpeechDetectionThresholdInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteStartSpeechDetectionThresholdInMs
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHSpeechDetectorEnded setStartSpeechDetectionThresholdInMs:](self, "setStartSpeechDetectionThresholdInMs:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHSpeechDetectorEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[MHSchemaMHSpeechDetectorEnded previousRequestId](self, "previousRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MHSchemaMHSpeechDetectorEnded previousRequestId](self, "previousRequestId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v7 = v8;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
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
  $43D1D06FA34761E24804D22522CA737B has;
  unsigned int v14;
  unint64_t timeSinceLastAcceptedRequestInNs;
  int v16;
  float amountOfSpeechDetectedInMs;
  float v18;
  int v19;
  float startSpeechDetectionThresholdInMs;
  float v21;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[MHSchemaMHSpeechDetectorEnded previousRequestId](self, "previousRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[MHSchemaMHSpeechDetectorEnded previousRequestId](self, "previousRequestId");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[MHSchemaMHSpeechDetectorEnded previousRequestId](self, "previousRequestId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previousRequestId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_19;
    }
    else
    {

    }
    has = self->_has;
    v14 = v4[32];
    if ((*(_BYTE *)&has & 1) == (v14 & 1))
    {
      if ((*(_BYTE *)&has & 1) != 0)
      {
        timeSinceLastAcceptedRequestInNs = self->_timeSinceLastAcceptedRequestInNs;
        if (timeSinceLastAcceptedRequestInNs != objc_msgSend(v4, "timeSinceLastAcceptedRequestInNs"))
          goto LABEL_19;
        has = self->_has;
        v14 = v4[32];
      }
      v16 = (*(unsigned int *)&has >> 1) & 1;
      if (v16 == ((v14 >> 1) & 1))
      {
        if (v16)
        {
          amountOfSpeechDetectedInMs = self->_amountOfSpeechDetectedInMs;
          objc_msgSend(v4, "amountOfSpeechDetectedInMs");
          if (amountOfSpeechDetectedInMs != v18)
            goto LABEL_19;
          has = self->_has;
          v14 = v4[32];
        }
        v19 = (*(unsigned int *)&has >> 2) & 1;
        if (v19 == ((v14 >> 2) & 1))
        {
          if (!v19
            || (startSpeechDetectionThresholdInMs = self->_startSpeechDetectionThresholdInMs,
                objc_msgSend(v4, "startSpeechDetectionThresholdInMs"),
                startSpeechDetectionThresholdInMs == v21))
          {
            v22 = 1;
            goto LABEL_20;
          }
        }
      }
    }
  }
  else
  {

  }
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  float amountOfSpeechDetectedInMs;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  float startSpeechDetectionThresholdInMs;
  double v13;
  long double v14;
  double v15;

  v3 = -[SISchemaUUID hash](self->_previousRequestId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761u * self->_timeSinceLastAcceptedRequestInNs;
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
  amountOfSpeechDetectedInMs = self->_amountOfSpeechDetectedInMs;
  v7 = amountOfSpeechDetectedInMs;
  if (amountOfSpeechDetectedInMs < 0.0)
    v7 = -amountOfSpeechDetectedInMs;
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
    startSpeechDetectionThresholdInMs = self->_startSpeechDetectionThresholdInMs;
    v13 = startSpeechDetectionThresholdInMs;
    if (startSpeechDetectionThresholdInMs < 0.0)
      v13 = -startSpeechDetectionThresholdInMs;
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
  return v5 ^ v3 ^ v10 ^ v11;
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
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHSpeechDetectorEnded amountOfSpeechDetectedInMs](self, "amountOfSpeechDetectedInMs");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("amountOfSpeechDetectedInMs"));

  }
  if (self->_previousRequestId)
  {
    -[MHSchemaMHSpeechDetectorEnded previousRequestId](self, "previousRequestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("previousRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("previousRequestId"));

    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHSpeechDetectorEnded startSpeechDetectionThresholdInMs](self, "startSpeechDetectionThresholdInMs");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("startSpeechDetectionThresholdInMs"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHSpeechDetectorEnded timeSinceLastAcceptedRequestInNs](self, "timeSinceLastAcceptedRequestInNs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("timeSinceLastAcceptedRequestInNs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHSpeechDetectorEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHSpeechDetectorEnded)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHSpeechDetectorEnded *v5;
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
    self = -[MHSchemaMHSpeechDetectorEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHSpeechDetectorEnded)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHSpeechDetectorEnded *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  MHSchemaMHSpeechDetectorEnded *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHSpeechDetectorEnded;
  v5 = -[MHSchemaMHSpeechDetectorEnded init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[MHSchemaMHSpeechDetectorEnded setPreviousRequestId:](v5, "setPreviousRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastAcceptedRequestInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHSpeechDetectorEnded setTimeSinceLastAcceptedRequestInNs:](v5, "setTimeSinceLastAcceptedRequestInNs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("amountOfSpeechDetectedInMs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[MHSchemaMHSpeechDetectorEnded setAmountOfSpeechDetectedInMs:](v5, "setAmountOfSpeechDetectedInMs:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startSpeechDetectionThresholdInMs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[MHSchemaMHSpeechDetectorEnded setStartSpeechDetectionThresholdInMs:](v5, "setStartSpeechDetectionThresholdInMs:");
    }
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)previousRequestId
{
  return self->_previousRequestId;
}

- (void)setPreviousRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_previousRequestId, a3);
}

- (unint64_t)timeSinceLastAcceptedRequestInNs
{
  return self->_timeSinceLastAcceptedRequestInNs;
}

- (float)amountOfSpeechDetectedInMs
{
  return self->_amountOfSpeechDetectedInMs;
}

- (float)startSpeechDetectionThresholdInMs
{
  return self->_startSpeechDetectionThresholdInMs;
}

- (void)setHasPreviousRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRequestId, 0);
}

@end
