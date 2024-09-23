@implementation AWDWifiLinkQualityRecord

- (void)setTxFrames:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_txFrames = a3;
}

- (void)setHasTxFrames:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTxFrames
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTxFail:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_txFail = a3;
}

- (void)setHasTxFail:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTxFail
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTxRetrans:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_txRetrans = a3;
}

- (void)setHasTxRetrans:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTxRetrans
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setBcnSched:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_bcnSched = a3;
}

- (void)setHasBcnSched:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasBcnSched
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBcnRcvs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_bcnRcvs = a3;
}

- (void)setHasBcnRcvs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasBcnRcvs
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setFwTxFrames:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_fwTxFrames = a3;
}

- (void)setHasFwTxFrames:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasFwTxFrames
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setFwTxFail:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_fwTxFail = a3;
}

- (void)setHasFwTxFail:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasFwTxFail
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFwTxRetrans:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_fwTxRetrans = a3;
}

- (void)setHasFwTxRetrans:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasFwTxRetrans
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setRxFrames:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_rxFrames = a3;
}

- (void)setHasRxFrames:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRxFrames
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRssi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTrgDisc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_trgDisc = a3;
}

- (void)setHasTrgDisc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTrgDisc
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setGwArpExpiry:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_gwArpExpiry = a3;
}

- (void)setHasGwArpExpiry:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasGwArpExpiry
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setUsrInput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_usrInput = a3;
}

- (void)setHasUsrInput:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasUsrInput
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTxPerSign:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_txPerSign = a3;
}

- (void)setHasTxPerSign:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTxPerSign
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setFwTxPerSign:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_fwTxPerSign = a3;
}

- (void)setHasFwTxPerSign:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasFwTxPerSign
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBcnPerSign:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_bcnPerSign = a3;
}

- (void)setHasBcnPerSign:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasBcnPerSign
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSympSign:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_sympSign = a3;
}

- (void)setHasSympSign:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSympSign
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setNetScore:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_netScore = a3;
}

- (void)setHasNetScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNetScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setUsrImpact:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_usrImpact = a3;
}

- (void)setHasUsrImpact:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasUsrImpact
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSympAwdCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_sympAwdCode = a3;
}

- (void)setHasSympAwdCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSympAwdCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setArpFailureCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_arpFailureCount = a3;
}

- (void)setHasArpFailureCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasArpFailureCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDnsServersImpacted:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_dnsServersImpacted = a3;
}

- (void)setHasDnsServersImpacted:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasDnsServersImpacted
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDnsServersTotal:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_dnsServersTotal = a3;
}

- (void)setHasDnsServersTotal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasDnsServersTotal
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setGateOpenTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_gateOpenTime = a3;
}

- (void)setHasGateOpenTime:(BOOL)a3
{
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasGateOpenTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTrafficWatchRx:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_trafficWatchRx = a3;
}

- (void)setHasTrafficWatchRx:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTrafficWatchRx
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTrafficWatchDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_trafficWatchDuration = a3;
}

- (void)setHasTrafficWatchDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasTrafficWatchDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTrafficWatchTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_trafficWatchTime = a3;
}

- (void)setHasTrafficWatchTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTrafficWatchTime
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setValidState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_validState = a3;
}

- (void)setHasValidState:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = 0x80000000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (BOOL)hasValidState
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setMetricReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_metricReason = a3;
}

- (void)setHasMetricReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMetricReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRapidLqmDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_rapidLqmDuration = a3;
}

- (void)setHasRapidLqmDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasRapidLqmDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTdEvalDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_tdEvalDuration = a3;
}

- (void)setHasTdEvalDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTdEvalDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRoamWaitTime:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_roamWaitTime = a3;
}

