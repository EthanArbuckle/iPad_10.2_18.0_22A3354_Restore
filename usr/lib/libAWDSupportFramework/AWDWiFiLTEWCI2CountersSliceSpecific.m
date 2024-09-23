@implementation AWDWiFiLTEWCI2CountersSliceSpecific

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setWlanRxPriTimeInMS:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_wlanRxPriTimeInMS = a3;
}

- (void)setHasWlanRxPriTimeInMS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWlanRxPriTimeInMS
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setWlanRxPriCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_wlanRxPriCount = a3;
}

- (void)setHasWlanRxPriCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWlanRxPriCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLteTxPowerLimitTimeInMS:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_lteTxPowerLimitTimeInMS = a3;
}

- (void)setHasLteTxPowerLimitTimeInMS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLteTxPowerLimitTimeInMS
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLteTxPowerLimitCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_lteTxPowerLimitCount = a3;
}

- (void)setHasLteTxPowerLimitCount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLteTxPowerLimitCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setType4HonouredTimeInMS:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_type4HonouredTimeInMS = a3;
}

- (void)setHasType4HonouredTimeInMS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasType4HonouredTimeInMS
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setType4HonouredCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_type4HonouredCount = a3;
}

- (void)setHasType4HonouredCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasType4HonouredCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTimeSharingWLANTimeInMS:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timeSharingWLANTimeInMS = a3;
}

- (void)setHasTimeSharingWLANTimeInMS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimeSharingWLANTimeInMS
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTimeSharingWLANIntervalCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timeSharingWLANIntervalCount = a3;
}

- (void)setHasTimeSharingWLANIntervalCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimeSharingWLANIntervalCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setWlanProtectionFramesDueToLTECoexCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_wlanProtectionFramesDueToLTECoexCount = a3;
}

- (void)setHasWlanProtectionFramesDueToLTECoexCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWlanProtectionFramesDueToLTECoexCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setType4DueToTimerExpiryCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_type4DueToTimerExpiryCount = a3;
}

- (void)setHasType4DueToTimerExpiryCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasType4DueToTimerExpiryCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTEWCI2CountersSliceSpecific;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiLTEWCI2CountersSliceSpecific description](&v3, sel_description), -[AWDWiFiLTEWCI2CountersSliceSpecific dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wlanRxPriTimeInMS), CFSTR("wlanRxPriTimeInMS"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wlanRxPriCount), CFSTR("wlanRxPriCount"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lteTxPowerLimitTimeInMS), CFSTR("lteTxPowerLimitTimeInMS"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lteTxPowerLimitCount), CFSTR("lteTxPowerLimitCount"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_type4HonouredTimeInMS), CFSTR("type4HonouredTimeInMS"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_type4HonouredCount), CFSTR("type4HonouredCount"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeSharingWLANTimeInMS), CFSTR("timeSharingWLANTimeInMS"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wlanProtectionFramesDueToLTECoexCount), CFSTR("wlanProtectionFramesDueToLTECoexCount"));
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeSharingWLANIntervalCount), CFSTR("timeSharingWLANIntervalCount"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x20) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_type4DueToTimerExpiryCount), CFSTR("type4DueToTimerExpiryCount"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLTEWCI2CountersSliceSpecificReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      return;
LABEL_23:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    goto LABEL_23;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 48) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 11) = self->_wlanRxPriTimeInMS;
  *((_WORD *)a3 + 48) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)a3 + 10) = self->_wlanRxPriCount;
  *((_WORD *)a3 + 48) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 2) = self->_lteTxPowerLimitTimeInMS;
  *((_WORD *)a3 + 48) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 1) = self->_lteTxPowerLimitCount;
  *((_WORD *)a3 + 48) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 8) = self->_type4HonouredTimeInMS;
  *((_WORD *)a3 + 48) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 7) = self->_type4HonouredCount;
  *((_WORD *)a3 + 48) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 4) = self->_timeSharingWLANTimeInMS;
  *((_WORD *)a3 + 48) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 3) = self->_timeSharingWLANIntervalCount;
  *((_WORD *)a3 + 48) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      return;
LABEL_23:
    *((_QWORD *)a3 + 6) = self->_type4DueToTimerExpiryCount;
    *((_WORD *)a3 + 48) |= 0x20u;
    return;
  }
LABEL_22:
  *((_QWORD *)a3 + 9) = self->_wlanProtectionFramesDueToLTECoexCount;
  *((_WORD *)a3 + 48) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    goto LABEL_23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)result + 5) = self->_timestamp;
    *((_WORD *)result + 48) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 11) = self->_wlanRxPriTimeInMS;
  *((_WORD *)result + 48) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 10) = self->_wlanRxPriCount;
  *((_WORD *)result + 48) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 2) = self->_lteTxPowerLimitTimeInMS;
  *((_WORD *)result + 48) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 1) = self->_lteTxPowerLimitCount;
  *((_WORD *)result + 48) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 8) = self->_type4HonouredTimeInMS;
  *((_WORD *)result + 48) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 7) = self->_type4HonouredCount;
  *((_WORD *)result + 48) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 4) = self->_timeSharingWLANTimeInMS;
  *((_WORD *)result + 48) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 3) = self->_timeSharingWLANIntervalCount;
  *((_WORD *)result + 48) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_QWORD *)result + 9) = self->_wlanProtectionFramesDueToLTECoexCount;
  *((_WORD *)result + 48) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x20) == 0)
    return result;
