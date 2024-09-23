@implementation LCServiceLoggingParameters

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setQos:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_qos = a3;
}

- (BOOL)hasQos
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasQos:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteQos
{
  -[LCServiceLoggingParameters setQos:](self, "setQos:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setMessageSizeQuotaInBytes:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_messageSizeQuotaInBytes = a3;
}

- (BOOL)hasMessageSizeQuotaInBytes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMessageSizeQuotaInBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMessageSizeQuotaInBytes
{
  -[LCServiceLoggingParameters setMessageSizeQuotaInBytes:](self, "setMessageSizeQuotaInBytes:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTotalDiskSizeQuotaInBytes:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalDiskSizeQuotaInBytes = a3;
}

- (BOOL)hasTotalDiskSizeQuotaInBytes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTotalDiskSizeQuotaInBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTotalDiskSizeQuotaInBytes
{
  -[LCServiceLoggingParameters setTotalDiskSizeQuotaInBytes:](self, "setTotalDiskSizeQuotaInBytes:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setOptOutOfCompression:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_optOutOfCompression = a3;
}

- (BOOL)hasOptOutOfCompression
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasOptOutOfCompression:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteOptOutOfCompression
{
  -[LCServiceLoggingParameters setOptOutOfCompression:](self, "setOptOutOfCompression:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setUploadSamplingRate:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_uploadSamplingRate = a3;
}

- (BOOL)hasUploadSamplingRate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasUploadSamplingRate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteUploadSamplingRate
{
  double v2;

  LODWORD(v2) = 0;
  -[LCServiceLoggingParameters setUploadSamplingRate:](self, "setUploadSamplingRate:", v2);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setRealtimeSamplingRate:(float)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_realtimeSamplingRate = a3;
}

- (BOOL)hasRealtimeSamplingRate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasRealtimeSamplingRate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteRealtimeSamplingRate
{
  double v2;

  LODWORD(v2) = 0;
  -[LCServiceLoggingParameters setRealtimeSamplingRate:](self, "setRealtimeSamplingRate:", v2);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)hasEntropy
{
  return self->_entropy != 0;
}

- (void)deleteEntropy
{
  -[LCServiceLoggingParameters setEntropy:](self, "setEntropy:", 0);
}

- (void)setOverrideIntoSamplePopulation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_overrideIntoSamplePopulation = a3;
}

- (BOOL)hasOverrideIntoSamplePopulation
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasOverrideIntoSamplePopulation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteOverrideIntoSamplePopulation
{
  -[LCServiceLoggingParameters setOverrideIntoSamplePopulation:](self, "setOverrideIntoSamplePopulation:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)hasUploadEndpointURL
{
  return self->_uploadEndpointURL != 0;
}

- (void)deleteUploadEndpointURL
{
  -[LCServiceLoggingParameters setUploadEndpointURL:](self, "setUploadEndpointURL:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return LCServiceLoggingParametersReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
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
      goto LABEL_17;
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
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteFloatField();
LABEL_8:
  -[LCServiceLoggingParameters entropy](self, "entropy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  -[LCServiceLoggingParameters uploadEndpointURL](self, "uploadEndpointURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $0322636175C7CAAEAB91C861E7CD74CB has;
  unsigned int v6;
  int qos;
  int v8;
  int messageSizeQuotaInBytes;
  int v10;
  int totalDiskSizeQuotaInBytes;
  int v12;
  int optOutOfCompression;
  int v14;
  float uploadSamplingRate;
  float v16;
  int v17;
  float realtimeSamplingRate;
  float v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int overrideIntoSamplePopulation;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  has = self->_has;
  v6 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_38;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    qos = self->_qos;
    if (qos != objc_msgSend(v4, "qos"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[56];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      messageSizeQuotaInBytes = self->_messageSizeQuotaInBytes;
      if (messageSizeQuotaInBytes != objc_msgSend(v4, "messageSizeQuotaInBytes"))
        goto LABEL_38;
      has = self->_has;
      v6 = v4[56];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        totalDiskSizeQuotaInBytes = self->_totalDiskSizeQuotaInBytes;
        if (totalDiskSizeQuotaInBytes != objc_msgSend(v4, "totalDiskSizeQuotaInBytes"))
          goto LABEL_38;
        has = self->_has;
        v6 = v4[56];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          optOutOfCompression = self->_optOutOfCompression;
          if (optOutOfCompression != objc_msgSend(v4, "optOutOfCompression"))
            goto LABEL_38;
          has = self->_has;
          v6 = v4[56];
        }
        v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            uploadSamplingRate = self->_uploadSamplingRate;
            objc_msgSend(v4, "uploadSamplingRate");
            if (uploadSamplingRate != v16)
              goto LABEL_38;
            has = self->_has;
            v6 = v4[56];
          }
          v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 != ((v6 >> 5) & 1))
            goto LABEL_38;
          if (v17)
          {
            realtimeSamplingRate = self->_realtimeSamplingRate;
            objc_msgSend(v4, "realtimeSamplingRate");
            if (realtimeSamplingRate != v19)
              goto LABEL_38;
          }
          -[LCServiceLoggingParameters entropy](self, "entropy");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "entropy");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v20 == 0) == (v21 != 0))
            goto LABEL_37;
          -[LCServiceLoggingParameters entropy](self, "entropy");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)v22;
            -[LCServiceLoggingParameters entropy](self, "entropy");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "entropy");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "isEqual:", v25);

            if (!v26)
              goto LABEL_38;
          }
          else
          {

          }
          v27 = (*(_BYTE *)&self->_has >> 6) & 1;
          if (v27 != ((v4[56] >> 6) & 1))
            goto LABEL_38;
          if (v27)
          {
            overrideIntoSamplePopulation = self->_overrideIntoSamplePopulation;
            if (overrideIntoSamplePopulation != objc_msgSend(v4, "overrideIntoSamplePopulation"))
              goto LABEL_38;
          }
          -[LCServiceLoggingParameters uploadEndpointURL](self, "uploadEndpointURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "uploadEndpointURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v20 == 0) != (v21 != 0))
          {
            -[LCServiceLoggingParameters uploadEndpointURL](self, "uploadEndpointURL");
            v29 = objc_claimAutoreleasedReturnValue();
            if (!v29)
            {

LABEL_41:
              v34 = 1;
              goto LABEL_39;
            }
            v30 = (void *)v29;
            -[LCServiceLoggingParameters uploadEndpointURL](self, "uploadEndpointURL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "uploadEndpointURL");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v31, "isEqual:", v32);

            if ((v33 & 1) != 0)
              goto LABEL_41;
          }
          else
          {
LABEL_37:

          }
        }
      }
    }
  }
