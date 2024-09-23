@implementation WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics

- (void)setKRxDataErrors:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_kRxDataErrors = a3;
}

- (void)setHasKRxDataErrors:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasKRxDataErrors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setKRxFrames:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_kRxFrames = a3;
}

- (void)setHasKRxFrames:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasKRxFrames
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setKRxRetryBitSet:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_kRxRetryBitSet = a3;
}

- (void)setHasKRxRetryBitSet:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasKRxRetryBitSet
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setKMACRxDataFrameMatchingRA:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_kMACRxDataFrameMatchingRA = a3;
}

- (void)setHasKMACRxDataFrameMatchingRA:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasKMACRxDataFrameMatchingRA
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setKMACRxDataFrameOtherRA:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_kMACRxDataFrameOtherRA = a3;
}

- (void)setHasKMACRxDataFrameOtherRA:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasKMACRxDataFrameOtherRA
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setKMACRxControlFrameMatchingRA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_kMACRxControlFrameMatchingRA = a3;
}

- (void)setHasKMACRxControlFrameMatchingRA:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasKMACRxControlFrameMatchingRA
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setKMACRxControlFrameOtherRA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_kMACRxControlFrameOtherRA = a3;
}

- (void)setHasKMACRxControlFrameOtherRA:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasKMACRxControlFrameOtherRA
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setKRxGoodPLCP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_kRxGoodPLCP = a3;
}

- (void)setHasKRxGoodPLCP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasKRxGoodPLCP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setKRxBadPLCP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_kRxBadPLCP = a3;
}

- (void)setHasKRxBadPLCP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasKRxBadPLCP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setKRxBadFCS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_kRxBadFCS = a3;
}

- (void)setHasKRxBadFCS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasKRxBadFCS
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setKTxFrames:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_kTxFrames = a3;
}

- (void)setHasKTxFrames:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasKTxFrames
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setKTxRetransmission:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_kTxRetransmission = a3;
}

- (void)setHasKTxRetransmission:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasKTxRetransmission
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setKdot11RetryCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_kdot11RetryCount = a3;
}

- (void)setHasKdot11RetryCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasKdot11RetryCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setKdot11MultipleRetryCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_kdot11MultipleRetryCount = a3;
}

- (void)setHasKdot11MultipleRetryCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasKdot11MultipleRetryCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setKdot11RTSSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_kdot11RTSSuccessCount = a3;
}

- (void)setHasKdot11RTSSuccessCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasKdot11RTSSuccessCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setKdot11RTSFailureCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_kdot11RTSFailureCount = a3;
}

- (void)setHasKdot11RTSFailureCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasKdot11RTSFailureCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setKCtlTxRTS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_kCtlTxRTS = a3;
}

- (void)setHasKCtlTxRTS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasKCtlTxRTS
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setKRxCRCGlitch:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_kRxCRCGlitch = a3;
}

- (void)setHasKRxCRCGlitch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasKRxCRCGlitch
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setKMACRxUnicastCTStoMAC:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_kMACRxUnicastCTStoMAC = a3;
}

- (void)setHasKMACRxUnicastCTStoMAC:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasKMACRxUnicastCTStoMAC
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setKMACRxUnicastCTStoOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_kMACRxUnicastCTStoOther = a3;
}

- (void)setHasKMACRxUnicastCTStoOther:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasKMACRxUnicastCTStoOther
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setKMACRxUnicastRTStoMAC:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_kMACRxUnicastRTStoMAC = a3;
}

- (void)setHasKMACRxUnicastRTStoMAC:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasKMACRxUnicastRTStoMAC
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setKMACRxUnicastRTStoOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_kMACRxUnicastRTStoOther = a3;
}

- (void)setHasKMACRxUnicastRTStoOther:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasKMACRxUnicastRTStoOther
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setKCtlTxCTS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_kCtlTxCTS = a3;
}

- (void)setHasKCtlTxCTS:(BOOL)a3
{
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasKCtlTxCTS
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setKRxBadOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_kRxBadOther = a3;
}

