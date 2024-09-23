@implementation KCellularLqmStateChange

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPrevStateDurationSec:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_prevStateDurationSec = a3;
}

- (void)setHasPrevStateDurationSec:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPrevStateDurationSec
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLqmState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_lqmState = a3;
}

- (void)setHasLqmState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLqmState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSysMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSysMode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsScreenOn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isScreenOn = a3;
}

- (void)setHasIsScreenOn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasIsScreenOn
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setPrevLqmState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_prevLqmState = a3;
}

- (void)setHasPrevLqmState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPrevLqmState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPrevSysMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_prevSysMode = a3;
}

- (void)setHasPrevSysMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPrevSysMode
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setPrevIsScreenOn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_prevIsScreenOn = a3;
}

- (void)setHasPrevIsScreenOn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasPrevIsScreenOn
{
  return *(_WORD *)&self->_has >> 15;
}

- (int)hiPowerEvent
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_hiPowerEvent;
  else
    return 0;
}

- (void)setHiPowerEvent:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_hiPowerEvent = a3;
}

- (void)setHasHiPowerEvent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHiPowerEvent
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)hiPowerEventAsString:(int)a3
{
  if (a3 < 0xD)
    return off_1E857CDC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsHiPowerEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_POOR_SIGNAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_LTE_UL_TRICKLING_GRANT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_EUTRA_RRC_CONN_FAIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_UTRA_RRC_CONN_FAIL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_ERLC_MAX_RETX")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_URLC_MAX_RETX")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_HIGH_POW_COST")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_PHY_ABORT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_RF_CONDITION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_GUARD_TIMER_EXPIRY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_RF_SIGNAL_IMPROVEMENT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_MAX")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)hiPowerExitReason
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_hiPowerExitReason;
  else
    return 0;
}

- (void)setHiPowerExitReason:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hiPowerExitReason = a3;
}

- (void)setHasHiPowerExitReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHiPowerExitReason
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)hiPowerExitReasonAsString:(int)a3
{
  if (a3 < 0xD)
    return off_1E857CDC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsHiPowerExitReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_POOR_SIGNAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_LTE_UL_TRICKLING_GRANT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_EUTRA_RRC_CONN_FAIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_UTRA_RRC_CONN_FAIL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_ERLC_MAX_RETX")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_URLC_MAX_RETX")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_HIGH_POW_COST")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_PHY_ABORT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_RF_CONDITION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_GUARD_TIMER_EXPIRY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_RF_SIGNAL_IMPROVEMENT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_MAX")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setWcdmaEcio:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_wcdmaEcio = a3;
}

- (void)setHasWcdmaEcio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWcdmaEcio
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setWcdmaRscp:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_wcdmaRscp = a3;
}

- (void)setHasWcdmaRscp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasWcdmaRscp
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setLteRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_lteRssi = a3;
}

- (void)setHasLteRssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLteRssi
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLteRsrp:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_lteRsrp = a3;
}

- (void)setHasLteRsrp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLteRsrp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLteRsrq:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_lteRsrq = a3;
}

- (void)setHasLteRsrq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLteRsrq
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLteRssnr:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_lteRssnr = a3;
}

