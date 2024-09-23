@implementation ODDSiriSchemaODDiOSAccessibilityProperties

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsAlwaysListenForHeySiriEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 1u;
  self->_isAlwaysListenForHeySiriEnabled = a3;
}

- (BOOL)hasIsAlwaysListenForHeySiriEnabled
{
  return *(&self->_isAtypicalSpeechEnabled + 1);
}

- (void)setHasIsAlwaysListenForHeySiriEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xFE | a3;
}

- (void)deleteIsAlwaysListenForHeySiriEnabled
{
  -[ODDSiriSchemaODDiOSAccessibilityProperties setIsAlwaysListenForHeySiriEnabled:](self, "setIsAlwaysListenForHeySiriEnabled:", 0);
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~1u;
}

- (void)setSiriPauseTimeState:(int)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 2u;
  self->_siriPauseTimeState = a3;
}

- (BOOL)hasSiriPauseTimeState
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 1) & 1;
}

- (void)setHasSiriPauseTimeState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xFD | v3;
}

- (void)deleteSiriPauseTimeState
{
  -[ODDSiriSchemaODDiOSAccessibilityProperties setSiriPauseTimeState:](self, "setSiriPauseTimeState:", 0);
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~2u;
}

- (void)setIsShowAppsBehindSiriEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 4u;
  self->_isShowAppsBehindSiriEnabled = a3;
}

- (BOOL)hasIsShowAppsBehindSiriEnabled
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 2) & 1;
}

- (void)setHasIsShowAppsBehindSiriEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xFB | v3;
}

- (void)deleteIsShowAppsBehindSiriEnabled
{
  -[ODDSiriSchemaODDiOSAccessibilityProperties setIsShowAppsBehindSiriEnabled:](self, "setIsShowAppsBehindSiriEnabled:", 0);
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~4u;
}

- (void)setSiriSpeechRate:(double)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 8u;
  self->_siriSpeechRate = a3;
}

- (BOOL)hasSiriSpeechRate
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 3) & 1;
}

- (void)setHasSiriSpeechRate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xF7 | v3;
}

- (void)deleteSiriSpeechRate
{
  -[ODDSiriSchemaODDiOSAccessibilityProperties setSiriSpeechRate:](self, "setSiriSpeechRate:", 0.0);
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~8u;
}

- (void)setIsVoiceOverEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 0x10u;
  self->_isVoiceOverEnabled = a3;
}

- (BOOL)hasIsVoiceOverEnabled
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 4) & 1;
}

- (void)setHasIsVoiceOverEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xEF | v3;
}

- (void)deleteIsVoiceOverEnabled
{
  -[ODDSiriSchemaODDiOSAccessibilityProperties setIsVoiceOverEnabled:](self, "setIsVoiceOverEnabled:", 0);
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~0x10u;
}

- (void)setIsTypeToSiriEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 0x20u;
  self->_isTypeToSiriEnabled = a3;
}

- (BOOL)hasIsTypeToSiriEnabled
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 5) & 1;
}

- (void)setHasIsTypeToSiriEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xDF | v3;
}

- (void)deleteIsTypeToSiriEnabled
{
  -[ODDSiriSchemaODDiOSAccessibilityProperties setIsTypeToSiriEnabled:](self, "setIsTypeToSiriEnabled:", 0);
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~0x20u;
}

- (void)setVoiceFeedback:(int)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 0x40u;
  self->_voiceFeedback = a3;
}

- (BOOL)hasVoiceFeedback
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 6) & 1;
}

- (void)setHasVoiceFeedback:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xBF | v3;
}

- (void)deleteVoiceFeedback
{
  -[ODDSiriSchemaODDiOSAccessibilityProperties setVoiceFeedback:](self, "setVoiceFeedback:", 0);
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~0x40u;
}

- (void)setIsAtypicalSpeechEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 0x80u;
  self->_isAtypicalSpeechEnabled = a3;
}

- (BOOL)hasIsAtypicalSpeechEnabled
{
  return *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 7;
}

- (void)setHasIsAtypicalSpeechEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(&self->_isAtypicalSpeechEnabled + 1) = v3 & 0x80 | *(&self->_isAtypicalSpeechEnabled + 1) & 0x7F;
}