LABEL_12:
  *((_QWORD *)result + 6) = self->_type4DueToTimerExpiryCount;
  *((_WORD *)result + 48) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 48);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 5))
        goto LABEL_56;
    }
    else if ((v7 & 0x10) != 0)
    {
LABEL_56:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x400) == 0 || self->_wlanRxPriTimeInMS != *((_QWORD *)a3 + 11))
        goto LABEL_56;
    }
    else if ((*((_WORD *)a3 + 48) & 0x400) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x200) == 0 || self->_wlanRxPriCount != *((_QWORD *)a3 + 10))
        goto LABEL_56;
    }
    else if ((*((_WORD *)a3 + 48) & 0x200) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_lteTxPowerLimitTimeInMS != *((_QWORD *)a3 + 2))
        goto LABEL_56;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_lteTxPowerLimitCount != *((_QWORD *)a3 + 1))
        goto LABEL_56;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_type4HonouredTimeInMS != *((_QWORD *)a3 + 8))
        goto LABEL_56;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_type4HonouredCount != *((_QWORD *)a3 + 7))
        goto LABEL_56;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_timeSharingWLANTimeInMS != *((_QWORD *)a3 + 4))
        goto LABEL_56;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timeSharingWLANIntervalCount != *((_QWORD *)a3 + 3))
        goto LABEL_56;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x100) == 0 || self->_wlanProtectionFramesDueToLTECoexCount != *((_QWORD *)a3 + 9))
        goto LABEL_56;
    }
    else if ((*((_WORD *)a3 + 48) & 0x100) != 0)
    {
      goto LABEL_56;
    }
    LOBYTE(v5) = (v7 & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_type4DueToTimerExpiryCount != *((_QWORD *)a3 + 6))
        goto LABEL_56;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_wlanRxPriTimeInMS;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_wlanRxPriCount;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_lteTxPowerLimitTimeInMS;
    if ((has & 1) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((has & 1) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_lteTxPowerLimitCount;
    if ((has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_type4HonouredTimeInMS;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_type4HonouredCount;
    if ((has & 8) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_timeSharingWLANTimeInMS;
    if ((has & 4) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_timeSharingWLANIntervalCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761u * self->_wlanProtectionFramesDueToLTECoexCount;
  if ((has & 0x20) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761u * self->_type4DueToTimerExpiryCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v3 = *((_WORD *)a3 + 48);
    if ((v3 & 0x400) == 0)
    {
LABEL_3:
      if ((v3 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*((_WORD *)a3 + 48) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_wlanRxPriTimeInMS = *((_QWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x200) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_wlanRxPriCount = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 48);
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_lteTxPowerLimitTimeInMS = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 48);
  if ((v3 & 1) == 0)
  {
LABEL_6:
    if ((v3 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_lteTxPowerLimitCount = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x80) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_type4HonouredTimeInMS = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 8) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_type4HonouredCount = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 48);
  if ((v3 & 8) == 0)
  {
LABEL_9:
    if ((v3 & 4) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  self->_timeSharingWLANTimeInMS = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 48);
  if ((v3 & 4) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  self->_timeSharingWLANIntervalCount = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x20) == 0)
      return;
LABEL_23:
    self->_type4DueToTimerExpiryCount = *((_QWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    return;
  }
LABEL_22:
  self->_wlanProtectionFramesDueToLTECoexCount = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 48) & 0x20) != 0)
    goto LABEL_23;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)wlanRxPriTimeInMS
{
  return self->_wlanRxPriTimeInMS;
}

- (unint64_t)wlanRxPriCount
{
  return self->_wlanRxPriCount;
}

- (unint64_t)lteTxPowerLimitTimeInMS
{
  return self->_lteTxPowerLimitTimeInMS;
}

- (unint64_t)lteTxPowerLimitCount
{
  return self->_lteTxPowerLimitCount;
}

- (unint64_t)type4HonouredTimeInMS
{
  return self->_type4HonouredTimeInMS;
}

- (unint64_t)type4HonouredCount
{
  return self->_type4HonouredCount;
}

- (unint64_t)timeSharingWLANTimeInMS
{
  return self->_timeSharingWLANTimeInMS;
}

- (unint64_t)timeSharingWLANIntervalCount
{
  return self->_timeSharingWLANIntervalCount;
}

- (unint64_t)wlanProtectionFramesDueToLTECoexCount
{
  return self->_wlanProtectionFramesDueToLTECoexCount;
}

- (unint64_t)type4DueToTimerExpiryCount
{
  return self->_type4DueToTimerExpiryCount;
}

@end
