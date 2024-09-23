@implementation UtraTddStats

- (void)setDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setActiveDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeDuration = a3;
}

- (void)setHasActiveDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNormalSleepDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_normalSleepDuration = a3;
}

- (void)setHasNormalSleepDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNormalSleepDuration
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDeepSleepDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_deepSleepDuration = a3;
}

- (void)setHasDeepSleepDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDeepSleepDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDeepSleepCycleCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_deepSleepCycleCount = a3;
}

- (void)setHasDeepSleepCycleCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDeepSleepCycleCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setVoltLowDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_voltLowDuration = a3;
}

- (void)setHasVoltLowDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasVoltLowDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setVoltMedDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_voltMedDuration = a3;
}

- (void)setHasVoltMedDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasVoltMedDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setVoltHighDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_voltHighDuration = a3;
}

- (void)setHasVoltHighDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasVoltHighDuration
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setZspClkOpt0Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_zspClkOpt0Duration = a3;
}

- (void)setHasZspClkOpt0Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasZspClkOpt0Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setZspClkOpt1Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_zspClkOpt1Duration = a3;
}

- (void)setHasZspClkOpt1Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasZspClkOpt1Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setZspClkOpt2Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_zspClkOpt2Duration = a3;
}

- (void)setHasZspClkOpt2Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasZspClkOpt2Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setZspClkOpt3Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_zspClkOpt3Duration = a3;
}

- (void)setHasZspClkOpt3Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasZspClkOpt3Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setZspClkOpt4Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_zspClkOpt4Duration = a3;
}

- (void)setHasZspClkOpt4Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasZspClkOpt4Duration
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setZspClkOpt5Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_zspClkOpt5Duration = a3;
}

- (void)setHasZspClkOpt5Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasZspClkOpt5Duration
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setThClkOpt0Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_thClkOpt0Duration = a3;
}

- (void)setHasThClkOpt0Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasThClkOpt0Duration
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setThClkOpt1Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_thClkOpt1Duration = a3;
}

- (void)setHasThClkOpt1Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasThClkOpt1Duration
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setStartTime:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasStartTime
{
  return *(_DWORD *)&self->_has & 1;
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
  v8.super_class = (Class)UtraTddStats;
  -[UtraTddStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UtraTddStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $47EACDA4C9A419300A4563DF10B362A3 has;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_duration);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("duration"));

    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_activeDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("active_duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_normalSleepDuration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("normal_sleep_duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deepSleepDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("deep_sleep_duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deepSleepCycleCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("deep_sleep_cycle_count"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_voltLowDuration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("volt_low_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_voltMedDuration);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("volt_med_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_voltHighDuration);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("volt_high_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_zspClkOpt0Duration);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("zsp_clk_opt0_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_zspClkOpt1Duration);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("zsp_clk_opt1_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_zspClkOpt2Duration);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("zsp_clk_opt2_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_zspClkOpt3Duration);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("zsp_clk_opt3_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_zspClkOpt4Duration);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("zsp_clk_opt4_duration"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_zspClkOpt5Duration);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("zsp_clk_opt5_duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_17;
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_thClkOpt1Duration);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("th_clk_opt1_duration"));

    if ((*(_DWORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_18;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_thClkOpt0Duration);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("th_clk_opt0_duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startTime);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("start_time"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return UtraTddStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $47EACDA4C9A419300A4563DF10B362A3 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_17;
LABEL_35:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 1) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_BYTE *)&has & 1) != 0)
LABEL_18:
    PBDataWriterWriteUint64Field();
LABEL_19:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $47EACDA4C9A419300A4563DF10B362A3 has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    v4[7] = self->_duration;
    v4[20] |= 0x10u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_activeDuration;
  v4[20] |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  v4[8] = self->_normalSleepDuration;
  v4[20] |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  v4[6] = self->_deepSleepDuration;
  v4[20] |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v4[5] = self->_deepSleepCycleCount;
  v4[20] |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v4[12] = self->_voltLowDuration;
  v4[20] |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v4[13] = self->_voltMedDuration;
  v4[20] |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v4[11] = self->_voltHighDuration;
  v4[20] |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v4[14] = self->_zspClkOpt0Duration;
  v4[20] |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v4[15] = self->_zspClkOpt1Duration;
  v4[20] |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v4[16] = self->_zspClkOpt2Duration;
  v4[20] |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v4[17] = self->_zspClkOpt3Duration;
  v4[20] |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  v4[18] = self->_zspClkOpt4Duration;
  v4[20] |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  v4[19] = self->_zspClkOpt5Duration;
  v4[20] |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_17;