LABEL_38:
  v34 = 0;
LABEL_39:

  return v34;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float uploadSamplingRate;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  float realtimeSamplingRate;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_qos;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_messageSizeQuotaInBytes;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_totalDiskSizeQuotaInBytes;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_13:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_14:
    v12 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_5:
  v7 = 2654435761 * self->_optOutOfCompression;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_6:
  uploadSamplingRate = self->_uploadSamplingRate;
  v9 = uploadSamplingRate;
  if (uploadSamplingRate < 0.0)
    v9 = -uploadSamplingRate;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_17:
  if ((has & 0x20) != 0)
  {
    realtimeSamplingRate = self->_realtimeSamplingRate;
    v15 = realtimeSamplingRate;
    if (realtimeSamplingRate < 0.0)
      v15 = -realtimeSamplingRate;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  v18 = -[NSData hash](self->_entropy, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v19 = 2654435761 * self->_overrideIntoSamplePopulation;
  else
    v19 = 0;
  return v5 ^ v4 ^ v6 ^ v7 ^ v12 ^ v13 ^ v19 ^ v18 ^ -[NSString hash](self->_uploadEndpointURL, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_entropy)
  {
    -[LCServiceLoggingParameters entropy](self, "entropy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entropy"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("entropy"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[LCServiceLoggingParameters messageSizeQuotaInBytes](self, "messageSizeQuotaInBytes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("messageSizeQuotaInBytes"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_8:
      if ((has & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LCServiceLoggingParameters optOutOfCompression](self, "optOutOfCompression"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("optOutOfCompression"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LCServiceLoggingParameters overrideIntoSamplePopulation](self, "overrideIntoSamplePopulation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("overrideIntoSamplePopulation"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_21:
  v17 = -[LCServiceLoggingParameters qos](self, "qos");
  v18 = CFSTR("QOSClassLow");
  if (v17 == 1)
    v18 = CFSTR("QOSClassMedium");
  if (v17 == 2)
    v19 = CFSTR("QOSClassHigh");
  else
    v19 = v18;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("qos"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_27:
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[LCServiceLoggingParameters realtimeSamplingRate](self, "realtimeSamplingRate");
  objc_msgSend(v20, "numberWithFloat:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("realtimeSamplingRate"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[LCServiceLoggingParameters totalDiskSizeQuotaInBytes](self, "totalDiskSizeQuotaInBytes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("totalDiskSizeQuotaInBytes"));

  }
LABEL_13:
  if (self->_uploadEndpointURL)
  {
    -[LCServiceLoggingParameters uploadEndpointURL](self, "uploadEndpointURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("uploadEndpointURL"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[LCServiceLoggingParameters uploadSamplingRate](self, "uploadSamplingRate");
    objc_msgSend(v11, "numberWithFloat:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("uploadSamplingRate"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LCServiceLoggingParameters dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LCServiceLoggingParameters)initWithJSON:(id)a3
{
  void *v4;
  LCServiceLoggingParameters *v5;
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
    self = -[LCServiceLoggingParameters initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LCServiceLoggingParameters)initWithDictionary:(id)a3
{
  id v4;
  LCServiceLoggingParameters *v5;
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
  LCServiceLoggingParameters *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LCServiceLoggingParameters;
  v5 = -[LCServiceLoggingParameters init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qos"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LCServiceLoggingParameters setQos:](v5, "setQos:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageSizeQuotaInBytes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LCServiceLoggingParameters setMessageSizeQuotaInBytes:](v5, "setMessageSizeQuotaInBytes:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalDiskSizeQuotaInBytes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LCServiceLoggingParameters setTotalDiskSizeQuotaInBytes:](v5, "setTotalDiskSizeQuotaInBytes:", objc_msgSend(v8, "intValue"));
    v19 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("optOutOfCompression"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LCServiceLoggingParameters setOptOutOfCompression:](v5, "setOptOutOfCompression:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uploadSamplingRate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[LCServiceLoggingParameters setUploadSamplingRate:](v5, "setUploadSamplingRate:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("realtimeSamplingRate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[LCServiceLoggingParameters setRealtimeSamplingRate:](v5, "setRealtimeSamplingRate:");
    }
    v20 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entropy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
      -[LCServiceLoggingParameters setEntropy:](v5, "setEntropy:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overrideIntoSamplePopulation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LCServiceLoggingParameters setOverrideIntoSamplePopulation:](v5, "setOverrideIntoSamplePopulation:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uploadEndpointURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[LCServiceLoggingParameters setUploadEndpointURL:](v5, "setUploadEndpointURL:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (int)qos
{
  return self->_qos;
}

- (int)messageSizeQuotaInBytes
{
  return self->_messageSizeQuotaInBytes;
}

- (int)totalDiskSizeQuotaInBytes
{
  return self->_totalDiskSizeQuotaInBytes;
}

- (BOOL)optOutOfCompression
{
  return self->_optOutOfCompression;
}

- (float)uploadSamplingRate
{
  return self->_uploadSamplingRate;
}

- (float)realtimeSamplingRate
{
  return self->_realtimeSamplingRate;
}

- (NSData)entropy
{
  return self->_entropy;
}

- (void)setEntropy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)overrideIntoSamplePopulation
{
  return self->_overrideIntoSamplePopulation;
}

- (NSString)uploadEndpointURL
{
  return self->_uploadEndpointURL;
}

- (void)setUploadEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasEntropy:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasUploadEndpointURL:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadEndpointURL, 0);
  objc_storeStrong((id *)&self->_entropy, 0);
}

@end
