@implementation AWDWiFiMetricsManagerInfraInterface

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerInfraInterface setLinkLatency0ms:](self, "setLinkLatency0ms:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkLatency64ms:](self, "setLinkLatency64ms:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkLatency128ms:](self, "setLinkLatency128ms:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkLatency256ms:](self, "setLinkLatency256ms:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkLatency512ms:](self, "setLinkLatency512ms:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkLatency1024ms:](self, "setLinkLatency1024ms:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkOpen0pct:](self, "setLinkOpen0pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkOpen125pct:](self, "setLinkOpen125pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkOpen25pct:](self, "setLinkOpen25pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkOpen375pct:](self, "setLinkOpen375pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkOpen50pct:](self, "setLinkOpen50pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkOpen625pct:](self, "setLinkOpen625pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkOpen75pct:](self, "setLinkOpen75pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkOpen875pct:](self, "setLinkOpen875pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLinkOpen100pct:](self, "setLinkOpen100pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setAvgCCA0pct:](self, "setAvgCCA0pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setAvgCCA125pct:](self, "setAvgCCA125pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setAvgCCA25pct:](self, "setAvgCCA25pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setAvgCCA375pct:](self, "setAvgCCA375pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setAvgCCA50pct:](self, "setAvgCCA50pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setAvgCCA625pct:](self, "setAvgCCA625pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setAvgCCA75pct:](self, "setAvgCCA75pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setAvgCCA875pct:](self, "setAvgCCA875pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setAvgCCA100pct:](self, "setAvgCCA100pct:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLqmOff:](self, "setLqmOff:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLqmUnknown:](self, "setLqmUnknown:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLqmBad:](self, "setLqmBad:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLqmPoor:](self, "setLqmPoor:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setLqmGood:](self, "setLqmGood:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setActivityUp:](self, "setActivityUp:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setActivityDown:](self, "setActivityDown:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setActivityInvoluntarilyDown:](self, "setActivityInvoluntarilyDown:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setActivityScanning:](self, "setActivityScanning:", 0);
  -[AWDWiFiMetricsManagerInfraInterface setActivityRoaming:](self, "setActivityRoaming:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerInfraInterface;
  -[AWDWiFiMetricsManagerInfraInterface dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRxPackets:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_rxPackets = a3;
}

- (void)setHasRxPackets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasRxPackets
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTxPackets:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_txPackets = a3;
}

- (void)setHasTxPackets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTxPackets
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setTxPacketsBe:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_txPacketsBe = a3;
}

- (void)setHasTxPacketsBe:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTxPacketsBe
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTxPacketsBk:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_txPacketsBk = a3;
}

- (void)setHasTxPacketsBk:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTxPacketsBk
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTxPacketsVi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_txPacketsVi = a3;
}

- (void)setHasTxPacketsVi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTxPacketsVi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTxPacketsVo:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_txPacketsVo = a3;
}

- (void)setHasTxPacketsVo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTxPacketsVo
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasRxBytes
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTxBytes
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTxBytesBe:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_txBytesBe = a3;
}

- (void)setHasTxBytesBe:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasTxBytesBe
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTxBytesBk:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_txBytesBk = a3;
}

- (void)setHasTxBytesBk:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTxBytesBk
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTxBytesVi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_txBytesVi = a3;
}

- (void)setHasTxBytesVi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasTxBytesVi
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTxBytesVo:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_txBytesVo = a3;
}

- (void)setHasTxBytesVo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTxBytesVo
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setLinkRateMbps:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_linkRateMbps = a3;
}

- (void)setHasLinkRateMbps:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasLinkRateMbps
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setEffectiveLinkRateMpbs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_effectiveLinkRateMpbs = a3;
}

- (void)setHasEffectiveLinkRateMpbs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasEffectiveLinkRateMpbs
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setDataTransferRateMpbs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_dataTransferRateMpbs = a3;
}

- (void)setHasDataTransferRateMpbs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDataTransferRateMpbs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setEffectiveDataTransferRateMpbs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_effectiveDataTransferRateMpbs = a3;
}

- (void)setHasEffectiveDataTransferRateMpbs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasEffectiveDataTransferRateMpbs
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setLinkLatencyMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_linkLatencyMs = a3;
}

- (void)setHasLinkLatencyMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasLinkLatencyMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasLinkLatency0ms
{
  return self->_linkLatency0ms != 0;
}

- (BOOL)hasLinkLatency64ms
{
  return self->_linkLatency64ms != 0;
}

- (BOOL)hasLinkLatency128ms
{
  return self->_linkLatency128ms != 0;
}

- (BOOL)hasLinkLatency256ms
{
  return self->_linkLatency256ms != 0;
}

- (BOOL)hasLinkLatency512ms
{
  return self->_linkLatency512ms != 0;
}

- (BOOL)hasLinkLatency1024ms
{
  return self->_linkLatency1024ms != 0;
}

- (void)setLinkOpenPct:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_linkOpenPct = a3;
}

- (void)setHasLinkOpenPct:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasLinkOpenPct
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasLinkOpen0pct
{
  return self->_linkOpen0pct != 0;
}

- (BOOL)hasLinkOpen125pct
{
  return self->_linkOpen125pct != 0;
}

- (BOOL)hasLinkOpen25pct
{
  return self->_linkOpen25pct != 0;
}

- (BOOL)hasLinkOpen375pct
{
  return self->_linkOpen375pct != 0;
}

- (BOOL)hasLinkOpen50pct
{
  return self->_linkOpen50pct != 0;
}

- (BOOL)hasLinkOpen625pct
{
  return self->_linkOpen625pct != 0;
}

- (BOOL)hasLinkOpen75pct
{
  return self->_linkOpen75pct != 0;
}

- (BOOL)hasLinkOpen875pct
{
  return self->_linkOpen875pct != 0;
}

- (BOOL)hasLinkOpen100pct
{
  return self->_linkOpen100pct != 0;
}

- (void)setAvgCCA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_avgCCA = a3;
}

- (void)setHasAvgCCA:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAvgCCA
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasAvgCCA0pct
{
  return self->_avgCCA0pct != 0;
}

- (BOOL)hasAvgCCA125pct
{
  return self->_avgCCA125pct != 0;
}

- (BOOL)hasAvgCCA25pct
{
  return self->_avgCCA25pct != 0;
}

- (BOOL)hasAvgCCA375pct
{
  return self->_avgCCA375pct != 0;
}

- (BOOL)hasAvgCCA50pct
{
  return self->_avgCCA50pct != 0;
}

- (BOOL)hasAvgCCA625pct
{
  return self->_avgCCA625pct != 0;
}

- (BOOL)hasAvgCCA75pct
{
  return self->_avgCCA75pct != 0;
}

- (BOOL)hasAvgCCA875pct
{
  return self->_avgCCA875pct != 0;
}

- (BOOL)hasAvgCCA100pct
{
  return self->_avgCCA100pct != 0;
}

- (void)setLqm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_lqm = a3;
}

- (void)setHasLqm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasLqm
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasLqmOff
{
  return self->_lqmOff != 0;
}

- (BOOL)hasLqmUnknown
{
  return self->_lqmUnknown != 0;
}

- (BOOL)hasLqmBad
{
  return self->_lqmBad != 0;
}

- (BOOL)hasLqmPoor
{
  return self->_lqmPoor != 0;
}

- (BOOL)hasLqmGood
{
  return self->_lqmGood != 0;
}

- (BOOL)hasActivityUp
{
  return self->_activityUp != 0;
}

- (BOOL)hasActivityDown
{
  return self->_activityDown != 0;
}

- (BOOL)hasActivityInvoluntarilyDown
{
  return self->_activityInvoluntarilyDown != 0;
}

- (BOOL)hasActivityScanning
{
  return self->_activityScanning != 0;
}