- (void)setHasKRxBadOther:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasKRxBadOther
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics;
  -[WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $D920E565D10DD7D8512C956EF549CB66 has;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxDataErrors);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("kRxDataErrors"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxFrames);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("kRxFrames"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxRetryBitSet);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("kRxRetryBitSet"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxDataFrameMatchingRA);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("kMACRxDataFrameMatchingRA"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxDataFrameOtherRA);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("kMACRxDataFrameOtherRA"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_kMACRxControlFrameMatchingRA);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("kMACRxControlFrameMatchingRA"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_kMACRxControlFrameOtherRA);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("kMACRxControlFrameOtherRA"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxGoodPLCP);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("kRxGoodPLCP"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxBadPLCP);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("kRxBadPLCP"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxBadFCS);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("kRxBadFCS"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kTxFrames);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("kTxFrames"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kTxRetransmission);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("kTxRetransmission"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kdot11RetryCount);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("kdot11RetryCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kdot11MultipleRetryCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("kdot11MultipleRetryCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kdot11RTSSuccessCount);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("kdot11RTSSuccessCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kdot11RTSFailureCount);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("kdot11RTSFailureCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kCtlTxRTS);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("kCtlTxRTS"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxCRCGlitch);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("kRxCRCGlitch"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxUnicastCTStoMAC);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("kMACRxUnicastCTStoMAC"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxUnicastCTStoOther);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("kMACRxUnicastCTStoOther"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxUnicastRTStoMAC);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("kMACRxUnicastRTStoMAC"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_24;
LABEL_49:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kCtlTxCTS);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("kCtlTxCTS"));

    if ((*(_DWORD *)&self->_has & 0x200) == 0)
      return v3;
    goto LABEL_25;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxUnicastRTStoOther);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("kMACRxUnicastRTStoOther"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
    goto LABEL_49;
LABEL_24:
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxBadOther);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("kRxBadOther"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityAggregateMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $D920E565D10DD7D8512C956EF549CB66 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_24;
LABEL_49:
    PBDataWriterWriteUint64Field();
    if ((*(_DWORD *)&self->_has & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
    goto LABEL_49;
LABEL_24:
  if ((*(_WORD *)&has & 0x200) != 0)
LABEL_25:
    PBDataWriterWriteUint64Field();
LABEL_26:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $D920E565D10DD7D8512C956EF549CB66 has;

  v4 = a3;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v4[13] = self->_kRxDataErrors;
    *((_DWORD *)v4 + 48) |= 0x1000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  v4[14] = self->_kRxFrames;
  *((_DWORD *)v4 + 48) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  v4[16] = self->_kRxRetryBitSet;
  *((_DWORD *)v4 + 48) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  v4[3] = self->_kMACRxDataFrameMatchingRA;
  *((_DWORD *)v4 + 48) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  v4[4] = self->_kMACRxDataFrameOtherRA;
  *((_DWORD *)v4 + 48) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 46) = self->_kMACRxControlFrameMatchingRA;
  *((_DWORD *)v4 + 48) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 47) = self->_kMACRxControlFrameOtherRA;
  *((_DWORD *)v4 + 48) |= 0x800000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  v4[15] = self->_kRxGoodPLCP;
  *((_DWORD *)v4 + 48) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  v4[11] = self->_kRxBadPLCP;
  *((_DWORD *)v4 + 48) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  v4[9] = self->_kRxBadFCS;
  *((_DWORD *)v4 + 48) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  v4[17] = self->_kTxFrames;
  *((_DWORD *)v4 + 48) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  v4[18] = self->_kTxRetransmission;
  *((_DWORD *)v4 + 48) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  v4[22] = self->_kdot11RetryCount;
  *((_DWORD *)v4 + 48) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  v4[19] = self->_kdot11MultipleRetryCount;
  *((_DWORD *)v4 + 48) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  v4[21] = self->_kdot11RTSSuccessCount;
  *((_DWORD *)v4 + 48) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  v4[20] = self->_kdot11RTSFailureCount;
  *((_DWORD *)v4 + 48) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  v4[2] = self->_kCtlTxRTS;
  *((_DWORD *)v4 + 48) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  v4[12] = self->_kRxCRCGlitch;
  *((_DWORD *)v4 + 48) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  v4[5] = self->_kMACRxUnicastCTStoMAC;
  *((_DWORD *)v4 + 48) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  v4[6] = self->_kMACRxUnicastCTStoOther;
  *((_DWORD *)v4 + 48) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  v4[7] = self->_kMACRxUnicastRTStoMAC;
  *((_DWORD *)v4 + 48) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_24;
LABEL_49:
    v4[1] = self->_kCtlTxCTS;
    *((_DWORD *)v4 + 48) |= 1u;
    if ((*(_DWORD *)&self->_has & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_48:
  v4[8] = self->_kMACRxUnicastRTStoOther;
  *((_DWORD *)v4 + 48) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
    goto LABEL_49;
LABEL_24:
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_25:
    v4[10] = self->_kRxBadOther;
    *((_DWORD *)v4 + 48) |= 0x200u;
  }
LABEL_26:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $D920E565D10DD7D8512C956EF549CB66 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    *((_QWORD *)result + 13) = self->_kRxDataErrors;
    *((_DWORD *)result + 48) |= 0x1000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 14) = self->_kRxFrames;
  *((_DWORD *)result + 48) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)result + 16) = self->_kRxRetryBitSet;
  *((_DWORD *)result + 48) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)result + 3) = self->_kMACRxDataFrameMatchingRA;
  *((_DWORD *)result + 48) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)result + 4) = self->_kMACRxDataFrameOtherRA;
  *((_DWORD *)result + 48) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 46) = self->_kMACRxControlFrameMatchingRA;
  *((_DWORD *)result + 48) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 47) = self->_kMACRxControlFrameOtherRA;
  *((_DWORD *)result + 48) |= 0x800000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)result + 15) = self->_kRxGoodPLCP;
  *((_DWORD *)result + 48) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)result + 11) = self->_kRxBadPLCP;
  *((_DWORD *)result + 48) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)result + 9) = self->_kRxBadFCS;
  *((_DWORD *)result + 48) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)result + 17) = self->_kTxFrames;
  *((_DWORD *)result + 48) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 18) = self->_kTxRetransmission;
  *((_DWORD *)result + 48) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)result + 22) = self->_kdot11RetryCount;
  *((_DWORD *)result + 48) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)result + 19) = self->_kdot11MultipleRetryCount;
  *((_DWORD *)result + 48) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)result + 21) = self->_kdot11RTSSuccessCount;
  *((_DWORD *)result + 48) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)result + 20) = self->_kdot11RTSFailureCount;
  *((_DWORD *)result + 48) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)result + 2) = self->_kCtlTxRTS;
  *((_DWORD *)result + 48) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)result + 12) = self->_kRxCRCGlitch;
  *((_DWORD *)result + 48) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)result + 5) = self->_kMACRxUnicastCTStoMAC;
  *((_DWORD *)result + 48) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)result + 6) = self->_kMACRxUnicastCTStoOther;
  *((_DWORD *)result + 48) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)result + 7) = self->_kMACRxUnicastRTStoMAC;
  *((_DWORD *)result + 48) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)result + 8) = self->_kMACRxUnicastRTStoOther;
  *((_DWORD *)result + 48) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      return result;
    goto LABEL_25;
  }