- (void)setHasRoamWaitTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasRoamWaitTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWifiLinkQualityRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWifiLinkQualityRecord description](&v3, sel_description), -[AWDWifiLinkQualityRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txFrames), CFSTR("txFrames"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txFail), CFSTR("txFail"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txRetrans), CFSTR("txRetrans"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bcnSched), CFSTR("bcnSched"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bcnRcvs), CFSTR("bcnRcvs"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fwTxFrames), CFSTR("fwTxFrames"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fwTxFail), CFSTR("fwTxFail"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fwTxRetrans), CFSTR("fwTxRetrans"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rxFrames), CFSTR("rxFrames"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rssi), CFSTR("rssi"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_trgDisc), CFSTR("trgDisc"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_gwArpExpiry), CFSTR("gwArpExpiry"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_usrInput), CFSTR("usrInput"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txPerSign), CFSTR("txPerSign"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fwTxPerSign), CFSTR("fwTxPerSign"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bcnPerSign), CFSTR("bcnPerSign"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sympSign), CFSTR("sympSign"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_netScore), CFSTR("netScore"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_usrImpact), CFSTR("usrImpact"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sympAwdCode), CFSTR("sympAwdCode"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_arpFailureCount), CFSTR("arpFailureCount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dnsServersImpacted), CFSTR("dnsServersImpacted"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dnsServersTotal), CFSTR("dnsServersTotal"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_gateOpenTime), CFSTR("gateOpenTime"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_trafficWatchRx), CFSTR("trafficWatchRx"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_trafficWatchDuration), CFSTR("trafficWatchDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_29;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_trafficWatchTime), CFSTR("trafficWatchTime"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_validState), CFSTR("validState"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_metricReason), CFSTR("metricReason"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_32;
LABEL_65:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tdEvalDuration), CFSTR("tdEvalDuration"));
    if ((*(_DWORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_33;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rapidLqmDuration), CFSTR("rapidLqmDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
    goto LABEL_65;
LABEL_32:
  if ((*(_BYTE *)&has & 4) != 0)
LABEL_33:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_roamWaitTime), CFSTR("roamWaitTime"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiLinkQualityRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $C67A20E2E9CB71E70E8272DEC2C6C683 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000000) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 4) == 0)
      return;
LABEL_65:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 4) != 0)
    goto LABEL_65;
}

- (void)copyTo:(id)a3
{
  $C67A20E2E9CB71E70E8272DEC2C6C683 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_txFrames;
    *((_DWORD *)a3 + 40) |= 0x4000000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000000) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 33) = self->_txFail;
  *((_DWORD *)a3 + 40) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 36) = self->_txRetrans;
  *((_DWORD *)a3 + 40) |= 0x10000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 17) = self->_bcnSched;
  *((_DWORD *)a3 + 40) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 16) = self->_bcnRcvs;
  *((_DWORD *)a3 + 40) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 21) = self->_fwTxFrames;
  *((_DWORD *)a3 + 40) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 20) = self->_fwTxFail;
  *((_DWORD *)a3 + 40) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 23) = self->_fwTxRetrans;
  *((_DWORD *)a3 + 40) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 28) = self->_rxFrames;
  *((_DWORD *)a3 + 40) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 27) = self->_rssi;
  *((_DWORD *)a3 + 40) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 32) = self->_trgDisc;
  *((_DWORD *)a3 + 40) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 24) = self->_gwArpExpiry;
  *((_DWORD *)a3 + 40) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 38) = self->_usrInput;
  *((_DWORD *)a3 + 40) |= 0x40000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 35) = self->_txPerSign;
  *((_DWORD *)a3 + 40) |= 0x8000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 22) = self->_fwTxPerSign;
  *((_DWORD *)a3 + 40) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 15) = self->_bcnPerSign;
  *((_DWORD *)a3 + 40) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 30) = self->_sympSign;
  *((_DWORD *)a3 + 40) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 26) = self->_netScore;
  *((_DWORD *)a3 + 40) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 37) = self->_usrImpact;
  *((_DWORD *)a3 + 40) |= 0x20000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 29) = self->_sympAwdCode;
  *((_DWORD *)a3 + 40) |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 14) = self->_arpFailureCount;
  *((_DWORD *)a3 + 40) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 18) = self->_dnsServersImpacted;
  *((_DWORD *)a3 + 40) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 19) = self->_dnsServersTotal;
  *((_DWORD *)a3 + 40) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_gateOpenTime;
  *((_DWORD *)a3 + 40) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 31) = self->_trafficWatchRx;
  *((_DWORD *)a3 + 40) |= 0x800000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)a3 + 5) = *(_QWORD *)&self->_trafficWatchDuration;
  *((_DWORD *)a3 + 40) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)a3 + 6) = *(_QWORD *)&self->_trafficWatchTime;
  *((_DWORD *)a3 + 40) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 39) = self->_validState;
  *((_DWORD *)a3 + 40) |= 0x80000000;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 25) = self->_metricReason;
  *((_DWORD *)a3 + 40) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)a3 + 2) = self->_rapidLqmDuration;
  *((_DWORD *)a3 + 40) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 4) == 0)
      return;
