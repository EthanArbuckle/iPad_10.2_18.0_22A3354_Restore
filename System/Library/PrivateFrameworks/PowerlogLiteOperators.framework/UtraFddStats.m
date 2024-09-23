@implementation UtraFddStats

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setActiveDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_activeDuration = a3;
}

- (void)setHasActiveDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasActiveDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLightSleepDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_lightSleepDuration = a3;
}

- (void)setHasLightSleepDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasLightSleepDuration
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDeepSleepDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_deepSleepDuration = a3;
}

- (void)setHasDeepSleepDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDeepSleepDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLightSleepCycleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_lightSleepCycleCount = a3;
}

- (void)setHasLightSleepCycleCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLightSleepCycleCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDeepSleepCycleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_deepSleepCycleCount = a3;
}

- (void)setHasDeepSleepCycleCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDeepSleepCycleCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setVoltLowDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_voltLowDuration = a3;
}

- (void)setHasVoltLowDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVoltLowDuration
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setVoltMedDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_voltMedDuration = a3;
}

- (void)setHasVoltMedDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasVoltMedDuration
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setVoltHighDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_voltHighDuration = a3;
}

- (void)setHasVoltHighDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVoltHighDuration
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setClkLowDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_clkLowDuration = a3;
}

- (void)setHasClkLowDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasClkLowDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setClkMedDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_clkMedDuration = a3;
}

- (void)setHasClkMedDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasClkMedDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setClkHighDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clkHighDuration = a3;
}

- (void)setHasClkHighDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClkHighDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setStartTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasStartTime
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)UtraFddStats;
  -[UtraFddStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UtraFddStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_duration);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("duration"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_activeDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("active_duration"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lightSleepDuration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("light_sleep_duration"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deepSleepDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("deep_sleep_duration"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lightSleepCycleCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("light_sleep_cycle_count"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deepSleepCycleCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("deep_sleep_cycle_count"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_voltLowDuration);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("volt_low_duration"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_voltMedDuration);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("volt_med_duration"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_voltHighDuration);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("volt_high_duration"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_clkLowDuration);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("clk_low_duration"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_clkHighDuration);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("clk_high_duration"));

    if ((*(_WORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_14;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_clkMedDuration);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("clk_med_duration"));

  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startTime);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("start_time"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return UtraFddStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
LABEL_27:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 1) != 0)
LABEL_14:
    PBDataWriterWriteUint64Field();
LABEL_15:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v4[10] = self->_duration;
    *((_WORD *)v4 + 32) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_activeDuration;
  *((_WORD *)v4 + 32) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v4[12] = self->_lightSleepDuration;
  *((_WORD *)v4 + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v4[9] = self->_deepSleepDuration;
  *((_WORD *)v4 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v4[11] = self->_lightSleepCycleCount;
  *((_WORD *)v4 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v4[8] = self->_deepSleepCycleCount;
  *((_WORD *)v4 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v4[14] = self->_voltLowDuration;
  *((_WORD *)v4 + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v4[15] = self->_voltMedDuration;
  *((_WORD *)v4 + 32) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v4[13] = self->_voltHighDuration;
  *((_WORD *)v4 + 32) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v4[6] = self->_clkLowDuration;
  *((_WORD *)v4 + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
LABEL_27:
    v4[5] = self->_clkHighDuration;
    *((_WORD *)v4 + 32) |= 4u;
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  v4[7] = self->_clkMedDuration;
  *((_WORD *)v4 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 1) != 0)
  {
LABEL_14:
    *((_QWORD *)v4 + 1) = self->_startTime;
    *((_WORD *)v4 + 32) |= 1u;
  }
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((_DWORD *)result + 10) = self->_duration;
    *((_WORD *)result + 32) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_activeDuration;
  *((_WORD *)result + 32) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 12) = self->_lightSleepDuration;
  *((_WORD *)result + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_deepSleepDuration;
  *((_WORD *)result + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 11) = self->_lightSleepCycleCount;
  *((_WORD *)result + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 8) = self->_deepSleepCycleCount;
  *((_WORD *)result + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 14) = self->_voltLowDuration;
  *((_WORD *)result + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 15) = self->_voltMedDuration;
  *((_WORD *)result + 32) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 13) = self->_voltHighDuration;
  *((_WORD *)result + 32) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 6) = self->_clkLowDuration;
  *((_WORD *)result + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 7) = self->_clkMedDuration;
  *((_WORD *)result + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      return result;
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 5) = self->_clkHighDuration;
  *((_WORD *)result + 32) |= 4u;
  if ((*(_WORD *)&self->_has & 1) == 0)
    return result;
LABEL_14:
  *((_QWORD *)result + 1) = self->_startTime;
  *((_WORD *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 32);
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_duration != *((_DWORD *)v4 + 10))
      goto LABEL_67;
  }
  else if ((v6 & 0x80) != 0)
  {
LABEL_67:
    v7 = 0;
    goto LABEL_68;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_activeDuration != *((_DWORD *)v4 + 4))
      goto LABEL_67;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_lightSleepDuration != *((_DWORD *)v4 + 12))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_deepSleepDuration != *((_DWORD *)v4 + 9))
      goto LABEL_67;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_lightSleepCycleCount != *((_DWORD *)v4 + 11))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_deepSleepCycleCount != *((_DWORD *)v4 + 8))
      goto LABEL_67;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x800) == 0 || self->_voltLowDuration != *((_DWORD *)v4 + 14))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 32) & 0x800) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x1000) == 0 || self->_voltMedDuration != *((_DWORD *)v4 + 15))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 32) & 0x1000) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0 || self->_voltHighDuration != *((_DWORD *)v4 + 13))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_clkLowDuration != *((_DWORD *)v4 + 6))
      goto LABEL_67;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_clkMedDuration != *((_DWORD *)v4 + 7))
      goto LABEL_67;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_clkHighDuration != *((_DWORD *)v4 + 5))
      goto LABEL_67;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_startTime != *((_QWORD *)v4 + 1))
      goto LABEL_67;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 1) == 0;
  }