LABEL_49:
  *((_QWORD *)result + 1) = self->_kCtlTxCTS;
  *((_DWORD *)result + 48) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x200) == 0)
    return result;
LABEL_25:
  *((_QWORD *)result + 10) = self->_kRxBadOther;
  *((_DWORD *)result + 48) |= 0x200u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $D920E565D10DD7D8512C956EF549CB66 has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_122;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 48);
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_kRxDataErrors != *((_QWORD *)v4 + 13))
      goto LABEL_122;
  }
  else if ((v6 & 0x1000) != 0)
  {
LABEL_122:
    v7 = 0;
    goto LABEL_123;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_kRxFrames != *((_QWORD *)v4 + 14))
      goto LABEL_122;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_kRxRetryBitSet != *((_QWORD *)v4 + 16))
      goto LABEL_122;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_kMACRxDataFrameMatchingRA != *((_QWORD *)v4 + 3))
      goto LABEL_122;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_kMACRxDataFrameOtherRA != *((_QWORD *)v4 + 4))
      goto LABEL_122;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_kMACRxControlFrameMatchingRA != *((_DWORD *)v4 + 46))
      goto LABEL_122;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_kMACRxControlFrameOtherRA != *((_DWORD *)v4 + 47))
      goto LABEL_122;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_kRxGoodPLCP != *((_QWORD *)v4 + 15))
      goto LABEL_122;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_kRxBadPLCP != *((_QWORD *)v4 + 11))
      goto LABEL_122;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_kRxBadFCS != *((_QWORD *)v4 + 9))
      goto LABEL_122;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_kTxFrames != *((_QWORD *)v4 + 17))
      goto LABEL_122;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_kTxRetransmission != *((_QWORD *)v4 + 18))
      goto LABEL_122;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_kdot11RetryCount != *((_QWORD *)v4 + 22))
      goto LABEL_122;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_kdot11MultipleRetryCount != *((_QWORD *)v4 + 19))
      goto LABEL_122;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_kdot11RTSSuccessCount != *((_QWORD *)v4 + 21))
      goto LABEL_122;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_kdot11RTSFailureCount != *((_QWORD *)v4 + 20))
      goto LABEL_122;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_kCtlTxRTS != *((_QWORD *)v4 + 2))
      goto LABEL_122;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_kRxCRCGlitch != *((_QWORD *)v4 + 12))
      goto LABEL_122;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_kMACRxUnicastCTStoMAC != *((_QWORD *)v4 + 5))
      goto LABEL_122;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_kMACRxUnicastCTStoOther != *((_QWORD *)v4 + 6))
      goto LABEL_122;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_kMACRxUnicastRTStoMAC != *((_QWORD *)v4 + 7))
      goto LABEL_122;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_kMACRxUnicastRTStoOther != *((_QWORD *)v4 + 8))
      goto LABEL_122;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_kCtlTxCTS != *((_QWORD *)v4 + 1))
      goto LABEL_122;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_kRxBadOther != *((_QWORD *)v4 + 10))
      goto LABEL_122;
    v7 = 1;
  }
  else
  {
    v7 = (*((_DWORD *)v4 + 48) & 0x200) == 0;
  }
