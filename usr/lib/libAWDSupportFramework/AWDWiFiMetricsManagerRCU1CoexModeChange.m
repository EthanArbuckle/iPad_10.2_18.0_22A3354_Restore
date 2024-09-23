@implementation AWDWiFiMetricsManagerRCU1CoexModeChange

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

- (void)setChannelNum:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_channelNum = a3;
}

- (void)setHasChannelNum:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasChannelNum
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setOnWifiMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_onWifiMode = a3;
}

- (void)setHasOnWifiMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasOnWifiMode
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setOffWifiMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_offWifiMode = a3;
}

- (void)setHasOffWifiMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasOffWifiMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setOnAirplayMode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_onAirplayMode = a3;
}

- (void)setHasOnAirplayMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasOnAirplayMode
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setOffAirplayMode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_offAirplayMode = a3;
}

- (void)setHasOffAirplayMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOffAirplayMode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPowerOnDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_powerOnDuration = a3;
}

- (void)setHasPowerOnDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPowerOnDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDisableDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_disableDuration = a3;
}

- (void)setHasDisableDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDisableDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDenyDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_denyDuration = a3;
}

- (void)setHasDenyDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDenyDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTddDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_tddDuration = a3;
}

- (void)setHasTddDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTddDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setFwDenyCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_fwDenyCount = a3;
}

- (void)setHasFwDenyCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFwDenyCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerRCU1CoexModeChange;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerRCU1CoexModeChange description](&v3, sel_description), -[AWDWiFiMetricsManagerRCU1CoexModeChange dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelNum), CFSTR("channel_num"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_onWifiMode), CFSTR("on_wifi_mode"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_offWifiMode), CFSTR("off_wifi_mode"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_onAirplayMode), CFSTR("on_airplay_mode"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_offAirplayMode), CFSTR("off_airplay_mode"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerOnDuration), CFSTR("power_on_duration"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_disableDuration), CFSTR("disable_duration"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tddDuration), CFSTR("tdd_duration"));
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_denyDuration), CFSTR("deny_duration"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x40) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fwDenyCount), CFSTR("fw_deny_count"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerRCU1CoexModeChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      return;
LABEL_23:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    goto LABEL_23;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 34) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 12) = self->_channelNum;
  *((_WORD *)a3 + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 15) = self->_onWifiMode;
  *((_WORD *)a3 + 34) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 14) = self->_offWifiMode;
  *((_WORD *)a3 + 34) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_BYTE *)a3 + 65) = self->_onAirplayMode;
  *((_WORD *)a3 + 34) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)a3 + 64) = self->_offAirplayMode;
  *((_WORD *)a3 + 34) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 3) = self->_powerOnDuration;
  *((_WORD *)a3 + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 2) = self->_disableDuration;
  *((_WORD *)a3 + 34) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 1) = self->_denyDuration;
  *((_WORD *)a3 + 34) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      return;
LABEL_23:
    *((_DWORD *)a3 + 13) = self->_fwDenyCount;
    *((_WORD *)a3 + 34) |= 0x40u;
    return;
  }
LABEL_22:
  *((_QWORD *)a3 + 4) = self->_tddDuration;
  *((_WORD *)a3 + 34) |= 8u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
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
    *((_WORD *)result + 34) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 12) = self->_channelNum;
  *((_WORD *)result + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 15) = self->_onWifiMode;
  *((_WORD *)result + 34) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 14) = self->_offWifiMode;
  *((_WORD *)result + 34) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)result + 65) = self->_onAirplayMode;
  *((_WORD *)result + 34) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)result + 64) = self->_offAirplayMode;
  *((_WORD *)result + 34) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 3) = self->_powerOnDuration;
  *((_WORD *)result + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 2) = self->_disableDuration;
  *((_WORD *)result + 34) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 1) = self->_denyDuration;
  *((_WORD *)result + 34) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_QWORD *)result + 4) = self->_tddDuration;
  *((_WORD *)result + 34) |= 8u;
  if ((*(_WORD *)&self->_has & 0x40) == 0)
    return result;