- (BOOL)hasActivityRoaming
{
  return self->_activityRoaming != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerInfraInterface;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerInfraInterface description](&v3, sel_description), -[AWDWiFiMetricsManagerInfraInterface dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $D6F352D4FD6CE9CC3730891842732671 has;
  AWDWiFiMetricsManagerStateMachine *linkLatency0ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency64ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency128ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency256ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency512ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency1024ms;
  AWDWiFiMetricsManagerStateMachine *linkOpen0pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen125pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen25pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen375pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen50pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen625pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen75pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen875pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen100pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA0pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA125pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA25pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA375pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA50pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA625pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA75pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA875pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA100pct;
  AWDWiFiMetricsManagerStateMachine *lqmOff;
  AWDWiFiMetricsManagerStateMachine *lqmUnknown;
  AWDWiFiMetricsManagerStateMachine *lqmBad;
  AWDWiFiMetricsManagerStateMachine *lqmPoor;
  AWDWiFiMetricsManagerStateMachine *lqmGood;
  AWDWiFiMetricsManagerStateMachine *activityUp;
  AWDWiFiMetricsManagerStateMachine *activityDown;
  AWDWiFiMetricsManagerStateMachine *activityInvoluntarilyDown;
  AWDWiFiMetricsManagerStateMachine *activityScanning;
  AWDWiFiMetricsManagerStateMachine *activityRoaming;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_97;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxPackets), CFSTR("rxPackets"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txPackets), CFSTR("txPackets"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txPacketsBe), CFSTR("txPacketsBe"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txPacketsBk), CFSTR("txPacketsBk"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txPacketsVi), CFSTR("txPacketsVi"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_9;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txPacketsVo), CFSTR("txPacketsVo"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxBytes), CFSTR("rxBytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txBytes), CFSTR("txBytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txBytesBe), CFSTR("txBytesBe"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txBytesBk), CFSTR("txBytesBk"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txBytesVi), CFSTR("txBytesVi"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txBytesVo), CFSTR("txBytesVo"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_109;
  }
LABEL_108:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_linkRateMbps), CFSTR("linkRate_Mbps"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_effectiveLinkRateMpbs), CFSTR("effectiveLinkRate_Mpbs"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dataTransferRateMpbs), CFSTR("dataTransferRate_Mpbs"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_111:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_effectiveDataTransferRateMpbs), CFSTR("effectiveDataTransferRate_Mpbs"));
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
LABEL_19:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_linkLatencyMs), CFSTR("linkLatency_ms"));
LABEL_20:
  linkLatency0ms = self->_linkLatency0ms;
  if (linkLatency0ms)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency0ms, "dictionaryRepresentation"), CFSTR("linkLatency_0ms"));
  linkLatency64ms = self->_linkLatency64ms;
  if (linkLatency64ms)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency64ms, "dictionaryRepresentation"), CFSTR("linkLatency_64ms"));
  linkLatency128ms = self->_linkLatency128ms;
  if (linkLatency128ms)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency128ms, "dictionaryRepresentation"), CFSTR("linkLatency_128ms"));
  linkLatency256ms = self->_linkLatency256ms;
  if (linkLatency256ms)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency256ms, "dictionaryRepresentation"), CFSTR("linkLatency_256ms"));
  linkLatency512ms = self->_linkLatency512ms;
  if (linkLatency512ms)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency512ms, "dictionaryRepresentation"), CFSTR("linkLatency_512ms"));
  linkLatency1024ms = self->_linkLatency1024ms;
  if (linkLatency1024ms)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency1024ms, "dictionaryRepresentation"), CFSTR("linkLatency_1024ms"));
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_linkOpenPct), CFSTR("linkOpen_pct"));
  linkOpen0pct = self->_linkOpen0pct;
  if (linkOpen0pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen0pct, "dictionaryRepresentation"), CFSTR("linkOpen_0pct"));
  linkOpen125pct = self->_linkOpen125pct;
  if (linkOpen125pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen125pct, "dictionaryRepresentation"), CFSTR("linkOpen_125pct"));
  linkOpen25pct = self->_linkOpen25pct;
  if (linkOpen25pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen25pct, "dictionaryRepresentation"), CFSTR("linkOpen_25pct"));
  linkOpen375pct = self->_linkOpen375pct;
  if (linkOpen375pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen375pct, "dictionaryRepresentation"), CFSTR("linkOpen_375pct"));
  linkOpen50pct = self->_linkOpen50pct;
  if (linkOpen50pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen50pct, "dictionaryRepresentation"), CFSTR("linkOpen_50pct"));
  linkOpen625pct = self->_linkOpen625pct;
  if (linkOpen625pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen625pct, "dictionaryRepresentation"), CFSTR("linkOpen_625pct"));
  linkOpen75pct = self->_linkOpen75pct;
  if (linkOpen75pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen75pct, "dictionaryRepresentation"), CFSTR("linkOpen_75pct"));
  linkOpen875pct = self->_linkOpen875pct;
  if (linkOpen875pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen875pct, "dictionaryRepresentation"), CFSTR("linkOpen_875pct"));
  linkOpen100pct = self->_linkOpen100pct;
  if (linkOpen100pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen100pct, "dictionaryRepresentation"), CFSTR("linkOpen_100pct"));
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgCCA), CFSTR("avgCCA"));
  avgCCA0pct = self->_avgCCA0pct;
  if (avgCCA0pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA0pct, "dictionaryRepresentation"), CFSTR("avgCCA_0pct"));
  avgCCA125pct = self->_avgCCA125pct;
  if (avgCCA125pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA125pct, "dictionaryRepresentation"), CFSTR("avgCCA_125pct"));
  avgCCA25pct = self->_avgCCA25pct;
  if (avgCCA25pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA25pct, "dictionaryRepresentation"), CFSTR("avgCCA_25pct"));
  avgCCA375pct = self->_avgCCA375pct;
  if (avgCCA375pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA375pct, "dictionaryRepresentation"), CFSTR("avgCCA_375pct"));
  avgCCA50pct = self->_avgCCA50pct;
  if (avgCCA50pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA50pct, "dictionaryRepresentation"), CFSTR("avgCCA_50pct"));
  avgCCA625pct = self->_avgCCA625pct;
  if (avgCCA625pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA625pct, "dictionaryRepresentation"), CFSTR("avgCCA_625pct"));
  avgCCA75pct = self->_avgCCA75pct;
  if (avgCCA75pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA75pct, "dictionaryRepresentation"), CFSTR("avgCCA_75pct"));
  avgCCA875pct = self->_avgCCA875pct;
  if (avgCCA875pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA875pct, "dictionaryRepresentation"), CFSTR("avgCCA_875pct"));
  avgCCA100pct = self->_avgCCA100pct;
  if (avgCCA100pct)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA100pct, "dictionaryRepresentation"), CFSTR("avgCCA_100pct"));
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lqm), CFSTR("lqm"));
  lqmOff = self->_lqmOff;
  if (lqmOff)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](lqmOff, "dictionaryRepresentation"), CFSTR("lqm_Off"));
  lqmUnknown = self->_lqmUnknown;
  if (lqmUnknown)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](lqmUnknown, "dictionaryRepresentation"), CFSTR("lqm_Unknown"));
  lqmBad = self->_lqmBad;
  if (lqmBad)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](lqmBad, "dictionaryRepresentation"), CFSTR("lqm_Bad"));
  lqmPoor = self->_lqmPoor;
  if (lqmPoor)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](lqmPoor, "dictionaryRepresentation"), CFSTR("lqm_Poor"));
  lqmGood = self->_lqmGood;
  if (lqmGood)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](lqmGood, "dictionaryRepresentation"), CFSTR("lqm_Good"));
  activityUp = self->_activityUp;
  if (activityUp)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityUp, "dictionaryRepresentation"), CFSTR("activity_Up"));
  activityDown = self->_activityDown;
  if (activityDown)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityDown, "dictionaryRepresentation"), CFSTR("activity_Down"));
  activityInvoluntarilyDown = self->_activityInvoluntarilyDown;
  if (activityInvoluntarilyDown)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityInvoluntarilyDown, "dictionaryRepresentation"), CFSTR("activity_InvoluntarilyDown"));
  activityScanning = self->_activityScanning;
  if (activityScanning)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityScanning, "dictionaryRepresentation"), CFSTR("activity_Scanning"));
  activityRoaming = self->_activityRoaming;
  if (activityRoaming)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityRoaming, "dictionaryRepresentation"), CFSTR("activity_Roaming"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerInfraInterfaceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $D6F352D4FD6CE9CC3730891842732671 has;

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_96;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_9;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
LABEL_19:
    PBDataWriterWriteUint32Field();
LABEL_20:
  if (self->_linkLatency0ms)
    PBDataWriterWriteSubmessage();
  if (self->_linkLatency64ms)
    PBDataWriterWriteSubmessage();
  if (self->_linkLatency128ms)
    PBDataWriterWriteSubmessage();
  if (self->_linkLatency256ms)
    PBDataWriterWriteSubmessage();
  if (self->_linkLatency512ms)
    PBDataWriterWriteSubmessage();
  if (self->_linkLatency1024ms)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_linkOpen0pct)
    PBDataWriterWriteSubmessage();
  if (self->_linkOpen125pct)
    PBDataWriterWriteSubmessage();
  if (self->_linkOpen25pct)
    PBDataWriterWriteSubmessage();
  if (self->_linkOpen375pct)
    PBDataWriterWriteSubmessage();
  if (self->_linkOpen50pct)
    PBDataWriterWriteSubmessage();
  if (self->_linkOpen625pct)
    PBDataWriterWriteSubmessage();
  if (self->_linkOpen75pct)
    PBDataWriterWriteSubmessage();
  if (self->_linkOpen875pct)
    PBDataWriterWriteSubmessage();
  if (self->_linkOpen100pct)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_avgCCA0pct)
    PBDataWriterWriteSubmessage();
  if (self->_avgCCA125pct)
    PBDataWriterWriteSubmessage();
  if (self->_avgCCA25pct)
    PBDataWriterWriteSubmessage();
  if (self->_avgCCA375pct)
    PBDataWriterWriteSubmessage();
  if (self->_avgCCA50pct)
    PBDataWriterWriteSubmessage();
  if (self->_avgCCA625pct)
    PBDataWriterWriteSubmessage();
  if (self->_avgCCA75pct)
    PBDataWriterWriteSubmessage();
  if (self->_avgCCA875pct)
    PBDataWriterWriteSubmessage();
  if (self->_avgCCA100pct)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_lqmOff)
    PBDataWriterWriteSubmessage();
  if (self->_lqmUnknown)
    PBDataWriterWriteSubmessage();
  if (self->_lqmBad)
    PBDataWriterWriteSubmessage();
  if (self->_lqmPoor)
    PBDataWriterWriteSubmessage();
  if (self->_lqmGood)
    PBDataWriterWriteSubmessage();
  if (self->_activityUp)
    PBDataWriterWriteSubmessage();
  if (self->_activityDown)
    PBDataWriterWriteSubmessage();
  if (self->_activityInvoluntarilyDown)
    PBDataWriterWriteSubmessage();
  if (self->_activityScanning)
    PBDataWriterWriteSubmessage();
  if (self->_activityRoaming)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  $D6F352D4FD6CE9CC3730891842732671 has;

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_DWORD *)a3 + 108) |= 4u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_96;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = self->_rxPackets;
  *((_DWORD *)a3 + 108) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_97;
  }