LABEL_65:
    *((_QWORD *)a3 + 3) = self->_roamWaitTime;
    *((_DWORD *)a3 + 40) |= 4u;
    return;
  }
LABEL_64:
  *((_QWORD *)a3 + 4) = self->_tdEvalDuration;
  *((_DWORD *)a3 + 40) |= 8u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
    goto LABEL_65;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    *((_DWORD *)result + 34) = self->_txFrames;
    *((_DWORD *)result + 40) |= 0x4000000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 33) = self->_txFail;
  *((_DWORD *)result + 40) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 36) = self->_txRetrans;
  *((_DWORD *)result + 40) |= 0x10000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 17) = self->_bcnSched;
  *((_DWORD *)result + 40) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 16) = self->_bcnRcvs;
  *((_DWORD *)result + 40) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 21) = self->_fwTxFrames;
  *((_DWORD *)result + 40) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 20) = self->_fwTxFail;
  *((_DWORD *)result + 40) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 23) = self->_fwTxRetrans;
  *((_DWORD *)result + 40) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 28) = self->_rxFrames;
  *((_DWORD *)result + 40) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 27) = self->_rssi;
  *((_DWORD *)result + 40) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)result + 32) = self->_trgDisc;
  *((_DWORD *)result + 40) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 24) = self->_gwArpExpiry;
  *((_DWORD *)result + 40) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 38) = self->_usrInput;
  *((_DWORD *)result + 40) |= 0x40000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 35) = self->_txPerSign;
  *((_DWORD *)result + 40) |= 0x8000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 22) = self->_fwTxPerSign;
  *((_DWORD *)result + 40) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 15) = self->_bcnPerSign;
  *((_DWORD *)result + 40) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 30) = self->_sympSign;
  *((_DWORD *)result + 40) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 26) = self->_netScore;
  *((_DWORD *)result + 40) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 37) = self->_usrImpact;
  *((_DWORD *)result + 40) |= 0x20000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 29) = self->_sympAwdCode;
  *((_DWORD *)result + 40) |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)result + 14) = self->_arpFailureCount;
  *((_DWORD *)result + 40) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)result + 18) = self->_dnsServersImpacted;
  *((_DWORD *)result + 40) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)result + 19) = self->_dnsServersTotal;
  *((_DWORD *)result + 40) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_gateOpenTime;
  *((_DWORD *)result + 40) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)result + 31) = self->_trafficWatchRx;
  *((_DWORD *)result + 40) |= 0x800000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_trafficWatchDuration;
  *((_DWORD *)result + 40) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_29;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_trafficWatchTime;
  *((_DWORD *)result + 40) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)result + 39) = self->_validState;
  *((_DWORD *)result + 40) |= 0x80000000;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)result + 25) = self->_metricReason;
  *((_DWORD *)result + 40) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_32;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)result + 2) = self->_rapidLqmDuration;
  *((_DWORD *)result + 40) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 4) == 0)
      return result;
    goto LABEL_33;
  }
LABEL_65:
  *((_QWORD *)result + 4) = self->_tdEvalDuration;
  *((_DWORD *)result + 40) |= 8u;
  if ((*(_DWORD *)&self->_has & 4) == 0)
    return result;
