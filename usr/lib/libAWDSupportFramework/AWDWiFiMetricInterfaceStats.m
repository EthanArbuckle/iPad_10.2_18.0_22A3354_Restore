@implementation AWDWiFiMetricInterfaceStats

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

- (void)setWifiA2dpRxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_wifiA2dpRxBytes = a3;
}

- (void)setHasWifiA2dpRxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasWifiA2dpRxBytes
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWifiScoRxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_wifiScoRxBytes = a3;
}

- (void)setHasWifiScoRxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasWifiScoRxBytes
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setWifiRxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_wifiRxBytes = a3;
}

- (void)setHasWifiRxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWifiRxBytes
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setWifiHidRxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_wifiHidRxBytes = a3;
}

- (void)setHasWifiHidRxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWifiHidRxBytes
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCellularDataRxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cellularDataRxBytes = a3;
}

- (void)setHasCellularDataRxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCellularDataRxBytes
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setWifiA2dpTxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_wifiA2dpTxBytes = a3;
}

- (void)setHasWifiA2dpTxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWifiA2dpTxBytes
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWifiScoTxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_wifiScoTxBytes = a3;
}

- (void)setHasWifiScoTxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasWifiScoTxBytes
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setWifiTxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_wifiTxBytes = a3;
}

- (void)setHasWifiTxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasWifiTxBytes
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setWifiHidTxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_wifiHidTxBytes = a3;
}

- (void)setHasWifiHidTxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWifiHidTxBytes
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setCellularDataTxBytes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cellularDataTxBytes = a3;
}

- (void)setHasCellularDataTxBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCellularDataTxBytes
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setStatsCollectionMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_statsCollectionMinutes = a3;
}

- (void)setHasStatsCollectionMinutes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasStatsCollectionMinutes
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setWifiAssocMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_wifiAssocMinutes = a3;
}

- (void)setHasWifiAssocMinutes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWifiAssocMinutes
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setA2dpAssocMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_a2dpAssocMinutes = a3;
}

- (void)setHasA2dpAssocMinutes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasA2dpAssocMinutes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setScoAssocMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_scoAssocMinutes = a3;
}

- (void)setHasScoAssocMinutes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasScoAssocMinutes
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHidAssocMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hidAssocMinutes = a3;
}

- (void)setHasHidAssocMinutes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHidAssocMinutes
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricInterfaceStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricInterfaceStats description](&v3, sel_description), -[AWDWiFiMetricInterfaceStats dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiA2dpRxBytes), CFSTR("wifiA2dpRxBytes"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiScoRxBytes), CFSTR("wifiScoRxBytes"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiRxBytes), CFSTR("wifiRxBytes"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiHidRxBytes), CFSTR("wifiHidRxBytes"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellularDataRxBytes), CFSTR("cellularDataRxBytes"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiA2dpTxBytes), CFSTR("wifiA2dpTxBytes"));
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiScoTxBytes), CFSTR("wifiScoTxBytes"));
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiTxBytes), CFSTR("wifiTxBytes"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiHidTxBytes), CFSTR("wifiHidTxBytes"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellularDataTxBytes), CFSTR("cellularDataTxBytes"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_statsCollectionMinutes), CFSTR("statsCollectionMinutes"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiAssocMinutes), CFSTR("wifiAssocMinutes"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
LABEL_33:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scoAssocMinutes), CFSTR("scoAssocMinutes"));
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_17;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_a2dpAssocMinutes), CFSTR("a2dpAssocMinutes"));
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_33;
LABEL_16:
  if ((has & 0x10) != 0)
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hidAssocMinutes), CFSTR("hidAssocMinutes"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricInterfaceStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0)
      return;
LABEL_33:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    goto LABEL_33;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 38) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_wifiA2dpRxBytes;
  *((_WORD *)a3 + 38) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 16) = self->_wifiScoRxBytes;
  *((_WORD *)a3 + 38) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 15) = self->_wifiRxBytes;
  *((_WORD *)a3 + 38) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 13) = self->_wifiHidRxBytes;
  *((_WORD *)a3 + 38) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 5) = self->_cellularDataRxBytes;
  *((_WORD *)a3 + 38) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 11) = self->_wifiA2dpTxBytes;
  *((_WORD *)a3 + 38) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 17) = self->_wifiScoTxBytes;
  *((_WORD *)a3 + 38) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 18) = self->_wifiTxBytes;
  *((_WORD *)a3 + 38) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 14) = self->_wifiHidTxBytes;
  *((_WORD *)a3 + 38) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 6) = self->_cellularDataTxBytes;
  *((_WORD *)a3 + 38) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 9) = self->_statsCollectionMinutes;
  *((_WORD *)a3 + 38) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 12) = self->_wifiAssocMinutes;
  *((_WORD *)a3 + 38) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 4) = self->_a2dpAssocMinutes;
  *((_WORD *)a3 + 38) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0)
      return;