- (void)deleteIsAtypicalSpeechEnabled
{
  -[ODDSiriSchemaODDiOSAccessibilityProperties setIsAtypicalSpeechEnabled:](self, "setIsAtypicalSpeechEnabled:", 0);
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDiOSAccessibilityPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = *(&self->_isAtypicalSpeechEnabled + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isAtypicalSpeechEnabled + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    PBDataWriterWriteInt32Field();
    if ((*(&self->_isAtypicalSpeechEnabled + 1) & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    PBDataWriterWriteBOOLField();
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (v4 < 0)
    goto LABEL_17;
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isAlwaysListenForHeySiriEnabled;
  int v8;
  int siriPauseTimeState;
  int v10;
  int isShowAppsBehindSiriEnabled;
  int v12;
  double siriSpeechRate;
  double v14;
  int v15;
  int isVoiceOverEnabled;
  int v17;
  int isTypeToSiriEnabled;
  int v19;
  int voiceFeedback;
  int isAtypicalSpeechEnabled;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
  v6 = v4[41];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_34;
  if ((v5 & 1) != 0)
  {
    isAlwaysListenForHeySiriEnabled = self->_isAlwaysListenForHeySiriEnabled;
    if (isAlwaysListenForHeySiriEnabled != objc_msgSend(v4, "isAlwaysListenForHeySiriEnabled"))
      goto LABEL_34;
    v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    v6 = v4[41];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_34;
  if (v8)
  {
    siriPauseTimeState = self->_siriPauseTimeState;
    if (siriPauseTimeState != objc_msgSend(v4, "siriPauseTimeState"))
      goto LABEL_34;
    v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    v6 = v4[41];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_34;
  if (v10)
  {
    isShowAppsBehindSiriEnabled = self->_isShowAppsBehindSiriEnabled;
    if (isShowAppsBehindSiriEnabled != objc_msgSend(v4, "isShowAppsBehindSiriEnabled"))
      goto LABEL_34;
    v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    v6 = v4[41];
  }
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_34;
  if (v12)
  {
    siriSpeechRate = self->_siriSpeechRate;
    objc_msgSend(v4, "siriSpeechRate");
    if (siriSpeechRate != v14)
      goto LABEL_34;
    v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    v6 = v4[41];
  }
  v15 = (v5 >> 4) & 1;
  if (v15 != ((v6 >> 4) & 1))
    goto LABEL_34;
  if (v15)
  {
    isVoiceOverEnabled = self->_isVoiceOverEnabled;
    if (isVoiceOverEnabled != objc_msgSend(v4, "isVoiceOverEnabled"))
      goto LABEL_34;
    v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    v6 = v4[41];
  }
  v17 = (v5 >> 5) & 1;
  if (v17 != ((v6 >> 5) & 1))
    goto LABEL_34;
  if (v17)
  {
    isTypeToSiriEnabled = self->_isTypeToSiriEnabled;
    if (isTypeToSiriEnabled != objc_msgSend(v4, "isTypeToSiriEnabled"))
      goto LABEL_34;
    v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    v6 = v4[41];
  }
  v19 = (v5 >> 6) & 1;
  if (v19 != ((v6 >> 6) & 1))
    goto LABEL_34;
  if (v19)
  {
    voiceFeedback = self->_voiceFeedback;
    if (voiceFeedback == objc_msgSend(v4, "voiceFeedback"))
    {
      v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
      v6 = v4[41];
      goto LABEL_30;
    }
LABEL_34:
    v22 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ v5) & 0x80) != 0)
    goto LABEL_34;
  if ((v5 & 0x80) != 0)
  {
    isAtypicalSpeechEnabled = self->_isAtypicalSpeechEnabled;
    if (isAtypicalSpeechEnabled != objc_msgSend(v4, "isAtypicalSpeechEnabled"))
      goto LABEL_34;
  }
  v22 = 1;
LABEL_35:

  return v22;
}

- (unint64_t)hash
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double siriSpeechRate;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v3 & 1) != 0)
  {
    v4 = 2654435761 * self->_isAlwaysListenForHeySiriEnabled;
    if ((*(&self->_isAtypicalSpeechEnabled + 1) & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_siriPauseTimeState;
      if ((*(&self->_isAtypicalSpeechEnabled + 1) & 4) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((*(&self->_isAtypicalSpeechEnabled + 1) & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
    if ((*(&self->_isAtypicalSpeechEnabled + 1) & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(&self->_isAtypicalSpeechEnabled + 1) & 4) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_isShowAppsBehindSiriEnabled;
  if ((*(&self->_isAtypicalSpeechEnabled + 1) & 8) == 0)
    goto LABEL_12;
LABEL_5:
  siriSpeechRate = self->_siriSpeechRate;
  v8 = -siriSpeechRate;
  if (siriSpeechRate >= 0.0)
    v8 = self->_siriSpeechRate;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((v3 & 0x10) != 0)
  {
    v12 = 2654435761 * self->_isVoiceOverEnabled;
    if ((v3 & 0x20) != 0)
    {
LABEL_17:
      v13 = 2654435761 * self->_isTypeToSiriEnabled;
      if ((v3 & 0x40) != 0)
        goto LABEL_18;
LABEL_22:
      v14 = 0;
      if (v3 < 0)
        goto LABEL_19;
LABEL_23:
      v15 = 0;
      return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
    }
  }
  else
  {
    v12 = 0;
    if ((v3 & 0x20) != 0)
      goto LABEL_17;
  }
  v13 = 0;
  if ((v3 & 0x40) == 0)
    goto LABEL_22;
LABEL_18:
  v14 = 2654435761 * self->_voiceFeedback;
  if ((v3 & 0x80) == 0)
    goto LABEL_23;
LABEL_19:
  v15 = 2654435761 * self->_isAtypicalSpeechEnabled;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isAlwaysListenForHeySiriEnabled](self, "isAlwaysListenForHeySiriEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isAlwaysListenForHeySiriEnabled"));

    v4 = *(&self->_isAtypicalSpeechEnabled + 1);
    if ((v4 & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isAtypicalSpeechEnabled + 1) & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isAtypicalSpeechEnabled](self, "isAtypicalSpeechEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isAtypicalSpeechEnabled"));

  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isShowAppsBehindSiriEnabled](self, "isShowAppsBehindSiriEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isShowAppsBehindSiriEnabled"));

  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isTypeToSiriEnabled](self, "isTypeToSiriEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isTypeToSiriEnabled"));

  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isVoiceOverEnabled](self, "isVoiceOverEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isVoiceOverEnabled"));

  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 2) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0)
      goto LABEL_8;