LABEL_123:

  return v7;
}

- (unint64_t)hash
{
  $D920E565D10DD7D8512C956EF549CB66 has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v3 = 2654435761u * self->_kRxDataErrors;
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_kRxFrames;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_kRxRetryBitSet;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  v5 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_kMACRxDataFrameMatchingRA;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  v6 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_kMACRxDataFrameOtherRA;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_kMACRxControlFrameMatchingRA;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_kMACRxControlFrameOtherRA;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  v9 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_kRxGoodPLCP;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  v10 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_kRxBadPLCP;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  v11 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_kRxBadFCS;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_12:
    v13 = 2654435761u * self->_kTxFrames;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_13:
    v14 = 2654435761u * self->_kTxRetransmission;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_14:
    v15 = 2654435761u * self->_kdot11RetryCount;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_15:
    v16 = 2654435761u * self->_kdot11MultipleRetryCount;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_16:
    v17 = 2654435761u * self->_kdot11RTSSuccessCount;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_17:
    v18 = 2654435761u * self->_kdot11RTSFailureCount;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  v18 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_18:
    v19 = 2654435761u * self->_kCtlTxRTS;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  v19 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_19:
    v20 = 2654435761u * self->_kRxCRCGlitch;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_20:
    v21 = 2654435761u * self->_kMACRxUnicastCTStoMAC;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  v21 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_21:
    v22 = 2654435761u * self->_kMACRxUnicastCTStoOther;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_22:
    v23 = 2654435761u * self->_kMACRxUnicastRTStoMAC;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  v23 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_23:
    v24 = 2654435761u * self->_kMACRxUnicastRTStoOther;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_24;
LABEL_48:
    v25 = 0;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_25;
LABEL_49:
    v26 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  }
LABEL_47:
  v24 = 0;
  if ((*(_BYTE *)&has & 1) == 0)
    goto LABEL_48;
LABEL_24:
  v25 = 2654435761u * self->_kCtlTxCTS;
  if ((*(_WORD *)&has & 0x200) == 0)
    goto LABEL_49;
