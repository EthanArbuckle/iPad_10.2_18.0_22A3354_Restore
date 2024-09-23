@implementation AWDWiFiMetricsManagerBTCoexModeChange

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

- (void)setCoexMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_coexMode = a3;
}

- (void)setHasCoexMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCoexMode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setA2dpConnectionCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_a2dpConnectionCount = a3;
}

- (void)setHasA2dpConnectionCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasA2dpConnectionCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHidConnectionCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hidConnectionCount = a3;
}

- (void)setHasHidConnectionCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHidConnectionCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setScoConnectionCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_scoConnectionCount = a3;
}

- (void)setHasScoConnectionCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasScoConnectionCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setWifiInfraChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_wifiInfraChannel = a3;
}

- (void)setHasWifiInfraChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWifiInfraChannel
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWifiInfraChainConfig:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_wifiInfraChainConfig = a3;
}

- (void)setHasWifiInfraChainConfig:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasWifiInfraChainConfig
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWifiInfraPhyMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_wifiInfraPhyMode = a3;
}

- (void)setHasWifiInfraPhyMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWifiInfraPhyMode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setClamshellClosed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clamshellClosed = a3;
}

- (void)setHasClamshellClosed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClamshellClosed
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRssi
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBTCoexModeChange;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerBTCoexModeChange description](&v3, sel_description), -[AWDWiFiMetricsManagerBTCoexModeChange dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_coexMode), CFSTR("coexMode"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_a2dpConnectionCount), CFSTR("a2dpConnectionCount"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hidConnectionCount), CFSTR("hidConnectionCount"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scoConnectionCount), CFSTR("scoConnectionCount"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiInfraChannel), CFSTR("wifiInfraChannel"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiInfraChainConfig), CFSTR("wifiInfraChainConfig"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_clamshellClosed), CFSTR("clamshellClosed"));
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiInfraPhyMode), CFSTR("wifiInfraPhyMode"));
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x20) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rssi), CFSTR("rssi"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerBTCoexModeChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      return;
LABEL_21:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    goto LABEL_21;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_coexMode;
  *((_WORD *)a3 + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 4) = self->_a2dpConnectionCount;
  *((_WORD *)a3 + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 7) = self->_hidConnectionCount;
  *((_WORD *)a3 + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 9) = self->_scoConnectionCount;
  *((_WORD *)a3 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 11) = self->_wifiInfraChannel;
  *((_WORD *)a3 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 10) = self->_wifiInfraChainConfig;
  *((_WORD *)a3 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 12) = self->_wifiInfraPhyMode;
  *((_WORD *)a3 + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      return;
LABEL_21:
    *((_DWORD *)a3 + 8) = self->_rssi;
    *((_WORD *)a3 + 26) |= 0x20u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_clamshellClosed;
  *((_WORD *)a3 + 26) |= 4u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    goto LABEL_21;
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_coexMode;
  *((_WORD *)result + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 4) = self->_a2dpConnectionCount;
  *((_WORD *)result + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 7) = self->_hidConnectionCount;
  *((_WORD *)result + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 9) = self->_scoConnectionCount;
  *((_WORD *)result + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 11) = self->_wifiInfraChannel;
  *((_WORD *)result + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 10) = self->_wifiInfraChainConfig;
  *((_WORD *)result + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 12) = self->_wifiInfraPhyMode;
  *((_WORD *)result + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 5) = self->_clamshellClosed;
  *((_WORD *)result + 26) |= 4u;
  if ((*(_WORD *)&self->_has & 0x20) == 0)
    return result;
LABEL_11:
  *((_DWORD *)result + 8) = self->_rssi;
  *((_WORD *)result + 26) |= 0x20u;
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
    v7 = *((_WORD *)a3 + 26);
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_51;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_51:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_coexMode != *((_DWORD *)a3 + 6))
        goto LABEL_51;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_a2dpConnectionCount != *((_DWORD *)a3 + 4))
        goto LABEL_51;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_hidConnectionCount != *((_DWORD *)a3 + 7))
        goto LABEL_51;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_scoConnectionCount != *((_DWORD *)a3 + 9))
        goto LABEL_51;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x100) == 0 || self->_wifiInfraChannel != *((_DWORD *)a3 + 11))
        goto LABEL_51;
    }
    else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_wifiInfraChainConfig != *((_DWORD *)a3 + 10))
        goto LABEL_51;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x200) == 0 || self->_wifiInfraPhyMode != *((_DWORD *)a3 + 12))
        goto LABEL_51;
    }
    else if ((*((_WORD *)a3 + 26) & 0x200) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_clamshellClosed != *((_DWORD *)a3 + 5))
        goto LABEL_51;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_51;
    }
    LOBYTE(v5) = (v7 & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_rssi != *((_DWORD *)a3 + 8))
        goto LABEL_51;
      LOBYTE(v5) = 1;
    }
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_coexMode;
      if ((has & 2) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_a2dpConnectionCount;
    if ((has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_hidConnectionCount;
    if ((has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_scoConnectionCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_wifiInfraChannel;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_wifiInfraChainConfig;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_wifiInfraPhyMode;
    if ((has & 4) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  v10 = 0;
  if ((has & 4) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761 * self->_clamshellClosed;
  if ((has & 0x20) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_rssi;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v3 = *((_WORD *)a3 + 26);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_coexMode = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_a2dpConnectionCount = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_hidConnectionCount = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_scoConnectionCount = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_wifiInfraChannel = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  self->_wifiInfraChainConfig = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x200) == 0)
  {
LABEL_9:
    if ((v3 & 4) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  self->_wifiInfraPhyMode = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 4) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0)
      return;
LABEL_21:
    self->_rssi = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 0x20u;
    return;
  }
LABEL_20:
  self->_clamshellClosed = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)a3 + 26) & 0x20) != 0)
    goto LABEL_21;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)coexMode
{
  return self->_coexMode;
}

- (unsigned)a2dpConnectionCount
{
  return self->_a2dpConnectionCount;
}

- (unsigned)hidConnectionCount
{
  return self->_hidConnectionCount;
}

- (unsigned)scoConnectionCount
{
  return self->_scoConnectionCount;
}

- (unsigned)wifiInfraChannel
{
  return self->_wifiInfraChannel;
}

- (unsigned)wifiInfraChainConfig
{
  return self->_wifiInfraChainConfig;
}

- (unsigned)wifiInfraPhyMode
{
  return self->_wifiInfraPhyMode;
}

- (unsigned)clamshellClosed
{
  return self->_clamshellClosed;
}

- (int)rssi
{
  return self->_rssi;
}

@end
