@implementation INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsDeviceLockStatus:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_isDeviceLockStatus = a3;
}

- (BOOL)hasIsDeviceLockStatus
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasIsDeviceLockStatus:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteIsDeviceLockStatus
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setIsDeviceLockStatus:](self, "setIsDeviceLockStatus:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setDeviceMotionState:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deviceMotionState = a3;
}

- (BOOL)hasDeviceMotionState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasDeviceMotionState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteDeviceMotionState
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setDeviceMotionState:](self, "setDeviceMotionState:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setIntentType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_intentType = a3;
}

- (BOOL)hasIntentType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasIntentType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteIntentType
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setIntentType:](self, "setIntentType:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setNowPlayingState:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_nowPlayingState = a3;
}

- (BOOL)hasNowPlayingState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasNowPlayingState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteNowPlayingState
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setNowPlayingState:](self, "setNowPlayingState:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setDeviceClass:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_deviceClass = a3;
}

- (BOOL)hasDeviceClass
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteDeviceClass
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setDeviceClass:](self, "setDeviceClass:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setClientHourOfDay:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_clientHourOfDay = a3;
}

- (BOOL)hasClientHourOfDay
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasClientHourOfDay:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteClientHourOfDay
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientHourOfDay:](self, "setClientHourOfDay:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setClientLocale:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_clientLocale = a3;
}

- (BOOL)hasClientLocale
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasClientLocale:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteClientLocale
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientLocale:](self, "setClientLocale:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setClientLanguage:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_clientLanguage = a3;
}

- (BOOL)hasClientLanguage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasClientLanguage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteClientLanguage
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientLanguage:](self, "setClientLanguage:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setClientRegion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_clientRegion = a3;
}

- (BOOL)hasClientRegion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasClientRegion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteClientRegion
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientRegion:](self, "setClientRegion:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setBucketedDeviceMotionState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_bucketedDeviceMotionState = a3;
}

- (BOOL)hasBucketedDeviceMotionState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasBucketedDeviceMotionState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteBucketedDeviceMotionState
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setBucketedDeviceMotionState:](self, "setBucketedDeviceMotionState:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
LABEL_21:
    PBDataWriterWriteInt64Field();
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x200) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $C5A00BAA0C83D70C2345CCD5F989A571 has;
  unsigned int v6;
  int isDeviceLockStatus;
  int v8;
  int deviceMotionState;
  int v10;
  int intentType;
  int v12;
  int nowPlayingState;
  int v14;
  int deviceClass;
  int v16;
  int clientHourOfDay;
  int v18;
  int64_t clientLocale;
  int v20;
  int64_t clientLanguage;
  int v22;
  int64_t clientRegion;
  int v24;
  int bucketedDeviceMotionState;
  BOOL v26;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  has = self->_has;
  v6 = v4[30];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_42;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isDeviceLockStatus = self->_isDeviceLockStatus;
    if (isDeviceLockStatus != objc_msgSend(v4, "isDeviceLockStatus"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[30];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_42;
  if (v8)
  {
    deviceMotionState = self->_deviceMotionState;
    if (deviceMotionState != objc_msgSend(v4, "deviceMotionState"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[30];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_42;
  if (v10)
  {
    intentType = self->_intentType;
    if (intentType != objc_msgSend(v4, "intentType"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[30];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_42;
  if (v12)
  {
    nowPlayingState = self->_nowPlayingState;
    if (nowPlayingState != objc_msgSend(v4, "nowPlayingState"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[30];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_42;
  if (v14)
  {
    deviceClass = self->_deviceClass;
    if (deviceClass != objc_msgSend(v4, "deviceClass"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[30];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_42;
  if (v16)
  {
    clientHourOfDay = self->_clientHourOfDay;
    if (clientHourOfDay != objc_msgSend(v4, "clientHourOfDay"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[30];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_42;
  if (v18)
  {
    clientLocale = self->_clientLocale;
    if (clientLocale != objc_msgSend(v4, "clientLocale"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[30];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_42;
  if (v20)
  {
    clientLanguage = self->_clientLanguage;
    if (clientLanguage != objc_msgSend(v4, "clientLanguage"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[30];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_42;
  if (v22)
  {
    clientRegion = self->_clientRegion;
    if (clientRegion == objc_msgSend(v4, "clientRegion"))
    {
      has = self->_has;
      v6 = v4[30];
      goto LABEL_38;
    }
LABEL_42:
    v26 = 0;
    goto LABEL_43;
  }
LABEL_38:
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_42;
  if (v24)
  {
    bucketedDeviceMotionState = self->_bucketedDeviceMotionState;
    if (bucketedDeviceMotionState != objc_msgSend(v4, "bucketedDeviceMotionState"))
      goto LABEL_42;
  }
  v26 = 1;
LABEL_43:

  return v26;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761 * self->_isDeviceLockStatus;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_deviceMotionState;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_intentType;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_nowPlayingState;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_deviceClass;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_clientHourOfDay;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_clientLocale;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_clientLanguage;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761 * self->_clientRegion;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_bucketedDeviceMotionState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals bucketedDeviceMotionState](self, "bucketedDeviceMotionState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bucketedDeviceMotionState"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals clientHourOfDay](self, "clientHourOfDay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("clientHourOfDay"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals clientLanguage](self, "clientLanguage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientLanguage"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals clientLocale](self, "clientLocale"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("clientLocale"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals clientRegion](self, "clientRegion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("clientRegion"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals deviceClass](self, "deviceClass"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("deviceClass"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals deviceMotionState](self, "deviceMotionState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("deviceMotionState"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals isDeviceLockStatus](self, "isDeviceLockStatus"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isDeviceLockStatus"));

    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals intentType](self, "intentType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("intentType"));

  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 8) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals nowPlayingState](self, "nowPlayingState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("nowPlayingState"));

  }
LABEL_12:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals *v5;
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
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals;
  v5 = -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDeviceLockStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setIsDeviceLockStatus:](v5, "setIsDeviceLockStatus:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceMotionState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setDeviceMotionState:](v5, "setDeviceMotionState:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setIntentType:](v5, "setIntentType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setNowPlayingState:](v5, "setNowPlayingState:", objc_msgSend(v9, "intValue"));
    v19 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceClass"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setDeviceClass:](v5, "setDeviceClass:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientHourOfDay"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientHourOfDay:](v5, "setClientHourOfDay:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientLocale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientLocale:](v5, "setClientLocale:", objc_msgSend(v12, "longLongValue"));
    v20 = v8;
    v21 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientLanguage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientLanguage:](v5, "setClientLanguage:", objc_msgSend(v13, "longLongValue"));
    v14 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientRegion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientRegion:](v5, "setClientRegion:", objc_msgSend(v15, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bucketedDeviceMotionState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setBucketedDeviceMotionState:](v5, "setBucketedDeviceMotionState:", objc_msgSend(v16, "intValue"));
    v17 = v5;

  }
  return v5;
}

- (BOOL)isDeviceLockStatus
{
  return self->_isDeviceLockStatus;
}

- (int)deviceMotionState
{
  return self->_deviceMotionState;
}

- (int)intentType
{
  return self->_intentType;
}

- (int)nowPlayingState
{
  return self->_nowPlayingState;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (int)clientHourOfDay
{
  return self->_clientHourOfDay;
}

- (int64_t)clientLocale
{
  return self->_clientLocale;
}

- (int64_t)clientLanguage
{
  return self->_clientLanguage;
}

- (int64_t)clientRegion
{
  return self->_clientRegion;
}

- (int)bucketedDeviceMotionState
{
  return self->_bucketedDeviceMotionState;
}

@end