LABEL_68:

  return v7;
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
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v3 = 2654435761 * self->_duration;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_activeDuration;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_lightSleepDuration;
    if ((has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_deepSleepDuration;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_lightSleepCycleCount;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_deepSleepCycleCount;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_voltLowDuration;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_voltMedDuration;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_voltHighDuration;
    if ((has & 8) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((has & 8) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_clkLowDuration;
    if ((has & 0x10) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_clkMedDuration;
    if ((has & 4) != 0)
      goto LABEL_13;
LABEL_26:
    v14 = 0;
    if ((has & 1) != 0)
      goto LABEL_14;
LABEL_27:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  v13 = 0;
  if ((has & 4) == 0)
    goto LABEL_26;
LABEL_13:
  v14 = 2654435761 * self->_clkHighDuration;
  if ((has & 1) == 0)
    goto LABEL_27;
LABEL_14:
  v15 = 2654435761u * self->_startTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x80) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x80u;
    v5 = *((_WORD *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_activeDuration = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_lightSleepDuration = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_deepSleepDuration = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_lightSleepCycleCount = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_deepSleepCycleCount = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x800) == 0)
  {
LABEL_8:
    if ((v5 & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_voltLowDuration = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x1000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_voltMedDuration = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  self->_voltHighDuration = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_clkLowDuration = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0)
      goto LABEL_13;
LABEL_27:
    self->_clkHighDuration = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 4u;
    if ((*((_WORD *)v4 + 32) & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  self->_clkMedDuration = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) != 0)
    goto LABEL_27;
LABEL_13:
  if ((v5 & 1) != 0)
  {
LABEL_14:
    self->_startTime = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_15:

}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)activeDuration
{
  return self->_activeDuration;
}

- (unsigned)lightSleepDuration
{
  return self->_lightSleepDuration;
}

- (unsigned)deepSleepDuration
{
  return self->_deepSleepDuration;
}

- (unsigned)lightSleepCycleCount
{
  return self->_lightSleepCycleCount;
}

- (unsigned)deepSleepCycleCount
{
  return self->_deepSleepCycleCount;
}

- (unsigned)voltLowDuration
{
  return self->_voltLowDuration;
}

- (unsigned)voltMedDuration
{
  return self->_voltMedDuration;
}

- (unsigned)voltHighDuration
{
  return self->_voltHighDuration;
}

- (unsigned)clkLowDuration
{
  return self->_clkLowDuration;
}

- (unsigned)clkMedDuration
{
  return self->_clkMedDuration;
}

- (unsigned)clkHighDuration
{
  return self->_clkHighDuration;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

@end