LABEL_25:
  v26 = 2654435761u * self->_kRxBadOther;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x1000) != 0)
  {
    self->_kRxDataErrors = *((_QWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x1000u;
    v5 = *((_DWORD *)v4 + 48);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_kRxFrames = *((_QWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  self->_kRxRetryBitSet = *((_QWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  self->_kMACRxDataFrameMatchingRA = *((_QWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  self->_kMACRxDataFrameOtherRA = *((_QWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x400000) == 0)
  {
LABEL_7:
    if ((v5 & 0x800000) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  self->_kMACRxControlFrameMatchingRA = *((_DWORD *)v4 + 46);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x800000) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  self->_kMACRxControlFrameOtherRA = *((_DWORD *)v4 + 47);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  self->_kRxGoodPLCP = *((_QWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  self->_kRxBadPLCP = *((_QWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  self->_kRxBadFCS = *((_QWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x10000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  self->_kTxFrames = *((_QWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x20000) == 0)
  {
LABEL_13:
    if ((v5 & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  self->_kTxRetransmission = *((_QWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x200000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  self->_kdot11RetryCount = *((_QWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((v5 & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  self->_kdot11MultipleRetryCount = *((_QWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x100000) == 0)
  {
LABEL_16:
    if ((v5 & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  self->_kdot11RTSSuccessCount = *((_QWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x80000) == 0)
  {
LABEL_17:
    if ((v5 & 2) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  self->_kdot11RTSFailureCount = *((_QWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_18:
    if ((v5 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  self->_kCtlTxRTS = *((_QWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x800) == 0)
  {
LABEL_19:
    if ((v5 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  self->_kRxCRCGlitch = *((_QWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_20:
    if ((v5 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  self->_kMACRxUnicastCTStoMAC = *((_QWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_21:
    if ((v5 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  self->_kMACRxUnicastCTStoOther = *((_QWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_22:
    if ((v5 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  self->_kMACRxUnicastRTStoMAC = *((_QWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x80) == 0)
  {
LABEL_23:
    if ((v5 & 1) == 0)
      goto LABEL_24;
LABEL_49:
    self->_kCtlTxCTS = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    if ((*((_DWORD *)v4 + 48) & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_48:
  self->_kMACRxUnicastRTStoOther = *((_QWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 1) != 0)
    goto LABEL_49;
LABEL_24:
  if ((v5 & 0x200) != 0)
  {
LABEL_25:
    self->_kRxBadOther = *((_QWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_26:

}

- (unint64_t)kRxDataErrors
{
  return self->_kRxDataErrors;
}

- (unint64_t)kRxFrames
{
  return self->_kRxFrames;
}

- (unint64_t)kRxRetryBitSet
{
  return self->_kRxRetryBitSet;
}

- (unint64_t)kMACRxDataFrameMatchingRA
{
  return self->_kMACRxDataFrameMatchingRA;
}

- (unint64_t)kMACRxDataFrameOtherRA
{
  return self->_kMACRxDataFrameOtherRA;
}

- (unsigned)kMACRxControlFrameMatchingRA
{
  return self->_kMACRxControlFrameMatchingRA;
}

- (unsigned)kMACRxControlFrameOtherRA
{
  return self->_kMACRxControlFrameOtherRA;
}

- (unint64_t)kRxGoodPLCP
{
  return self->_kRxGoodPLCP;
}

- (unint64_t)kRxBadPLCP
{
  return self->_kRxBadPLCP;
}

- (unint64_t)kRxBadFCS
{
  return self->_kRxBadFCS;
}

- (unint64_t)kTxFrames
{
  return self->_kTxFrames;
}

- (unint64_t)kTxRetransmission
{
  return self->_kTxRetransmission;
}

- (unint64_t)kdot11RetryCount
{
  return self->_kdot11RetryCount;
}

- (unint64_t)kdot11MultipleRetryCount
{
  return self->_kdot11MultipleRetryCount;
}

- (unint64_t)kdot11RTSSuccessCount
{
  return self->_kdot11RTSSuccessCount;
}

- (unint64_t)kdot11RTSFailureCount
{
  return self->_kdot11RTSFailureCount;
}

- (unint64_t)kCtlTxRTS
{
  return self->_kCtlTxRTS;
}

- (unint64_t)kRxCRCGlitch
{
  return self->_kRxCRCGlitch;
}

- (unint64_t)kMACRxUnicastCTStoMAC
{
  return self->_kMACRxUnicastCTStoMAC;
}

- (unint64_t)kMACRxUnicastCTStoOther
{
  return self->_kMACRxUnicastCTStoOther;
}

- (unint64_t)kMACRxUnicastRTStoMAC
{
  return self->_kMACRxUnicastRTStoMAC;
}

- (unint64_t)kMACRxUnicastRTStoOther
{
  return self->_kMACRxUnicastRTStoOther;
}

- (unint64_t)kCtlTxCTS
{
  return self->_kCtlTxCTS;
}

- (unint64_t)kRxBadOther
{
  return self->_kRxBadOther;
}

@end