LABEL_96:
  *((_QWORD *)a3 + 9) = self->_txPackets;
  *((_DWORD *)a3 + 108) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_98;
  }
LABEL_97:
  *((_QWORD *)a3 + 10) = self->_txPacketsBe;
  *((_DWORD *)a3 + 108) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_99;
  }
LABEL_98:
  *((_QWORD *)a3 + 11) = self->_txPacketsBk;
  *((_DWORD *)a3 + 108) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_100;
  }
LABEL_99:
  *((_QWORD *)a3 + 12) = self->_txPacketsVi;
  *((_DWORD *)a3 + 108) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_9;
    goto LABEL_101;
  }
LABEL_100:
  *((_QWORD *)a3 + 13) = self->_txPacketsVo;
  *((_DWORD *)a3 + 108) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_102;
  }
LABEL_101:
  *((_QWORD *)a3 + 1) = self->_rxBytes;
  *((_DWORD *)a3 + 108) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_103;
  }
LABEL_102:
  *((_QWORD *)a3 + 4) = self->_txBytes;
  *((_DWORD *)a3 + 108) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_104;
  }
LABEL_103:
  *((_QWORD *)a3 + 5) = self->_txBytesBe;
  *((_DWORD *)a3 + 108) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_105;
  }
LABEL_104:
  *((_QWORD *)a3 + 6) = self->_txBytesBk;
  *((_DWORD *)a3 + 108) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_106;
  }
LABEL_105:
  *((_QWORD *)a3 + 7) = self->_txBytesVi;
  *((_DWORD *)a3 + 108) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_107;
  }
LABEL_106:
  *((_QWORD *)a3 + 8) = self->_txBytesVo;
  *((_DWORD *)a3 + 108) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)a3 + 95) = self->_linkRateMbps;
  *((_DWORD *)a3 + 108) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)a3 + 60) = self->_effectiveLinkRateMpbs;
  *((_DWORD *)a3 + 108) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)a3 + 58) = self->_dataTransferRateMpbs;
  *((_DWORD *)a3 + 108) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_110:
  *((_DWORD *)a3 + 59) = self->_effectiveDataTransferRateMpbs;
  *((_DWORD *)a3 + 108) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_19:
    *((_DWORD *)a3 + 74) = self->_linkLatencyMs;
    *((_DWORD *)a3 + 108) |= 0x20000u;
  }
