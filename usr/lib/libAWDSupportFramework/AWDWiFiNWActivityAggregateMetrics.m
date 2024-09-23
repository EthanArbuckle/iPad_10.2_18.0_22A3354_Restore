@implementation AWDWiFiNWActivityAggregateMetrics

- (void)setKRxDataErrors:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_kRxDataErrors = a3;
}

- (void)setHasKRxDataErrors:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasKRxDataErrors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setKRxFrames:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_kRxFrames = a3;
}

- (void)setHasKRxFrames:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasKRxFrames
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setKRxRetryBitSet:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_kRxRetryBitSet = a3;
}

- (void)setHasKRxRetryBitSet:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasKRxRetryBitSet
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
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
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
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
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasKMACRxDataFrameOtherRA
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setKMACRxControlFrameMatchingRA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_kMACRxControlFrameMatchingRA = a3;
}

- (void)setHasKMACRxControlFrameMatchingRA:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasKMACRxControlFrameMatchingRA
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setKMACRxControlFrameOtherRA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_kMACRxControlFrameOtherRA = a3;
}

- (void)setHasKMACRxControlFrameOtherRA:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasKMACRxControlFrameOtherRA
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setKRxGoodPLCP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_kRxGoodPLCP = a3;
}

- (void)setHasKRxGoodPLCP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasKRxGoodPLCP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setKRxBadPLCP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_kRxBadPLCP = a3;
}

- (void)setHasKRxBadPLCP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasKRxBadPLCP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
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
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasKRxBadFCS
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setKTxFrames:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_kTxFrames = a3;
}

- (void)setHasKTxFrames:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasKTxFrames
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setKTxRetransmission:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_kTxRetransmission = a3;
}

- (void)setHasKTxRetransmission:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasKTxRetransmission
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setKdot11RetryCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_kdot11RetryCount = a3;
}

- (void)setHasKdot11RetryCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasKdot11RetryCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setKdot11MultipleRetryCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_kdot11MultipleRetryCount = a3;
}

- (void)setHasKdot11MultipleRetryCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasKdot11MultipleRetryCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setKdot11RTSSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_kdot11RTSSuccessCount = a3;
}

- (void)setHasKdot11RTSSuccessCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasKdot11RTSSuccessCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setKdot11RTSFailureCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_kdot11RTSFailureCount = a3;
}

- (void)setHasKdot11RTSFailureCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasKdot11RTSFailureCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
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
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasKCtlTxRTS
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setKRxCRCGlitch:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_kRxCRCGlitch = a3;
}

- (void)setHasKRxCRCGlitch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasKRxCRCGlitch
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
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
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
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
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
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
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
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
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
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
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasKCtlTxCTS
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityAggregateMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityAggregateMetrics description](&v3, sel_description), -[AWDWiFiNWActivityAggregateMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $6E9D4BE9CD91340AE534803B45062F36 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxDataErrors), CFSTR("kRxDataErrors"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxFrames), CFSTR("kRxFrames"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxRetryBitSet), CFSTR("kRxRetryBitSet"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxDataFrameMatchingRA), CFSTR("kMACRxDataFrameMatchingRA"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxDataFrameOtherRA), CFSTR("kMACRxDataFrameOtherRA"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_kMACRxControlFrameMatchingRA), CFSTR("kMACRxControlFrameMatchingRA"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_kMACRxControlFrameOtherRA), CFSTR("kMACRxControlFrameOtherRA"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxGoodPLCP), CFSTR("kRxGoodPLCP"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxBadPLCP), CFSTR("kRxBadPLCP"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxBadFCS), CFSTR("kRxBadFCS"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kTxFrames), CFSTR("kTxFrames"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kTxRetransmission), CFSTR("kTxRetransmission"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kdot11RetryCount), CFSTR("kdot11RetryCount"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kdot11MultipleRetryCount), CFSTR("kdot11MultipleRetryCount"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kdot11RTSSuccessCount), CFSTR("kdot11RTSSuccessCount"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kdot11RTSFailureCount), CFSTR("kdot11RTSFailureCount"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kCtlTxRTS), CFSTR("kCtlTxRTS"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRxCRCGlitch), CFSTR("kRxCRCGlitch"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxUnicastCTStoMAC), CFSTR("kMACRxUnicastCTStoMAC"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxUnicastCTStoOther), CFSTR("kMACRxUnicastCTStoOther"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
LABEL_47:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxUnicastRTStoOther), CFSTR("kMACRxUnicastRTStoOther"));
    if ((*(_DWORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_24;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kMACRxUnicastRTStoMAC), CFSTR("kMACRxUnicastRTStoMAC"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
    goto LABEL_47;
LABEL_23:
  if ((*(_BYTE *)&has & 1) != 0)
LABEL_24:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kCtlTxCTS), CFSTR("kCtlTxCTS"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityAggregateMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $6E9D4BE9CD91340AE534803B45062F36 has;

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 1) == 0)
      return;
LABEL_47:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 1) != 0)
    goto LABEL_47;
}

