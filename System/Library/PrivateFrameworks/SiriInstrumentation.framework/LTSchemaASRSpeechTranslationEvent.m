@implementation LTSchemaASRSpeechTranslationEvent

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)deleteRequestID
{
  -[LTSchemaASRSpeechTranslationEvent setRequestID:](self, "setRequestID:", 0);
}

- (BOOL)hasSelectedLocale
{
  return self->_selectedLocale != 0;
}

- (void)deleteSelectedLocale
{
  -[LTSchemaASRSpeechTranslationEvent setSelectedLocale:](self, "setSelectedLocale:", 0);
}

- (void)setTimeToFirstPartialMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeToFirstPartialMs = a3;
}

- (BOOL)hasTimeToFirstPartialMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTimeToFirstPartialMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTimeToFirstPartialMs
{
  -[LTSchemaASRSpeechTranslationEvent setTimeToFirstPartialMs:](self, "setTimeToFirstPartialMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTimeToFinalResultMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timeToFinalResultMs = a3;
}

- (BOOL)hasTimeToFinalResultMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTimeToFinalResultMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTimeToFinalResultMs
{
  -[LTSchemaASRSpeechTranslationEvent setTimeToFinalResultMs:](self, "setTimeToFinalResultMs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setLatencyFinalResultMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_latencyFinalResultMs = a3;
}

- (BOOL)hasLatencyFinalResultMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLatencyFinalResultMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteLatencyFinalResultMs
{
  -[LTSchemaASRSpeechTranslationEvent setLatencyFinalResultMs:](self, "setLatencyFinalResultMs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setTimeToSendFirstAudioPacket:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timeToSendFirstAudioPacket = a3;
}

- (BOOL)hasTimeToSendFirstAudioPacket
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasTimeToSendFirstAudioPacket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteTimeToSendFirstAudioPacket
{
  -[LTSchemaASRSpeechTranslationEvent setTimeToSendFirstAudioPacket:](self, "setTimeToSendFirstAudioPacket:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setTimeToReceiveFirstAudioPacket:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_timeToReceiveFirstAudioPacket = a3;
}

- (BOOL)hasTimeToReceiveFirstAudioPacket
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasTimeToReceiveFirstAudioPacket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteTimeToReceiveFirstAudioPacket
{
  -[LTSchemaASRSpeechTranslationEvent setTimeToReceiveFirstAudioPacket:](self, "setTimeToReceiveFirstAudioPacket:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setNumAudioPacket:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numAudioPacket = a3;
}

- (BOOL)hasNumAudioPacket
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasNumAudioPacket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteNumAudioPacket
{
  -[LTSchemaASRSpeechTranslationEvent setNumAudioPacket:](self, "setNumAudioPacket:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setTimeToSendFinishAudio:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_timeToSendFinishAudio = a3;
}

- (BOOL)hasTimeToSendFinishAudio
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasTimeToSendFinishAudio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteTimeToSendFinishAudio
{
  -[LTSchemaASRSpeechTranslationEvent setTimeToSendFinishAudio:](self, "setTimeToSendFinishAudio:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaASRSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[LTSchemaASRSpeechTranslationEvent requestID](self, "requestID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[LTSchemaASRSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v7 = v8;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = v8;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_19:
    PBDataWriterWriteUint32Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_19;
LABEL_11:
  if ((has & 0x40) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint32Field();
    v7 = v8;
  }
LABEL_13:

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
  BOOL v17;
  $87568BC8588BA6DDEF3071E9761E3E30 has;
  unsigned int v20;
  unsigned int timeToFirstPartialMs;
  int v22;
  unsigned int timeToFinalResultMs;
  int v24;
  unsigned int latencyFinalResultMs;
  int v26;
  unsigned int timeToSendFirstAudioPacket;
  int v28;
  unsigned int timeToReceiveFirstAudioPacket;
  int v30;
  unsigned int numAudioPacket;
  int v32;
  unsigned int timeToSendFinishAudio;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[LTSchemaASRSpeechTranslationEvent requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[LTSchemaASRSpeechTranslationEvent requestID](self, "requestID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LTSchemaASRSpeechTranslationEvent requestID](self, "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[LTSchemaASRSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[LTSchemaASRSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[LTSchemaASRSpeechTranslationEvent selectedLocale](self, "selectedLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[52];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      timeToFirstPartialMs = self->_timeToFirstPartialMs;
      if (timeToFirstPartialMs != objc_msgSend(v4, "timeToFirstPartialMs"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[52];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        timeToFinalResultMs = self->_timeToFinalResultMs;
        if (timeToFinalResultMs != objc_msgSend(v4, "timeToFinalResultMs"))
          goto LABEL_12;
        has = self->_has;
        v20 = v4[52];
      }
      v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (v24)
        {
          latencyFinalResultMs = self->_latencyFinalResultMs;
          if (latencyFinalResultMs != objc_msgSend(v4, "latencyFinalResultMs"))
            goto LABEL_12;
          has = self->_has;
          v20 = v4[52];
        }
        v26 = (*(unsigned int *)&has >> 3) & 1;
        if (v26 == ((v20 >> 3) & 1))
        {
          if (v26)
          {
            timeToSendFirstAudioPacket = self->_timeToSendFirstAudioPacket;
            if (timeToSendFirstAudioPacket != objc_msgSend(v4, "timeToSendFirstAudioPacket"))
              goto LABEL_12;
            has = self->_has;
            v20 = v4[52];
          }
          v28 = (*(unsigned int *)&has >> 4) & 1;
          if (v28 == ((v20 >> 4) & 1))
          {
            if (v28)
            {
              timeToReceiveFirstAudioPacket = self->_timeToReceiveFirstAudioPacket;
              if (timeToReceiveFirstAudioPacket != objc_msgSend(v4, "timeToReceiveFirstAudioPacket"))
                goto LABEL_12;
              has = self->_has;
              v20 = v4[52];
            }
            v30 = (*(unsigned int *)&has >> 5) & 1;
            if (v30 == ((v20 >> 5) & 1))
            {
              if (v30)
              {
                numAudioPacket = self->_numAudioPacket;
                if (numAudioPacket != objc_msgSend(v4, "numAudioPacket"))
                  goto LABEL_12;
                has = self->_has;
                v20 = v4[52];
              }
              v32 = (*(unsigned int *)&has >> 6) & 1;
              if (v32 == ((v20 >> 6) & 1))
              {
                if (!v32
                  || (timeToSendFinishAudio = self->_timeToSendFinishAudio,
                      timeToSendFinishAudio == objc_msgSend(v4, "timeToSendFinishAudio")))
                {
                  v17 = 1;
                  goto LABEL_13;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_requestID, "hash");
  v4 = -[NSString hash](self->_selectedLocale, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_timeToFirstPartialMs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_timeToFinalResultMs;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_latencyFinalResultMs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_timeToSendFirstAudioPacket;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_timeToReceiveFirstAudioPacket;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_13:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v10 = 2654435761 * self->_numAudioPacket;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v11 = 2654435761 * self->_timeToSendFinishAudio;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent latencyFinalResultMs](self, "latencyFinalResultMs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("latencyFinalResultMs"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent numAudioPacket](self, "numAudioPacket"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("numAudioPacket"));

  }
  if (self->_requestID)
  {
    -[LTSchemaASRSpeechTranslationEvent requestID](self, "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestID"));

  }
  if (self->_selectedLocale)
  {
    -[LTSchemaASRSpeechTranslationEvent selectedLocale](self, "selectedLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("selectedLocale"));

  }
  v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToFinalResultMs](self, "timeToFinalResultMs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("timeToFinalResultMs"));

    v11 = (char)self->_has;
    if ((v11 & 1) == 0)
    {
LABEL_11:
      if ((v11 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToFirstPartialMs](self, "timeToFirstPartialMs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("timeToFirstPartialMs"));

  v11 = (char)self->_has;
  if ((v11 & 0x10) == 0)
  {
LABEL_12:
    if ((v11 & 0x40) == 0)
      goto LABEL_13;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToSendFinishAudio](self, "timeToSendFinishAudio"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("timeToSendFinishAudio"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToReceiveFirstAudioPacket](self, "timeToReceiveFirstAudioPacket"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("timeToReceiveFirstAudioPacket"));

  v11 = (char)self->_has;
  if ((v11 & 0x40) != 0)
    goto LABEL_19;
LABEL_13:
  if ((v11 & 8) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToSendFirstAudioPacket](self, "timeToSendFirstAudioPacket"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("timeToSendFirstAudioPacket"));

  }
LABEL_15:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LTSchemaASRSpeechTranslationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LTSchemaASRSpeechTranslationEvent)initWithJSON:(id)a3
{
  void *v4;
  LTSchemaASRSpeechTranslationEvent *v5;
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
    self = -[LTSchemaASRSpeechTranslationEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LTSchemaASRSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4;
  LTSchemaASRSpeechTranslationEvent *v5;
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
  LTSchemaASRSpeechTranslationEvent *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LTSchemaASRSpeechTranslationEvent;
  v5 = -[LTSchemaASRSpeechTranslationEvent init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[LTSchemaASRSpeechTranslationEvent setRequestID:](v5, "setRequestID:", v7);

    }
    v20 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectedLocale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[LTSchemaASRSpeechTranslationEvent setSelectedLocale:](v5, "setSelectedLocale:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToFirstPartialMs"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaASRSpeechTranslationEvent setTimeToFirstPartialMs:](v5, "setTimeToFirstPartialMs:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToFinalResultMs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaASRSpeechTranslationEvent setTimeToFinalResultMs:](v5, "setTimeToFinalResultMs:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latencyFinalResultMs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaASRSpeechTranslationEvent setLatencyFinalResultMs:](v5, "setLatencyFinalResultMs:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToSendFirstAudioPacket"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaASRSpeechTranslationEvent setTimeToSendFirstAudioPacket:](v5, "setTimeToSendFirstAudioPacket:", objc_msgSend(v13, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToReceiveFirstAudioPacket"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaASRSpeechTranslationEvent setTimeToReceiveFirstAudioPacket:](v5, "setTimeToReceiveFirstAudioPacket:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAudioPacket"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaASRSpeechTranslationEvent setNumAudioPacket:](v5, "setNumAudioPacket:", objc_msgSend(v15, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToSendFinishAudio"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaASRSpeechTranslationEvent setTimeToSendFinishAudio:](v5, "setTimeToSendFinishAudio:", objc_msgSend(v16, "unsignedIntValue"));
    v17 = v5;

  }
  return v5;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)selectedLocale
{
  return self->_selectedLocale;
}

- (void)setSelectedLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)timeToFirstPartialMs
{
  return self->_timeToFirstPartialMs;
}

- (unsigned)timeToFinalResultMs
{
  return self->_timeToFinalResultMs;
}

- (unsigned)latencyFinalResultMs
{
  return self->_latencyFinalResultMs;
}

- (unsigned)timeToSendFirstAudioPacket
{
  return self->_timeToSendFirstAudioPacket;
}

- (unsigned)timeToReceiveFirstAudioPacket
{
  return self->_timeToReceiveFirstAudioPacket;
}

- (unsigned)numAudioPacket
{
  return self->_numAudioPacket;
}

- (unsigned)timeToSendFinishAudio
{
  return self->_timeToSendFinishAudio;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSelectedLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
