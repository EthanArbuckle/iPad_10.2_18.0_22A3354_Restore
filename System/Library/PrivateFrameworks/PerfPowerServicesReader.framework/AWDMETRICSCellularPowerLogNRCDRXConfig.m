@implementation AWDMETRICSCellularPowerLogNRCDRXConfig

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCdrxEnable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_cdrxEnable = a3;
}

- (void)setHasCdrxEnable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasCdrxEnable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHarqRttTimerDl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_harqRttTimerDl = a3;
}

- (void)setHasHarqRttTimerDl:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHarqRttTimerDl
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHarqRttTimerUl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_harqRttTimerUl = a3;
}

- (void)setHasHarqRttTimerUl:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasHarqRttTimerUl
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDrxSlotOffset:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_drxSlotOffset = a3;
}

- (void)setHasDrxSlotOffset:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDrxSlotOffset
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShortCycleEnable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_shortCycleEnable = a3;
}

- (void)setHasShortCycleEnable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasShortCycleEnable
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setRetransmissionTimerDl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_retransmissionTimerDl = a3;
}

- (void)setHasRetransmissionTimerDl:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRetransmissionTimerDl
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRetransmissionTimerUl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_retransmissionTimerUl = a3;
}

- (void)setHasRetransmissionTimerUl:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRetransmissionTimerUl
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setOnDurationTimerFraction:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_onDurationTimerFraction = a3;
}

- (void)setHasOnDurationTimerFraction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasOnDurationTimerFraction
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setOnDurationTimerMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_onDurationTimerMs = a3;
}

- (void)setHasOnDurationTimerMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasOnDurationTimerMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setInactivityTimerMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_inactivityTimerMs = a3;
}

- (void)setHasInactivityTimerMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasInactivityTimerMs
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLongCycle:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_longCycle = a3;
}

- (void)setHasLongCycle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLongCycle
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setLongCycleOffset:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_longCycleOffset = a3;
}

- (void)setHasLongCycleOffset:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLongCycleOffset
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setShortCycle:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_shortCycle = a3;
}

- (void)setHasShortCycle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasShortCycle
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setShortCycleTimer:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_shortCycleTimer = a3;
}

- (void)setHasShortCycleTimer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasShortCycleTimer
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)fr
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_fr;
  else
    return 0;
}

- (void)setFr:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_fr = a3;
}

- (void)setHasFr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($8916D25C126ECC634E090C0140988639)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasFr
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)frAsString:(int)a3
{
  if (a3 < 3)
    return off_251429C88[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFr:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB6")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MMWAVE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularPowerLogNRCDRXConfig;
  -[AWDMETRICSCellularPowerLogNRCDRXConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDMETRICSCellularPowerLogNRCDRXConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $8916D25C126ECC634E090C0140988639 has;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t fr;
  __CFString *v22;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cdrxEnable);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("cdrx_enable"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_harqRttTimerDl);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("harq_rtt_timer_dl"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_harqRttTimerUl);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("harq_rtt_timer_ul"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_drxSlotOffset);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("drx_slot_offset"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shortCycleEnable);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("short_cycle_enable"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retransmissionTimerDl);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("retransmission_timer_dl"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retransmissionTimerUl);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("retransmission_timer_ul"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_onDurationTimerFraction);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("on_duration_timer_fraction"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_onDurationTimerMs);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("on_duration_timer_ms"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_inactivityTimerMs);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("inactivity_timer_ms"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_longCycle);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("long_cycle"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_longCycleOffset);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("long_cycle_offset"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_shortCycle);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("short_cycle"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
LABEL_34:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_subsId);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("subs_id"));

    if ((*(_DWORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_35;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_shortCycleTimer);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("short_cycle_timer"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
    goto LABEL_34;
LABEL_17:
  if ((*(_BYTE *)&has & 4) == 0)
    return v3;
LABEL_35:
  fr = self->_fr;
  if (fr >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_fr);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_251429C88[fr];
  }
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("fr"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogNRCDRXConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $8916D25C126ECC634E090C0140988639 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
LABEL_35:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_BYTE *)&has & 4) != 0)
LABEL_18:
    PBDataWriterWriteInt32Field();
LABEL_19:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $8916D25C126ECC634E090C0140988639 has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 19) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 72) = self->_cdrxEnable;
  *((_DWORD *)v4 + 19) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 6) = self->_harqRttTimerDl;
  *((_DWORD *)v4 + 19) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 7) = self->_harqRttTimerUl;
  *((_DWORD *)v4 + 19) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 4) = self->_drxSlotOffset;
  *((_DWORD *)v4 + 19) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *((_BYTE *)v4 + 73) = self->_shortCycleEnable;
  *((_DWORD *)v4 + 19) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 13) = self->_retransmissionTimerDl;
  *((_DWORD *)v4 + 19) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 14) = self->_retransmissionTimerUl;
  *((_DWORD *)v4 + 19) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 11) = self->_onDurationTimerFraction;
  *((_DWORD *)v4 + 19) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 12) = self->_onDurationTimerMs;
  *((_DWORD *)v4 + 19) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 8) = self->_inactivityTimerMs;
  *((_DWORD *)v4 + 19) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 9) = self->_longCycle;
  *((_DWORD *)v4 + 19) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 10) = self->_longCycleOffset;
  *((_DWORD *)v4 + 19) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 15) = self->_shortCycle;
  *((_DWORD *)v4 + 19) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
