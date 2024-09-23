@implementation CDASchemaCDAScoreBoosters

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setDeviceBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_deviceBoost = a3;
}

- (BOOL)hasDeviceBoost
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasDeviceBoost:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteDeviceBoost
{
  -[CDASchemaCDAScoreBoosters setDeviceBoost:](self, "setDeviceBoost:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setRecentUnlockBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_recentUnlockBoost = a3;
}

- (BOOL)hasRecentUnlockBoost
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasRecentUnlockBoost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteRecentUnlockBoost
{
  -[CDASchemaCDAScoreBoosters setRecentUnlockBoost:](self, "setRecentUnlockBoost:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setRecentRaiseToWakeBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_recentRaiseToWakeBoost = a3;
}

- (BOOL)hasRecentRaiseToWakeBoost
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasRecentRaiseToWakeBoost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteRecentRaiseToWakeBoost
{
  -[CDASchemaCDAScoreBoosters setRecentRaiseToWakeBoost:](self, "setRecentRaiseToWakeBoost:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setRecentSiriRequestBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_recentSiriRequestBoost = a3;
}

- (BOOL)hasRecentSiriRequestBoost
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasRecentSiriRequestBoost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteRecentSiriRequestBoost
{
  -[CDASchemaCDAScoreBoosters setRecentSiriRequestBoost:](self, "setRecentSiriRequestBoost:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setRecentMotionBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_recentMotionBoost = a3;
}

- (BOOL)hasRecentMotionBoost
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasRecentMotionBoost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteRecentMotionBoost
{
  -[CDASchemaCDAScoreBoosters setRecentMotionBoost:](self, "setRecentMotionBoost:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setRecentPlaybackBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_recentPlaybackBoost = a3;
}

- (BOOL)hasRecentPlaybackBoost
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasRecentPlaybackBoost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteRecentPlaybackBoost
{
  -[CDASchemaCDAScoreBoosters setRecentPlaybackBoost:](self, "setRecentPlaybackBoost:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setIsTrump:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isTrump = a3;
}

- (BOOL)hasIsTrump
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsTrump:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteIsTrump
{
  -[CDASchemaCDAScoreBoosters setIsTrump:](self, "setIsTrump:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setTrumpReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_trumpReason = a3;
}

- (BOOL)hasTrumpReason
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasTrumpReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteTrumpReason
{
  -[CDASchemaCDAScoreBoosters setTrumpReason:](self, "setTrumpReason:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setRecentAlarmBoost:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_recentAlarmBoost = a3;
}

- (BOOL)hasRecentAlarmBoost
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasRecentAlarmBoost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteRecentAlarmBoost
{
  -[CDASchemaCDAScoreBoosters setRecentAlarmBoost:](self, "setRecentAlarmBoost:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAScoreBoostersReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $7FDC7EBAFB6615D238A9123E7C98239A has;
  unsigned int v6;
  unsigned int deviceBoost;
  int v8;
  unsigned int recentUnlockBoost;
  int v10;
  unsigned int recentRaiseToWakeBoost;
  int v12;
  unsigned int recentSiriRequestBoost;
  int v14;
  unsigned int recentMotionBoost;
  int v16;
  unsigned int recentPlaybackBoost;
  int v18;
  int isTrump;
  int v20;
  int trumpReason;
  int v22;
  unsigned int recentAlarmBoost;
  BOOL v24;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  has = self->_has;
  v6 = v4[22];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_38;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    deviceBoost = self->_deviceBoost;
    if (deviceBoost != objc_msgSend(v4, "deviceBoost"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_38;
  if (v8)
  {
    recentUnlockBoost = self->_recentUnlockBoost;
    if (recentUnlockBoost != objc_msgSend(v4, "recentUnlockBoost"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_38;
  if (v10)
  {
    recentRaiseToWakeBoost = self->_recentRaiseToWakeBoost;
    if (recentRaiseToWakeBoost != objc_msgSend(v4, "recentRaiseToWakeBoost"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_38;
  if (v12)
  {
    recentSiriRequestBoost = self->_recentSiriRequestBoost;
    if (recentSiriRequestBoost != objc_msgSend(v4, "recentSiriRequestBoost"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_38;
  if (v14)
  {
    recentMotionBoost = self->_recentMotionBoost;
    if (recentMotionBoost != objc_msgSend(v4, "recentMotionBoost"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_38;
  if (v16)
  {
    recentPlaybackBoost = self->_recentPlaybackBoost;
    if (recentPlaybackBoost != objc_msgSend(v4, "recentPlaybackBoost"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_38;
  if (v18)
  {
    isTrump = self->_isTrump;
    if (isTrump != objc_msgSend(v4, "isTrump"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_38;
  if (v20)
  {
    trumpReason = self->_trumpReason;
    if (trumpReason == objc_msgSend(v4, "trumpReason"))
    {
      has = self->_has;
      v6 = v4[22];
      goto LABEL_34;
    }
LABEL_38:
    v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_38;
  if (v22)
  {
    recentAlarmBoost = self->_recentAlarmBoost;
    if (recentAlarmBoost != objc_msgSend(v4, "recentAlarmBoost"))
      goto LABEL_38;
  }
  v24 = 1;
LABEL_39:

  return v24;
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

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761 * self->_deviceBoost;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_recentUnlockBoost;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_13;
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
    v5 = 2654435761 * self->_recentRaiseToWakeBoost;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_recentSiriRequestBoost;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_recentMotionBoost;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_recentPlaybackBoost;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_isTrump;
    if ((has & 0x80) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  v9 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761 * self->_trumpReason;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_recentAlarmBoost;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters deviceBoost](self, "deviceBoost"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceBoost"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CDASchemaCDAScoreBoosters isTrump](self, "isTrump"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isTrump"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentAlarmBoost](self, "recentAlarmBoost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("recentAlarmBoost"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentMotionBoost](self, "recentMotionBoost"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("recentMotionBoost"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentPlaybackBoost](self, "recentPlaybackBoost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("recentPlaybackBoost"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentRaiseToWakeBoost](self, "recentRaiseToWakeBoost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("recentRaiseToWakeBoost"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentUnlockBoost](self, "recentUnlockBoost"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("recentUnlockBoost"));

    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_19;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAScoreBoosters recentSiriRequestBoost](self, "recentSiriRequestBoost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("recentSiriRequestBoost"));

  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_18;
LABEL_9:
  if ((has & 0x80) == 0)
    goto LABEL_23;
LABEL_19:
  v13 = -[CDASchemaCDAScoreBoosters trumpReason](self, "trumpReason") - 1;
  if (v13 > 7)
    v14 = CFSTR("CDATRUMPREASON_UNKNOWN");
  else
    v14 = off_1E562BED0[v13];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("trumpReason"));
LABEL_23:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CDASchemaCDAScoreBoosters dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CDASchemaCDAScoreBoosters)initWithJSON:(id)a3
{
  void *v4;
  CDASchemaCDAScoreBoosters *v5;
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
    self = -[CDASchemaCDAScoreBoosters initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CDASchemaCDAScoreBoosters)initWithDictionary:(id)a3
{
  id v4;
  CDASchemaCDAScoreBoosters *v5;
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
  CDASchemaCDAScoreBoosters *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CDASchemaCDAScoreBoosters;
  v5 = -[CDASchemaCDAScoreBoosters init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceBoost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAScoreBoosters setDeviceBoost:](v5, "setDeviceBoost:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recentUnlockBoost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAScoreBoosters setRecentUnlockBoost:](v5, "setRecentUnlockBoost:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recentRaiseToWakeBoost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAScoreBoosters setRecentRaiseToWakeBoost:](v5, "setRecentRaiseToWakeBoost:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recentSiriRequestBoost"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAScoreBoosters setRecentSiriRequestBoost:](v5, "setRecentSiriRequestBoost:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recentMotionBoost"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAScoreBoosters setRecentMotionBoost:](v5, "setRecentMotionBoost:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recentPlaybackBoost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAScoreBoosters setRecentPlaybackBoost:](v5, "setRecentPlaybackBoost:", objc_msgSend(v11, "unsignedIntValue"));
    v19 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTrump"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAScoreBoosters setIsTrump:](v5, "setIsTrump:", objc_msgSend(v12, "BOOLValue"));
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trumpReason"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAScoreBoosters setTrumpReason:](v5, "setTrumpReason:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recentAlarmBoost"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAScoreBoosters setRecentAlarmBoost:](v5, "setRecentAlarmBoost:", objc_msgSend(v15, "unsignedIntValue"));
    v16 = v5;

  }
  return v5;
}

- (unsigned)deviceBoost
{
  return self->_deviceBoost;
}

- (unsigned)recentUnlockBoost
{
  return self->_recentUnlockBoost;
}

- (unsigned)recentRaiseToWakeBoost
{
  return self->_recentRaiseToWakeBoost;
}

- (unsigned)recentSiriRequestBoost
{
  return self->_recentSiriRequestBoost;
}

- (unsigned)recentMotionBoost
{
  return self->_recentMotionBoost;
}

- (unsigned)recentPlaybackBoost
{
  return self->_recentPlaybackBoost;
}

- (BOOL)isTrump
{
  return self->_isTrump;
}

- (int)trumpReason
{
  return self->_trumpReason;
}

- (unsigned)recentAlarmBoost
{
  return self->_recentAlarmBoost;
}

@end