LABEL_20:
  if (self->_linkLatency0ms)
    objc_msgSend(a3, "setLinkLatency0ms:");
  if (self->_linkLatency64ms)
    objc_msgSend(a3, "setLinkLatency64ms:");
  if (self->_linkLatency128ms)
    objc_msgSend(a3, "setLinkLatency128ms:");
  if (self->_linkLatency256ms)
    objc_msgSend(a3, "setLinkLatency256ms:");
  if (self->_linkLatency512ms)
    objc_msgSend(a3, "setLinkLatency512ms:");
  if (self->_linkLatency1024ms)
    objc_msgSend(a3, "setLinkLatency1024ms:");
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *((_DWORD *)a3 + 94) = self->_linkOpenPct;
    *((_DWORD *)a3 + 108) |= 0x40000u;
  }
  if (self->_linkOpen0pct)
    objc_msgSend(a3, "setLinkOpen0pct:");
  if (self->_linkOpen125pct)
    objc_msgSend(a3, "setLinkOpen125pct:");
  if (self->_linkOpen25pct)
    objc_msgSend(a3, "setLinkOpen25pct:");
  if (self->_linkOpen375pct)
    objc_msgSend(a3, "setLinkOpen375pct:");
  if (self->_linkOpen50pct)
    objc_msgSend(a3, "setLinkOpen50pct:");
  if (self->_linkOpen625pct)
    objc_msgSend(a3, "setLinkOpen625pct:");
  if (self->_linkOpen75pct)
    objc_msgSend(a3, "setLinkOpen75pct:");
  if (self->_linkOpen875pct)
    objc_msgSend(a3, "setLinkOpen875pct:");
  if (self->_linkOpen100pct)
    objc_msgSend(a3, "setLinkOpen100pct:");
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *((_DWORD *)a3 + 38) = self->_avgCCA;
    *((_DWORD *)a3 + 108) |= 0x2000u;
  }
  if (self->_avgCCA0pct)
    objc_msgSend(a3, "setAvgCCA0pct:");
  if (self->_avgCCA125pct)
    objc_msgSend(a3, "setAvgCCA125pct:");
  if (self->_avgCCA25pct)
    objc_msgSend(a3, "setAvgCCA25pct:");
  if (self->_avgCCA375pct)
    objc_msgSend(a3, "setAvgCCA375pct:");
  if (self->_avgCCA50pct)
    objc_msgSend(a3, "setAvgCCA50pct:");
  if (self->_avgCCA625pct)
    objc_msgSend(a3, "setAvgCCA625pct:");
  if (self->_avgCCA75pct)
    objc_msgSend(a3, "setAvgCCA75pct:");
  if (self->_avgCCA875pct)
    objc_msgSend(a3, "setAvgCCA875pct:");
  if (self->_avgCCA100pct)
    objc_msgSend(a3, "setAvgCCA100pct:");
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    *((_DWORD *)a3 + 96) = self->_lqm;
    *((_DWORD *)a3 + 108) |= 0x100000u;
  }
  if (self->_lqmOff)
    objc_msgSend(a3, "setLqmOff:");
  if (self->_lqmUnknown)
    objc_msgSend(a3, "setLqmUnknown:");
  if (self->_lqmBad)
    objc_msgSend(a3, "setLqmBad:");
  if (self->_lqmPoor)
    objc_msgSend(a3, "setLqmPoor:");
  if (self->_lqmGood)
    objc_msgSend(a3, "setLqmGood:");
  if (self->_activityUp)
    objc_msgSend(a3, "setActivityUp:");
  if (self->_activityDown)
    objc_msgSend(a3, "setActivityDown:");
  if (self->_activityInvoluntarilyDown)
    objc_msgSend(a3, "setActivityInvoluntarilyDown:");
  if (self->_activityScanning)
    objc_msgSend(a3, "setActivityScanning:");
  if (self->_activityRoaming)
    objc_msgSend(a3, "setActivityRoaming:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $D6F352D4FD6CE9CC3730891842732671 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_DWORD *)(v5 + 432) |= 4u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_rxPackets;
  *(_DWORD *)(v5 + 432) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  *(_QWORD *)(v5 + 72) = self->_txPackets;
  *(_DWORD *)(v5 + 432) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  *(_QWORD *)(v5 + 80) = self->_txPacketsBe;
  *(_DWORD *)(v5 + 432) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  *(_QWORD *)(v5 + 88) = self->_txPacketsBk;
  *(_DWORD *)(v5 + 432) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  *(_QWORD *)(v5 + 96) = self->_txPacketsVi;
  *(_DWORD *)(v5 + 432) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  *(_QWORD *)(v5 + 104) = self->_txPacketsVo;
  *(_DWORD *)(v5 + 432) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  *(_QWORD *)(v5 + 8) = self->_rxBytes;
  *(_DWORD *)(v5 + 432) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  *(_QWORD *)(v5 + 32) = self->_txBytes;
  *(_DWORD *)(v5 + 432) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  *(_QWORD *)(v5 + 40) = self->_txBytesBe;
  *(_DWORD *)(v5 + 432) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  *(_QWORD *)(v5 + 48) = self->_txBytesBk;
  *(_DWORD *)(v5 + 432) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  *(_QWORD *)(v5 + 56) = self->_txBytesVi;
  *(_DWORD *)(v5 + 432) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  *(_QWORD *)(v5 + 64) = self->_txBytesVo;
  *(_DWORD *)(v5 + 432) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 380) = self->_linkRateMbps;
  *(_DWORD *)(v5 + 432) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 240) = self->_effectiveLinkRateMpbs;
  *(_DWORD *)(v5 + 432) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 232) = self->_dataTransferRateMpbs;
  *(_DWORD *)(v5 + 432) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_43:
  *(_DWORD *)(v5 + 236) = self->_effectiveDataTransferRateMpbs;
  *(_DWORD *)(v5 + 432) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_19:
    *(_DWORD *)(v5 + 296) = self->_linkLatencyMs;
    *(_DWORD *)(v5 + 432) |= 0x20000u;
  }