LABEL_12:
  *((_DWORD *)result + 13) = self->_fwDenyCount;
  *((_WORD *)result + 34) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 34);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 5))
      goto LABEL_62;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_channelNum != *((_DWORD *)a3 + 12))
      goto LABEL_62;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 34) & 0x100) == 0 || self->_onWifiMode != *((_DWORD *)a3 + 15))
      goto LABEL_62;
  }
  else if ((*((_WORD *)a3 + 34) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_offWifiMode != *((_DWORD *)a3 + 14))
      goto LABEL_62;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 34) & 0x400) == 0)
      goto LABEL_62;
    if (self->_onAirplayMode)
    {
      if (!*((_BYTE *)a3 + 65))
        goto LABEL_62;
    }
    else if (*((_BYTE *)a3 + 65))
    {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)a3 + 34) & 0x400) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 34) & 0x200) != 0)
      goto LABEL_62;
    goto LABEL_38;
  }
  if ((*((_WORD *)a3 + 34) & 0x200) == 0)
    goto LABEL_62;
  if (self->_offAirplayMode)
  {
    if (!*((_BYTE *)a3 + 64))
      goto LABEL_62;
    goto LABEL_38;
  }
  if (*((_BYTE *)a3 + 64))
  {
LABEL_62:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_38:
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_powerOnDuration != *((_QWORD *)a3 + 3))
      goto LABEL_62;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_disableDuration != *((_QWORD *)a3 + 2))
      goto LABEL_62;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_denyDuration != *((_QWORD *)a3 + 1))
      goto LABEL_62;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_tddDuration != *((_QWORD *)a3 + 4))
      goto LABEL_62;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_62;
  }
  LOBYTE(v5) = (v7 & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_fwDenyCount != *((_DWORD *)a3 + 13))
      goto LABEL_62;
    LOBYTE(v5) = 1;
  }
  return v5;
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
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_channelNum;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_onWifiMode;
    if ((has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_offWifiMode;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_onAirplayMode;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_offAirplayMode;
    if ((has & 4) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_powerOnDuration;
    if ((has & 2) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_disableDuration;
    if ((has & 1) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((has & 1) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_denyDuration;
    if ((has & 8) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  v11 = 0;
  if ((has & 8) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761u * self->_tddDuration;
  if ((has & 0x40) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761 * self->_fwDenyCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v3 = *((_WORD *)a3 + 34);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_channelNum = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_onWifiMode = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_offWifiMode = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x400) == 0)
  {
LABEL_6:
    if ((v3 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_onAirplayMode = *((_BYTE *)a3 + 65);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x200) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_offAirplayMode = *((_BYTE *)a3 + 64);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 4) == 0)
  {
LABEL_8:
    if ((v3 & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_powerOnDuration = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 2) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  self->_disableDuration = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 8) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  self->_denyDuration = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 8) == 0)
  {
LABEL_11:
    if ((v3 & 0x40) == 0)
      return;
LABEL_23:
    self->_fwDenyCount = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x40u;
    return;
  }
LABEL_22:
  self->_tddDuration = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 34) & 0x40) != 0)
    goto LABEL_23;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)channelNum
{
  return self->_channelNum;
}

- (unsigned)onWifiMode
{
  return self->_onWifiMode;
}

- (unsigned)offWifiMode
{
  return self->_offWifiMode;
}

- (BOOL)onAirplayMode
{
  return self->_onAirplayMode;
}

- (BOOL)offAirplayMode
{
  return self->_offAirplayMode;
}

- (unint64_t)powerOnDuration
{
  return self->_powerOnDuration;
}

- (unint64_t)disableDuration
{
  return self->_disableDuration;
}

- (unint64_t)denyDuration
{
  return self->_denyDuration;
}

- (unint64_t)tddDuration
{
  return self->_tddDuration;
}

- (unsigned)fwDenyCount
{
  return self->_fwDenyCount;
}

@end