LABEL_33:
  *((_QWORD *)result + 3) = self->_roamWaitTime;
  *((_DWORD *)result + 40) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 40);
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_txFrames != *((_DWORD *)a3 + 34))
        goto LABEL_161;
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_txFail != *((_DWORD *)a3 + 33))
        goto LABEL_161;
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_txRetrans != *((_DWORD *)a3 + 36))
        goto LABEL_161;
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_bcnSched != *((_DWORD *)a3 + 17))
        goto LABEL_161;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_bcnRcvs != *((_DWORD *)a3 + 16))
        goto LABEL_161;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_fwTxFrames != *((_DWORD *)a3 + 21))
        goto LABEL_161;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_fwTxFail != *((_DWORD *)a3 + 20))
        goto LABEL_161;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_fwTxRetrans != *((_DWORD *)a3 + 23))
        goto LABEL_161;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_rxFrames != *((_DWORD *)a3 + 28))
        goto LABEL_161;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_rssi != *((_DWORD *)a3 + 27))
        goto LABEL_161;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_trgDisc != *((_DWORD *)a3 + 32))
        goto LABEL_161;
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_gwArpExpiry != *((_DWORD *)a3 + 24))
        goto LABEL_161;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_usrInput != *((_DWORD *)a3 + 38))
        goto LABEL_161;
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_txPerSign != *((_DWORD *)a3 + 35))
        goto LABEL_161;
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_fwTxPerSign != *((_DWORD *)a3 + 22))
        goto LABEL_161;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_bcnPerSign != *((_DWORD *)a3 + 15))
        goto LABEL_161;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_sympSign != *((_DWORD *)a3 + 30))
        goto LABEL_161;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_netScore != *((_DWORD *)a3 + 26))
        goto LABEL_161;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_usrImpact != *((_DWORD *)a3 + 37))
        goto LABEL_161;
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_sympAwdCode != *((_DWORD *)a3 + 29))
        goto LABEL_161;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_arpFailureCount != *((_DWORD *)a3 + 14))
        goto LABEL_161;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_dnsServersImpacted != *((_DWORD *)a3 + 18))
        goto LABEL_161;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_dnsServersTotal != *((_DWORD *)a3 + 19))
        goto LABEL_161;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_gateOpenTime != *((double *)a3 + 1))
        goto LABEL_161;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_trafficWatchRx != *((_DWORD *)a3 + 31))
        goto LABEL_161;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_trafficWatchDuration != *((double *)a3 + 5))
        goto LABEL_161;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_trafficWatchTime != *((double *)a3 + 6))
        goto LABEL_161;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_validState != *((_DWORD *)a3 + 39))
        goto LABEL_161;
    }
    else if (v7 < 0)
    {
LABEL_161:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_metricReason != *((_DWORD *)a3 + 25))
        goto LABEL_161;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_rapidLqmDuration != *((_QWORD *)a3 + 2))
        goto LABEL_161;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_tdEvalDuration != *((_QWORD *)a3 + 4))
        goto LABEL_161;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_161;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 40) & 4) == 0;
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_roamWaitTime != *((_QWORD *)a3 + 3))
        goto LABEL_161;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $C67A20E2E9CB71E70E8272DEC2C6C683 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double gateOpenTime;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  double trafficWatchDuration;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  double trafficWatchTime;
  double v21;
  long double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    v48 = 2654435761 * self->_txFrames;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
LABEL_3:
      v47 = 2654435761 * self->_txFail;
      if ((*(_DWORD *)&has & 0x10000000) != 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else
  {
    v48 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_3;
  }
  v47 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_4:
    v46 = 2654435761 * self->_txRetrans;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  v46 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_5:
    v45 = 2654435761 * self->_bcnSched;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  v45 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_6:
    v44 = 2654435761 * self->_bcnRcvs;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  v44 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_7:
    v43 = 2654435761 * self->_fwTxFrames;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  v43 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_8:
    v42 = 2654435761 * self->_fwTxFail;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  v42 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_9:
    v41 = 2654435761 * self->_fwTxRetrans;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  v41 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_10:
    v40 = 2654435761 * self->_rxFrames;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  v40 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_11:
    v39 = 2654435761 * self->_rssi;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  v39 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_12:
    v38 = 2654435761 * self->_trgDisc;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_39:
  v38 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_13:
    v37 = 2654435761 * self->_gwArpExpiry;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_14;
    goto LABEL_41;
  }
LABEL_40:
  v37 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_14:
    v36 = 2654435761 * self->_usrInput;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_15;
    goto LABEL_42;
  }
LABEL_41:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_15:
    v35 = 2654435761 * self->_txPerSign;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  v35 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_16:
    v34 = 2654435761 * self->_fwTxPerSign;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  v34 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_17:
    v33 = 2654435761 * self->_bcnPerSign;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_18:
    v32 = 2654435761 * self->_sympSign;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_19:
    v31 = 2654435761 * self->_netScore;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_20:
    v30 = 2654435761 * self->_usrImpact;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_21:
    v4 = 2654435761 * self->_sympAwdCode;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  v4 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_22:
    v5 = 2654435761 * self->_arpFailureCount;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  v5 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_23:
    v6 = 2654435761 * self->_dnsServersImpacted;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_24;