LABEL_20:

  *(_QWORD *)(v6 + 248) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkLatency0ms, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 288) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkLatency64ms, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 264) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkLatency128ms, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 272) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkLatency256ms, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 280) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkLatency512ms, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 256) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkLatency1024ms, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *(_DWORD *)(v6 + 376) = self->_linkOpenPct;
    *(_DWORD *)(v6 + 432) |= 0x40000u;
  }

  *(_QWORD *)(v6 + 304) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkOpen0pct, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 320) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkOpen125pct, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 328) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkOpen25pct, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 336) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkOpen375pct, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 344) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkOpen50pct, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 352) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkOpen625pct, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 360) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkOpen75pct, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 368) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkOpen875pct, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 312) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_linkOpen100pct, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 152) = self->_avgCCA;
    *(_DWORD *)(v6 + 432) |= 0x2000u;
  }

  *(_QWORD *)(v6 + 160) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_avgCCA0pct, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 176) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_avgCCA125pct, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 184) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_avgCCA25pct, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 192) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_avgCCA375pct, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 200) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_avgCCA50pct, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 208) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_avgCCA625pct, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 216) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_avgCCA75pct, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 224) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_avgCCA875pct, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 168) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_avgCCA100pct, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 384) = self->_lqm;
    *(_DWORD *)(v6 + 432) |= 0x100000u;
  }

  *(_QWORD *)(v6 + 408) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_lqmOff, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 424) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_lqmUnknown, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 392) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_lqmBad, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 416) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_lqmPoor, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 400) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_lqmGood, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 144) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_activityUp, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 112) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_activityDown, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 120) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_activityInvoluntarilyDown, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 136) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_activityScanning, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 128) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_activityRoaming, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $D6F352D4FD6CE9CC3730891842732671 has;
  int v7;
  AWDWiFiMetricsManagerStateMachine *linkLatency0ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency64ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency128ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency256ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency512ms;
  AWDWiFiMetricsManagerStateMachine *linkLatency1024ms;
  int v14;
  AWDWiFiMetricsManagerStateMachine *linkOpen0pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen125pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen25pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen375pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen50pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen625pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen75pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen875pct;
  AWDWiFiMetricsManagerStateMachine *linkOpen100pct;
  int v24;
  AWDWiFiMetricsManagerStateMachine *avgCCA0pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA125pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA25pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA375pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA50pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA625pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA75pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA875pct;
  AWDWiFiMetricsManagerStateMachine *avgCCA100pct;
  int v34;
  AWDWiFiMetricsManagerStateMachine *lqmOff;
  AWDWiFiMetricsManagerStateMachine *lqmUnknown;
  AWDWiFiMetricsManagerStateMachine *lqmBad;
  AWDWiFiMetricsManagerStateMachine *lqmPoor;
  AWDWiFiMetricsManagerStateMachine *lqmGood;
  AWDWiFiMetricsManagerStateMachine *activityUp;
  AWDWiFiMetricsManagerStateMachine *activityDown;
  AWDWiFiMetricsManagerStateMachine *activityInvoluntarilyDown;
  AWDWiFiMetricsManagerStateMachine *activityScanning;
  AWDWiFiMetricsManagerStateMachine *activityRoaming;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 108);
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_175;
    }
    else if ((v7 & 4) != 0)
    {
LABEL_175:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_rxPackets != *((_QWORD *)a3 + 2))
        goto LABEL_175;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_txPackets != *((_QWORD *)a3 + 9))
        goto LABEL_175;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_txPacketsBe != *((_QWORD *)a3 + 10))
        goto LABEL_175;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_txPacketsBk != *((_QWORD *)a3 + 11))
        goto LABEL_175;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_txPacketsVi != *((_QWORD *)a3 + 12))
        goto LABEL_175;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_txPacketsVo != *((_QWORD *)a3 + 13))
        goto LABEL_175;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_rxBytes != *((_QWORD *)a3 + 1))
        goto LABEL_175;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_txBytes != *((_QWORD *)a3 + 4))
        goto LABEL_175;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_txBytesBe != *((_QWORD *)a3 + 5))
        goto LABEL_175;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_txBytesBk != *((_QWORD *)a3 + 6))
        goto LABEL_175;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_txBytesVi != *((_QWORD *)a3 + 7))
        goto LABEL_175;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_txBytesVo != *((_QWORD *)a3 + 8))
        goto LABEL_175;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_linkRateMbps != *((_DWORD *)a3 + 95))
        goto LABEL_175;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_effectiveLinkRateMpbs != *((_DWORD *)a3 + 60))
        goto LABEL_175;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_dataTransferRateMpbs != *((_DWORD *)a3 + 58))
        goto LABEL_175;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_effectiveDataTransferRateMpbs != *((_DWORD *)a3 + 59))
        goto LABEL_175;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_linkLatencyMs != *((_DWORD *)a3 + 74))
        goto LABEL_175;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_175;
    }
    linkLatency0ms = self->_linkLatency0ms;
    if (!((unint64_t)linkLatency0ms | *((_QWORD *)a3 + 31))
      || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency0ms, "isEqual:")) != 0)
    {
      linkLatency64ms = self->_linkLatency64ms;
      if (!((unint64_t)linkLatency64ms | *((_QWORD *)a3 + 36))
        || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency64ms, "isEqual:")) != 0)
      {
        linkLatency128ms = self->_linkLatency128ms;
        if (!((unint64_t)linkLatency128ms | *((_QWORD *)a3 + 33))
          || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency128ms, "isEqual:")) != 0)
        {
          linkLatency256ms = self->_linkLatency256ms;
          if (!((unint64_t)linkLatency256ms | *((_QWORD *)a3 + 34))
            || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency256ms, "isEqual:")) != 0)
          {
            linkLatency512ms = self->_linkLatency512ms;
            if (!((unint64_t)linkLatency512ms | *((_QWORD *)a3 + 35))
              || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency512ms, "isEqual:")) != 0)
            {
              linkLatency1024ms = self->_linkLatency1024ms;
              if (!((unint64_t)linkLatency1024ms | *((_QWORD *)a3 + 32))
                || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency1024ms, "isEqual:")) != 0)
              {
                v14 = *((_DWORD *)a3 + 108);
                if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
                {
                  if ((v14 & 0x40000) == 0 || self->_linkOpenPct != *((_DWORD *)a3 + 94))
                    goto LABEL_175;
                }
                else if ((v14 & 0x40000) != 0)
                {
                  goto LABEL_175;
                }
                linkOpen0pct = self->_linkOpen0pct;
                if (!((unint64_t)linkOpen0pct | *((_QWORD *)a3 + 38))
                  || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen0pct, "isEqual:")) != 0)
                {
                  linkOpen125pct = self->_linkOpen125pct;
                  if (!((unint64_t)linkOpen125pct | *((_QWORD *)a3 + 40))
                    || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen125pct, "isEqual:")) != 0)
                  {
                    linkOpen25pct = self->_linkOpen25pct;
                    if (!((unint64_t)linkOpen25pct | *((_QWORD *)a3 + 41))
                      || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen25pct, "isEqual:")) != 0)
                    {
                      linkOpen375pct = self->_linkOpen375pct;
                      if (!((unint64_t)linkOpen375pct | *((_QWORD *)a3 + 42))
                        || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen375pct, "isEqual:")) != 0)
                      {
                        linkOpen50pct = self->_linkOpen50pct;
                        if (!((unint64_t)linkOpen50pct | *((_QWORD *)a3 + 43))
                          || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen50pct, "isEqual:")) != 0)
                        {
                          linkOpen625pct = self->_linkOpen625pct;
                          if (!((unint64_t)linkOpen625pct | *((_QWORD *)a3 + 44))
                            || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen625pct, "isEqual:")) != 0)
                          {
                            linkOpen75pct = self->_linkOpen75pct;
                            if (!((unint64_t)linkOpen75pct | *((_QWORD *)a3 + 45))
                              || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen75pct, "isEqual:")) != 0)
                            {
                              linkOpen875pct = self->_linkOpen875pct;
                              if (!((unint64_t)linkOpen875pct | *((_QWORD *)a3 + 46))
                                || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen875pct, "isEqual:")) != 0)
                              {
                                linkOpen100pct = self->_linkOpen100pct;
                                if (!((unint64_t)linkOpen100pct | *((_QWORD *)a3 + 39))
                                  || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen100pct, "isEqual:")) != 0)
                                {
                                  v24 = *((_DWORD *)a3 + 108);
                                  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
                                  {
                                    if ((v24 & 0x2000) == 0 || self->_avgCCA != *((_DWORD *)a3 + 38))
                                      goto LABEL_175;
                                  }
                                  else if ((v24 & 0x2000) != 0)
                                  {
                                    goto LABEL_175;
                                  }
                                  avgCCA0pct = self->_avgCCA0pct;
                                  if (!((unint64_t)avgCCA0pct | *((_QWORD *)a3 + 20))
                                    || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA0pct, "isEqual:")) != 0)
                                  {
                                    avgCCA125pct = self->_avgCCA125pct;
                                    if (!((unint64_t)avgCCA125pct | *((_QWORD *)a3 + 22))
                                      || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA125pct, "isEqual:")) != 0)
                                    {
                                      avgCCA25pct = self->_avgCCA25pct;
                                      if (!((unint64_t)avgCCA25pct | *((_QWORD *)a3 + 23))
                                        || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA25pct, "isEqual:")) != 0)
                                      {
                                        avgCCA375pct = self->_avgCCA375pct;
                                        if (!((unint64_t)avgCCA375pct | *((_QWORD *)a3 + 24))
                                          || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA375pct, "isEqual:")) != 0)
                                        {
                                          avgCCA50pct = self->_avgCCA50pct;
                                          if (!((unint64_t)avgCCA50pct | *((_QWORD *)a3 + 25))
                                            || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA50pct, "isEqual:")) != 0)
                                          {
                                            avgCCA625pct = self->_avgCCA625pct;
                                            if (!((unint64_t)avgCCA625pct | *((_QWORD *)a3 + 26))
                                              || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA625pct, "isEqual:")) != 0)
                                            {
                                              avgCCA75pct = self->_avgCCA75pct;
                                              if (!((unint64_t)avgCCA75pct | *((_QWORD *)a3 + 27))
                                                || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA75pct, "isEqual:")) != 0)
                                              {
                                                avgCCA875pct = self->_avgCCA875pct;
                                                if (!((unint64_t)avgCCA875pct | *((_QWORD *)a3 + 28))
                                                  || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA875pct, "isEqual:")) != 0)
                                                {
                                                  avgCCA100pct = self->_avgCCA100pct;
                                                  if (!((unint64_t)avgCCA100pct | *((_QWORD *)a3 + 21))
                                                    || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA100pct, "isEqual:")) != 0)
                                                  {
                                                    v34 = *((_DWORD *)a3 + 108);
                                                    if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
                                                    {
                                                      if ((v34 & 0x100000) == 0 || self->_lqm != *((_DWORD *)a3 + 96))
                                                        goto LABEL_175;
                                                    }
                                                    else if ((v34 & 0x100000) != 0)
                                                    {
                                                      goto LABEL_175;
                                                    }
                                                    lqmOff = self->_lqmOff;
                                                    if (!((unint64_t)lqmOff | *((_QWORD *)a3 + 51))
                                                      || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmOff, "isEqual:")) != 0)
                                                    {
                                                      lqmUnknown = self->_lqmUnknown;
                                                      if (!((unint64_t)lqmUnknown | *((_QWORD *)a3 + 53))
                                                        || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmUnknown, "isEqual:")) != 0)
                                                      {
                                                        lqmBad = self->_lqmBad;
                                                        if (!((unint64_t)lqmBad | *((_QWORD *)a3 + 49))
                                                          || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmBad, "isEqual:")) != 0)
                                                        {
                                                          lqmPoor = self->_lqmPoor;
                                                          if (!((unint64_t)lqmPoor | *((_QWORD *)a3 + 52))
                                                            || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmPoor, "isEqual:")) != 0)
                                                          {
                                                            lqmGood = self->_lqmGood;
                                                            if (!((unint64_t)lqmGood | *((_QWORD *)a3 + 50))
                                                              || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmGood, "isEqual:")) != 0)
                                                            {
                                                              activityUp = self->_activityUp;
                                                              if (!((unint64_t)activityUp | *((_QWORD *)a3 + 18))
                                                                || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityUp, "isEqual:")) != 0)
                                                              {
                                                                activityDown = self->_activityDown;
                                                                if (!((unint64_t)activityDown | *((_QWORD *)a3 + 14))
                                                                  || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityDown, "isEqual:")) != 0)
                                                                {
                                                                  activityInvoluntarilyDown = self->_activityInvoluntarilyDown;
                                                                  if (!((unint64_t)activityInvoluntarilyDown | *((_QWORD *)a3 + 15))
                                                                    || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityInvoluntarilyDown, "isEqual:")) != 0)
                                                                  {
                                                                    activityScanning = self->_activityScanning;
                                                                    if (!((unint64_t)activityScanning | *((_QWORD *)a3 + 17))
                                                                      || (v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityScanning, "isEqual:")) != 0)
                                                                    {
                                                                      activityRoaming = self->_activityRoaming;
                                                                      if ((unint64_t)activityRoaming | *((_QWORD *)a3 + 16))
                                                                        LOBYTE(v5) = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityRoaming, "isEqual:");
                                                                      else
                                                                        LOBYTE(v5) = 1;
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $D6F352D4FD6CE9CC3730891842732671 has;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    v59 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v58 = 2654435761u * self->_rxPackets;
      if ((*(_WORD *)&has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else
  {
    v59 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v58 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_4:
    v57 = 2654435761u * self->_txPackets;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  v57 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_5:
    v56 = 2654435761u * self->_txPacketsBe;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  v56 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    v55 = 2654435761u * self->_txPacketsBk;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v55 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_7:
    v54 = 2654435761u * self->_txPacketsVi;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v54 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_8:
    v53 = 2654435761u * self->_txPacketsVo;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v53 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_9:
    v52 = 2654435761u * self->_rxBytes;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v52 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_10:
    v51 = 2654435761u * self->_txBytes;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v51 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_11:
    v50 = 2654435761u * self->_txBytesBe;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v50 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_12:
    v49 = 2654435761u * self->_txBytesBk;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v49 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_13:
    v48 = 2654435761u * self->_txBytesVi;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v48 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_14:
    v47 = 2654435761u * self->_txBytesVo;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  v47 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_15:
    v46 = 2654435761 * self->_linkRateMbps;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  v46 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_16:
    v45 = 2654435761 * self->_effectiveLinkRateMpbs;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  v45 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_17:
    v44 = 2654435761 * self->_dataTransferRateMpbs;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_18;
LABEL_36:
    v43 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_35:
  v44 = 0;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_36;
LABEL_18:
  v43 = 2654435761 * self->_effectiveDataTransferRateMpbs;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    v42 = 2654435761 * self->_linkLatencyMs;
    goto LABEL_38;
  }
LABEL_37:
  v42 = 0;
LABEL_38:
  v41 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkLatency0ms, "hash");
  v40 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkLatency64ms, "hash");
  v39 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkLatency128ms, "hash");
  v38 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkLatency256ms, "hash");
  v37 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkLatency512ms, "hash");
  v36 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkLatency1024ms, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    v35 = 2654435761 * self->_linkOpenPct;
  else
    v35 = 0;
  v34 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkOpen0pct, "hash");
  v33 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkOpen125pct, "hash");
  v32 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkOpen25pct, "hash");
  v31 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkOpen375pct, "hash");
  v30 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkOpen50pct, "hash");
  v29 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkOpen625pct, "hash");
  v28 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkOpen75pct, "hash");
  v27 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkOpen875pct, "hash");
  v25 = -[AWDWiFiMetricsManagerStateMachine hash](self->_linkOpen100pct, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    v4 = 2654435761 * self->_avgCCA;
  else
    v4 = 0;
  v5 = -[AWDWiFiMetricsManagerStateMachine hash](self->_avgCCA0pct, "hash", v25);
  v6 = -[AWDWiFiMetricsManagerStateMachine hash](self->_avgCCA125pct, "hash");
  v7 = -[AWDWiFiMetricsManagerStateMachine hash](self->_avgCCA25pct, "hash");
  v8 = -[AWDWiFiMetricsManagerStateMachine hash](self->_avgCCA375pct, "hash");
  v9 = -[AWDWiFiMetricsManagerStateMachine hash](self->_avgCCA50pct, "hash");
  v10 = -[AWDWiFiMetricsManagerStateMachine hash](self->_avgCCA625pct, "hash");
  v11 = -[AWDWiFiMetricsManagerStateMachine hash](self->_avgCCA75pct, "hash");
  v12 = -[AWDWiFiMetricsManagerStateMachine hash](self->_avgCCA875pct, "hash");
  v13 = -[AWDWiFiMetricsManagerStateMachine hash](self->_avgCCA100pct, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    v14 = 2654435761 * self->_lqm;
  else
    v14 = 0;
  v15 = v58 ^ v59 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[AWDWiFiMetricsManagerStateMachine hash](self->_lqmOff, "hash");
  v16 = -[AWDWiFiMetricsManagerStateMachine hash](self->_lqmUnknown, "hash");
  v17 = v16 ^ -[AWDWiFiMetricsManagerStateMachine hash](self->_lqmBad, "hash");
  v18 = v17 ^ -[AWDWiFiMetricsManagerStateMachine hash](self->_lqmPoor, "hash");
  v19 = v18 ^ -[AWDWiFiMetricsManagerStateMachine hash](self->_lqmGood, "hash");
  v20 = v19 ^ -[AWDWiFiMetricsManagerStateMachine hash](self->_activityUp, "hash");
  v21 = v20 ^ -[AWDWiFiMetricsManagerStateMachine hash](self->_activityDown, "hash");
  v22 = v21 ^ -[AWDWiFiMetricsManagerStateMachine hash](self->_activityInvoluntarilyDown, "hash");
  v23 = v15 ^ v22 ^ -[AWDWiFiMetricsManagerStateMachine hash](self->_activityScanning, "hash");
  return v23 ^ -[AWDWiFiMetricsManagerStateMachine hash](self->_activityRoaming, "hash");
}

- (void)mergeFrom:(id)a3
{
  int v5;
  AWDWiFiMetricsManagerStateMachine *linkLatency0ms;
  uint64_t v7;
  AWDWiFiMetricsManagerStateMachine *linkLatency64ms;
  uint64_t v9;
  AWDWiFiMetricsManagerStateMachine *linkLatency128ms;
  uint64_t v11;
  AWDWiFiMetricsManagerStateMachine *linkLatency256ms;
  uint64_t v13;
  AWDWiFiMetricsManagerStateMachine *linkLatency512ms;
  uint64_t v15;
  AWDWiFiMetricsManagerStateMachine *linkLatency1024ms;
  uint64_t v17;
  AWDWiFiMetricsManagerStateMachine *linkOpen0pct;
  uint64_t v19;
  AWDWiFiMetricsManagerStateMachine *linkOpen125pct;
  uint64_t v21;
  AWDWiFiMetricsManagerStateMachine *linkOpen25pct;
  uint64_t v23;
  AWDWiFiMetricsManagerStateMachine *linkOpen375pct;
  uint64_t v25;
  AWDWiFiMetricsManagerStateMachine *linkOpen50pct;
  uint64_t v27;
  AWDWiFiMetricsManagerStateMachine *linkOpen625pct;
  uint64_t v29;
  AWDWiFiMetricsManagerStateMachine *linkOpen75pct;
  uint64_t v31;
  AWDWiFiMetricsManagerStateMachine *linkOpen875pct;
  uint64_t v33;
  AWDWiFiMetricsManagerStateMachine *linkOpen100pct;
  uint64_t v35;
  AWDWiFiMetricsManagerStateMachine *avgCCA0pct;
  uint64_t v37;
  AWDWiFiMetricsManagerStateMachine *avgCCA125pct;
  uint64_t v39;
  AWDWiFiMetricsManagerStateMachine *avgCCA25pct;
  uint64_t v41;
  AWDWiFiMetricsManagerStateMachine *avgCCA375pct;
  uint64_t v43;
  AWDWiFiMetricsManagerStateMachine *avgCCA50pct;
  uint64_t v45;
  AWDWiFiMetricsManagerStateMachine *avgCCA625pct;
  uint64_t v47;
  AWDWiFiMetricsManagerStateMachine *avgCCA75pct;
  uint64_t v49;
  AWDWiFiMetricsManagerStateMachine *avgCCA875pct;
  uint64_t v51;
  AWDWiFiMetricsManagerStateMachine *avgCCA100pct;
  uint64_t v53;
  AWDWiFiMetricsManagerStateMachine *lqmOff;
  uint64_t v55;
  AWDWiFiMetricsManagerStateMachine *lqmUnknown;
  uint64_t v57;
  AWDWiFiMetricsManagerStateMachine *lqmBad;
  uint64_t v59;
  AWDWiFiMetricsManagerStateMachine *lqmPoor;
  uint64_t v61;
  AWDWiFiMetricsManagerStateMachine *lqmGood;
  uint64_t v63;
  AWDWiFiMetricsManagerStateMachine *activityUp;
  uint64_t v65;
  AWDWiFiMetricsManagerStateMachine *activityDown;
  uint64_t v67;
  AWDWiFiMetricsManagerStateMachine *activityInvoluntarilyDown;
  uint64_t v69;
  AWDWiFiMetricsManagerStateMachine *activityScanning;
  uint64_t v71;
  AWDWiFiMetricsManagerStateMachine *activityRoaming;
  uint64_t v73;

  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
    v5 = *((_DWORD *)a3 + 108);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_rxPackets = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  self->_txPackets = *((_QWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  self->_txPacketsBe = *((_QWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  self->_txPacketsBk = *((_QWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  self->_txPacketsVi = *((_QWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x1000) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  self->_txPacketsVo = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  self->_rxBytes = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  self->_txBytes = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  self->_txBytesBe = *((_QWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  self->_txBytesBk = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  self->_txBytesVi = *((_QWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  self->_txBytesVo = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x80000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  self->_linkRateMbps = *((_DWORD *)a3 + 95);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x10000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  self->_effectiveLinkRateMpbs = *((_DWORD *)a3 + 60);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((v5 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  self->_dataTransferRateMpbs = *((_DWORD *)a3 + 58);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x8000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_39:
  self->_effectiveDataTransferRateMpbs = *((_DWORD *)a3 + 59);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)a3 + 108) & 0x20000) != 0)
  {
LABEL_19:
    self->_linkLatencyMs = *((_DWORD *)a3 + 74);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_20:
  linkLatency0ms = self->_linkLatency0ms;
  v7 = *((_QWORD *)a3 + 31);
  if (linkLatency0ms)
  {
    if (v7)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency0ms, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency0ms:](self, "setLinkLatency0ms:");
  }
  linkLatency64ms = self->_linkLatency64ms;
  v9 = *((_QWORD *)a3 + 36);
  if (linkLatency64ms)
  {
    if (v9)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency64ms, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency64ms:](self, "setLinkLatency64ms:");
  }
  linkLatency128ms = self->_linkLatency128ms;
  v11 = *((_QWORD *)a3 + 33);
  if (linkLatency128ms)
  {
    if (v11)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency128ms, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency128ms:](self, "setLinkLatency128ms:");
  }
  linkLatency256ms = self->_linkLatency256ms;
  v13 = *((_QWORD *)a3 + 34);
  if (linkLatency256ms)
  {
    if (v13)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency256ms, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency256ms:](self, "setLinkLatency256ms:");
  }
  linkLatency512ms = self->_linkLatency512ms;
  v15 = *((_QWORD *)a3 + 35);
  if (linkLatency512ms)
  {
    if (v15)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency512ms, "mergeFrom:");
  }
  else if (v15)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency512ms:](self, "setLinkLatency512ms:");
  }
  linkLatency1024ms = self->_linkLatency1024ms;
  v17 = *((_QWORD *)a3 + 32);
  if (linkLatency1024ms)
  {
    if (v17)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency1024ms, "mergeFrom:");
  }
  else if (v17)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency1024ms:](self, "setLinkLatency1024ms:");
  }
  if ((*((_BYTE *)a3 + 434) & 4) != 0)
  {
    self->_linkOpenPct = *((_DWORD *)a3 + 94);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  linkOpen0pct = self->_linkOpen0pct;
  v19 = *((_QWORD *)a3 + 38);
  if (linkOpen0pct)
  {
    if (v19)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen0pct, "mergeFrom:");
  }
  else if (v19)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen0pct:](self, "setLinkOpen0pct:");
  }
  linkOpen125pct = self->_linkOpen125pct;
  v21 = *((_QWORD *)a3 + 40);
  if (linkOpen125pct)
  {
    if (v21)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen125pct, "mergeFrom:");
  }
  else if (v21)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen125pct:](self, "setLinkOpen125pct:");
  }
  linkOpen25pct = self->_linkOpen25pct;
  v23 = *((_QWORD *)a3 + 41);
  if (linkOpen25pct)
  {
    if (v23)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen25pct, "mergeFrom:");
  }
  else if (v23)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen25pct:](self, "setLinkOpen25pct:");
  }
  linkOpen375pct = self->_linkOpen375pct;
  v25 = *((_QWORD *)a3 + 42);
  if (linkOpen375pct)
  {
    if (v25)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen375pct, "mergeFrom:");
  }
  else if (v25)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen375pct:](self, "setLinkOpen375pct:");
  }
  linkOpen50pct = self->_linkOpen50pct;
  v27 = *((_QWORD *)a3 + 43);
  if (linkOpen50pct)
  {
    if (v27)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen50pct, "mergeFrom:");
  }
  else if (v27)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen50pct:](self, "setLinkOpen50pct:");
  }
  linkOpen625pct = self->_linkOpen625pct;
  v29 = *((_QWORD *)a3 + 44);
  if (linkOpen625pct)
  {
    if (v29)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen625pct, "mergeFrom:");
  }
  else if (v29)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen625pct:](self, "setLinkOpen625pct:");
  }
  linkOpen75pct = self->_linkOpen75pct;
  v31 = *((_QWORD *)a3 + 45);
  if (linkOpen75pct)
  {
    if (v31)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen75pct, "mergeFrom:");
  }
  else if (v31)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen75pct:](self, "setLinkOpen75pct:");
  }
  linkOpen875pct = self->_linkOpen875pct;
  v33 = *((_QWORD *)a3 + 46);
  if (linkOpen875pct)
  {
    if (v33)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen875pct, "mergeFrom:");
  }
  else if (v33)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen875pct:](self, "setLinkOpen875pct:");
  }
  linkOpen100pct = self->_linkOpen100pct;
  v35 = *((_QWORD *)a3 + 39);
  if (linkOpen100pct)
  {
    if (v35)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen100pct, "mergeFrom:");
  }
  else if (v35)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen100pct:](self, "setLinkOpen100pct:");
  }
  if ((*((_BYTE *)a3 + 433) & 0x20) != 0)
  {
    self->_avgCCA = *((_DWORD *)a3 + 38);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  avgCCA0pct = self->_avgCCA0pct;
  v37 = *((_QWORD *)a3 + 20);
  if (avgCCA0pct)
  {
    if (v37)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA0pct, "mergeFrom:");
  }
  else if (v37)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA0pct:](self, "setAvgCCA0pct:");
  }
  avgCCA125pct = self->_avgCCA125pct;
  v39 = *((_QWORD *)a3 + 22);
  if (avgCCA125pct)
  {
    if (v39)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA125pct, "mergeFrom:");
  }
  else if (v39)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA125pct:](self, "setAvgCCA125pct:");
  }
  avgCCA25pct = self->_avgCCA25pct;
  v41 = *((_QWORD *)a3 + 23);
  if (avgCCA25pct)
  {
    if (v41)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA25pct, "mergeFrom:");
  }
  else if (v41)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA25pct:](self, "setAvgCCA25pct:");
  }
  avgCCA375pct = self->_avgCCA375pct;
  v43 = *((_QWORD *)a3 + 24);
  if (avgCCA375pct)
  {
    if (v43)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA375pct, "mergeFrom:");
  }
  else if (v43)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA375pct:](self, "setAvgCCA375pct:");
  }
  avgCCA50pct = self->_avgCCA50pct;
  v45 = *((_QWORD *)a3 + 25);
  if (avgCCA50pct)
  {
    if (v45)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA50pct, "mergeFrom:");
  }
  else if (v45)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA50pct:](self, "setAvgCCA50pct:");
  }
  avgCCA625pct = self->_avgCCA625pct;
  v47 = *((_QWORD *)a3 + 26);
  if (avgCCA625pct)
  {
    if (v47)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA625pct, "mergeFrom:");
  }
  else if (v47)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA625pct:](self, "setAvgCCA625pct:");
  }
  avgCCA75pct = self->_avgCCA75pct;
  v49 = *((_QWORD *)a3 + 27);
  if (avgCCA75pct)
  {
    if (v49)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA75pct, "mergeFrom:");
  }
  else if (v49)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA75pct:](self, "setAvgCCA75pct:");
  }
  avgCCA875pct = self->_avgCCA875pct;
  v51 = *((_QWORD *)a3 + 28);
  if (avgCCA875pct)
  {
    if (v51)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA875pct, "mergeFrom:");
  }
  else if (v51)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA875pct:](self, "setAvgCCA875pct:");
  }
  avgCCA100pct = self->_avgCCA100pct;
  v53 = *((_QWORD *)a3 + 21);
  if (avgCCA100pct)
  {
    if (v53)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA100pct, "mergeFrom:");
  }
  else if (v53)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA100pct:](self, "setAvgCCA100pct:");
  }
  if ((*((_BYTE *)a3 + 434) & 0x10) != 0)
  {
    self->_lqm = *((_DWORD *)a3 + 96);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
  lqmOff = self->_lqmOff;
  v55 = *((_QWORD *)a3 + 51);
  if (lqmOff)
  {
    if (v55)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmOff, "mergeFrom:");
  }
  else if (v55)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmOff:](self, "setLqmOff:");
  }
  lqmUnknown = self->_lqmUnknown;
  v57 = *((_QWORD *)a3 + 53);
  if (lqmUnknown)
  {
    if (v57)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmUnknown, "mergeFrom:");
  }
  else if (v57)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmUnknown:](self, "setLqmUnknown:");
  }
  lqmBad = self->_lqmBad;
  v59 = *((_QWORD *)a3 + 49);
  if (lqmBad)
  {
    if (v59)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmBad, "mergeFrom:");
  }
  else if (v59)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmBad:](self, "setLqmBad:");
  }
  lqmPoor = self->_lqmPoor;
  v61 = *((_QWORD *)a3 + 52);
  if (lqmPoor)
  {
    if (v61)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmPoor, "mergeFrom:");
  }
  else if (v61)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmPoor:](self, "setLqmPoor:");
  }
  lqmGood = self->_lqmGood;
  v63 = *((_QWORD *)a3 + 50);
  if (lqmGood)
  {
    if (v63)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmGood, "mergeFrom:");
  }
  else if (v63)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmGood:](self, "setLqmGood:");
  }
  activityUp = self->_activityUp;
  v65 = *((_QWORD *)a3 + 18);
  if (activityUp)
  {
    if (v65)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityUp, "mergeFrom:");
  }
  else if (v65)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityUp:](self, "setActivityUp:");
  }
  activityDown = self->_activityDown;
  v67 = *((_QWORD *)a3 + 14);
  if (activityDown)
  {
    if (v67)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityDown, "mergeFrom:");
  }
  else if (v67)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityDown:](self, "setActivityDown:");
  }
  activityInvoluntarilyDown = self->_activityInvoluntarilyDown;
  v69 = *((_QWORD *)a3 + 15);
  if (activityInvoluntarilyDown)
  {
    if (v69)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityInvoluntarilyDown, "mergeFrom:");
  }
  else if (v69)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityInvoluntarilyDown:](self, "setActivityInvoluntarilyDown:");
  }
  activityScanning = self->_activityScanning;
  v71 = *((_QWORD *)a3 + 17);
  if (activityScanning)
  {
    if (v71)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityScanning, "mergeFrom:");
  }
  else if (v71)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityScanning:](self, "setActivityScanning:");
  }
  activityRoaming = self->_activityRoaming;
  v73 = *((_QWORD *)a3 + 16);
  if (activityRoaming)
  {
    if (v73)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityRoaming, "mergeFrom:");
  }
  else if (v73)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityRoaming:](self, "setActivityRoaming:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)rxPackets
{
  return self->_rxPackets;
}

- (unint64_t)txPackets
{
  return self->_txPackets;
}

- (unint64_t)txPacketsBe
{
  return self->_txPacketsBe;
}

- (unint64_t)txPacketsBk
{
  return self->_txPacketsBk;
}

- (unint64_t)txPacketsVi
{
  return self->_txPacketsVi;
}

- (unint64_t)txPacketsVo
{
  return self->_txPacketsVo;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)txBytesBe
{
  return self->_txBytesBe;
}

- (unint64_t)txBytesBk
{
  return self->_txBytesBk;
}

- (unint64_t)txBytesVi
{
  return self->_txBytesVi;
}

- (unint64_t)txBytesVo
{
  return self->_txBytesVo;
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

- (unsigned)linkLatencyMs
{
  return self->_linkLatencyMs;
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency0ms
{
  return self->_linkLatency0ms;
}

- (void)setLinkLatency0ms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency64ms
{
  return self->_linkLatency64ms;
}

- (void)setLinkLatency64ms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency128ms
{
  return self->_linkLatency128ms;
}

- (void)setLinkLatency128ms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency256ms
{
  return self->_linkLatency256ms;
}

- (void)setLinkLatency256ms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency512ms
{
  return self->_linkLatency512ms;
}

- (void)setLinkLatency512ms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency1024ms
{
  return self->_linkLatency1024ms;
}

- (void)setLinkLatency1024ms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (unsigned)linkOpenPct
{
  return self->_linkOpenPct;
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen0pct
{
  return self->_linkOpen0pct;
}

- (void)setLinkOpen0pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen125pct
{
  return self->_linkOpen125pct;
}

- (void)setLinkOpen125pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen25pct
{
  return self->_linkOpen25pct;
}

- (void)setLinkOpen25pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen375pct
{
  return self->_linkOpen375pct;
}

- (void)setLinkOpen375pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen50pct
{
  return self->_linkOpen50pct;
}

- (void)setLinkOpen50pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen625pct
{
  return self->_linkOpen625pct;
}

- (void)setLinkOpen625pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen75pct
{
  return self->_linkOpen75pct;
}

- (void)setLinkOpen75pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen875pct
{
  return self->_linkOpen875pct;
}

- (void)setLinkOpen875pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen100pct
{
  return self->_linkOpen100pct;
}

- (void)setLinkOpen100pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (unsigned)avgCCA
{
  return self->_avgCCA;
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA0pct
{
  return self->_avgCCA0pct;
}

- (void)setAvgCCA0pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA125pct
{
  return self->_avgCCA125pct;
}

- (void)setAvgCCA125pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA25pct
{
  return self->_avgCCA25pct;
}

- (void)setAvgCCA25pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA375pct
{
  return self->_avgCCA375pct;
}

- (void)setAvgCCA375pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA50pct
{
  return self->_avgCCA50pct;
}

- (void)setAvgCCA50pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA625pct
{
  return self->_avgCCA625pct;
}

- (void)setAvgCCA625pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA75pct
{
  return self->_avgCCA75pct;
}

- (void)setAvgCCA75pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA875pct
{
  return self->_avgCCA875pct;
}

- (void)setAvgCCA875pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA100pct
{
  return self->_avgCCA100pct;
}

- (void)setAvgCCA100pct:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (unsigned)lqm
{
  return self->_lqm;
}

- (AWDWiFiMetricsManagerStateMachine)lqmOff
{
  return self->_lqmOff;
}

- (void)setLqmOff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (AWDWiFiMetricsManagerStateMachine)lqmUnknown
{
  return self->_lqmUnknown;
}

- (void)setLqmUnknown:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (AWDWiFiMetricsManagerStateMachine)lqmBad
{
  return self->_lqmBad;
}

- (void)setLqmBad:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (AWDWiFiMetricsManagerStateMachine)lqmPoor
{
  return self->_lqmPoor;
}

- (void)setLqmPoor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (AWDWiFiMetricsManagerStateMachine)lqmGood
{
  return self->_lqmGood;
}

- (void)setLqmGood:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (AWDWiFiMetricsManagerStateMachine)activityUp
{
  return self->_activityUp;
}

- (void)setActivityUp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (AWDWiFiMetricsManagerStateMachine)activityDown
{
  return self->_activityDown;
}

- (void)setActivityDown:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (AWDWiFiMetricsManagerStateMachine)activityInvoluntarilyDown
{
  return self->_activityInvoluntarilyDown;
}

- (void)setActivityInvoluntarilyDown:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (AWDWiFiMetricsManagerStateMachine)activityScanning
{
  return self->_activityScanning;
}

- (void)setActivityScanning:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (AWDWiFiMetricsManagerStateMachine)activityRoaming
{
  return self->_activityRoaming;
}

- (void)setActivityRoaming:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
