@implementation AWDMETRICSCellularPowerLogLTECDRXConfig

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

- (void)setOnDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_onDuration = a3;
}

- (void)setHasOnDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasOnDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDrxInactivity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_drxInactivity = a3;
}

- (void)setHasDrxInactivity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDrxInactivity
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDrxRetxTimer:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_drxRetxTimer = a3;
}

- (void)setHasDrxRetxTimer:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDrxRetxTimer
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLongDrxCycle:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_longDrxCycle = a3;
}

- (void)setHasLongDrxCycle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLongDrxCycle
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCycleStartOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cycleStartOffset = a3;
}

- (void)setHasCycleStartOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCycleStartOffset
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setShortDrxCycleEnable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_shortDrxCycleEnable = a3;
}

- (void)setHasShortDrxCycleEnable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasShortDrxCycleEnable
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setShortDrxCycle:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_shortDrxCycle = a3;
}

- (void)setHasShortDrxCycle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasShortDrxCycle
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDrxShortCycleNum:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_drxShortCycleNum = a3;
}

- (void)setHasDrxShortCycleNum:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDrxShortCycleNum
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCdrxEnable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_cdrxEnable = a3;
}

- (void)setHasCdrxEnable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasCdrxEnable
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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
  v8.super_class = (Class)AWDMETRICSCellularPowerLogLTECDRXConfig;
  -[AWDMETRICSCellularPowerLogLTECDRXConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDMETRICSCellularPowerLogLTECDRXConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_onDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("on_duration"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_drxInactivity);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("drx_inactivity"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_drxRetxTimer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("drx_retx_timer"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_longDrxCycle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("long_drx_cycle"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cycleStartOffset);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("cycle_start_offset"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shortDrxCycleEnable);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("short_drx_cycle_enable"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_shortDrxCycle);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("short_drx_cycle"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cdrxEnable);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("cdrx_enable"));

    if ((*(_WORD *)&self->_has & 0x100) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_drxShortCycleNum);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("drx_short_cycle_num"));

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x100) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogLTECDRXConfigReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
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
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
LABEL_23:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x100) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field();
LABEL_13:

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
    *((_WORD *)v4 + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_onDuration;
  *((_WORD *)v4 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 5) = self->_drxInactivity;
  *((_WORD *)v4 + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 6) = self->_drxRetxTimer;
  *((_WORD *)v4 + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_longDrxCycle;
  *((_WORD *)v4 + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 4) = self->_cycleStartOffset;
  *((_WORD *)v4 + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)v4 + 49) = self->_shortDrxCycleEnable;
  *((_WORD *)v4 + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 10) = self->_shortDrxCycle;
  *((_WORD *)v4 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
LABEL_23:
    *((_BYTE *)v4 + 48) = self->_cdrxEnable;
    *((_WORD *)v4 + 26) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  *((_DWORD *)v4 + 7) = self->_drxShortCycleNum;
  *((_WORD *)v4 + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x100) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_WORD *)v4 + 26) |= 0x100u;
  }
LABEL_13:

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
    *((_WORD *)result + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_onDuration;
  *((_WORD *)result + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 5) = self->_drxInactivity;
  *((_WORD *)result + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 6) = self->_drxRetxTimer;
  *((_WORD *)result + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_longDrxCycle;
  *((_WORD *)result + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 4) = self->_cycleStartOffset;
  *((_WORD *)result + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)result + 49) = self->_shortDrxCycleEnable;
  *((_WORD *)result + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 10) = self->_shortDrxCycle;
  *((_WORD *)result + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 7) = self->_drxShortCycleNum;
  *((_WORD *)result + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_BYTE *)result + 48) = self->_cdrxEnable;
  *((_WORD *)result + 26) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    return result;
LABEL_12:
  *((_DWORD *)result + 11) = self->_subsId;
  *((_WORD *)result + 26) |= 0x100u;
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
    goto LABEL_63;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 26);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_63;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_onDuration != *((_DWORD *)v4 + 9))
      goto LABEL_63;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_drxInactivity != *((_DWORD *)v4 + 5))
      goto LABEL_63;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_drxRetxTimer != *((_DWORD *)v4 + 6))
      goto LABEL_63;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_longDrxCycle != *((_DWORD *)v4 + 8))
      goto LABEL_63;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cycleStartOffset != *((_DWORD *)v4 + 4))
      goto LABEL_63;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0)
      goto LABEL_63;
    if (self->_shortDrxCycleEnable)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_63;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_shortDrxCycle != *((_DWORD *)v4 + 10))
      goto LABEL_63;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_drxShortCycleNum != *((_DWORD *)v4 + 7))
      goto LABEL_63;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) != 0)
    {
      if (self->_cdrxEnable)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_63;
        goto LABEL_58;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_58;
    }
LABEL_63:
    v7 = 0;
    goto LABEL_64;
  }
  if ((*((_WORD *)v4 + 26) & 0x200) != 0)
    goto LABEL_63;
LABEL_58:
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 11))
      goto LABEL_63;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x100) == 0;
  }
LABEL_64:

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

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_onDuration;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_drxInactivity;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_drxRetxTimer;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_longDrxCycle;
    if ((has & 2) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_cycleStartOffset;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_shortDrxCycleEnable;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_shortDrxCycle;
    if ((has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_drxShortCycleNum;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761 * self->_cdrxEnable;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 26);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_onDuration = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_drxInactivity = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_drxRetxTimer = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_longDrxCycle = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_cycleStartOffset = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_shortDrxCycleEnable = *((_BYTE *)v4 + 49);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_shortDrxCycle = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
LABEL_23:
    self->_cdrxEnable = *((_BYTE *)v4 + 48);
    *(_WORD *)&self->_has |= 0x200u;
    if ((*((_WORD *)v4 + 26) & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  self->_drxShortCycleNum = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) != 0)
    goto LABEL_23;
LABEL_11:
  if ((v5 & 0x100) != 0)
  {
LABEL_12:
    self->_subsId = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_13:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)onDuration
{
  return self->_onDuration;
}

- (unsigned)drxInactivity
{
  return self->_drxInactivity;
}

- (unsigned)drxRetxTimer
{
  return self->_drxRetxTimer;
}

- (unsigned)longDrxCycle
{
  return self->_longDrxCycle;
}

- (unsigned)cycleStartOffset
{
  return self->_cycleStartOffset;
}

- (BOOL)shortDrxCycleEnable
{
  return self->_shortDrxCycleEnable;
}

- (unsigned)shortDrxCycle
{
  return self->_shortDrxCycle;
}

- (unsigned)drxShortCycleNum
{
  return self->_drxShortCycleNum;
}

- (BOOL)cdrxEnable
{
  return self->_cdrxEnable;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
