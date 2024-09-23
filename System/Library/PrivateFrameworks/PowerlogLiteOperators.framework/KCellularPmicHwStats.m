@implementation KCellularPmicHwStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDurationMs
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSleepDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_sleepDurMs = a3;
}

- (void)setHasSleepDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSleepDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeDurMs = a3;
}

- (void)setHasActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveDurMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSleepEntryCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_sleepEntryCount = a3;
}

- (void)setHasSleepEntryCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSleepEntryCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLowVoltActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_lowVoltActiveDurMs = a3;
}

- (void)setHasLowVoltActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasLowVoltActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMidVoltActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_midVoltActiveDurMs = a3;
}

- (void)setHasMidVoltActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMidVoltActiveDurMs
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHighVoltActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_highVoltActiveDurMs = a3;
}

- (void)setHasHighVoltActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHighVoltActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setGsmCa5ActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_gsmCa5ActiveDurMs = a3;
}

- (void)setHasGsmCa5ActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGsmCa5ActiveDurMs
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setLteActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_lteActiveDurMs = a3;
}

- (void)setHasLteActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasLteActiveDurMs
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setWcdmaActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_wcdmaActiveDurMs = a3;
}

- (void)setHasWcdmaActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasWcdmaActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTdscdmaActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_tdscdmaActiveDurMs = a3;
}

- (void)setHasTdscdmaActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTdscdmaActiveDurMs
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHostActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hostActiveDurMs = a3;
}

- (void)setHasHostActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHostActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHostCpuSysActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_hostCpuSysActiveDurMs = a3;
}

- (void)setHasHostCpuSysActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHostCpuSysActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHostCpuActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hostCpuActiveDurMs = a3;
}

- (void)setHasHostCpuActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHostCpuActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRpcuActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_rpcuActiveDurMs = a3;
}

- (void)setHasRpcuActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRpcuActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setPhyActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_phyActiveDurMs = a3;
}

- (void)setHasPhyActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPhyActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPhyNocActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_phyNocActiveDurMs = a3;
}

- (void)setHasPhyNocActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPhyNocActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setBctActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_bctActiveDurMs = a3;
}

- (void)setHasBctActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBctActiveDurMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCdmaActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cdmaActiveDurMs = a3;
}

- (void)setHasCdmaActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCdmaActiveDurMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setGsmActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_gsmActiveDurMs = a3;
}

- (void)setHasGsmActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasGsmActiveDurMs
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTpcuActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_tpcuActiveDurMs = a3;
}

- (void)setHasTpcuActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTpcuActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIoActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_ioActiveDurMs = a3;
}

- (void)setHasIoActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIoActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPerActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_perActiveDurMs = a3;
}

- (void)setHasPerActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPerActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDbgActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dbgActiveDurMs = a3;
}

- (void)setHasDbgActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDbgActiveDurMs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDpuActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dpuActiveDurMs = a3;
}

- (void)setHasDpuActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDpuActiveDurMs
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRauActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_rauActiveDurMs = a3;
}

- (void)setHasRauActiveDurMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRauActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
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
  v8.super_class = (Class)KCellularPmicHwStats;
  -[KCellularPmicHwStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularPmicHwStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $BA88B0CE12B33516D6A70CF81698D416 has;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durationMs);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("duration_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sleepDurMs);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sleep_dur_ms"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_activeDurMs);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("active_dur_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sleepEntryCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("sleep_entry_count"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lowVoltActiveDurMs);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("low_volt_active_dur_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_midVoltActiveDurMs);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("mid_volt_active_dur_ms"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_highVoltActiveDurMs);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("high_volt_active_dur_ms"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gsmCa5ActiveDurMs);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("gsm_ca5_active_dur_ms"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lteActiveDurMs);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("lte_active_dur_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_wcdmaActiveDurMs);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("wcdma_active_dur_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tdscdmaActiveDurMs);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("tdscdma_active_dur_ms"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hostActiveDurMs);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("host_active_dur_ms"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hostCpuSysActiveDurMs);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("host_cpu_sys_active_dur_ms"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hostCpuActiveDurMs);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("host_cpu_active_dur_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rpcuActiveDurMs);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("rpcu_active_dur_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_phyActiveDurMs);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("phy_active_dur_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_phyNocActiveDurMs);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("phy_noc_active_dur_ms"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bctActiveDurMs);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("bct_active_dur_ms"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cdmaActiveDurMs);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("cdma_active_dur_ms"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gsmActiveDurMs);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("gsm_active_dur_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tpcuActiveDurMs);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("tpcu_active_dur_ms"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ioActiveDurMs);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("io_active_dur_ms"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_perActiveDurMs);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("per_active_dur_ms"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_27;
LABEL_55:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dpuActiveDurMs);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("dpu_active_dur_ms"));

    if ((*(_DWORD *)&self->_has & 0x100000) == 0)
      return v3;
    goto LABEL_28;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dbgActiveDurMs);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("dbg_active_dur_ms"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
    goto LABEL_55;
LABEL_27:
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rauActiveDurMs);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rau_active_dur_ms"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularPmicHwStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $BA88B0CE12B33516D6A70CF81698D416 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_27;
LABEL_55:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
    goto LABEL_55;