LABEL_51:
    v7 = 0;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_25;
LABEL_52:
    v12 = 0;
    goto LABEL_55;
  }
LABEL_50:
  v6 = 0;
  if ((*(_WORD *)&has & 0x800) == 0)
    goto LABEL_51;
LABEL_24:
  v7 = 2654435761 * self->_dnsServersTotal;
  if ((*(_BYTE *)&has & 1) == 0)
    goto LABEL_52;
LABEL_25:
  gateOpenTime = self->_gateOpenTime;
  v9 = -gateOpenTime;
  if (gateOpenTime >= 0.0)
    v9 = self->_gateOpenTime;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_55:
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    v13 = 2654435761 * self->_trafficWatchRx;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_57;
LABEL_62:
    v18 = 0;
    goto LABEL_65;
  }
  v13 = 0;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_62;
LABEL_57:
  trafficWatchDuration = self->_trafficWatchDuration;
  v15 = -trafficWatchDuration;
  if (trafficWatchDuration >= 0.0)
    v15 = self->_trafficWatchDuration;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_65:
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    trafficWatchTime = self->_trafficWatchTime;
    v21 = -trafficWatchTime;
    if (trafficWatchTime >= 0.0)
      v21 = self->_trafficWatchTime;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    v24 = 2654435761 * self->_validState;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_75:
      v25 = 0;
      if ((*(_BYTE *)&has & 2) != 0)
        goto LABEL_76;
      goto LABEL_81;
    }
  }
  else
  {
    v24 = 0;
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_75;
  }
  v25 = 2654435761 * self->_metricReason;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_76:
    v26 = 2654435761u * self->_rapidLqmDuration;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_77;
LABEL_82:
    v27 = 0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_78;
LABEL_83:
    v28 = 0;
    return v47 ^ v48 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_81:
  v26 = 0;
  if ((*(_BYTE *)&has & 8) == 0)
    goto LABEL_82;
LABEL_77:
  v27 = 2654435761u * self->_tdEvalDuration;
  if ((*(_BYTE *)&has & 4) == 0)
    goto LABEL_83;