LABEL_19:
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[ODDSiriSchemaODDiOSAccessibilityProperties siriSpeechRate](self, "siriSpeechRate");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("siriSpeechRate"));

    if ((*(&self->_isAtypicalSpeechEnabled + 1) & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_20;
  }
LABEL_15:
  v10 = -[ODDSiriSchemaODDiOSAccessibilityProperties siriPauseTimeState](self, "siriPauseTimeState") - 1;
  if (v10 > 2)
    v11 = CFSTR("SIRIPAUSETIMESTATE_UNKNOWN");
  else
    v11 = off_1E563C240[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("siriPauseTimeState"));
  v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 8) != 0)
    goto LABEL_19;
LABEL_8:
  if ((v4 & 0x40) == 0)
    goto LABEL_24;
LABEL_20:
  v14 = -[ODDSiriSchemaODDiOSAccessibilityProperties voiceFeedback](self, "voiceFeedback") - 1;
  if (v14 > 5)
    v15 = CFSTR("VOICEFEEDBACK_UNKNOWN");
  else
    v15 = off_1E563C258[v14];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("voiceFeedback"));
LABEL_24:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDiOSAccessibilityProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDiOSAccessibilityProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDiOSAccessibilityProperties *v5;
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
    self = -[ODDSiriSchemaODDiOSAccessibilityProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDiOSAccessibilityProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDiOSAccessibilityProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ODDSiriSchemaODDiOSAccessibilityProperties *v14;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODDSiriSchemaODDiOSAccessibilityProperties;
  v5 = -[ODDSiriSchemaODDiOSAccessibilityProperties init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAlwaysListenForHeySiriEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsAlwaysListenForHeySiriEnabled:](v5, "setIsAlwaysListenForHeySiriEnabled:", objc_msgSend(v6, "BOOLValue"));
    v16 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriPauseTimeState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDiOSAccessibilityProperties setSiriPauseTimeState:](v5, "setSiriPauseTimeState:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShowAppsBehindSiriEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsShowAppsBehindSiriEnabled:](v5, "setIsShowAppsBehindSiriEnabled:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriSpeechRate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[ODDSiriSchemaODDiOSAccessibilityProperties setSiriSpeechRate:](v5, "setSiriSpeechRate:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isVoiceOverEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsVoiceOverEnabled:](v5, "setIsVoiceOverEnabled:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTypeToSiriEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsTypeToSiriEnabled:](v5, "setIsTypeToSiriEnabled:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceFeedback"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDiOSAccessibilityProperties setVoiceFeedback:](v5, "setVoiceFeedback:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAtypicalSpeechEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsAtypicalSpeechEnabled:](v5, "setIsAtypicalSpeechEnabled:", objc_msgSend(v13, "BOOLValue"));
    v14 = v5;

  }
  return v5;
}

- (BOOL)isAlwaysListenForHeySiriEnabled
{
  return self->_isAlwaysListenForHeySiriEnabled;
}

- (int)siriPauseTimeState
{
  return self->_siriPauseTimeState;
}

- (BOOL)isShowAppsBehindSiriEnabled
{
  return self->_isShowAppsBehindSiriEnabled;
}

- (double)siriSpeechRate
{
  return self->_siriSpeechRate;
}

- (BOOL)isVoiceOverEnabled
{
  return self->_isVoiceOverEnabled;
}

- (BOOL)isTypeToSiriEnabled
{
  return self->_isTypeToSiriEnabled;
}

- (int)voiceFeedback
{
  return self->_voiceFeedback;
}

- (BOOL)isAtypicalSpeechEnabled
{
  return self->_isAtypicalSpeechEnabled;
}

@end
