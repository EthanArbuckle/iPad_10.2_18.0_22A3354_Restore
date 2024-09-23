@implementation CAARSchemaCAARAppHistoryFeatures

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumMinutesSinceAppInstalled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numMinutesSinceAppInstalled = a3;
}

- (BOOL)hasNumMinutesSinceAppInstalled
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasNumMinutesSinceAppInstalled:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteNumMinutesSinceAppInstalled
{
  -[CAARSchemaCAARAppHistoryFeatures setNumMinutesSinceAppInstalled:](self, "setNumMinutesSinceAppInstalled:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setNumMinutesSinceAppLastLaunched:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numMinutesSinceAppLastLaunched = a3;
}

- (BOOL)hasNumMinutesSinceAppLastLaunched
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasNumMinutesSinceAppLastLaunched:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteNumMinutesSinceAppLastLaunched
{
  -[CAARSchemaCAARAppHistoryFeatures setNumMinutesSinceAppLastLaunched:](self, "setNumMinutesSinceAppLastLaunched:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setNumAppLaunchesLastTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numAppLaunchesLastTwoMinutes = a3;
}

- (BOOL)hasNumAppLaunchesLastTwoMinutes
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasNumAppLaunchesLastTwoMinutes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteNumAppLaunchesLastTwoMinutes
{
  -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastTwoMinutes:](self, "setNumAppLaunchesLastTwoMinutes:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setNumAppLaunchesLastTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numAppLaunchesLastTenMinutes = a3;
}

- (BOOL)hasNumAppLaunchesLastTenMinutes
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasNumAppLaunchesLastTenMinutes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteNumAppLaunchesLastTenMinutes
{
  -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastTenMinutes:](self, "setNumAppLaunchesLastTenMinutes:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setNumAppLaunchesLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numAppLaunchesLastOneHour = a3;
}

- (BOOL)hasNumAppLaunchesLastOneHour
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumAppLaunchesLastOneHour:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteNumAppLaunchesLastOneHour
{
  -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastOneHour:](self, "setNumAppLaunchesLastOneHour:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setNumAppLaunchesLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numAppLaunchesLastSixHours = a3;
}

- (BOOL)hasNumAppLaunchesLastSixHours
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumAppLaunchesLastSixHours:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteNumAppLaunchesLastSixHours
{
  -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastSixHours:](self, "setNumAppLaunchesLastSixHours:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setNumAppLaunchesLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numAppLaunchesLastOneDay = a3;
}

- (BOOL)hasNumAppLaunchesLastOneDay
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumAppLaunchesLastOneDay:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteNumAppLaunchesLastOneDay
{
  -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastOneDay:](self, "setNumAppLaunchesLastOneDay:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setNumAppLaunchesLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numAppLaunchesLastSevenDays = a3;
}

- (BOOL)hasNumAppLaunchesLastSevenDays
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumAppLaunchesLastSevenDays:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteNumAppLaunchesLastSevenDays
{
  -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastSevenDays:](self, "setNumAppLaunchesLastSevenDays:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setNumAppLaunchesLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numAppLaunchesLastTwentyEightDays = a3;
}

- (BOOL)hasNumAppLaunchesLastTwentyEightDays
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumAppLaunchesLastTwentyEightDays:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteNumAppLaunchesLastTwentyEightDays
{
  -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastTwentyEightDays:](self, "setNumAppLaunchesLastTwentyEightDays:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setNumAppLaunchesLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numAppLaunchesLastInfinity = a3;
}

- (BOOL)hasNumAppLaunchesLastInfinity
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasNumAppLaunchesLastInfinity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteNumAppLaunchesLastInfinity
{
  -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastInfinity:](self, "setNumAppLaunchesLastInfinity:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARAppHistoryFeaturesReadFrom(self, (uint64_t)a3);
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
      goto LABEL_15;
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
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
LABEL_21:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x200) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field();
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $958F9EC9CB2CC80A4CC5CE126BC74112 has;
  unsigned int v6;
  unsigned int numMinutesSinceAppInstalled;
  int v8;
  unsigned int numMinutesSinceAppLastLaunched;
  int v10;
  unsigned int numAppLaunchesLastTwoMinutes;
  int v12;
  unsigned int numAppLaunchesLastTenMinutes;
  int v14;
  unsigned int numAppLaunchesLastOneHour;
  int v16;
  unsigned int numAppLaunchesLastSixHours;
  int v18;
  unsigned int numAppLaunchesLastOneDay;
  int v20;
  unsigned int numAppLaunchesLastSevenDays;
  int v22;
  unsigned int numAppLaunchesLastTwentyEightDays;
  int v24;
  unsigned int numAppLaunchesLastInfinity;
  BOOL v26;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_42;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numMinutesSinceAppInstalled = self->_numMinutesSinceAppInstalled;
    if (numMinutesSinceAppInstalled != objc_msgSend(v4, "numMinutesSinceAppInstalled"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_42;
  if (v8)
  {
    numMinutesSinceAppLastLaunched = self->_numMinutesSinceAppLastLaunched;
    if (numMinutesSinceAppLastLaunched != objc_msgSend(v4, "numMinutesSinceAppLastLaunched"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_42;
  if (v10)
  {
    numAppLaunchesLastTwoMinutes = self->_numAppLaunchesLastTwoMinutes;
    if (numAppLaunchesLastTwoMinutes != objc_msgSend(v4, "numAppLaunchesLastTwoMinutes"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_42;
  if (v12)
  {
    numAppLaunchesLastTenMinutes = self->_numAppLaunchesLastTenMinutes;
    if (numAppLaunchesLastTenMinutes != objc_msgSend(v4, "numAppLaunchesLastTenMinutes"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_42;
  if (v14)
  {
    numAppLaunchesLastOneHour = self->_numAppLaunchesLastOneHour;
    if (numAppLaunchesLastOneHour != objc_msgSend(v4, "numAppLaunchesLastOneHour"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_42;
  if (v16)
  {
    numAppLaunchesLastSixHours = self->_numAppLaunchesLastSixHours;
    if (numAppLaunchesLastSixHours != objc_msgSend(v4, "numAppLaunchesLastSixHours"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_42;
  if (v18)
  {
    numAppLaunchesLastOneDay = self->_numAppLaunchesLastOneDay;
    if (numAppLaunchesLastOneDay != objc_msgSend(v4, "numAppLaunchesLastOneDay"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_42;
  if (v20)
  {
    numAppLaunchesLastSevenDays = self->_numAppLaunchesLastSevenDays;
    if (numAppLaunchesLastSevenDays != objc_msgSend(v4, "numAppLaunchesLastSevenDays"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_42;
  if (v22)
  {
    numAppLaunchesLastTwentyEightDays = self->_numAppLaunchesLastTwentyEightDays;
    if (numAppLaunchesLastTwentyEightDays == objc_msgSend(v4, "numAppLaunchesLastTwentyEightDays"))
    {
      has = self->_has;
      v6 = v4[24];
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
    numAppLaunchesLastInfinity = self->_numAppLaunchesLastInfinity;
    if (numAppLaunchesLastInfinity != objc_msgSend(v4, "numAppLaunchesLastInfinity"))
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
    v3 = 2654435761 * self->_numMinutesSinceAppInstalled;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_numMinutesSinceAppLastLaunched;
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
    v5 = 2654435761 * self->_numAppLaunchesLastTwoMinutes;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_numAppLaunchesLastTenMinutes;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_numAppLaunchesLastOneHour;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_numAppLaunchesLastSixHours;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_numAppLaunchesLastOneDay;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_numAppLaunchesLastSevenDays;
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
  v11 = 2654435761 * self->_numAppLaunchesLastTwentyEightDays;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_numAppLaunchesLastInfinity;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastInfinity](self, "numAppLaunchesLastInfinity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numAppLaunchesLastInfinity"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastOneDay](self, "numAppLaunchesLastOneDay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numAppLaunchesLastOneDay"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastOneHour](self, "numAppLaunchesLastOneHour"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numAppLaunchesLastOneHour"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastSevenDays](self, "numAppLaunchesLastSevenDays"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numAppLaunchesLastSevenDays"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastSixHours](self, "numAppLaunchesLastSixHours"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numAppLaunchesLastSixHours"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastTenMinutes](self, "numAppLaunchesLastTenMinutes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numAppLaunchesLastTenMinutes"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastTwentyEightDays](self, "numAppLaunchesLastTwentyEightDays"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numAppLaunchesLastTwentyEightDays"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numMinutesSinceAppInstalled](self, "numMinutesSinceAppInstalled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("numMinutesSinceAppInstalled"));

    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numAppLaunchesLastTwoMinutes](self, "numAppLaunchesLastTwoMinutes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numAppLaunchesLastTwoMinutes"));

  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 2) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppHistoryFeatures numMinutesSinceAppLastLaunched](self, "numMinutesSinceAppLastLaunched"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numMinutesSinceAppLastLaunched"));

  }
LABEL_12:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARAppHistoryFeatures dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARAppHistoryFeatures)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARAppHistoryFeatures *v5;
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
    self = -[CAARSchemaCAARAppHistoryFeatures initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARAppHistoryFeatures)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARAppHistoryFeatures *v5;
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
  CAARSchemaCAARAppHistoryFeatures *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CAARSchemaCAARAppHistoryFeatures;
  v5 = -[CAARSchemaCAARAppHistoryFeatures init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numMinutesSinceAppInstalled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumMinutesSinceAppInstalled:](v5, "setNumMinutesSinceAppInstalled:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numMinutesSinceAppLastLaunched"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumMinutesSinceAppLastLaunched:](v5, "setNumMinutesSinceAppLastLaunched:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppLaunchesLastTwoMinutes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastTwoMinutes:](v5, "setNumAppLaunchesLastTwoMinutes:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppLaunchesLastTenMinutes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastTenMinutes:](v5, "setNumAppLaunchesLastTenMinutes:", objc_msgSend(v9, "unsignedIntValue"));
    v19 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppLaunchesLastOneHour"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastOneHour:](v5, "setNumAppLaunchesLastOneHour:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppLaunchesLastSixHours"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastSixHours:](v5, "setNumAppLaunchesLastSixHours:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppLaunchesLastOneDay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastOneDay:](v5, "setNumAppLaunchesLastOneDay:", objc_msgSend(v12, "unsignedIntValue"));
    v20 = v8;
    v21 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppLaunchesLastSevenDays"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastSevenDays:](v5, "setNumAppLaunchesLastSevenDays:", objc_msgSend(v13, "unsignedIntValue"));
    v14 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppLaunchesLastTwentyEightDays"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastTwentyEightDays:](v5, "setNumAppLaunchesLastTwentyEightDays:", objc_msgSend(v15, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppLaunchesLastInfinity"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppHistoryFeatures setNumAppLaunchesLastInfinity:](v5, "setNumAppLaunchesLastInfinity:", objc_msgSend(v16, "unsignedIntValue"));
    v17 = v5;

  }
  return v5;
}

- (unsigned)numMinutesSinceAppInstalled
{
  return self->_numMinutesSinceAppInstalled;
}

- (unsigned)numMinutesSinceAppLastLaunched
{
  return self->_numMinutesSinceAppLastLaunched;
}

- (unsigned)numAppLaunchesLastTwoMinutes
{
  return self->_numAppLaunchesLastTwoMinutes;
}

- (unsigned)numAppLaunchesLastTenMinutes
{
  return self->_numAppLaunchesLastTenMinutes;
}

- (unsigned)numAppLaunchesLastOneHour
{
  return self->_numAppLaunchesLastOneHour;
}

- (unsigned)numAppLaunchesLastSixHours
{
  return self->_numAppLaunchesLastSixHours;
}

- (unsigned)numAppLaunchesLastOneDay
{
  return self->_numAppLaunchesLastOneDay;
}

- (unsigned)numAppLaunchesLastSevenDays
{
  return self->_numAppLaunchesLastSevenDays;
}

- (unsigned)numAppLaunchesLastTwentyEightDays
{
  return self->_numAppLaunchesLastTwentyEightDays;
}

- (unsigned)numAppLaunchesLastInfinity
{
  return self->_numAppLaunchesLastInfinity;
}

@end