- (void)copyTo:(id)a3
{
  $6E9D4BE9CD91340AE534803B45062F36 has;

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *((_QWORD *)a3 + 12) = self->_kRxDataErrors;
    *((_DWORD *)a3 + 46) |= 0x800u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 13) = self->_kRxFrames;
  *((_DWORD *)a3 + 46) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 15) = self->_kRxRetryBitSet;
  *((_DWORD *)a3 + 46) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)a3 + 3) = self->_kMACRxDataFrameMatchingRA;
  *((_DWORD *)a3 + 46) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)a3 + 4) = self->_kMACRxDataFrameOtherRA;
  *((_DWORD *)a3 + 46) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 44) = self->_kMACRxControlFrameMatchingRA;
  *((_DWORD *)a3 + 46) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 45) = self->_kMACRxControlFrameOtherRA;
  *((_DWORD *)a3 + 46) |= 0x400000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)a3 + 14) = self->_kRxGoodPLCP;
  *((_DWORD *)a3 + 46) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)a3 + 10) = self->_kRxBadPLCP;
  *((_DWORD *)a3 + 46) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)a3 + 9) = self->_kRxBadFCS;
  *((_DWORD *)a3 + 46) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)a3 + 16) = self->_kTxFrames;
  *((_DWORD *)a3 + 46) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)a3 + 17) = self->_kTxRetransmission;
  *((_DWORD *)a3 + 46) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)a3 + 21) = self->_kdot11RetryCount;
  *((_DWORD *)a3 + 46) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)a3 + 18) = self->_kdot11MultipleRetryCount;
  *((_DWORD *)a3 + 46) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)a3 + 20) = self->_kdot11RTSSuccessCount;
  *((_DWORD *)a3 + 46) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)a3 + 19) = self->_kdot11RTSFailureCount;
  *((_DWORD *)a3 + 46) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)a3 + 2) = self->_kCtlTxRTS;
  *((_DWORD *)a3 + 46) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)a3 + 11) = self->_kRxCRCGlitch;
  *((_DWORD *)a3 + 46) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)a3 + 5) = self->_kMACRxUnicastCTStoMAC;
  *((_DWORD *)a3 + 46) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)a3 + 6) = self->_kMACRxUnicastCTStoOther;
  *((_DWORD *)a3 + 46) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)a3 + 7) = self->_kMACRxUnicastRTStoMAC;
  *((_DWORD *)a3 + 46) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 1) == 0)
      return;
LABEL_47:
    *((_QWORD *)a3 + 1) = self->_kCtlTxCTS;
    *((_DWORD *)a3 + 46) |= 1u;
    return;
  }
LABEL_46:
  *((_QWORD *)a3 + 8) = self->_kMACRxUnicastRTStoOther;
  *((_DWORD *)a3 + 46) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 1) != 0)
    goto LABEL_47;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $6E9D4BE9CD91340AE534803B45062F36 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *((_QWORD *)result + 12) = self->_kRxDataErrors;
    *((_DWORD *)result + 46) |= 0x800u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 13) = self->_kRxFrames;
  *((_DWORD *)result + 46) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 15) = self->_kRxRetryBitSet;
  *((_DWORD *)result + 46) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)result + 3) = self->_kMACRxDataFrameMatchingRA;
  *((_DWORD *)result + 46) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)result + 4) = self->_kMACRxDataFrameOtherRA;
  *((_DWORD *)result + 46) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 44) = self->_kMACRxControlFrameMatchingRA;
  *((_DWORD *)result + 46) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 45) = self->_kMACRxControlFrameOtherRA;
  *((_DWORD *)result + 46) |= 0x400000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)result + 14) = self->_kRxGoodPLCP;
  *((_DWORD *)result + 46) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)result + 10) = self->_kRxBadPLCP;
  *((_DWORD *)result + 46) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)result + 9) = self->_kRxBadFCS;
  *((_DWORD *)result + 46) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)result + 16) = self->_kTxFrames;
  *((_DWORD *)result + 46) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)result + 17) = self->_kTxRetransmission;
  *((_DWORD *)result + 46) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 21) = self->_kdot11RetryCount;
  *((_DWORD *)result + 46) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)result + 18) = self->_kdot11MultipleRetryCount;
  *((_DWORD *)result + 46) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)result + 20) = self->_kdot11RTSSuccessCount;
  *((_DWORD *)result + 46) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)result + 19) = self->_kdot11RTSFailureCount;
  *((_DWORD *)result + 46) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)result + 2) = self->_kCtlTxRTS;
  *((_DWORD *)result + 46) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)result + 11) = self->_kRxCRCGlitch;
  *((_DWORD *)result + 46) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)result + 5) = self->_kMACRxUnicastCTStoMAC;
  *((_DWORD *)result + 46) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)result + 6) = self->_kMACRxUnicastCTStoOther;
  *((_DWORD *)result + 46) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)result + 7) = self->_kMACRxUnicastRTStoMAC;
  *((_DWORD *)result + 46) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 1) == 0)
      return result;
    goto LABEL_24;
  }