- (void)setHasLteRssnr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLteRssnr
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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
  v8.super_class = (Class)KCellularLqmStateChange;
  -[KCellularLqmStateChange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularLqmStateChange dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t hiPowerEvent;
  __CFString *v16;
  uint64_t hiPowerExitReason;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prevStateDurationSec);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("prev_state_duration_sec"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lqmState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("lqm_state"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sysMode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sys_mode"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isScreenOn);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("is_screen_on"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prevLqmState);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("prev_lqm_state"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prevSysMode);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("prev_sys_mode"));

  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prevIsScreenOn);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("prev_is_screen_on"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_27:
  hiPowerEvent = self->_hiPowerEvent;
  if (hiPowerEvent >= 0xD)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hiPowerEvent);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E857CDC0[hiPowerEvent];
  }
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("hi_power_event"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_31:
  hiPowerExitReason = self->_hiPowerExitReason;
  if (hiPowerExitReason >= 0xD)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hiPowerExitReason);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_1E857CDC0[hiPowerExitReason];
  }
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("hi_power_exit_reason"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_wcdmaEcio);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("wcdma_ecio"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_wcdmaRscp);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("wcdma_rscp"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_lteRssi);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("lte_rssi"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_lteRsrq);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("lte_rsrq"));

    if ((*(_WORD *)&self->_has & 0x80) == 0)
      return v3;
    goto LABEL_17;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_lteRsrp);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("lte_rsrp"));

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_39;
LABEL_16:
  if ((has & 0x80) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_lteRssnr);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("lte_rssnr"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLqmStateChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
LABEL_33:
    PBDataWriterWriteSint32Field();
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_33;
LABEL_16:
  if ((has & 0x80) != 0)
LABEL_17:
    PBDataWriterWriteSint32Field();
LABEL_18:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 36) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_prevStateDurationSec;
  *((_WORD *)v4 + 36) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 6) = self->_lqmState;
  *((_WORD *)v4 + 36) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 14) = self->_sysMode;
  *((_WORD *)v4 + 36) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)v4 + 68) = self->_isScreenOn;
  *((_WORD *)v4 + 36) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 11) = self->_prevLqmState;
  *((_WORD *)v4 + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 13) = self->_prevSysMode;
  *((_WORD *)v4 + 36) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_BYTE *)v4 + 69) = self->_prevIsScreenOn;
  *((_WORD *)v4 + 36) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 4) = self->_hiPowerEvent;
  *((_WORD *)v4 + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 5) = self->_hiPowerExitReason;
  *((_WORD *)v4 + 36) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 15) = self->_wcdmaEcio;
  *((_WORD *)v4 + 36) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 16) = self->_wcdmaRscp;
  *((_WORD *)v4 + 36) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 9) = self->_lteRssi;
  *((_WORD *)v4 + 36) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
LABEL_33:
    *((_DWORD *)v4 + 8) = self->_lteRsrq;
    *((_WORD *)v4 + 36) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  *((_DWORD *)v4 + 7) = self->_lteRsrp;
  *((_WORD *)v4 + 36) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_33;
LABEL_16:
  if ((has & 0x80) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 10) = self->_lteRssnr;
    *((_WORD *)v4 + 36) |= 0x80u;
  }
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_WORD *)result + 36) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 12) = self->_prevStateDurationSec;
  *((_WORD *)result + 36) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 6) = self->_lqmState;
  *((_WORD *)result + 36) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 14) = self->_sysMode;
  *((_WORD *)result + 36) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)result + 68) = self->_isScreenOn;
  *((_WORD *)result + 36) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 11) = self->_prevLqmState;
  *((_WORD *)result + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 13) = self->_prevSysMode;
  *((_WORD *)result + 36) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_BYTE *)result + 69) = self->_prevIsScreenOn;
  *((_WORD *)result + 36) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 4) = self->_hiPowerEvent;
  *((_WORD *)result + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 5) = self->_hiPowerExitReason;
  *((_WORD *)result + 36) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 15) = self->_wcdmaEcio;
  *((_WORD *)result + 36) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 16) = self->_wcdmaRscp;
  *((_WORD *)result + 36) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 9) = self->_lteRssi;
  *((_WORD *)result + 36) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 7) = self->_lteRsrp;
  *((_WORD *)result + 36) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0)
      return result;
    goto LABEL_17;
  }
LABEL_33:
  *((_DWORD *)result + 8) = self->_lteRsrq;
  *((_WORD *)result + 36) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x80) == 0)
    return result;
LABEL_17:
  *((_DWORD *)result + 10) = self->_lteRssnr;
  *((_WORD *)result + 36) |= 0x80u;
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
    goto LABEL_88;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 36);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_88;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x200) == 0 || self->_prevStateDurationSec != *((_DWORD *)v4 + 12))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 36) & 0x200) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_lqmState != *((_DWORD *)v4 + 6))
      goto LABEL_88;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x800) == 0 || self->_sysMode != *((_DWORD *)v4 + 14))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 36) & 0x800) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x4000) == 0)
      goto LABEL_88;
    if (self->_isScreenOn)
    {
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_88;
    }
    else if (*((_BYTE *)v4 + 68))
    {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x4000) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x100) == 0 || self->_prevLqmState != *((_DWORD *)v4 + 11))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 36) & 0x100) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x400) == 0 || self->_prevSysMode != *((_DWORD *)v4 + 13))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 36) & 0x400) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x8000) == 0)
      goto LABEL_42;