LABEL_27:
  if ((*(_DWORD *)&has & 0x100000) != 0)
LABEL_28:
    PBDataWriterWriteUint32Field();
LABEL_29:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $BA88B0CE12B33516D6A70CF81698D416 has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 30) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_durationMs;
  *((_DWORD *)v4 + 30) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 25) = self->_sleepDurMs;
  *((_DWORD *)v4 + 30) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 4) = self->_activeDurMs;
  *((_DWORD *)v4 + 30) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 26) = self->_sleepEntryCount;
  *((_DWORD *)v4 + 30) |= 0x800000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 17) = self->_lowVoltActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 19) = self->_midVoltActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 12) = self->_highVoltActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 11) = self->_gsmCa5ActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 18) = self->_lteActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 29) = self->_wcdmaActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 27) = self->_tdscdmaActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x1000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 13) = self->_hostActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 15) = self->_hostCpuSysActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 14) = self->_hostCpuActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 24) = self->_rpcuActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 21) = self->_phyActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 22) = self->_phyNocActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 5) = self->_bctActiveDurMs;
  *((_DWORD *)v4 + 30) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 6) = self->_cdmaActiveDurMs;
  *((_DWORD *)v4 + 30) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 10) = self->_gsmActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 28) = self->_tpcuActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x2000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 16) = self->_ioActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 20) = self->_perActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_27;
LABEL_55:
    *((_DWORD *)v4 + 8) = self->_dpuActiveDurMs;
    *((_DWORD *)v4 + 30) |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_54:
  *((_DWORD *)v4 + 7) = self->_dbgActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
    goto LABEL_55;
LABEL_27:
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_28:
    *((_DWORD *)v4 + 23) = self->_rauActiveDurMs;
    *((_DWORD *)v4 + 30) |= 0x100000u;
  }
LABEL_29:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $BA88B0CE12B33516D6A70CF81698D416 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 30) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_durationMs;
  *((_DWORD *)result + 30) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 25) = self->_sleepDurMs;
  *((_DWORD *)result + 30) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 4) = self->_activeDurMs;
  *((_DWORD *)result + 30) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 26) = self->_sleepEntryCount;
  *((_DWORD *)result + 30) |= 0x800000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 17) = self->_lowVoltActiveDurMs;
  *((_DWORD *)result + 30) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 19) = self->_midVoltActiveDurMs;
  *((_DWORD *)result + 30) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 12) = self->_highVoltActiveDurMs;
  *((_DWORD *)result + 30) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 11) = self->_gsmCa5ActiveDurMs;
  *((_DWORD *)result + 30) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 18) = self->_lteActiveDurMs;
  *((_DWORD *)result + 30) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 29) = self->_wcdmaActiveDurMs;
  *((_DWORD *)result + 30) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 27) = self->_tdscdmaActiveDurMs;
  *((_DWORD *)result + 30) |= 0x1000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 13) = self->_hostActiveDurMs;
  *((_DWORD *)result + 30) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 15) = self->_hostCpuSysActiveDurMs;
  *((_DWORD *)result + 30) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 14) = self->_hostCpuActiveDurMs;
  *((_DWORD *)result + 30) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)result + 24) = self->_rpcuActiveDurMs;
  *((_DWORD *)result + 30) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 21) = self->_phyActiveDurMs;
  *((_DWORD *)result + 30) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 22) = self->_phyNocActiveDurMs;
  *((_DWORD *)result + 30) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 5) = self->_bctActiveDurMs;
  *((_DWORD *)result + 30) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 6) = self->_cdmaActiveDurMs;
  *((_DWORD *)result + 30) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 10) = self->_gsmActiveDurMs;
  *((_DWORD *)result + 30) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 28) = self->_tpcuActiveDurMs;
  *((_DWORD *)result + 30) |= 0x2000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 16) = self->_ioActiveDurMs;
  *((_DWORD *)result + 30) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 20) = self->_perActiveDurMs;
  *((_DWORD *)result + 30) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 7) = self->_dbgActiveDurMs;
  *((_DWORD *)result + 30) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      return result;
    goto LABEL_28;
  }
LABEL_55:
  *((_DWORD *)result + 8) = self->_dpuActiveDurMs;
  *((_DWORD *)result + 30) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
    return result;