LABEL_47:
  *((_QWORD *)result + 8) = self->_kMACRxUnicastRTStoOther;
  *((_DWORD *)result + 46) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 1) == 0)
    return result;
LABEL_24:
  *((_QWORD *)result + 1) = self->_kCtlTxCTS;
  *((_DWORD *)result + 46) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $6E9D4BE9CD91340AE534803B45062F36 has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 46);
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_kRxDataErrors != *((_QWORD *)a3 + 12))
        goto LABEL_116;
    }
    else if ((v7 & 0x800) != 0)
    {
LABEL_116:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_kRxFrames != *((_QWORD *)a3 + 13))
        goto LABEL_116;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_kRxRetryBitSet != *((_QWORD *)a3 + 15))
        goto LABEL_116;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_kMACRxDataFrameMatchingRA != *((_QWORD *)a3 + 3))
        goto LABEL_116;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_kMACRxDataFrameOtherRA != *((_QWORD *)a3 + 4))
        goto LABEL_116;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_kMACRxControlFrameMatchingRA != *((_DWORD *)a3 + 44))
        goto LABEL_116;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_kMACRxControlFrameOtherRA != *((_DWORD *)a3 + 45))
        goto LABEL_116;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_kRxGoodPLCP != *((_QWORD *)a3 + 14))
        goto LABEL_116;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_kRxBadPLCP != *((_QWORD *)a3 + 10))
        goto LABEL_116;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_kRxBadFCS != *((_QWORD *)a3 + 9))
        goto LABEL_116;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_kTxFrames != *((_QWORD *)a3 + 16))
        goto LABEL_116;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_kTxRetransmission != *((_QWORD *)a3 + 17))
        goto LABEL_116;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_kdot11RetryCount != *((_QWORD *)a3 + 21))
        goto LABEL_116;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_kdot11MultipleRetryCount != *((_QWORD *)a3 + 18))
        goto LABEL_116;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_kdot11RTSSuccessCount != *((_QWORD *)a3 + 20))
        goto LABEL_116;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_kdot11RTSFailureCount != *((_QWORD *)a3 + 19))
        goto LABEL_116;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_kCtlTxRTS != *((_QWORD *)a3 + 2))
        goto LABEL_116;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_kRxCRCGlitch != *((_QWORD *)a3 + 11))
        goto LABEL_116;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_kMACRxUnicastCTStoMAC != *((_QWORD *)a3 + 5))
        goto LABEL_116;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_kMACRxUnicastCTStoOther != *((_QWORD *)a3 + 6))
        goto LABEL_116;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_kMACRxUnicastRTStoMAC != *((_QWORD *)a3 + 7))
        goto LABEL_116;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_kMACRxUnicastRTStoOther != *((_QWORD *)a3 + 8))
        goto LABEL_116;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_116;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 46) & 1) == 0;
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_kCtlTxCTS != *((_QWORD *)a3 + 1))
        goto LABEL_116;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $6E9D4BE9CD91340AE534803B45062F36 has;
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

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v3 = 2654435761u * self->_kRxDataErrors;
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_kRxFrames;
      if ((*(_WORD *)&has & 0x4000) != 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_kRxRetryBitSet;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  v5 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_kMACRxDataFrameMatchingRA;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  v6 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_kMACRxDataFrameOtherRA;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_kMACRxControlFrameMatchingRA;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_kMACRxControlFrameOtherRA;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  v9 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_kRxGoodPLCP;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  v10 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_kRxBadPLCP;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  v11 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_kRxBadFCS;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  v12 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_12:
    v13 = 2654435761u * self->_kTxFrames;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_13:
    v14 = 2654435761u * self->_kTxRetransmission;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_14:
    v15 = 2654435761u * self->_kdot11RetryCount;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_15:
    v16 = 2654435761u * self->_kdot11MultipleRetryCount;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_16:
    v17 = 2654435761u * self->_kdot11RTSSuccessCount;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_17:
    v18 = 2654435761u * self->_kdot11RTSFailureCount;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  v18 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_18:
    v19 = 2654435761u * self->_kCtlTxRTS;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  v19 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_19:
    v20 = 2654435761u * self->_kRxCRCGlitch;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_20:
    v21 = 2654435761u * self->_kMACRxUnicastCTStoMAC;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  v21 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_21:
    v22 = 2654435761u * self->_kMACRxUnicastCTStoOther;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_22:
    v23 = 2654435761u * self->_kMACRxUnicastRTStoMAC;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_23;
LABEL_46:
    v24 = 0;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_24;
LABEL_47:
    v25 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
  }
