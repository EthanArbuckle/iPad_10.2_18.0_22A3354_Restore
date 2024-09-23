@implementation AWDPowerWifiMetrics

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setWifi2P4GHzTxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_wifi2P4GHzTxDuration = a3;
}

- (void)setHasWifi2P4GHzTxDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasWifi2P4GHzTxDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setWifi2P4GHzRxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_wifi2P4GHzRxDuration = a3;
}

- (void)setHasWifi2P4GHzRxDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasWifi2P4GHzRxDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWifi5GHz20MHzTxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_wifi5GHz20MHzTxDuration = a3;
}

- (void)setHasWifi5GHz20MHzTxDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasWifi5GHz20MHzTxDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setWifi5GHz40MHzTxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_wifi5GHz40MHzTxDuration = a3;
}

- (void)setHasWifi5GHz40MHzTxDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasWifi5GHz40MHzTxDuration
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setWifi5GHz80MHzTxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_wifi5GHz80MHzTxDuration = a3;
}

- (void)setHasWifi5GHz80MHzTxDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasWifi5GHz80MHzTxDuration
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setWifi5GHz20MHzRxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_wifi5GHz20MHzRxDuration = a3;
}

- (void)setHasWifi5GHz20MHzRxDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasWifi5GHz20MHzRxDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setWifi5GHz40MHzRxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_wifi5GHz40MHzRxDuration = a3;
}

- (void)setHasWifi5GHz40MHzRxDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasWifi5GHz40MHzRxDuration
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setWifi5GHz80MHzRxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_wifi5GHz80MHzRxDuration = a3;
}

- (void)setHasWifi5GHz80MHzRxDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasWifi5GHz80MHzRxDuration
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setWifiSleepDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_wifiSleepDuration = a3;
}

- (void)setHasWifiSleepDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasWifiSleepDuration
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setWifiTotalDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_wifiTotalDuration = a3;
}

- (void)setHasWifiTotalDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasWifiTotalDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setWifiFRTSDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_wifiFRTSDuration = a3;
}

- (void)setHasWifiFRTSDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasWifiFRTSDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setWifiScanDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_wifiScanDuration = a3;
}

- (void)setHasWifiScanDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasWifiScanDuration
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setWifiPcieL0Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_wifiPcieL0Duration = a3;
}

- (void)setHasWifiPcieL0Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasWifiPcieL0Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setWifiPcieL10Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_wifiPcieL10Duration = a3;
}

- (void)setHasWifiPcieL10Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasWifiPcieL10Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setWifiPcieL11Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_wifiPcieL11Duration = a3;
}

- (void)setHasWifiPcieL11Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasWifiPcieL11Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setWifiPcieL12Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_wifiPcieL12Duration = a3;
}

- (void)setHasWifiPcieL12Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasWifiPcieL12Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setWifiTotalPowerMicroWatt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_wifiTotalPowerMicroWatt = a3;
}

- (void)setHasWifiTotalPowerMicroWatt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasWifiTotalPowerMicroWatt
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setWifiHsicActiveDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_wifiHsicActiveDuration = a3;
}

- (void)setHasWifiHsicActiveDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasWifiHsicActiveDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerWifiMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerWifiMetrics description](&v3, sel_description), -[AWDPowerWifiMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifi2P4GHzTxDuration), CFSTR("wifi2P4GHzTxDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifi2P4GHzRxDuration), CFSTR("wifi2P4GHzRxDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifi5GHz20MHzTxDuration), CFSTR("wifi5GHz20MHzTxDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifi5GHz40MHzTxDuration), CFSTR("wifi5GHz40MHzTxDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifi5GHz80MHzTxDuration), CFSTR("wifi5GHz80MHzTxDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifi5GHz20MHzRxDuration), CFSTR("wifi5GHz20MHzRxDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifi5GHz40MHzRxDuration), CFSTR("wifi5GHz40MHzRxDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifi5GHz80MHzRxDuration), CFSTR("wifi5GHz80MHzRxDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiSleepDuration), CFSTR("wifiSleepDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiTotalDuration), CFSTR("wifiTotalDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiFRTSDuration), CFSTR("wifiFRTSDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiScanDuration), CFSTR("wifiScanDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiPcieL0Duration), CFSTR("wifiPcieL0Duration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiPcieL10Duration), CFSTR("wifiPcieL10Duration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiPcieL11Duration), CFSTR("wifiPcieL11Duration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
LABEL_39:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiTotalPowerMicroWatt), CFSTR("wifiTotalPowerMicroWatt"));
    if ((*(_DWORD *)&self->_has & 0x400) == 0)
      return v3;
    goto LABEL_20;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiPcieL12Duration), CFSTR("wifiPcieL12Duration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
    goto LABEL_39;
LABEL_19:
  if ((*(_WORD *)&has & 0x400) != 0)
LABEL_20:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiHsicActiveDuration), CFSTR("wifiHsicActiveDuration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerWifiMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x400) == 0)
      return;
LABEL_39:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
    goto LABEL_39;
}

- (void)copyTo:(id)a3
{
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 22) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_wifi2P4GHzTxDuration;
  *((_DWORD *)a3 + 22) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 4) = self->_wifi2P4GHzRxDuration;
  *((_DWORD *)a3 + 22) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 7) = self->_wifi5GHz20MHzTxDuration;
  *((_DWORD *)a3 + 22) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 9) = self->_wifi5GHz40MHzTxDuration;
  *((_DWORD *)a3 + 22) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 11) = self->_wifi5GHz80MHzTxDuration;
  *((_DWORD *)a3 + 22) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 6) = self->_wifi5GHz20MHzRxDuration;
  *((_DWORD *)a3 + 22) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 8) = self->_wifi5GHz40MHzRxDuration;
  *((_DWORD *)a3 + 22) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 10) = self->_wifi5GHz80MHzRxDuration;
  *((_DWORD *)a3 + 22) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 19) = self->_wifiSleepDuration;
  *((_DWORD *)a3 + 22) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 20) = self->_wifiTotalDuration;
  *((_DWORD *)a3 + 22) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 12) = self->_wifiFRTSDuration;
  *((_DWORD *)a3 + 22) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 18) = self->_wifiScanDuration;
  *((_DWORD *)a3 + 22) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 14) = self->_wifiPcieL0Duration;
  *((_DWORD *)a3 + 22) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 15) = self->_wifiPcieL10Duration;
  *((_DWORD *)a3 + 22) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 16) = self->_wifiPcieL11Duration;
  *((_DWORD *)a3 + 22) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 17) = self->_wifiPcieL12Duration;
  *((_DWORD *)a3 + 22) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x400) == 0)
      return;
LABEL_39:
    *((_DWORD *)a3 + 13) = self->_wifiHsicActiveDuration;
    *((_DWORD *)a3 + 22) |= 0x400u;
    return;
  }
LABEL_38:
  *((_DWORD *)a3 + 21) = self->_wifiTotalPowerMicroWatt;
  *((_DWORD *)a3 + 22) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
    goto LABEL_39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 22) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_wifi2P4GHzTxDuration;
  *((_DWORD *)result + 22) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 4) = self->_wifi2P4GHzRxDuration;
  *((_DWORD *)result + 22) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 7) = self->_wifi5GHz20MHzTxDuration;
  *((_DWORD *)result + 22) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 9) = self->_wifi5GHz40MHzTxDuration;
  *((_DWORD *)result + 22) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 11) = self->_wifi5GHz80MHzTxDuration;
  *((_DWORD *)result + 22) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 6) = self->_wifi5GHz20MHzRxDuration;
  *((_DWORD *)result + 22) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 8) = self->_wifi5GHz40MHzRxDuration;
  *((_DWORD *)result + 22) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 10) = self->_wifi5GHz80MHzRxDuration;
  *((_DWORD *)result + 22) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 19) = self->_wifiSleepDuration;
  *((_DWORD *)result + 22) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 20) = self->_wifiTotalDuration;
  *((_DWORD *)result + 22) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 12) = self->_wifiFRTSDuration;
  *((_DWORD *)result + 22) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 18) = self->_wifiScanDuration;
  *((_DWORD *)result + 22) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 14) = self->_wifiPcieL0Duration;
  *((_DWORD *)result + 22) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 15) = self->_wifiPcieL10Duration;
  *((_DWORD *)result + 22) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 16) = self->_wifiPcieL11Duration;
  *((_DWORD *)result + 22) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 17) = self->_wifiPcieL12Duration;
  *((_DWORD *)result + 22) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x400) == 0)
      return result;
    goto LABEL_20;
  }
