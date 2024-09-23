@implementation SISchemaPNRTextToSpeechRequestReceived

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasVoiceAssetKey
{
  return self->_voiceAssetKey != 0;
}

- (void)deleteVoiceAssetKey
{
  -[SISchemaPNRTextToSpeechRequestReceived setVoiceAssetKey:](self, "setVoiceAssetKey:", 0);
}

- (BOOL)hasVoiceResourceAssetKey
{
  return self->_voiceResourceAssetKey != 0;
}

- (void)deleteVoiceResourceAssetKey
{
  -[SISchemaPNRTextToSpeechRequestReceived setVoiceResourceAssetKey:](self, "setVoiceResourceAssetKey:", 0);
}

- (void)setIsWarmStart:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isWarmStart = a3;
}

- (BOOL)hasIsWarmStart
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsWarmStart:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsWarmStart
{
  -[SISchemaPNRTextToSpeechRequestReceived setIsWarmStart:](self, "setIsWarmStart:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsSynthesisCached:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isSynthesisCached = a3;
}

- (BOOL)hasIsSynthesisCached
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsSynthesisCached:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsSynthesisCached
{
  -[SISchemaPNRTextToSpeechRequestReceived setIsSynthesisCached:](self, "setIsSynthesisCached:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSourceOfTTS:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sourceOfTTS = a3;
}

- (BOOL)hasSourceOfTTS
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSourceOfTTS:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSourceOfTTS
{
  -[SISchemaPNRTextToSpeechRequestReceived setSourceOfTTS:](self, "setSourceOfTTS:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setSpeechError:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_speechError = a3;
}

- (BOOL)hasSpeechError
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSpeechError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteSpeechError
{
  -[SISchemaPNRTextToSpeechRequestReceived setSpeechError:](self, "setSpeechError:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaPNRTextToSpeechRequestReceivedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaPNRTextToSpeechRequestReceived voiceAssetKey](self, "voiceAssetKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaPNRTextToSpeechRequestReceived voiceResourceAssetKey](self, "voiceResourceAssetKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v7 = v8;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = v8;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteInt32Field();
      v7 = v8;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }
LABEL_10:

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
  $43E87A8505A4D46BEA580963216D60C1 has;
  unsigned int v20;
  int isWarmStart;
  int v22;
  int isSynthesisCached;
  int v24;
  int sourceOfTTS;
  int v26;
  int speechError;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SISchemaPNRTextToSpeechRequestReceived voiceAssetKey](self, "voiceAssetKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceAssetKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaPNRTextToSpeechRequestReceived voiceAssetKey](self, "voiceAssetKey");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaPNRTextToSpeechRequestReceived voiceAssetKey](self, "voiceAssetKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceAssetKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaPNRTextToSpeechRequestReceived voiceResourceAssetKey](self, "voiceResourceAssetKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceResourceAssetKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[SISchemaPNRTextToSpeechRequestReceived voiceResourceAssetKey](self, "voiceResourceAssetKey");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaPNRTextToSpeechRequestReceived voiceResourceAssetKey](self, "voiceResourceAssetKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceResourceAssetKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[36];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      isWarmStart = self->_isWarmStart;
      if (isWarmStart != objc_msgSend(v4, "isWarmStart"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[36];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        isSynthesisCached = self->_isSynthesisCached;
        if (isSynthesisCached != objc_msgSend(v4, "isSynthesisCached"))
          goto LABEL_12;
        has = self->_has;
        v20 = v4[36];
      }
      v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (v24)
        {
          sourceOfTTS = self->_sourceOfTTS;
          if (sourceOfTTS != objc_msgSend(v4, "sourceOfTTS"))
            goto LABEL_12;
          has = self->_has;
          v20 = v4[36];
        }
        v26 = (*(unsigned int *)&has >> 3) & 1;
        if (v26 == ((v20 >> 3) & 1))
        {
          if (!v26 || (speechError = self->_speechError, speechError == objc_msgSend(v4, "speechError")))
          {
            v17 = 1;
            goto LABEL_13;
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

  v3 = -[NSString hash](self->_voiceAssetKey, "hash");
  v4 = -[NSString hash](self->_voiceResourceAssetKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_isWarmStart;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_isSynthesisCached;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v7 = 2654435761 * self->_sourceOfTTS;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v8 = 2654435761 * self->_speechError;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaPNRTextToSpeechRequestReceived isSynthesisCached](self, "isSynthesisCached"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isSynthesisCached"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaPNRTextToSpeechRequestReceived isWarmStart](self, "isWarmStart"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isWarmStart"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_12;
  }
LABEL_8:
  v7 = -[SISchemaPNRTextToSpeechRequestReceived sourceOfTTS](self, "sourceOfTTS") - 1;
  if (v7 > 4)
    v8 = CFSTR("PNRSOURCEOFTTS_UNKNOWN_SOURCE_OF_TTS");
  else
    v8 = off_1E5636E58[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sourceOfTTS"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    v9 = -[SISchemaPNRTextToSpeechRequestReceived speechError](self, "speechError") - 1;
    if (v9 > 0xF)
      v10 = CFSTR("PNRSPEECHERROR_UNKNOWN_SPEECH_ERROR");
    else
      v10 = off_1E5636E80[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("speechError"));
  }
LABEL_16:
  if (self->_voiceAssetKey)
  {
    -[SISchemaPNRTextToSpeechRequestReceived voiceAssetKey](self, "voiceAssetKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("voiceAssetKey"));

  }
  if (self->_voiceResourceAssetKey)
  {
    -[SISchemaPNRTextToSpeechRequestReceived voiceResourceAssetKey](self, "voiceResourceAssetKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("voiceResourceAssetKey"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaPNRTextToSpeechRequestReceived dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaPNRTextToSpeechRequestReceived)initWithJSON:(id)a3
{
  void *v4;
  SISchemaPNRTextToSpeechRequestReceived *v5;
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
    self = -[SISchemaPNRTextToSpeechRequestReceived initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaPNRTextToSpeechRequestReceived)initWithDictionary:(id)a3
{
  id v4;
  SISchemaPNRTextToSpeechRequestReceived *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SISchemaPNRTextToSpeechRequestReceived *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaPNRTextToSpeechRequestReceived;
  v5 = -[SISchemaPNRTextToSpeechRequestReceived init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceAssetKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaPNRTextToSpeechRequestReceived setVoiceAssetKey:](v5, "setVoiceAssetKey:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceResourceAssetKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaPNRTextToSpeechRequestReceived setVoiceResourceAssetKey:](v5, "setVoiceResourceAssetKey:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWarmStart"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaPNRTextToSpeechRequestReceived setIsWarmStart:](v5, "setIsWarmStart:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSynthesisCached"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaPNRTextToSpeechRequestReceived setIsSynthesisCached:](v5, "setIsSynthesisCached:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceOfTTS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaPNRTextToSpeechRequestReceived setSourceOfTTS:](v5, "setSourceOfTTS:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechError"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaPNRTextToSpeechRequestReceived setSpeechError:](v5, "setSpeechError:", objc_msgSend(v13, "intValue"));
    v14 = v5;

  }
  return v5;
}

- (NSString)voiceAssetKey
{
  return self->_voiceAssetKey;
}

- (void)setVoiceAssetKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)voiceResourceAssetKey
{
  return self->_voiceResourceAssetKey;
}

- (void)setVoiceResourceAssetKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isWarmStart
{
  return self->_isWarmStart;
}

- (BOOL)isSynthesisCached
{
  return self->_isSynthesisCached;
}

- (int)sourceOfTTS
{
  return self->_sourceOfTTS;
}

- (int)speechError
{
  return self->_speechError;
}

- (void)setHasVoiceAssetKey:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasVoiceResourceAssetKey:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceResourceAssetKey, 0);
  objc_storeStrong((id *)&self->_voiceAssetKey, 0);
}

@end