LABEL_35:
    v4[10] = self->_thClkOpt1Duration;
    v4[20] |= 0x80u;
    if ((*(_DWORD *)&self->_has & 1) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  v4[9] = self->_thClkOpt0Duration;
  v4[20] |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_18:
    *((_QWORD *)v4 + 1) = self->_startTime;
    v4[20] |= 1u;
  }
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $47EACDA4C9A419300A4563DF10B362A3 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *((_DWORD *)result + 7) = self->_duration;
    *((_DWORD *)result + 20) |= 0x10u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_activeDuration;
  *((_DWORD *)result + 20) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 8) = self->_normalSleepDuration;
  *((_DWORD *)result + 20) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 6) = self->_deepSleepDuration;
  *((_DWORD *)result + 20) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 5) = self->_deepSleepCycleCount;
  *((_DWORD *)result + 20) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 12) = self->_voltLowDuration;
  *((_DWORD *)result + 20) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 13) = self->_voltMedDuration;
  *((_DWORD *)result + 20) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 11) = self->_voltHighDuration;
  *((_DWORD *)result + 20) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 14) = self->_zspClkOpt0Duration;
  *((_DWORD *)result + 20) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 15) = self->_zspClkOpt1Duration;
  *((_DWORD *)result + 20) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 16) = self->_zspClkOpt2Duration;
  *((_DWORD *)result + 20) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 17) = self->_zspClkOpt3Duration;
  *((_DWORD *)result + 20) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 18) = self->_zspClkOpt4Duration;
  *((_DWORD *)result + 20) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 19) = self->_zspClkOpt5Duration;
  *((_DWORD *)result + 20) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 9) = self->_thClkOpt0Duration;
  *((_DWORD *)result + 20) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 1) == 0)
      return result;
    goto LABEL_18;
  }
LABEL_35:
  *((_DWORD *)result + 10) = self->_thClkOpt1Duration;
  *((_DWORD *)result + 20) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 1) == 0)
    return result;
LABEL_18:
  *((_QWORD *)result + 1) = self->_startTime;
  *((_DWORD *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $47EACDA4C9A419300A4563DF10B362A3 has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_87;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 20);
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_duration != *((_DWORD *)v4 + 7))
      goto LABEL_87;
  }
  else if ((v6 & 0x10) != 0)
  {
LABEL_87:
    v7 = 0;
    goto LABEL_88;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_activeDuration != *((_DWORD *)v4 + 4))
      goto LABEL_87;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_normalSleepDuration != *((_DWORD *)v4 + 8))
      goto LABEL_87;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_deepSleepDuration != *((_DWORD *)v4 + 6))
      goto LABEL_87;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_deepSleepCycleCount != *((_DWORD *)v4 + 5))
      goto LABEL_87;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_voltLowDuration != *((_DWORD *)v4 + 12))
      goto LABEL_87;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_voltMedDuration != *((_DWORD *)v4 + 13))
      goto LABEL_87;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_voltHighDuration != *((_DWORD *)v4 + 11))
      goto LABEL_87;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_zspClkOpt0Duration != *((_DWORD *)v4 + 14))
      goto LABEL_87;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_zspClkOpt1Duration != *((_DWORD *)v4 + 15))
      goto LABEL_87;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_zspClkOpt2Duration != *((_DWORD *)v4 + 16))
      goto LABEL_87;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_zspClkOpt3Duration != *((_DWORD *)v4 + 17))
      goto LABEL_87;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_zspClkOpt4Duration != *((_DWORD *)v4 + 18))
      goto LABEL_87;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_zspClkOpt5Duration != *((_DWORD *)v4 + 19))
      goto LABEL_87;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_thClkOpt0Duration != *((_DWORD *)v4 + 9))
      goto LABEL_87;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_thClkOpt1Duration != *((_DWORD *)v4 + 10))
      goto LABEL_87;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_startTime != *((_QWORD *)v4 + 1))
      goto LABEL_87;
    v7 = 1;
  }
  else
  {
    v7 = (*((_DWORD *)v4 + 20) & 1) == 0;
  }