LABEL_33:
    *((_DWORD *)a3 + 7) = self->_hidAssocMinutes;
    *((_WORD *)a3 + 38) |= 0x10u;
    return;
  }
LABEL_32:
  *((_DWORD *)a3 + 8) = self->_scoAssocMinutes;
  *((_WORD *)a3 + 38) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    goto LABEL_33;
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
    *((_WORD *)result + 38) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_wifiA2dpRxBytes;
  *((_WORD *)result + 38) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 16) = self->_wifiScoRxBytes;
  *((_WORD *)result + 38) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 15) = self->_wifiRxBytes;
  *((_WORD *)result + 38) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 13) = self->_wifiHidRxBytes;
  *((_WORD *)result + 38) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 5) = self->_cellularDataRxBytes;
  *((_WORD *)result + 38) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 11) = self->_wifiA2dpTxBytes;
  *((_WORD *)result + 38) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 17) = self->_wifiScoTxBytes;
  *((_WORD *)result + 38) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 18) = self->_wifiTxBytes;
  *((_WORD *)result + 38) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 14) = self->_wifiHidTxBytes;
  *((_WORD *)result + 38) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 6) = self->_cellularDataTxBytes;
  *((_WORD *)result + 38) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 9) = self->_statsCollectionMinutes;
  *((_WORD *)result + 38) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 12) = self->_wifiAssocMinutes;
  *((_WORD *)result + 38) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 4) = self->_a2dpAssocMinutes;
  *((_WORD *)result + 38) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_17;
  }
LABEL_33:
  *((_DWORD *)result + 8) = self->_scoAssocMinutes;
  *((_WORD *)result + 38) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) == 0)
    return result;