LABEL_78:
  v28 = 2654435761u * self->_roamWaitTime;
  return v47 ^ v48 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x4000000) != 0)
  {
    self->_txFrames = *((_DWORD *)a3 + 34);
    *(_DWORD *)&self->_has |= 0x4000000u;
    v3 = *((_DWORD *)a3 + 40);
    if ((v3 & 0x2000000) == 0)
    {
LABEL_3:
      if ((v3 & 0x10000000) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((v3 & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  self->_txFail = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_4:
    if ((v3 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  self->_txRetrans = *((_DWORD *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x10000000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x200) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  self->_bcnSched = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  self->_bcnRcvs = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x100u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x2000) == 0)
  {
LABEL_7:
    if ((v3 & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  self->_fwTxFrames = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x1000) == 0)
  {
LABEL_8:
    if ((v3 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  self->_fwTxFail = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x8000) == 0)
  {
LABEL_9:
    if ((v3 & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  self->_fwTxRetrans = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x100000) == 0)
  {
LABEL_10:
    if ((v3 & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  self->_rxFrames = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x100000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x80000) == 0)
  {
LABEL_11:
    if ((v3 & 0x1000000) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  self->_rssi = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x80000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_12:
    if ((v3 & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  self->_trgDisc = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x10000) == 0)
  {
LABEL_13:
    if ((v3 & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  self->_gwArpExpiry = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_14:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  self->_usrInput = *((_DWORD *)a3 + 38);
  *(_DWORD *)&self->_has |= 0x40000000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_15:
    if ((v3 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  self->_txPerSign = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x4000) == 0)
  {
LABEL_16:
    if ((v3 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  self->_fwTxPerSign = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x80) == 0)
  {
LABEL_17:
    if ((v3 & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  self->_bcnPerSign = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x400000) == 0)
  {
LABEL_18:
    if ((v3 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  self->_sympSign = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x400000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x40000) == 0)
  {
LABEL_19:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  self->_netScore = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x40000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_20:
    if ((v3 & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  self->_usrImpact = *((_DWORD *)a3 + 37);
  *(_DWORD *)&self->_has |= 0x20000000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x200000) == 0)
  {
LABEL_21:
    if ((v3 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  self->_sympAwdCode = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x200000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x40) == 0)
  {
LABEL_22:
    if ((v3 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  self->_arpFailureCount = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x400) == 0)
  {
LABEL_23:
    if ((v3 & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  self->_dnsServersImpacted = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x800) == 0)
  {
LABEL_24:
    if ((v3 & 1) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  self->_dnsServersTotal = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 1) == 0)
  {
LABEL_25:
    if ((v3 & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  self->_gateOpenTime = *((double *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x800000) == 0)
  {
LABEL_26:
    if ((v3 & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  self->_trafficWatchRx = *((_DWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x800000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x10) == 0)
  {
LABEL_27:
    if ((v3 & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  self->_trafficWatchDuration = *((double *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_28:
    if ((v3 & 0x80000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  self->_trafficWatchTime = *((double *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  self->_validState = *((_DWORD *)a3 + 39);
  *(_DWORD *)&self->_has |= 0x80000000;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x20000) == 0)
  {
LABEL_30:
    if ((v3 & 2) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  self->_metricReason = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x20000u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 2) == 0)
  {
LABEL_31:
    if ((v3 & 8) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  self->_rapidLqmDuration = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_32:
    if ((v3 & 4) == 0)
      return;
LABEL_65:
    self->_roamWaitTime = *((_QWORD *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
    return;
  }
LABEL_64:
  self->_tdEvalDuration = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)a3 + 40) & 4) != 0)
    goto LABEL_65;
}

- (unsigned)txFrames
{
  return self->_txFrames;
}

- (unsigned)txFail
{
  return self->_txFail;
}

- (unsigned)txRetrans
{
  return self->_txRetrans;
}

- (unsigned)bcnSched
{
  return self->_bcnSched;
}

- (unsigned)bcnRcvs
{
  return self->_bcnRcvs;
}

- (unsigned)fwTxFrames
{
  return self->_fwTxFrames;
}

- (unsigned)fwTxFail
{
  return self->_fwTxFail;
}

- (unsigned)fwTxRetrans
{
  return self->_fwTxRetrans;
}

- (unsigned)rxFrames
{
  return self->_rxFrames;
}

- (int)rssi
{
  return self->_rssi;
}

- (unsigned)trgDisc
{
  return self->_trgDisc;
}

- (unsigned)gwArpExpiry
{
  return self->_gwArpExpiry;
}

- (unsigned)usrInput
{
  return self->_usrInput;
}

- (unsigned)txPerSign
{
  return self->_txPerSign;
}

- (unsigned)fwTxPerSign
{
  return self->_fwTxPerSign;
}

- (unsigned)bcnPerSign
{
  return self->_bcnPerSign;
}

- (unsigned)sympSign
{
  return self->_sympSign;
}

- (unsigned)netScore
{
  return self->_netScore;
}

- (unsigned)usrImpact
{
  return self->_usrImpact;
}

- (unsigned)sympAwdCode
{
  return self->_sympAwdCode;
}

- (unsigned)arpFailureCount
{
  return self->_arpFailureCount;
}

- (unsigned)dnsServersImpacted
{
  return self->_dnsServersImpacted;
}

- (unsigned)dnsServersTotal
{
  return self->_dnsServersTotal;
}

- (double)gateOpenTime
{
  return self->_gateOpenTime;
}

- (unsigned)trafficWatchRx
{
  return self->_trafficWatchRx;
}

- (double)trafficWatchDuration
{
  return self->_trafficWatchDuration;
}

- (double)trafficWatchTime
{
  return self->_trafficWatchTime;
}

- (unsigned)validState
{
  return self->_validState;
}

- (unsigned)metricReason
{
  return self->_metricReason;
}

- (unint64_t)rapidLqmDuration
{
  return self->_rapidLqmDuration;
}

- (unint64_t)tdEvalDuration
{
  return self->_tdEvalDuration;
}

- (unint64_t)roamWaitTime
{
  return self->_roamWaitTime;
}

@end
