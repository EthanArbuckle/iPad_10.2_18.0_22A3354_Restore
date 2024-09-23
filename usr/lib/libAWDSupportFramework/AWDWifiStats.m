@implementation AWDWifiStats

- (void)setPhyType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_phyType = a3;
}

- (void)setHasPhyType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasPhyType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setTxbytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_txbytes = a3;
}

- (void)setHasTxbytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTxbytes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRxbytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rxbytes = a3;
}

- (void)setHasRxbytes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRxbytes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAvgLatencyTx:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_avgLatencyTx = a3;
}

- (void)setHasAvgLatencyTx:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAvgLatencyTx
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAvgJitterRx:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_avgJitterRx = a3;
}

- (void)setHasAvgJitterRx:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAvgJitterRx
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAvgRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_avgRssi = a3;
}

- (void)setHasAvgRssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAvgRssi
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAvgRetx:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_avgRetx = a3;
}

- (void)setHasAvgRetx:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAvgRetx
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAvgTimeBackoff:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_avgTimeBackoff = a3;
}

- (void)setHasAvgTimeBackoff:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasAvgTimeBackoff
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPowerSaveDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_powerSaveDur = a3;
}

- (void)setHasPowerSaveDur:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasPowerSaveDur
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setLinkRateMbps:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_linkRateMbps = a3;
}

- (void)setHasLinkRateMbps:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasLinkRateMbps
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setEffectiveLinkRateMpbs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_effectiveLinkRateMpbs = a3;
}

- (void)setHasEffectiveLinkRateMpbs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasEffectiveLinkRateMpbs
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setDataTransferRateMpbs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_dataTransferRateMpbs = a3;
}

- (void)setHasDataTransferRateMpbs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasDataTransferRateMpbs
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEffectiveDataTransferRateMpbs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_effectiveDataTransferRateMpbs = a3;
}

- (void)setHasEffectiveDataTransferRateMpbs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasEffectiveDataTransferRateMpbs
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAverageCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_averageCCA = a3;
}

- (void)setHasAverageCCA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAverageCCA
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWifiStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWifiStats description](&v3, sel_description), -[AWDWifiStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_phyType), CFSTR("phyType"));
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txbytes), CFSTR("txbytes"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxbytes), CFSTR("rxbytes"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgLatencyTx), CFSTR("avg_latency_tx"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgJitterRx), CFSTR("avg_jitter_rx"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_avgRssi), CFSTR("avg_rssi"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgRetx), CFSTR("avg_retx"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgTimeBackoff), CFSTR("avg_time_backoff"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_powerSaveDur), CFSTR("power_save_dur"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_linkRateMbps), CFSTR("linkRate_Mbps"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_effectiveLinkRateMpbs), CFSTR("effectiveLinkRate_Mpbs"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_effectiveDataTransferRateMpbs), CFSTR("effectiveDataTransferRate_Mpbs"));
    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dataTransferRateMpbs), CFSTR("dataTransferRate_Mpbs"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 4) != 0)
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_averageCCA), CFSTR("averageCCA"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      return;
LABEL_29:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
    goto LABEL_29;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_phyType;
    *((_WORD *)a3 + 36) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = self->_txbytes;
  *((_WORD *)a3 + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 1) = self->_rxbytes;
  *((_WORD *)a3 + 36) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 8) = self->_avgLatencyTx;
  *((_WORD *)a3 + 36) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 7) = self->_avgJitterRx;
  *((_WORD *)a3 + 36) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 10) = self->_avgRssi;
  *((_WORD *)a3 + 36) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 9) = self->_avgRetx;
  *((_WORD *)a3 + 36) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 11) = self->_avgTimeBackoff;
  *((_WORD *)a3 + 36) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 17) = self->_powerSaveDur;
  *((_WORD *)a3 + 36) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 15) = self->_linkRateMbps;
  *((_WORD *)a3 + 36) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 14) = self->_effectiveLinkRateMpbs;
  *((_WORD *)a3 + 36) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 12) = self->_dataTransferRateMpbs;
  *((_WORD *)a3 + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      return;
LABEL_29:
    *((_DWORD *)a3 + 6) = self->_averageCCA;
    *((_WORD *)a3 + 36) |= 4u;
    return;
  }
LABEL_28:
  *((_DWORD *)a3 + 13) = self->_effectiveDataTransferRateMpbs;
  *((_WORD *)a3 + 36) |= 0x200u;
  if ((*(_WORD *)&self->_has & 4) != 0)
    goto LABEL_29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((_DWORD *)result + 16) = self->_phyType;
    *((_WORD *)result + 36) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = self->_txbytes;
  *((_WORD *)result + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 1) = self->_rxbytes;
  *((_WORD *)result + 36) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 8) = self->_avgLatencyTx;
  *((_WORD *)result + 36) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 7) = self->_avgJitterRx;
  *((_WORD *)result + 36) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 10) = self->_avgRssi;
  *((_WORD *)result + 36) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 9) = self->_avgRetx;
  *((_WORD *)result + 36) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 11) = self->_avgTimeBackoff;
  *((_WORD *)result + 36) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 17) = self->_powerSaveDur;
  *((_WORD *)result + 36) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 15) = self->_linkRateMbps;
  *((_WORD *)result + 36) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 14) = self->_effectiveLinkRateMpbs;
  *((_WORD *)result + 36) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 12) = self->_dataTransferRateMpbs;
  *((_WORD *)result + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      return result;
    goto LABEL_15;
  }