LABEL_39:
  *((_DWORD *)result + 21) = self->_wifiTotalPowerMicroWatt;
  *((_DWORD *)result + 22) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
    return result;
LABEL_20:
  *((_DWORD *)result + 13) = self->_wifiHsicActiveDuration;
  *((_DWORD *)result + 22) |= 0x400u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 22);
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_96;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_96:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_wifi2P4GHzTxDuration != *((_DWORD *)a3 + 5))
        goto LABEL_96;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_wifi2P4GHzRxDuration != *((_DWORD *)a3 + 4))
        goto LABEL_96;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_wifi5GHz20MHzTxDuration != *((_DWORD *)a3 + 7))
        goto LABEL_96;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_wifi5GHz40MHzTxDuration != *((_DWORD *)a3 + 9))
        goto LABEL_96;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_wifi5GHz80MHzTxDuration != *((_DWORD *)a3 + 11))
        goto LABEL_96;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_wifi5GHz20MHzRxDuration != *((_DWORD *)a3 + 6))
        goto LABEL_96;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_wifi5GHz40MHzRxDuration != *((_DWORD *)a3 + 8))
        goto LABEL_96;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_wifi5GHz80MHzRxDuration != *((_DWORD *)a3 + 10))
        goto LABEL_96;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_wifiSleepDuration != *((_DWORD *)a3 + 19))
        goto LABEL_96;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_wifiTotalDuration != *((_DWORD *)a3 + 20))
        goto LABEL_96;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_wifiFRTSDuration != *((_DWORD *)a3 + 12))
        goto LABEL_96;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_wifiScanDuration != *((_DWORD *)a3 + 18))
        goto LABEL_96;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_wifiPcieL0Duration != *((_DWORD *)a3 + 14))
        goto LABEL_96;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_wifiPcieL10Duration != *((_DWORD *)a3 + 15))
        goto LABEL_96;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_wifiPcieL11Duration != *((_DWORD *)a3 + 16))
        goto LABEL_96;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_wifiPcieL12Duration != *((_DWORD *)a3 + 17))
        goto LABEL_96;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_wifiTotalPowerMicroWatt != *((_DWORD *)a3 + 21))
        goto LABEL_96;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_96;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 22) & 0x400) == 0;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_wifiHsicActiveDuration != *((_DWORD *)a3 + 13))
        goto LABEL_96;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has;
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

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_wifi2P4GHzTxDuration;
      if ((*(_BYTE *)&has & 2) != 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_wifi2P4GHzRxDuration;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_wifi5GHz20MHzTxDuration;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  v6 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_wifi5GHz40MHzTxDuration;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  v7 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_wifi5GHz80MHzTxDuration;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  v8 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_wifi5GHz20MHzRxDuration;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  v9 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_wifi5GHz40MHzRxDuration;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  v10 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_wifi5GHz80MHzRxDuration;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_wifiSleepDuration;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_wifiTotalDuration;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  v13 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_wifiFRTSDuration;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_wifiScanDuration;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  v15 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_wifiPcieL0Duration;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  v16 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_wifiPcieL10Duration;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  v17 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_wifiPcieL11Duration;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  v18 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_wifiPcieL12Duration;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_19;
LABEL_38:
    v20 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_20;
LABEL_39:
    v21 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_37:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0)
    goto LABEL_38;