LABEL_45:
  v23 = 0;
  if ((*(_BYTE *)&has & 0x80) == 0)
    goto LABEL_46;
LABEL_23:
  v24 = 2654435761u * self->_kMACRxUnicastRTStoOther;
  if ((*(_BYTE *)&has & 1) == 0)
    goto LABEL_47;
LABEL_24:
  v25 = 2654435761u * self->_kCtlTxCTS;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x800) != 0)
  {
    self->_kRxDataErrors = *((_QWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
    v3 = *((_DWORD *)a3 + 46);
    if ((v3 & 0x1000) == 0)
    {
LABEL_3:
      if ((v3 & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((v3 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_kRxFrames = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x4000) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  self->_kRxRetryBitSet = *((_QWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  self->_kMACRxDataFrameMatchingRA = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  self->_kMACRxDataFrameOtherRA = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x200000) == 0)
  {
LABEL_7:
    if ((v3 & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  self->_kMACRxControlFrameMatchingRA = *((_DWORD *)a3 + 44);
  *(_DWORD *)&self->_has |= 0x200000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x400000) == 0)
  {
LABEL_8:
    if ((v3 & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  self->_kMACRxControlFrameOtherRA = *((_DWORD *)a3 + 45);
  *(_DWORD *)&self->_has |= 0x400000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x2000) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  self->_kRxGoodPLCP = *((_QWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  self->_kRxBadPLCP = *((_QWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  self->_kRxBadFCS = *((_QWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x8000) == 0)
  {
LABEL_12:
    if ((v3 & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  self->_kTxFrames = *((_QWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x10000) == 0)
  {
LABEL_13:
    if ((v3 & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  self->_kTxRetransmission = *((_QWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x100000) == 0)
  {
LABEL_14:
    if ((v3 & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  self->_kdot11RetryCount = *((_QWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x20000) == 0)
  {
LABEL_15:
    if ((v3 & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  self->_kdot11MultipleRetryCount = *((_QWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x80000) == 0)
  {
LABEL_16:
    if ((v3 & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  self->_kdot11RTSSuccessCount = *((_QWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x40000) == 0)
  {
LABEL_17:
    if ((v3 & 2) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  self->_kdot11RTSFailureCount = *((_QWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 2) == 0)
  {
LABEL_18:
    if ((v3 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  self->_kCtlTxRTS = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x400) == 0)
  {
LABEL_19:
    if ((v3 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  self->_kRxCRCGlitch = *((_QWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x10) == 0)
  {
LABEL_20:
    if ((v3 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  self->_kMACRxUnicastCTStoMAC = *((_QWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x20) == 0)
  {
LABEL_21:
    if ((v3 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  self->_kMACRxUnicastCTStoOther = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x40) == 0)
  {
LABEL_22:
    if ((v3 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  self->_kMACRxUnicastRTStoMAC = *((_QWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x80) == 0)
  {
LABEL_23:
    if ((v3 & 1) == 0)
      return;
LABEL_47:
    self->_kCtlTxCTS = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    return;
  }
LABEL_46:
  self->_kMACRxUnicastRTStoOther = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)a3 + 46) & 1) != 0)
    goto LABEL_47;
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

@end