LABEL_28:
  *((_DWORD *)result + 23) = self->_rauActiveDurMs;
  *((_DWORD *)result + 30) |= 0x100000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $BA88B0CE12B33516D6A70CF81698D416 has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_137;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 30);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_137;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_137:
    v7 = 0;
    goto LABEL_138;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_durationMs != *((_DWORD *)v4 + 9))
      goto LABEL_137;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_sleepDurMs != *((_DWORD *)v4 + 25))
      goto LABEL_137;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_activeDurMs != *((_DWORD *)v4 + 4))
      goto LABEL_137;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_sleepEntryCount != *((_DWORD *)v4 + 26))
      goto LABEL_137;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_lowVoltActiveDurMs != *((_DWORD *)v4 + 17))
      goto LABEL_137;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_midVoltActiveDurMs != *((_DWORD *)v4 + 19))
      goto LABEL_137;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_highVoltActiveDurMs != *((_DWORD *)v4 + 12))
      goto LABEL_137;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_gsmCa5ActiveDurMs != *((_DWORD *)v4 + 11))
      goto LABEL_137;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_lteActiveDurMs != *((_DWORD *)v4 + 18))
      goto LABEL_137;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_wcdmaActiveDurMs != *((_DWORD *)v4 + 29))
      goto LABEL_137;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_tdscdmaActiveDurMs != *((_DWORD *)v4 + 27))
      goto LABEL_137;
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_hostActiveDurMs != *((_DWORD *)v4 + 13))
      goto LABEL_137;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_hostCpuSysActiveDurMs != *((_DWORD *)v4 + 15))
      goto LABEL_137;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_hostCpuActiveDurMs != *((_DWORD *)v4 + 14))
      goto LABEL_137;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_rpcuActiveDurMs != *((_DWORD *)v4 + 24))
      goto LABEL_137;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_phyActiveDurMs != *((_DWORD *)v4 + 21))
      goto LABEL_137;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_phyNocActiveDurMs != *((_DWORD *)v4 + 22))
      goto LABEL_137;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bctActiveDurMs != *((_DWORD *)v4 + 5))
      goto LABEL_137;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_cdmaActiveDurMs != *((_DWORD *)v4 + 6))
      goto LABEL_137;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_gsmActiveDurMs != *((_DWORD *)v4 + 10))
      goto LABEL_137;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_tpcuActiveDurMs != *((_DWORD *)v4 + 28))
      goto LABEL_137;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_ioActiveDurMs != *((_DWORD *)v4 + 16))
      goto LABEL_137;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_perActiveDurMs != *((_DWORD *)v4 + 20))
      goto LABEL_137;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dbgActiveDurMs != *((_DWORD *)v4 + 7))
      goto LABEL_137;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_dpuActiveDurMs != *((_DWORD *)v4 + 8))
      goto LABEL_137;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_rauActiveDurMs != *((_DWORD *)v4 + 23))
      goto LABEL_137;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x100000) == 0;
  }
LABEL_138:

  return v7;
}

- (unint64_t)hash
{
  $BA88B0CE12B33516D6A70CF81698D416 has;
  unint64_t v3;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_durationMs;
      if ((*(_DWORD *)&has & 0x400000) != 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_sleepDurMs;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  v5 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_activeDurMs;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_sleepEntryCount;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  v7 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_lowVoltActiveDurMs;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_midVoltActiveDurMs;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  v9 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_highVoltActiveDurMs;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  v10 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_gsmCa5ActiveDurMs;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  v11 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_lteActiveDurMs;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_wcdmaActiveDurMs;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_39:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_tdscdmaActiveDurMs;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_14;
    goto LABEL_41;
  }
LABEL_40:
  v14 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_hostActiveDurMs;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_15;
    goto LABEL_42;
  }
LABEL_41:
  v15 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_hostCpuSysActiveDurMs;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  v16 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_hostCpuActiveDurMs;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_rpcuActiveDurMs;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_phyActiveDurMs;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_19:
    v20 = 2654435761 * self->_phyNocActiveDurMs;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  v20 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_20:
    v21 = 2654435761 * self->_bctActiveDurMs;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  v21 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_21:
    v22 = 2654435761 * self->_cdmaActiveDurMs;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_22:
    v23 = 2654435761 * self->_gsmActiveDurMs;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_23:
    v24 = 2654435761 * self->_tpcuActiveDurMs;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  v24 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_24:
    v25 = 2654435761 * self->_ioActiveDurMs;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_25:
    v26 = 2654435761 * self->_perActiveDurMs;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  v26 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_26:
    v27 = 2654435761 * self->_dbgActiveDurMs;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_27;
LABEL_54:
    v28 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_28;
LABEL_55:
    v29 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_53:
  v27 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_54;
LABEL_27:
  v28 = 2654435761 * self->_dpuActiveDurMs;
  if ((*(_DWORD *)&has & 0x100000) == 0)
    goto LABEL_55;