LABEL_17:
  *((_DWORD *)result + 7) = self->_hidAssocMinutes;
  *((_WORD *)result + 38) |= 0x10u;
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
    v7 = *((_WORD *)a3 + 38);
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_81;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_81;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_wifiA2dpRxBytes != *((_DWORD *)a3 + 10))
        goto LABEL_81;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_81;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 38) & 0x2000) == 0 || self->_wifiScoRxBytes != *((_DWORD *)a3 + 16))
        goto LABEL_81;
    }
    else if ((*((_WORD *)a3 + 38) & 0x2000) != 0)
    {
      goto LABEL_81;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 38) & 0x1000) == 0 || self->_wifiRxBytes != *((_DWORD *)a3 + 15))
        goto LABEL_81;
    }
    else if ((*((_WORD *)a3 + 38) & 0x1000) != 0)
    {
      goto LABEL_81;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 38) & 0x400) == 0 || self->_wifiHidRxBytes != *((_DWORD *)a3 + 13))
        goto LABEL_81;
    }
    else if ((*((_WORD *)a3 + 38) & 0x400) != 0)
    {
      goto LABEL_81;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_cellularDataRxBytes != *((_DWORD *)a3 + 5))
        goto LABEL_81;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_81;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 38) & 0x100) == 0 || self->_wifiA2dpTxBytes != *((_DWORD *)a3 + 11))
        goto LABEL_81;
    }
    else if ((*((_WORD *)a3 + 38) & 0x100) != 0)
    {
      goto LABEL_81;
    }
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
    {
      if ((*((_WORD *)a3 + 38) & 0x4000) == 0 || self->_wifiScoTxBytes != *((_DWORD *)a3 + 17))
        goto LABEL_81;
    }
    else if ((*((_WORD *)a3 + 38) & 0x4000) != 0)
    {
      goto LABEL_81;
    }
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
    {
      if ((*((_WORD *)a3 + 38) & 0x8000) == 0 || self->_wifiTxBytes != *((_DWORD *)a3 + 18))
        goto LABEL_81;
    }
    else if ((*((_WORD *)a3 + 38) & 0x8000) != 0)
    {
LABEL_81:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 38) & 0x800) == 0 || self->_wifiHidTxBytes != *((_DWORD *)a3 + 14))
        goto LABEL_81;
    }
    else if ((*((_WORD *)a3 + 38) & 0x800) != 0)
    {
      goto LABEL_81;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_cellularDataTxBytes != *((_DWORD *)a3 + 6))
        goto LABEL_81;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_81;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_statsCollectionMinutes != *((_DWORD *)a3 + 9))
        goto LABEL_81;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_81;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 38) & 0x200) == 0 || self->_wifiAssocMinutes != *((_DWORD *)a3 + 12))
        goto LABEL_81;
    }
    else if ((*((_WORD *)a3 + 38) & 0x200) != 0)
    {
      goto LABEL_81;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_a2dpAssocMinutes != *((_DWORD *)a3 + 4))
        goto LABEL_81;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_81;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_scoAssocMinutes != *((_DWORD *)a3 + 8))
        goto LABEL_81;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_81;
    }
    LOBYTE(v5) = (v7 & 0x10) == 0;
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_hidAssocMinutes != *((_DWORD *)a3 + 7))
        goto LABEL_81;
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
    if ((has & 0x80) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_wifiA2dpRxBytes;
      if ((*(_WORD *)&self->_has & 0x2000) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_wifiScoRxBytes;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_wifiRxBytes;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_wifiHidRxBytes;
    if ((has & 4) != 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_cellularDataRxBytes;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_wifiA2dpTxBytes;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_wifiScoTxBytes;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_wifiTxBytes;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_wifiHidTxBytes;
    if ((has & 8) != 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  v12 = 0;
  if ((has & 8) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_cellularDataTxBytes;
    if ((has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  v13 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_statsCollectionMinutes;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_wifiAssocMinutes;
    if ((has & 2) != 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  v15 = 0;
  if ((has & 2) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_a2dpAssocMinutes;
    if ((has & 0x20) != 0)
      goto LABEL_16;
LABEL_32:
    v17 = 0;
    if ((has & 0x10) != 0)
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
  v17 = 2654435761 * self->_scoAssocMinutes;
  if ((has & 0x10) == 0)
    goto LABEL_33;
LABEL_17:
  v18 = 2654435761 * self->_hidAssocMinutes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v3 = *((_WORD *)a3 + 38);
    if ((v3 & 0x80) == 0)
    {
LABEL_3:
      if ((v3 & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((v3 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_wifiA2dpRxBytes = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x2000) == 0)
  {
LABEL_4:
    if ((v3 & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  self->_wifiScoRxBytes = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x2000u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x1000) == 0)
  {
LABEL_5:
    if ((v3 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  self->_wifiRxBytes = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x1000u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x400) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  self->_wifiHidRxBytes = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  self->_cellularDataRxBytes = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x100) == 0)
  {
LABEL_8:
    if ((v3 & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  self->_wifiA2dpTxBytes = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x4000) == 0)
  {
LABEL_9:
    if ((v3 & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  self->_wifiScoTxBytes = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x4000u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x8000) == 0)
  {
LABEL_10:
    if ((v3 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  self->_wifiTxBytes = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x8000u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x800) == 0)
  {
LABEL_11:
    if ((v3 & 8) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  self->_wifiHidTxBytes = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 8) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  self->_cellularDataTxBytes = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  self->_statsCollectionMinutes = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x200) == 0)
  {
LABEL_14:
    if ((v3 & 2) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  self->_wifiAssocMinutes = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 2) == 0)
  {
LABEL_15:
    if ((v3 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  self->_a2dpAssocMinutes = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x20) == 0)
  {
LABEL_16:
    if ((v3 & 0x10) == 0)
      return;
LABEL_33:
    self->_hidAssocMinutes = *((_DWORD *)a3 + 7);
    *(_WORD *)&self->_has |= 0x10u;
    return;
  }
LABEL_32:
  self->_scoAssocMinutes = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 38) & 0x10) != 0)
    goto LABEL_33;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)wifiA2dpRxBytes
{
  return self->_wifiA2dpRxBytes;
}

- (unsigned)wifiScoRxBytes
{
  return self->_wifiScoRxBytes;
}

- (unsigned)wifiRxBytes
{
  return self->_wifiRxBytes;
}

- (unsigned)wifiHidRxBytes
{
  return self->_wifiHidRxBytes;
}

- (unsigned)cellularDataRxBytes
{
  return self->_cellularDataRxBytes;
}

- (unsigned)wifiA2dpTxBytes
{
  return self->_wifiA2dpTxBytes;
}

- (unsigned)wifiScoTxBytes
{
  return self->_wifiScoTxBytes;
}

- (unsigned)wifiTxBytes
{
  return self->_wifiTxBytes;
}

- (unsigned)wifiHidTxBytes
{
  return self->_wifiHidTxBytes;
}

- (unsigned)cellularDataTxBytes
{
  return self->_cellularDataTxBytes;
}

- (unsigned)statsCollectionMinutes
{
  return self->_statsCollectionMinutes;
}

- (unsigned)wifiAssocMinutes
{
  return self->_wifiAssocMinutes;
}

- (unsigned)a2dpAssocMinutes
{
  return self->_a2dpAssocMinutes;
}

- (unsigned)scoAssocMinutes
{
  return self->_scoAssocMinutes;
}

- (unsigned)hidAssocMinutes
{
  return self->_hidAssocMinutes;
}

@end