LABEL_88:

  return v7;
}

- (unint64_t)hash
{
  $47EACDA4C9A419300A4563DF10B362A3 has;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    v3 = 2654435761 * self->_duration;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_activeDuration;
      if ((*(_BYTE *)&has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_normalSleepDuration;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v5 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_deepSleepDuration;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v6 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_deepSleepCycleCount;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v7 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_voltLowDuration;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v8 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_voltMedDuration;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v9 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_voltHighDuration;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v10 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_zspClkOpt0Duration;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v11 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_zspClkOpt1Duration;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v12 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_zspClkOpt2Duration;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v13 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_zspClkOpt3Duration;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_zspClkOpt4Duration;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_zspClkOpt5Duration;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  v16 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_thClkOpt0Duration;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_17;
LABEL_34:
    v18 = 0;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_18;
LABEL_35:
    v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_33:
  v17 = 0;
  if ((*(_BYTE *)&has & 0x80) == 0)
    goto LABEL_34;
LABEL_17:
  v18 = 2654435761 * self->_thClkOpt1Duration;
  if ((*(_BYTE *)&has & 1) == 0)
    goto LABEL_35;
LABEL_18:
  v19 = 2654435761u * self->_startTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x10) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 7);
    *(_DWORD *)&self->_has |= 0x10u;
    v5 = *((_DWORD *)v4 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_activeDuration = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  self->_normalSleepDuration = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  self->_deepSleepDuration = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  self->_deepSleepCycleCount = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  self->_voltLowDuration = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  self->_voltMedDuration = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  self->_voltHighDuration = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x800) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  self->_zspClkOpt0Duration = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  self->_zspClkOpt1Duration = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x2000) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  self->_zspClkOpt2Duration = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  self->_zspClkOpt3Duration = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x8000) == 0)
  {
LABEL_14:
    if ((v5 & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  self->_zspClkOpt4Duration = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x10000) == 0)
  {
LABEL_15:
    if ((v5 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  self->_zspClkOpt5Duration = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x40) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0)
      goto LABEL_17;
LABEL_35:
    self->_thClkOpt1Duration = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x80u;
    if ((*((_DWORD *)v4 + 20) & 1) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  self->_thClkOpt0Duration = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x80) != 0)
    goto LABEL_35;
LABEL_17:
  if ((v5 & 1) != 0)
  {
LABEL_18:
    self->_startTime = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
LABEL_19:

}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)activeDuration
{
  return self->_activeDuration;
}

- (unsigned)normalSleepDuration
{
  return self->_normalSleepDuration;
}

- (unsigned)deepSleepDuration
{
  return self->_deepSleepDuration;
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

- (unsigned)zspClkOpt0Duration
{
  return self->_zspClkOpt0Duration;
}

- (unsigned)zspClkOpt1Duration
{
  return self->_zspClkOpt1Duration;
}

- (unsigned)zspClkOpt2Duration
{
  return self->_zspClkOpt2Duration;
}

- (unsigned)zspClkOpt3Duration
{
  return self->_zspClkOpt3Duration;
}

- (unsigned)zspClkOpt4Duration
{
  return self->_zspClkOpt4Duration;
}

- (unsigned)zspClkOpt5Duration
{
  return self->_zspClkOpt5Duration;
}

- (unsigned)thClkOpt0Duration
{
  return self->_thClkOpt0Duration;
}

- (unsigned)thClkOpt1Duration
{
  return self->_thClkOpt1Duration;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

@end