LABEL_28:
  v29 = 2654435761 * self->_rauActiveDurMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 30);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_durationMs = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x400000) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  self->_sleepDurMs = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  self->_activeDurMs = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x800000) == 0)
  {
LABEL_6:
    if ((v5 & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  self->_sleepEntryCount = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x4000) == 0)
  {
LABEL_7:
    if ((v5 & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  self->_lowVoltActiveDurMs = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x10000) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  self->_midVoltActiveDurMs = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  self->_highVoltActiveDurMs = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  self->_gsmCa5ActiveDurMs = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x8000) == 0)
  {
LABEL_11:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  self->_lteActiveDurMs = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  self->_wcdmaActiveDurMs = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  self->_tdscdmaActiveDurMs = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  self->_hostActiveDurMs = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x1000) == 0)
  {
LABEL_15:
    if ((v5 & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  self->_hostCpuSysActiveDurMs = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_16:
    if ((v5 & 0x200000) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  self->_hostCpuActiveDurMs = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x200000) == 0)
  {
LABEL_17:
    if ((v5 & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  self->_rpcuActiveDurMs = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x40000) == 0)
  {
LABEL_18:
    if ((v5 & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  self->_phyActiveDurMs = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x80000) == 0)
  {
LABEL_19:
    if ((v5 & 4) == 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  self->_phyNocActiveDurMs = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_20:
    if ((v5 & 8) == 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  self->_bctActiveDurMs = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_21:
    if ((v5 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  self->_cdmaActiveDurMs = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_22:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  self->_gsmActiveDurMs = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  self->_tpcuActiveDurMs = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x2000) == 0)
  {
LABEL_24:
    if ((v5 & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  self->_ioActiveDurMs = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x20000) == 0)
  {
LABEL_25:
    if ((v5 & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  self->_perActiveDurMs = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_26:
    if ((v5 & 0x20) == 0)
      goto LABEL_27;
LABEL_55:
    self->_dpuActiveDurMs = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 0x20u;
    if ((*((_DWORD *)v4 + 30) & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_54:
  self->_dbgActiveDurMs = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x20) != 0)
    goto LABEL_55;
LABEL_27:
  if ((v5 & 0x100000) != 0)
  {
LABEL_28:
    self->_rauActiveDurMs = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_29:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)sleepDurMs
{
  return self->_sleepDurMs;
}

- (unsigned)activeDurMs
{
  return self->_activeDurMs;
}

- (unsigned)sleepEntryCount
{
  return self->_sleepEntryCount;
}

- (unsigned)lowVoltActiveDurMs
{
  return self->_lowVoltActiveDurMs;
}

- (unsigned)midVoltActiveDurMs
{
  return self->_midVoltActiveDurMs;
}

- (unsigned)highVoltActiveDurMs
{
  return self->_highVoltActiveDurMs;
}

- (unsigned)gsmCa5ActiveDurMs
{
  return self->_gsmCa5ActiveDurMs;
}

- (unsigned)lteActiveDurMs
{
  return self->_lteActiveDurMs;
}

- (unsigned)wcdmaActiveDurMs
{
  return self->_wcdmaActiveDurMs;
}

- (unsigned)tdscdmaActiveDurMs
{
  return self->_tdscdmaActiveDurMs;
}

- (unsigned)hostActiveDurMs
{
  return self->_hostActiveDurMs;
}

- (unsigned)hostCpuSysActiveDurMs
{
  return self->_hostCpuSysActiveDurMs;
}

- (unsigned)hostCpuActiveDurMs
{
  return self->_hostCpuActiveDurMs;
}

- (unsigned)rpcuActiveDurMs
{
  return self->_rpcuActiveDurMs;
}

- (unsigned)phyActiveDurMs
{
  return self->_phyActiveDurMs;
}

- (unsigned)phyNocActiveDurMs
{
  return self->_phyNocActiveDurMs;
}

- (unsigned)bctActiveDurMs
{
  return self->_bctActiveDurMs;
}

- (unsigned)cdmaActiveDurMs
{
  return self->_cdmaActiveDurMs;
}

- (unsigned)gsmActiveDurMs
{
  return self->_gsmActiveDurMs;
}

- (unsigned)tpcuActiveDurMs
{
  return self->_tpcuActiveDurMs;
}

- (unsigned)ioActiveDurMs
{
  return self->_ioActiveDurMs;
}

- (unsigned)perActiveDurMs
{
  return self->_perActiveDurMs;
}

- (unsigned)dbgActiveDurMs
{
  return self->_dbgActiveDurMs;
}

- (unsigned)dpuActiveDurMs
{
  return self->_dpuActiveDurMs;
}

- (unsigned)rauActiveDurMs
{
  return self->_rauActiveDurMs;
}

@end