LABEL_88:
    v7 = 0;
    goto LABEL_89;
  }
  if ((*((_WORD *)v4 + 36) & 0x8000) == 0)
    goto LABEL_88;
  if (self->_prevIsScreenOn)
  {
    if (!*((_BYTE *)v4 + 69))
      goto LABEL_88;
  }
  else if (*((_BYTE *)v4 + 69))
  {
    goto LABEL_88;
  }
LABEL_42:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_hiPowerEvent != *((_DWORD *)v4 + 4))
      goto LABEL_88;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_hiPowerExitReason != *((_DWORD *)v4 + 5))
      goto LABEL_88;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x1000) == 0 || self->_wcdmaEcio != *((_DWORD *)v4 + 15))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 36) & 0x1000) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x2000) == 0 || self->_wcdmaRscp != *((_DWORD *)v4 + 16))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 36) & 0x2000) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_lteRssi != *((_DWORD *)v4 + 9))
      goto LABEL_88;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_lteRsrp != *((_DWORD *)v4 + 7))
      goto LABEL_88;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_lteRsrq != *((_DWORD *)v4 + 8))
      goto LABEL_88;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lteRssnr != *((_DWORD *)v4 + 10))
      goto LABEL_88;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x80) == 0;
  }
LABEL_89:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
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

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_prevStateDurationSec;
      if ((has & 8) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_lqmState;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_sysMode;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_isScreenOn;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_prevLqmState;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_prevSysMode;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_prevIsScreenOn;
    if ((has & 2) != 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v10 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_hiPowerEvent;
    if ((has & 4) != 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_hiPowerExitReason;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_wcdmaEcio;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_wcdmaRscp;
    if ((has & 0x40) != 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  v14 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_lteRssi;
    if ((has & 0x10) != 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  v15 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_lteRsrp;
    if ((has & 0x20) != 0)
      goto LABEL_16;
LABEL_32:
    v17 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_17;
LABEL_33:
    v18 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
LABEL_31:
  v16 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_32;
LABEL_16:
  v17 = 2654435761 * self->_lteRsrq;
  if ((has & 0x80) == 0)
    goto LABEL_33;
LABEL_17:
  v18 = 2654435761 * self->_lteRssnr;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 36);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_prevStateDurationSec = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  self->_lqmState = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x800) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  self->_sysMode = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x4000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  self->_isScreenOn = *((_BYTE *)v4 + 68);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  self->_prevLqmState = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  self->_prevSysMode = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  self->_prevIsScreenOn = *((_BYTE *)v4 + 69);
  *(_WORD *)&self->_has |= 0x8000u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  self->_hiPowerEvent = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  self->_hiPowerExitReason = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  self->_wcdmaEcio = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  self->_wcdmaRscp = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  self->_lteRssi = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_15:
    if ((v5 & 0x20) == 0)
      goto LABEL_16;
LABEL_33:
    self->_lteRsrq = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x20u;
    if ((*((_WORD *)v4 + 36) & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  self->_lteRsrp = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x20) != 0)
    goto LABEL_33;
LABEL_16:
  if ((v5 & 0x80) != 0)
  {
LABEL_17:
    self->_lteRssnr = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_18:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)prevStateDurationSec
{
  return self->_prevStateDurationSec;
}

- (unsigned)lqmState
{
  return self->_lqmState;
}

- (int)sysMode
{
  return self->_sysMode;
}

- (BOOL)isScreenOn
{
  return self->_isScreenOn;
}

- (unsigned)prevLqmState
{
  return self->_prevLqmState;
}

- (unsigned)prevSysMode
{
  return self->_prevSysMode;
}

- (BOOL)prevIsScreenOn
{
  return self->_prevIsScreenOn;
}

- (int)wcdmaEcio
{
  return self->_wcdmaEcio;
}

- (int)wcdmaRscp
{
  return self->_wcdmaRscp;
}

- (int)lteRssi
{
  return self->_lteRssi;
}

- (int)lteRsrp
{
  return self->_lteRsrp;
}

- (int)lteRsrq
{
  return self->_lteRsrq;
}

- (int)lteRssnr
{
  return self->_lteRssnr;
}

@end
