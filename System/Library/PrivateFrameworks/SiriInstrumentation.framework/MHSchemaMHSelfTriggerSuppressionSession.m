@implementation MHSchemaMHSelfTriggerSuppressionSession

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumSelfTriggersDetectedInSession:(unsigned int)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 1u;
  self->_numSelfTriggersDetectedInSession = a3;
}

- (BOOL)hasNumSelfTriggersDetectedInSession
{
  return *(&self->_isBuiltInSpeakerActive + 1);
}

- (void)setHasNumSelfTriggersDetectedInSession:(BOOL)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xFE | a3;
}

- (void)deleteNumSelfTriggersDetectedInSession
{
  -[MHSchemaMHSelfTriggerSuppressionSession setNumSelfTriggersDetectedInSession:](self, "setNumSelfTriggersDetectedInSession:", 0);
  *(&self->_isBuiltInSpeakerActive + 1) &= ~1u;
}

- (void)setSessionDurationInSeconds:(double)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 2u;
  self->_sessionDurationInSeconds = a3;
}

- (BOOL)hasSessionDurationInSeconds
{
  return (*((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1) >> 1) & 1;
}

- (void)setHasSessionDurationInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xFD | v3;
}

- (void)deleteSessionDurationInSeconds
{
  -[MHSchemaMHSelfTriggerSuppressionSession setSessionDurationInSeconds:](self, "setSessionDurationInSeconds:", 0.0);
  *(&self->_isBuiltInSpeakerActive + 1) &= ~2u;
}

- (void)setAudioSource:(int)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 4u;
  self->_audioSource = a3;
}

- (BOOL)hasAudioSource
{
  return (*((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1) >> 2) & 1;
}

- (void)setHasAudioSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xFB | v3;
}

- (void)deleteAudioSource
{
  -[MHSchemaMHSelfTriggerSuppressionSession setAudioSource:](self, "setAudioSource:", 0);
  *(&self->_isBuiltInSpeakerActive + 1) &= ~4u;
}

- (void)setIsBluetoothSpeakerActive:(BOOL)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 8u;
  self->_isBluetoothSpeakerActive = a3;
}

- (BOOL)hasIsBluetoothSpeakerActive
{
  return (*((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1) >> 3) & 1;
}

- (void)setHasIsBluetoothSpeakerActive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xF7 | v3;
}

- (void)deleteIsBluetoothSpeakerActive
{
  -[MHSchemaMHSelfTriggerSuppressionSession setIsBluetoothSpeakerActive:](self, "setIsBluetoothSpeakerActive:", 0);
  *(&self->_isBuiltInSpeakerActive + 1) &= ~8u;
}

- (void)setIsBuiltInSpeakerActive:(BOOL)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 0x10u;
  self->_isBuiltInSpeakerActive = a3;
}

- (BOOL)hasIsBuiltInSpeakerActive
{
  return (*((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1) >> 4) & 1;
}

- (void)setHasIsBuiltInSpeakerActive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xEF | v3;
}