LABEL_19:
  v20 = 2654435761 * self->_wifiTotalPowerMicroWatt;
  if ((*(_WORD *)&has & 0x400) == 0)
    goto LABEL_39;
LABEL_20:
  v21 = 2654435761 * self->_wifiHsicActiveDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v3 = *((_DWORD *)a3 + 22);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_wifi2P4GHzTxDuration = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  self->_wifi2P4GHzRxDuration = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  self->_wifi5GHz20MHzTxDuration = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x40) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  self->_wifi5GHz40MHzTxDuration = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  self->_wifi5GHz80MHzTxDuration = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  self->_wifi5GHz20MHzRxDuration = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x20) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  self->_wifi5GHz40MHzRxDuration = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  self->_wifi5GHz80MHzRxDuration = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x10000) == 0)
  {
LABEL_11:
    if ((v3 & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  self->_wifiSleepDuration = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x20000) == 0)
  {
LABEL_12:
    if ((v3 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  self->_wifiTotalDuration = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x200) == 0)
  {
LABEL_13:
    if ((v3 & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  self->_wifiFRTSDuration = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x8000) == 0)
  {
LABEL_14:
    if ((v3 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  self->_wifiScanDuration = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x800) == 0)
  {
LABEL_15:
    if ((v3 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  self->_wifiPcieL0Duration = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x1000) == 0)
  {
LABEL_16:
    if ((v3 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  self->_wifiPcieL10Duration = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x2000) == 0)
  {
LABEL_17:
    if ((v3 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  self->_wifiPcieL11Duration = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x4000) == 0)
  {
LABEL_18:
    if ((v3 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  self->_wifiPcieL12Duration = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x40000) == 0)
  {
LABEL_19:
    if ((v3 & 0x400) == 0)
      return;
LABEL_39:
    self->_wifiHsicActiveDuration = *((_DWORD *)a3 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
    return;
  }
LABEL_38:
  self->_wifiTotalPowerMicroWatt = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)a3 + 22) & 0x400) != 0)
    goto LABEL_39;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)wifi2P4GHzTxDuration
{
  return self->_wifi2P4GHzTxDuration;
}

- (unsigned)wifi2P4GHzRxDuration
{
  return self->_wifi2P4GHzRxDuration;
}

- (unsigned)wifi5GHz20MHzTxDuration
{
  return self->_wifi5GHz20MHzTxDuration;
}

- (unsigned)wifi5GHz40MHzTxDuration
{
  return self->_wifi5GHz40MHzTxDuration;
}

- (unsigned)wifi5GHz80MHzTxDuration
{
  return self->_wifi5GHz80MHzTxDuration;
}

- (unsigned)wifi5GHz20MHzRxDuration
{
  return self->_wifi5GHz20MHzRxDuration;
}

- (unsigned)wifi5GHz40MHzRxDuration
{
  return self->_wifi5GHz40MHzRxDuration;
}

- (unsigned)wifi5GHz80MHzRxDuration
{
  return self->_wifi5GHz80MHzRxDuration;
}

- (unsigned)wifiSleepDuration
{
  return self->_wifiSleepDuration;
}

- (unsigned)wifiTotalDuration
{
  return self->_wifiTotalDuration;
}

- (unsigned)wifiFRTSDuration
{
  return self->_wifiFRTSDuration;
}

- (unsigned)wifiScanDuration
{
  return self->_wifiScanDuration;
}

- (unsigned)wifiPcieL0Duration
{
  return self->_wifiPcieL0Duration;
}

- (unsigned)wifiPcieL10Duration
{
  return self->_wifiPcieL10Duration;
}

- (unsigned)wifiPcieL11Duration
{
  return self->_wifiPcieL11Duration;
}

- (unsigned)wifiPcieL12Duration
{
  return self->_wifiPcieL12Duration;
}

- (unsigned)wifiTotalPowerMicroWatt
{
  return self->_wifiTotalPowerMicroWatt;
}

- (unsigned)wifiHsicActiveDuration
{
  return self->_wifiHsicActiveDuration;
}

@end