LABEL_35:
    *((_DWORD *)v4 + 17) = self->_subsId;
    *((_DWORD *)v4 + 19) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  *((_DWORD *)v4 + 16) = self->_shortCycleTimer;
  *((_DWORD *)v4 + 19) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 5) = self->_fr;
    *((_DWORD *)v4 + 19) |= 4u;
  }
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $8916D25C126ECC634E090C0140988639 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 19) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 72) = self->_cdrxEnable;
  *((_DWORD *)result + 19) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 6) = self->_harqRttTimerDl;
  *((_DWORD *)result + 19) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 7) = self->_harqRttTimerUl;
  *((_DWORD *)result + 19) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 4) = self->_drxSlotOffset;
  *((_DWORD *)result + 19) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *((_BYTE *)result + 73) = self->_shortCycleEnable;
  *((_DWORD *)result + 19) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 13) = self->_retransmissionTimerDl;
  *((_DWORD *)result + 19) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 14) = self->_retransmissionTimerUl;
  *((_DWORD *)result + 19) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 11) = self->_onDurationTimerFraction;
  *((_DWORD *)result + 19) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 12) = self->_onDurationTimerMs;
  *((_DWORD *)result + 19) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 8) = self->_inactivityTimerMs;
  *((_DWORD *)result + 19) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 9) = self->_longCycle;
  *((_DWORD *)result + 19) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 10) = self->_longCycleOffset;
  *((_DWORD *)result + 19) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 15) = self->_shortCycle;
  *((_DWORD *)result + 19) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 16) = self->_shortCycleTimer;
  *((_DWORD *)result + 19) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      return result;
    goto LABEL_18;
  }
LABEL_35:
  *((_DWORD *)result + 17) = self->_subsId;
  *((_DWORD *)result + 19) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 4) == 0)
    return result;
LABEL_18:
  *((_DWORD *)result + 5) = self->_fr;
  *((_DWORD *)result + 19) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $8916D25C126ECC634E090C0140988639 has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_93;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 19);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_93;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0)
      goto LABEL_93;
    if (self->_cdrxEnable)
    {
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_93;
    }
    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_harqRttTimerDl != *((_DWORD *)v4 + 6))
      goto LABEL_93;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_harqRttTimerUl != *((_DWORD *)v4 + 7))
      goto LABEL_93;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_drxSlotOffset != *((_DWORD *)v4 + 4))
      goto LABEL_93;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) != 0)
    {
      if (self->_shortCycleEnable)
      {
        if (!*((_BYTE *)v4 + 73))
          goto LABEL_93;
        goto LABEL_38;
      }
      if (!*((_BYTE *)v4 + 73))
        goto LABEL_38;
    }
LABEL_93:
    v7 = 0;
    goto LABEL_94;
  }
  if ((v6 & 0x10000) != 0)
    goto LABEL_93;