LABEL_29:
  *((_DWORD *)result + 13) = self->_effectiveDataTransferRateMpbs;
  *((_WORD *)result + 36) |= 0x200u;
  if ((*(_WORD *)&self->_has & 4) == 0)
    return result;
LABEL_15:
  *((_DWORD *)result + 6) = self->_averageCCA;
  *((_WORD *)result + 36) |= 4u;
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
    v7 = *((_WORD *)a3 + 36);
    if ((has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 36) & 0x1000) == 0 || self->_phyType != *((_DWORD *)a3 + 16))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 36) & 0x1000) != 0)
    {
LABEL_71:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_txbytes != *((_QWORD *)a3 + 2))
        goto LABEL_71;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_rxbytes != *((_QWORD *)a3 + 1))
        goto LABEL_71;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_avgLatencyTx != *((_DWORD *)a3 + 8))
        goto LABEL_71;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_avgJitterRx != *((_DWORD *)a3 + 7))
        goto LABEL_71;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_avgRssi != *((_DWORD *)a3 + 10))
        goto LABEL_71;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_avgRetx != *((_DWORD *)a3 + 9))
        goto LABEL_71;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_avgTimeBackoff != *((_DWORD *)a3 + 11))
        goto LABEL_71;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 36) & 0x2000) == 0 || self->_powerSaveDur != *((_DWORD *)a3 + 17))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 36) & 0x2000) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 36) & 0x800) == 0 || self->_linkRateMbps != *((_DWORD *)a3 + 15))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 36) & 0x800) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 36) & 0x400) == 0 || self->_effectiveLinkRateMpbs != *((_DWORD *)a3 + 14))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 36) & 0x400) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 36) & 0x100) == 0 || self->_dataTransferRateMpbs != *((_DWORD *)a3 + 12))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 36) & 0x100) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 36) & 0x200) == 0 || self->_effectiveDataTransferRateMpbs != *((_DWORD *)a3 + 13))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 36) & 0x200) != 0)
    {
      goto LABEL_71;
    }
    LOBYTE(v5) = (v7 & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_averageCCA != *((_DWORD *)a3 + 6))
        goto LABEL_71;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
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

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    v3 = 2654435761 * self->_phyType;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_txbytes;
      if ((has & 1) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_rxbytes;
    if ((has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_avgLatencyTx;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_avgJitterRx;
    if ((has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_avgRssi;
    if ((has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_avgRetx;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_avgTimeBackoff;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_powerSaveDur;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_linkRateMbps;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_effectiveLinkRateMpbs;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_dataTransferRateMpbs;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_14;
LABEL_28:
    v15 = 0;
    if ((has & 4) != 0)
      goto LABEL_15;
LABEL_29:
    v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_28;
LABEL_14:
  v15 = 2654435761 * self->_effectiveDataTransferRateMpbs;
  if ((has & 4) == 0)
    goto LABEL_29;
LABEL_15:
  v16 = 2654435761 * self->_averageCCA;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x1000) != 0)
  {
    self->_phyType = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x1000u;
    v3 = *((_WORD *)a3 + 36);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_txbytes = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_rxbytes = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_avgLatencyTx = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_avgJitterRx = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_avgRssi = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_avgRetx = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_avgTimeBackoff = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x2000) == 0)
  {
LABEL_10:
    if ((v3 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  self->_powerSaveDur = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x2000u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x800) == 0)
  {
LABEL_11:
    if ((v3 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_linkRateMbps = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x400) == 0)
  {
LABEL_12:
    if ((v3 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  self->_effectiveLinkRateMpbs = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x100) == 0)
  {
LABEL_13:
    if ((v3 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  self->_dataTransferRateMpbs = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x200) == 0)
  {
LABEL_14:
    if ((v3 & 4) == 0)
      return;
LABEL_29:
    self->_averageCCA = *((_DWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 4u;
    return;
  }
LABEL_28:
  self->_effectiveDataTransferRateMpbs = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 36) & 4) != 0)
    goto LABEL_29;
}

- (unsigned)phyType
{
  return self->_phyType;
}

- (unint64_t)txbytes
{
  return self->_txbytes;
}

- (unint64_t)rxbytes
{
  return self->_rxbytes;
}

- (unsigned)avgLatencyTx
{
  return self->_avgLatencyTx;
}

- (unsigned)avgJitterRx
{
  return self->_avgJitterRx;
}

- (int)avgRssi
{
  return self->_avgRssi;
}

- (unsigned)avgRetx
{
  return self->_avgRetx;
}

- (unsigned)avgTimeBackoff
{
  return self->_avgTimeBackoff;
}

- (unsigned)powerSaveDur
{
  return self->_powerSaveDur;
}

- (unsigned)linkRateMbps
{
  return self->_linkRateMbps;
}

- (unsigned)effectiveLinkRateMpbs
{
  return self->_effectiveLinkRateMpbs;
}

- (unsigned)dataTransferRateMpbs
{
  return self->_dataTransferRateMpbs;
}

- (unsigned)effectiveDataTransferRateMpbs
{
  return self->_effectiveDataTransferRateMpbs;
}

- (unsigned)averageCCA
{
  return self->_averageCCA;
}

@end