- (void)deleteIsBuiltInSpeakerActive
{
  -[MHSchemaMHSelfTriggerSuppressionSession setIsBuiltInSpeakerActive:](self, "setIsBuiltInSpeakerActive:", 0);
  *(&self->_isBuiltInSpeakerActive + 1) &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHSelfTriggerSuppressionSessionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = *(&self->_isBuiltInSpeakerActive + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(&self->_isBuiltInSpeakerActive + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isBuiltInSpeakerActive + 1) & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v4 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int numSelfTriggersDetectedInSession;
  int v8;
  double sessionDurationInSeconds;
  double v10;
  int v11;
  int audioSource;
  int v13;
  int isBluetoothSpeakerActive;
  int v15;
  int isBuiltInSpeakerActive;
  BOOL v17;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
  v6 = v4[30];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_22;
  if ((v5 & 1) != 0)
  {
    numSelfTriggersDetectedInSession = self->_numSelfTriggersDetectedInSession;
    if (numSelfTriggersDetectedInSession != objc_msgSend(v4, "numSelfTriggersDetectedInSession"))
      goto LABEL_22;
    v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
    v6 = v4[30];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v8)
  {
    sessionDurationInSeconds = self->_sessionDurationInSeconds;
    objc_msgSend(v4, "sessionDurationInSeconds");
    if (sessionDurationInSeconds != v10)
      goto LABEL_22;
    v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
    v6 = v4[30];
  }
  v11 = (v5 >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1))
    goto LABEL_22;
  if (v11)
  {
    audioSource = self->_audioSource;
    if (audioSource != objc_msgSend(v4, "audioSource"))
      goto LABEL_22;
    v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
    v6 = v4[30];
  }
  v13 = (v5 >> 3) & 1;
  if (v13 != ((v6 >> 3) & 1))
    goto LABEL_22;
  if (v13)
  {
    isBluetoothSpeakerActive = self->_isBluetoothSpeakerActive;
    if (isBluetoothSpeakerActive == objc_msgSend(v4, "isBluetoothSpeakerActive"))
    {
      v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
      v6 = v4[30];
      goto LABEL_18;
    }
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
LABEL_18:
  v15 = (v5 >> 4) & 1;
  if (v15 != ((v6 >> 4) & 1))
    goto LABEL_22;
  if (v15)
  {
    isBuiltInSpeakerActive = self->_isBuiltInSpeakerActive;
    if (isBuiltInSpeakerActive != objc_msgSend(v4, "isBuiltInSpeakerActive"))
      goto LABEL_22;
  }
  v17 = 1;
LABEL_23:

  return v17;
}

- (unint64_t)hash
{
  char v3;
  uint64_t v4;
  double sessionDurationInSeconds;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v3 & 1) != 0)
  {
    v4 = 2654435761 * self->_numSelfTriggersDetectedInSession;
    if ((*(&self->_isBuiltInSpeakerActive + 1) & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(&self->_isBuiltInSpeakerActive + 1) & 2) == 0)
    goto LABEL_8;
LABEL_3:
  sessionDurationInSeconds = self->_sessionDurationInSeconds;
  v6 = -sessionDurationInSeconds;
  if (sessionDurationInSeconds >= 0.0)
    v6 = self->_sessionDurationInSeconds;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((v3 & 4) == 0)
  {
    v10 = 0;
    if ((v3 & 8) != 0)
      goto LABEL_13;
LABEL_16:
    v11 = 0;
    if ((v3 & 0x10) != 0)
      goto LABEL_14;
LABEL_17:
    v12 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  v10 = 2654435761 * self->_audioSource;
  if ((v3 & 8) == 0)
    goto LABEL_16;
LABEL_13:
  v11 = 2654435761 * self->_isBluetoothSpeakerActive;
  if ((v3 & 0x10) == 0)
    goto LABEL_17;
LABEL_14:
  v12 = 2654435761 * self->_isBuiltInSpeakerActive;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v4 & 4) != 0)
  {
    v5 = -[MHSchemaMHSelfTriggerSuppressionSession audioSource](self, "audioSource");
    v6 = CFSTR("MHSELFTRIGGERSUPPRESSIONAUDIOSOURCE_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("MHSELFTRIGGERSUPPRESSIONAUDIOSOURCE_AUDIO_VIDEO_VOICE_CONTROLLER");
    if (v5 == 2)
      v7 = CFSTR("MHSELFTRIGGERSUPPRESSIONAUDIOSOURCE_AUDIO_TAP");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioSource"));
    v4 = *(&self->_isBuiltInSpeakerActive + 1);
  }
  if ((v4 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHSelfTriggerSuppressionSession isBluetoothSpeakerActive](self, "isBluetoothSpeakerActive"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isBluetoothSpeakerActive"));

    v4 = *(&self->_isBuiltInSpeakerActive + 1);
    if ((v4 & 0x10) == 0)
    {
LABEL_10:
      if ((v4 & 1) == 0)
        goto LABEL_11;
LABEL_16:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHSelfTriggerSuppressionSession numSelfTriggersDetectedInSession](self, "numSelfTriggersDetectedInSession"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numSelfTriggersDetectedInSession"));

      if ((*(&self->_isBuiltInSpeakerActive + 1) & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHSelfTriggerSuppressionSession isBuiltInSpeakerActive](self, "isBuiltInSpeakerActive"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isBuiltInSpeakerActive"));

  v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v4 & 1) != 0)
    goto LABEL_16;
LABEL_11:
  if ((v4 & 2) != 0)
  {
LABEL_12:
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHSelfTriggerSuppressionSession sessionDurationInSeconds](self, "sessionDurationInSeconds");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sessionDurationInSeconds"));

  }
LABEL_13:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHSelfTriggerSuppressionSession dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHSelfTriggerSuppressionSession)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHSelfTriggerSuppressionSession *v5;
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
    self = -[MHSchemaMHSelfTriggerSuppressionSession initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHSelfTriggerSuppressionSession)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHSelfTriggerSuppressionSession *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MHSchemaMHSelfTriggerSuppressionSession *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHSelfTriggerSuppressionSession;
  v5 = -[MHSchemaMHSelfTriggerSuppressionSession init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelfTriggersDetectedInSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHSelfTriggerSuppressionSession setNumSelfTriggersDetectedInSession:](v5, "setNumSelfTriggersDetectedInSession:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionDurationInSeconds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[MHSchemaMHSelfTriggerSuppressionSession setSessionDurationInSeconds:](v5, "setSessionDurationInSeconds:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHSelfTriggerSuppressionSession setAudioSource:](v5, "setAudioSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isBluetoothSpeakerActive"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHSelfTriggerSuppressionSession setIsBluetoothSpeakerActive:](v5, "setIsBluetoothSpeakerActive:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isBuiltInSpeakerActive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHSelfTriggerSuppressionSession setIsBuiltInSpeakerActive:](v5, "setIsBuiltInSpeakerActive:", objc_msgSend(v10, "BOOLValue"));
    v11 = v5;

  }
  return v5;
}

- (unsigned)numSelfTriggersDetectedInSession
{
  return self->_numSelfTriggersDetectedInSession;
}

- (double)sessionDurationInSeconds
{
  return self->_sessionDurationInSeconds;
}

- (int)audioSource
{
  return self->_audioSource;
}

- (BOOL)isBluetoothSpeakerActive
{
  return self->_isBluetoothSpeakerActive;
}

- (BOOL)isBuiltInSpeakerActive
{
  return self->_isBuiltInSpeakerActive;
}

@end