LABEL_38:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_retransmissionTimerDl != *((_DWORD *)v4 + 13))
      goto LABEL_93;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_retransmissionTimerUl != *((_DWORD *)v4 + 14))
      goto LABEL_93;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_onDurationTimerFraction != *((_DWORD *)v4 + 11))
      goto LABEL_93;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_onDurationTimerMs != *((_DWORD *)v4 + 12))
      goto LABEL_93;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_inactivityTimerMs != *((_DWORD *)v4 + 8))
      goto LABEL_93;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_longCycle != *((_DWORD *)v4 + 9))
      goto LABEL_93;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_longCycleOffset != *((_DWORD *)v4 + 10))
      goto LABEL_93;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_shortCycle != *((_DWORD *)v4 + 15))
      goto LABEL_93;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_shortCycleTimer != *((_DWORD *)v4 + 16))
      goto LABEL_93;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_subsId != *((_DWORD *)v4 + 17))
      goto LABEL_93;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_fr != *((_DWORD *)v4 + 5))
      goto LABEL_93;
    v7 = 1;
  }
  else
  {
    v7 = (*((_DWORD *)v4 + 19) & 4) == 0;
  }
LABEL_94:

  return v7;
}

- (unint64_t)hash
{
  $8916D25C126ECC634E090C0140988639 has;
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

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_cdrxEnable;
      if ((*(_BYTE *)&has & 8) != 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_harqRttTimerDl;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_harqRttTimerUl;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v6 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_drxSlotOffset;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_shortCycleEnable;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v8 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_retransmissionTimerDl;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v9 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_retransmissionTimerUl;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v10 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_onDurationTimerFraction;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v11 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_onDurationTimerMs;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v12 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_inactivityTimerMs;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v13 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_longCycle;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v14 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_longCycleOffset;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v15 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_shortCycle;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  v16 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_shortCycleTimer;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_17;
LABEL_34:
    v18 = 0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_18;
LABEL_35:
    v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_33:
  v17 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0)
    goto LABEL_34;
LABEL_17:
  v18 = 2654435761 * self->_subsId;
  if ((*(_BYTE *)&has & 4) == 0)
    goto LABEL_35;
LABEL_18:
  v19 = 2654435761 * self->_fr;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 19);
    if ((v5 & 0x8000) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  self->_cdrxEnable = *((_BYTE *)v4 + 72);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  self->_harqRttTimerDl = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  self->_harqRttTimerUl = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  self->_drxSlotOffset = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x10000) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  self->_shortCycleEnable = *((_BYTE *)v4 + 73);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  self->_retransmissionTimerDl = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  self->_retransmissionTimerUl = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  self->_onDurationTimerFraction = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  self->_onDurationTimerMs = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  self->_inactivityTimerMs = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  self->_longCycle = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  self->_longCycleOffset = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x1000) == 0)
  {
LABEL_15:
    if ((v5 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  self->_shortCycle = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x2000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0)
      goto LABEL_17;
LABEL_35:
    self->_subsId = *((_DWORD *)v4 + 17);
    *(_DWORD *)&self->_has |= 0x4000u;
    if ((*((_DWORD *)v4 + 19) & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  self->_shortCycleTimer = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 19);
  if ((v5 & 0x4000) != 0)
    goto LABEL_35;
LABEL_17:
  if ((v5 & 4) != 0)
  {
LABEL_18:
    self->_fr = *((_DWORD *)v4 + 5);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_19:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)cdrxEnable
{
  return self->_cdrxEnable;
}

- (unsigned)harqRttTimerDl
{
  return self->_harqRttTimerDl;
}

- (unsigned)harqRttTimerUl
{
  return self->_harqRttTimerUl;
}

- (unsigned)drxSlotOffset
{
  return self->_drxSlotOffset;
}

- (BOOL)shortCycleEnable
{
  return self->_shortCycleEnable;
}

- (unsigned)retransmissionTimerDl
{
  return self->_retransmissionTimerDl;
}

- (unsigned)retransmissionTimerUl
{
  return self->_retransmissionTimerUl;
}

- (unsigned)onDurationTimerFraction
{
  return self->_onDurationTimerFraction;
}

- (unsigned)onDurationTimerMs
{
  return self->_onDurationTimerMs;
}

- (unsigned)inactivityTimerMs
{
  return self->_inactivityTimerMs;
}

- (unsigned)longCycle
{
  return self->_longCycle;
}

- (unsigned)longCycleOffset
{
  return self->_longCycleOffset;
}

- (unsigned)shortCycle
{
  return self->_shortCycle;
}

- (unsigned)shortCycleTimer
{
  return self->_shortCycleTimer;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
