@implementation AWDWiFiMetricsManagerBTCoexStats

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerBTCoexStats setAntennaOwnership2BT:](self, "setAntennaOwnership2BT:", 0);
  -[AWDWiFiMetricsManagerBTCoexStats setAntennaOwnership2WLAN:](self, "setAntennaOwnership2WLAN:", 0);
  -[AWDWiFiMetricsManagerBTCoexStats setEnbledStateOn:](self, "setEnbledStateOn:", 0);
  -[AWDWiFiMetricsManagerBTCoexStats setEnbledStateOff:](self, "setEnbledStateOff:", 0);
  -[AWDWiFiMetricsManagerBTCoexStats setHybridStateOn:](self, "setHybridStateOn:", 0);
  -[AWDWiFiMetricsManagerBTCoexStats setHybridStateOff:](self, "setHybridStateOff:", 0);
  -[AWDWiFiMetricsManagerBTCoexStats setTdmStateOn:](self, "setTdmStateOn:", 0);
  -[AWDWiFiMetricsManagerBTCoexStats setTdmStateOff:](self, "setTdmStateOff:", 0);
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBTCoexStats;
  -[AWDWiFiMetricsManagerBTCoexStats dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setAntennaRequests:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_antennaRequests = a3;
}

- (void)setHasAntennaRequests:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAntennaRequests
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAntennaGrants:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_antennaGrants = a3;
}

- (void)setHasAntennaGrants:(BOOL)a3
{
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAntennaGrants
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setWlanPreempted:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_wlanPreempted = a3;
}

- (void)setHasWlanPreempted:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasWlanPreempted
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setPsnullExceeded:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_psnullExceeded = a3;
}

- (void)setHasPsnullExceeded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPsnullExceeded
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHighUcodeLatency:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_highUcodeLatency = a3;
}

- (void)setHasHighUcodeLatency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHighUcodeLatency
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasAntennaOwnership2BT
{
  return self->_antennaOwnership2BT != 0;
}

- (BOOL)hasAntennaOwnership2WLAN
{
  return self->_antennaOwnership2WLAN != 0;
}

- (BOOL)hasEnbledStateOn
{
  return self->_enbledStateOn != 0;
}

- (BOOL)hasEnbledStateOff
{
  return self->_enbledStateOff != 0;
}

- (BOOL)hasHybridStateOn
{
  return self->_hybridStateOn != 0;
}

- (BOOL)hasHybridStateOff
{
  return self->_hybridStateOff != 0;
}

- (BOOL)hasTdmStateOn
{
  return self->_tdmStateOn != 0;
}

- (BOOL)hasTdmStateOff
{
  return self->_tdmStateOff != 0;
}

- (void)setRequestsACL:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_requestsACL = a3;
}

- (void)setHasRequestsACL:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRequestsACL
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRequestsSCO:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_requestsSCO = a3;
}

- (void)setHasRequestsSCO:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRequestsSCO
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setRequestseSCO:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_requestseSCO = a3;
}

- (void)setHasRequestseSCO:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRequestseSCO
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setRequestsA2DP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_requestsA2DP = a3;
}

- (void)setHasRequestsA2DP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRequestsA2DP
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setRequestsSniff:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_requestsSniff = a3;
}

- (void)setHasRequestsSniff:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRequestsSniff
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRequestsPageScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_requestsPageScan = a3;
}

- (void)setHasRequestsPageScan:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasRequestsPageScan
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRequestsInquiryScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_requestsInquiryScan = a3;
}

- (void)setHasRequestsInquiryScan:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRequestsInquiryScan
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRequestsPage:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_requestsPage = a3;
}

- (void)setHasRequestsPage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRequestsPage
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRequestsInquiry:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_requestsInquiry = a3;
}

- (void)setHasRequestsInquiry:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRequestsInquiry
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRequestsBLE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_requestsBLE = a3;
}

- (void)setHasRequestsBLE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRequestsBLE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRequestsOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_requestsOther = a3;
}

- (void)setHasRequestsOther:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRequestsOther
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setRequestsBLEScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_requestsBLEScan = a3;
}

- (void)setHasRequestsBLEScan:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRequestsBLEScan
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRequestsMSS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_requestsMSS = a3;
}

- (void)setHasRequestsMSS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRequestsMSS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRequestsPARK:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_requestsPARK = a3;
}

- (void)setHasRequestsPARK:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRequestsPARK
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setBeaconLostCnt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_beaconLostCnt = a3;
}

- (void)setHasBeaconLostCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBeaconLostCnt
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)rxMPDUCountPerMCSsCount
{
  return self->_rxMPDUCountPerMCSs.count;
}

- (unint64_t)rxMPDUCountPerMCSs
{
  return self->_rxMPDUCountPerMCSs.list;
}

- (void)clearRxMPDUCountPerMCSs
{
  PBRepeatedUInt64Clear();
}

- (void)addRxMPDUCountPerMCS:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)rxMPDUCountPerMCSAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_rxMPDUCountPerMCSs;
  unint64_t count;

  p_rxMPDUCountPerMCSs = &self->_rxMPDUCountPerMCSs;
  count = self->_rxMPDUCountPerMCSs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_rxMPDUCountPerMCSs->list[a3];
}

- (void)setRxMPDUCountPerMCSs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)txMPDUCountPerMCSsCount
{
  return self->_txMPDUCountPerMCSs.count;
}

- (unint64_t)txMPDUCountPerMCSs
{
  return self->_txMPDUCountPerMCSs.list;
}

- (void)clearTxMPDUCountPerMCSs
{
  PBRepeatedUInt64Clear();
}

- (void)addTxMPDUCountPerMCS:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)txMPDUCountPerMCSAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_txMPDUCountPerMCSs;
  unint64_t count;

  p_txMPDUCountPerMCSs = &self->_txMPDUCountPerMCSs;
  count = self->_txMPDUCountPerMCSs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txMPDUCountPerMCSs->list[a3];
}

- (void)setTxMPDUCountPerMCSs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (void)setTimeTillResumeAccumulatedMsec:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_timeTillResumeAccumulatedMsec = a3;
}

- (void)setHasTimeTillResumeAccumulatedMsec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTimeTillResumeAccumulatedMsec
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setResumeTimeAccumulatedMsec:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_resumeTimeAccumulatedMsec = a3;
}

- (void)setHasResumeTimeAccumulatedMsec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasResumeTimeAccumulatedMsec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setEnvelopeLowToHighAccumulatedMsec:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_envelopeLowToHighAccumulatedMsec = a3;
}

- (void)setHasEnvelopeLowToHighAccumulatedMsec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasEnvelopeLowToHighAccumulatedMsec
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setScoReservedSlotDenyCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_scoReservedSlotDenyCount = a3;
}

- (void)setHasScoReservedSlotDenyCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasScoReservedSlotDenyCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setScoRetransmission1DenyCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_scoRetransmission1DenyCount = a3;
}

- (void)setHasScoRetransmission1DenyCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasScoRetransmission1DenyCount
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setScoRetransmission2DenyCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_scoRetransmission2DenyCount = a3;
}

- (void)setHasScoRetransmission2DenyCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasScoRetransmission2DenyCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setGuardTimeMicroseconds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_guardTimeMicroseconds = a3;
}

- (void)setHasGuardTimeMicroseconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGuardTimeMicroseconds
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPsRequestTxCnt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_psRequestTxCnt = a3;
}

- (void)setHasPsRequestTxCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasPsRequestTxCnt
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTxCTS2Self:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_txCTS2Self = a3;
}

- (void)setHasTxCTS2Self:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTxCTS2Self
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBTCoexStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerBTCoexStats description](&v3, sel_description), -[AWDWiFiMetricsManagerBTCoexStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $0E65A0BFD4F635254F2A60AA8857012C has;
  AWDWiFiMetricsManagerStateMachine *antennaOwnership2BT;
  AWDWiFiMetricsManagerStateMachine *antennaOwnership2WLAN;
  AWDWiFiMetricsManagerStateMachine *enbledStateOn;
  AWDWiFiMetricsManagerStateMachine *enbledStateOff;
  AWDWiFiMetricsManagerStateMachine *hybridStateOn;
  AWDWiFiMetricsManagerStateMachine *hybridStateOff;
  AWDWiFiMetricsManagerStateMachine *tdmStateOn;
  AWDWiFiMetricsManagerStateMachine *tdmStateOff;
  $0E65A0BFD4F635254F2A60AA8857012C v13;
  $0E65A0BFD4F635254F2A60AA8857012C v14;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_4;
      goto LABEL_53;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_antennaRequests), CFSTR("antennaRequests"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_5;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_antennaGrants), CFSTR("antennaGrants"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wlanPreempted), CFSTR("wlanPreempted"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_psnullExceeded), CFSTR("psnullExceeded"));
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highUcodeLatency), CFSTR("highUcodeLatency"));
LABEL_8:
  antennaOwnership2BT = self->_antennaOwnership2BT;
  if (antennaOwnership2BT)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](antennaOwnership2BT, "dictionaryRepresentation"), CFSTR("antennaOwnership2_BT"));
  antennaOwnership2WLAN = self->_antennaOwnership2WLAN;
  if (antennaOwnership2WLAN)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](antennaOwnership2WLAN, "dictionaryRepresentation"), CFSTR("antennaOwnership2_WLAN"));
  enbledStateOn = self->_enbledStateOn;
  if (enbledStateOn)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](enbledStateOn, "dictionaryRepresentation"), CFSTR("enbledState_On"));
  enbledStateOff = self->_enbledStateOff;
  if (enbledStateOff)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](enbledStateOff, "dictionaryRepresentation"), CFSTR("enbledState_Off"));
  hybridStateOn = self->_hybridStateOn;
  if (hybridStateOn)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](hybridStateOn, "dictionaryRepresentation"), CFSTR("hybridState_On"));
  hybridStateOff = self->_hybridStateOff;
  if (hybridStateOff)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](hybridStateOff, "dictionaryRepresentation"), CFSTR("hybridState_Off"));
  tdmStateOn = self->_tdmStateOn;
  if (tdmStateOn)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](tdmStateOn, "dictionaryRepresentation"), CFSTR("tdmState_On"));
  tdmStateOff = self->_tdmStateOff;
  if (tdmStateOff)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](tdmStateOff, "dictionaryRepresentation"), CFSTR("tdmState_Off"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsACL), CFSTR("requestsACL"));
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x80000) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v13 & 0x200000) == 0)
        goto LABEL_27;
      goto LABEL_59;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
    goto LABEL_26;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsSCO), CFSTR("requestsSCO"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v13 & 0x100) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestseSCO), CFSTR("requestseSCO"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v13 & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsA2DP), CFSTR("requestsA2DP"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v13 & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsSniff), CFSTR("requestsSniff"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v13 & 0x2000) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsPageScan), CFSTR("requestsPageScan"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v13 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsInquiryScan), CFSTR("requestsInquiryScan"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v13 & 0x1000) == 0)
      goto LABEL_33;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsPage), CFSTR("requestsPage"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v13 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsInquiry), CFSTR("requestsInquiry"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v13 & 0x8000) == 0)
      goto LABEL_35;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsBLE), CFSTR("requestsBLE"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v13 & 0x800) == 0)
      goto LABEL_36;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsOther), CFSTR("requestsOther"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v13 & 0x4000) == 0)
      goto LABEL_37;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsBLEScan), CFSTR("requestsBLEScan"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v13 & 0x10000) == 0)
      goto LABEL_38;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsMSS), CFSTR("requestsMSS"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&v13 & 4) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestsPARK), CFSTR("requestsPARK"));
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_39:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_beaconLostCnt), CFSTR("beaconLostCnt"));
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("rxMPDUCountPerMCS"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("txMPDUCountPerMCS"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x4000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeTillResumeAccumulatedMsec), CFSTR("timeTillResumeAccumulatedMsec"));
    v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x400000) == 0)
    {
LABEL_42:
      if ((*(_BYTE *)&v14 & 8) == 0)
        goto LABEL_43;
      goto LABEL_74;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
    goto LABEL_42;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resumeTimeAccumulatedMsec), CFSTR("resumeTimeAccumulatedMsec"));
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 8) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
      goto LABEL_44;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_envelopeLowToHighAccumulatedMsec), CFSTR("envelopeLowToHighAccumulatedMsec"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      goto LABEL_45;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_scoReservedSlotDenyCount), CFSTR("scoReservedSlotDenyCount"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0)
      goto LABEL_46;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_scoRetransmission1DenyCount), CFSTR("scoRetransmission1DenyCount"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_46:
    if ((*(_BYTE *)&v14 & 0x10) == 0)
      goto LABEL_47;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_scoRetransmission2DenyCount), CFSTR("scoRetransmission2DenyCount"));
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x10) == 0)
  {
LABEL_47:
    if ((*(_BYTE *)&v14 & 0x40) == 0)
      goto LABEL_48;
LABEL_79:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_psRequestTxCnt), CFSTR("psRequestTxCnt"));
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      return v3;
    goto LABEL_49;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_guardTimeMicroseconds), CFSTR("guardTimeMicroseconds"));
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) != 0)
    goto LABEL_79;
LABEL_48:
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
LABEL_49:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txCTS2Self), CFSTR("txCTS2Self"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerBTCoexStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $0E65A0BFD4F635254F2A60AA8857012C has;
  $0E65A0BFD4F635254F2A60AA8857012C v5;
  unint64_t v6;
  unint64_t v7;
  $0E65A0BFD4F635254F2A60AA8857012C v8;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_4;
      goto LABEL_58;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_5;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteUint64Field();
LABEL_8:
  if (self->_antennaOwnership2BT)
    PBDataWriterWriteSubmessage();
  if (self->_antennaOwnership2WLAN)
    PBDataWriterWriteSubmessage();
  if (self->_enbledStateOn)
    PBDataWriterWriteSubmessage();
  if (self->_enbledStateOff)
    PBDataWriterWriteSubmessage();
  if (self->_hybridStateOn)
    PBDataWriterWriteSubmessage();
  if (self->_hybridStateOff)
    PBDataWriterWriteSubmessage();
  if (self->_tdmStateOn)
    PBDataWriterWriteSubmessage();
  if (self->_tdmStateOff)
    PBDataWriterWriteSubmessage();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = self->_has;
    if ((*(_DWORD *)&v5 & 0x80000) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v5 & 0x200000) == 0)
        goto LABEL_27;
      goto LABEL_64;
    }
  }
  else if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v5 & 0x100) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v5 & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v5 & 0x2000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v5 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v5 & 0x1000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v5 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v5 & 0x8000) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v5 & 0x800) == 0)
      goto LABEL_36;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v5 & 0x4000) == 0)
      goto LABEL_37;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v5 & 0x10000) == 0)
      goto LABEL_38;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&v5 & 4) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_39:
    PBDataWriterWriteUint64Field();
LABEL_40:
  if (self->_rxMPDUCountPerMCSs.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_rxMPDUCountPerMCSs.count);
  }
  if (self->_txMPDUCountPerMCSs.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v7;
    }
    while (v7 < self->_txMPDUCountPerMCSs.count);
  }
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
    {
LABEL_48:
      if ((*(_BYTE *)&v8 & 8) == 0)
        goto LABEL_49;
      goto LABEL_79;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteUint64Field();
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v8 & 0x800000) == 0)
      goto LABEL_50;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0)
      goto LABEL_51;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint64Field();
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v8 & 0x2000000) == 0)
      goto LABEL_52;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint64Field();
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_52:
    if ((*(_BYTE *)&v8 & 0x10) == 0)
      goto LABEL_53;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint64Field();
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x10) == 0)
  {
LABEL_53:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_54;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v8 & 0x10000000) == 0)
      return;
LABEL_85:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_84:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
    goto LABEL_85;
}

- (void)copyTo:(id)a3
{
  $0E65A0BFD4F635254F2A60AA8857012C has;
  $0E65A0BFD4F635254F2A60AA8857012C v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  $0E65A0BFD4F635254F2A60AA8857012C v13;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    *((_QWORD *)a3 + 34) = self->_timestamp;
    *((_DWORD *)a3 + 90) |= 0x8000000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_4;
      goto LABEL_61;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 8) = self->_antennaRequests;
  *((_DWORD *)a3 + 90) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_5;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)a3 + 7) = self->_antennaGrants;
  *((_DWORD *)a3 + 90) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)a3 + 36) = self->_wlanPreempted;
  *((_DWORD *)a3 + 90) |= 0x20000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_63:
  *((_QWORD *)a3 + 14) = self->_psnullExceeded;
  *((_DWORD *)a3 + 90) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *((_QWORD *)a3 + 12) = self->_highUcodeLatency;
    *((_DWORD *)a3 + 90) |= 0x20u;
  }
LABEL_8:
  if (self->_antennaOwnership2BT)
    objc_msgSend(a3, "setAntennaOwnership2BT:");
  if (self->_antennaOwnership2WLAN)
    objc_msgSend(a3, "setAntennaOwnership2WLAN:");
  if (self->_enbledStateOn)
    objc_msgSend(a3, "setEnbledStateOn:");
  if (self->_enbledStateOff)
    objc_msgSend(a3, "setEnbledStateOff:");
  if (self->_hybridStateOn)
    objc_msgSend(a3, "setHybridStateOn:");
  if (self->_hybridStateOff)
    objc_msgSend(a3, "setHybridStateOff:");
  if (self->_tdmStateOn)
    objc_msgSend(a3, "setTdmStateOn:");
  if (self->_tdmStateOff)
    objc_msgSend(a3, "setTdmStateOff:");
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_QWORD *)a3 + 16) = self->_requestsACL;
    *((_DWORD *)a3 + 90) |= 0x200u;
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v6 & 0x200000) == 0)
        goto LABEL_27;
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
    goto LABEL_26;
  }
  *((_QWORD *)a3 + 26) = self->_requestsSCO;
  *((_DWORD *)a3 + 90) |= 0x80000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_28;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)a3 + 28) = self->_requestseSCO;
  *((_DWORD *)a3 + 90) |= 0x200000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)a3 + 15) = self->_requestsA2DP;
  *((_DWORD *)a3 + 90) |= 0x100u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)a3 + 27) = self->_requestsSniff;
  *((_DWORD *)a3 + 90) |= 0x100000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)a3 + 25) = self->_requestsPageScan;
  *((_DWORD *)a3 + 90) |= 0x40000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)a3 + 20) = self->_requestsInquiryScan;
  *((_DWORD *)a3 + 90) |= 0x2000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)a3 + 24) = self->_requestsPage;
  *((_DWORD *)a3 + 90) |= 0x20000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)a3 + 19) = self->_requestsInquiry;
  *((_DWORD *)a3 + 90) |= 0x1000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_35;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)a3 + 17) = self->_requestsBLE;
  *((_DWORD *)a3 + 90) |= 0x400u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_36;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)a3 + 22) = self->_requestsOther;
  *((_DWORD *)a3 + 90) |= 0x8000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_37;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)a3 + 18) = self->_requestsBLEScan;
  *((_DWORD *)a3 + 90) |= 0x800u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_38;
LABEL_78:
    *((_QWORD *)a3 + 23) = self->_requestsPARK;
    *((_DWORD *)a3 + 90) |= 0x10000u;
    if ((*(_DWORD *)&self->_has & 4) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_77:
  *((_QWORD *)a3 + 21) = self->_requestsMSS;
  *((_DWORD *)a3 + 90) |= 0x4000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
    goto LABEL_78;
LABEL_38:
  if ((*(_BYTE *)&v6 & 4) != 0)
  {
LABEL_39:
    *((_QWORD *)a3 + 9) = self->_beaconLostCnt;
    *((_DWORD *)a3 + 90) |= 4u;
  }
LABEL_40:
  if (-[AWDWiFiMetricsManagerBTCoexStats rxMPDUCountPerMCSsCount](self, "rxMPDUCountPerMCSsCount"))
  {
    objc_msgSend(a3, "clearRxMPDUCountPerMCSs");
    v7 = -[AWDWiFiMetricsManagerBTCoexStats rxMPDUCountPerMCSsCount](self, "rxMPDUCountPerMCSsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(a3, "addRxMPDUCountPerMCS:", -[AWDWiFiMetricsManagerBTCoexStats rxMPDUCountPerMCSAtIndex:](self, "rxMPDUCountPerMCSAtIndex:", i));
    }
  }
  if (-[AWDWiFiMetricsManagerBTCoexStats txMPDUCountPerMCSsCount](self, "txMPDUCountPerMCSsCount"))
  {
    objc_msgSend(a3, "clearTxMPDUCountPerMCSs");
    v10 = -[AWDWiFiMetricsManagerBTCoexStats txMPDUCountPerMCSsCount](self, "txMPDUCountPerMCSsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addTxMPDUCountPerMCS:", -[AWDWiFiMetricsManagerBTCoexStats txMPDUCountPerMCSAtIndex:](self, "txMPDUCountPerMCSAtIndex:", j));
    }
  }
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) != 0)
  {
    *((_QWORD *)a3 + 33) = self->_timeTillResumeAccumulatedMsec;
    *((_DWORD *)a3 + 90) |= 0x4000000u;
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
    {
LABEL_50:
      if ((*(_BYTE *)&v13 & 8) == 0)
        goto LABEL_51;
      goto LABEL_82;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
    goto LABEL_50;
  }
  *((_QWORD *)a3 + 29) = self->_resumeTimeAccumulatedMsec;
  *((_DWORD *)a3 + 90) |= 0x400000u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 8) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v13 & 0x800000) == 0)
      goto LABEL_52;
    goto LABEL_83;
  }
LABEL_82:
  *((_QWORD *)a3 + 10) = self->_envelopeLowToHighAccumulatedMsec;
  *((_DWORD *)a3 + 90) |= 8u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v13 & 0x1000000) == 0)
      goto LABEL_53;
    goto LABEL_84;
  }
LABEL_83:
  *((_QWORD *)a3 + 30) = self->_scoReservedSlotDenyCount;
  *((_DWORD *)a3 + 90) |= 0x800000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v13 & 0x2000000) == 0)
      goto LABEL_54;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)a3 + 31) = self->_scoRetransmission1DenyCount;
  *((_DWORD *)a3 + 90) |= 0x1000000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) == 0)
  {
LABEL_54:
    if ((*(_BYTE *)&v13 & 0x10) == 0)
      goto LABEL_55;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)a3 + 32) = self->_scoRetransmission2DenyCount;
  *((_DWORD *)a3 + 90) |= 0x2000000u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x10) == 0)
  {
LABEL_55:
    if ((*(_BYTE *)&v13 & 0x40) == 0)
      goto LABEL_56;
    goto LABEL_87;
  }
LABEL_86:
  *((_QWORD *)a3 + 11) = self->_guardTimeMicroseconds;
  *((_DWORD *)a3 + 90) |= 0x10u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v13 & 0x10000000) == 0)
      return;
    goto LABEL_57;
  }
LABEL_87:
  *((_QWORD *)a3 + 13) = self->_psRequestTxCnt;
  *((_DWORD *)a3 + 90) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
    return;
LABEL_57:
  *((_QWORD *)a3 + 35) = self->_txCTS2Self;
  *((_DWORD *)a3 + 90) |= 0x10000000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $0E65A0BFD4F635254F2A60AA8857012C has;
  $0E65A0BFD4F635254F2A60AA8857012C v8;
  $0E65A0BFD4F635254F2A60AA8857012C v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    *(_QWORD *)(v5 + 272) = self->_timestamp;
    *(_DWORD *)(v5 + 360) |= 0x8000000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 64) = self->_antennaRequests;
  *(_DWORD *)(v5 + 360) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  *(_QWORD *)(v5 + 56) = self->_antennaGrants;
  *(_DWORD *)(v5 + 360) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  *(_QWORD *)(v5 + 288) = self->_wlanPreempted;
  *(_DWORD *)(v5 + 360) |= 0x20000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_39:
  *(_QWORD *)(v5 + 112) = self->_psnullExceeded;
  *(_DWORD *)(v5 + 360) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *(_QWORD *)(v5 + 96) = self->_highUcodeLatency;
    *(_DWORD *)(v5 + 360) |= 0x20u;
  }
LABEL_8:

  *(_QWORD *)(v6 + 296) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_antennaOwnership2BT, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 304) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_antennaOwnership2WLAN, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 320) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_enbledStateOn, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 312) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_enbledStateOff, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 336) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_hybridStateOn, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 328) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_hybridStateOff, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 352) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_tdmStateOn, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 344) = -[AWDWiFiMetricsManagerStateMachine copyWithZone:](self->_tdmStateOff, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) != 0)
  {
    *(_QWORD *)(v6 + 128) = self->_requestsACL;
    *(_DWORD *)(v6 + 360) |= 0x200u;
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x80000) == 0)
    {
LABEL_10:
      if ((*(_DWORD *)&v8 & 0x200000) == 0)
        goto LABEL_11;
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
    goto LABEL_10;
  }
  *(_QWORD *)(v6 + 208) = self->_requestsSCO;
  *(_DWORD *)(v6 + 360) |= 0x80000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v8 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  *(_QWORD *)(v6 + 224) = self->_requestseSCO;
  *(_DWORD *)(v6 + 360) |= 0x200000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v8 & 0x100000) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  *(_QWORD *)(v6 + 120) = self->_requestsA2DP;
  *(_DWORD *)(v6 + 360) |= 0x100u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v8 & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  *(_QWORD *)(v6 + 216) = self->_requestsSniff;
  *(_DWORD *)(v6 + 360) |= 0x100000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v8 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  *(_QWORD *)(v6 + 200) = self->_requestsPageScan;
  *(_DWORD *)(v6 + 360) |= 0x40000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v8 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  *(_QWORD *)(v6 + 160) = self->_requestsInquiryScan;
  *(_DWORD *)(v6 + 360) |= 0x2000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  *(_QWORD *)(v6 + 192) = self->_requestsPage;
  *(_DWORD *)(v6 + 360) |= 0x20000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v8 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  *(_QWORD *)(v6 + 152) = self->_requestsInquiry;
  *(_DWORD *)(v6 + 360) |= 0x1000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v8 & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  *(_QWORD *)(v6 + 136) = self->_requestsBLE;
  *(_DWORD *)(v6 + 360) |= 0x400u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v8 & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  *(_QWORD *)(v6 + 176) = self->_requestsOther;
  *(_DWORD *)(v6 + 360) |= 0x8000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  *(_QWORD *)(v6 + 144) = self->_requestsBLEScan;
  *(_DWORD *)(v6 + 360) |= 0x800u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  *(_QWORD *)(v6 + 168) = self->_requestsMSS;
  *(_DWORD *)(v6 + 360) |= 0x4000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_54:
  *(_QWORD *)(v6 + 184) = self->_requestsPARK;
  *(_DWORD *)(v6 + 360) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_23:
    *(_QWORD *)(v6 + 72) = self->_beaconLostCnt;
    *(_DWORD *)(v6 + 360) |= 4u;
  }
LABEL_24:
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x4000000) != 0)
  {
    *(_QWORD *)(v6 + 264) = self->_timeTillResumeAccumulatedMsec;
    *(_DWORD *)(v6 + 360) |= 0x4000000u;
    v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
    {
LABEL_26:
      if ((*(_BYTE *)&v9 & 8) == 0)
        goto LABEL_27;
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
    goto LABEL_26;
  }
  *(_QWORD *)(v6 + 232) = self->_resumeTimeAccumulatedMsec;
  *(_DWORD *)(v6 + 360) |= 0x400000u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 8) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x800000) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  *(_QWORD *)(v6 + 80) = self->_envelopeLowToHighAccumulatedMsec;
  *(_DWORD *)(v6 + 360) |= 8u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  *(_QWORD *)(v6 + 240) = self->_scoReservedSlotDenyCount;
  *(_DWORD *)(v6 + 360) |= 0x800000u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  *(_QWORD *)(v6 + 248) = self->_scoRetransmission1DenyCount;
  *(_DWORD *)(v6 + 360) |= 0x1000000u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v9 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_62;
  }
LABEL_61:
  *(_QWORD *)(v6 + 256) = self->_scoRetransmission2DenyCount;
  *(_DWORD *)(v6 + 360) |= 0x2000000u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v9 & 0x40) == 0)
      goto LABEL_32;
LABEL_63:
    *(_QWORD *)(v6 + 104) = self->_psRequestTxCnt;
    *(_DWORD *)(v6 + 360) |= 0x40u;
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      return (id)v6;
    goto LABEL_33;
  }
LABEL_62:
  *(_QWORD *)(v6 + 88) = self->_guardTimeMicroseconds;
  *(_DWORD *)(v6 + 360) |= 0x10u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x40) != 0)
    goto LABEL_63;
LABEL_32:
  if ((*(_DWORD *)&v9 & 0x10000000) != 0)
  {
LABEL_33:
    *(_QWORD *)(v6 + 280) = self->_txCTS2Self;
    *(_DWORD *)(v6 + 360) |= 0x10000000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  $0E65A0BFD4F635254F2A60AA8857012C has;
  int v7;
  AWDWiFiMetricsManagerStateMachine *antennaOwnership2BT;
  AWDWiFiMetricsManagerStateMachine *antennaOwnership2WLAN;
  AWDWiFiMetricsManagerStateMachine *enbledStateOn;
  AWDWiFiMetricsManagerStateMachine *enbledStateOff;
  AWDWiFiMetricsManagerStateMachine *hybridStateOn;
  AWDWiFiMetricsManagerStateMachine *hybridStateOff;
  AWDWiFiMetricsManagerStateMachine *tdmStateOn;
  AWDWiFiMetricsManagerStateMachine *tdmStateOff;
  $0E65A0BFD4F635254F2A60AA8857012C v16;
  int v17;
  $0E65A0BFD4F635254F2A60AA8857012C v18;
  int v19;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 90);
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_timestamp != *((_QWORD *)a3 + 34))
        goto LABEL_169;
    }
    else if ((v7 & 0x8000000) != 0)
    {
LABEL_169:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_antennaRequests != *((_QWORD *)a3 + 8))
        goto LABEL_169;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_169;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_antennaGrants != *((_QWORD *)a3 + 7))
        goto LABEL_169;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_169;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_wlanPreempted != *((_QWORD *)a3 + 36))
        goto LABEL_169;
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_169;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_psnullExceeded != *((_QWORD *)a3 + 14))
        goto LABEL_169;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_169;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_highUcodeLatency != *((_QWORD *)a3 + 12))
        goto LABEL_169;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_169;
    }
    antennaOwnership2BT = self->_antennaOwnership2BT;
    if (!((unint64_t)antennaOwnership2BT | *((_QWORD *)a3 + 37))
      || (IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](antennaOwnership2BT, "isEqual:")) != 0)
    {
      antennaOwnership2WLAN = self->_antennaOwnership2WLAN;
      if (!((unint64_t)antennaOwnership2WLAN | *((_QWORD *)a3 + 38))
        || (IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](antennaOwnership2WLAN, "isEqual:")) != 0)
      {
        enbledStateOn = self->_enbledStateOn;
        if (!((unint64_t)enbledStateOn | *((_QWORD *)a3 + 40))
          || (IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](enbledStateOn, "isEqual:")) != 0)
        {
          enbledStateOff = self->_enbledStateOff;
          if (!((unint64_t)enbledStateOff | *((_QWORD *)a3 + 39))
            || (IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](enbledStateOff, "isEqual:")) != 0)
          {
            hybridStateOn = self->_hybridStateOn;
            if (!((unint64_t)hybridStateOn | *((_QWORD *)a3 + 42))
              || (IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](hybridStateOn, "isEqual:")) != 0)
            {
              hybridStateOff = self->_hybridStateOff;
              if (!((unint64_t)hybridStateOff | *((_QWORD *)a3 + 41))
                || (IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](hybridStateOff, "isEqual:")) != 0)
              {
                tdmStateOn = self->_tdmStateOn;
                if (!((unint64_t)tdmStateOn | *((_QWORD *)a3 + 44))
                  || (IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](tdmStateOn, "isEqual:")) != 0)
                {
                  tdmStateOff = self->_tdmStateOff;
                  if (!((unint64_t)tdmStateOff | *((_QWORD *)a3 + 43))
                    || (IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](tdmStateOff, "isEqual:")) != 0)
                  {
                    v16 = self->_has;
                    v17 = *((_DWORD *)a3 + 90);
                    if ((*(_WORD *)&v16 & 0x200) != 0)
                    {
                      if ((v17 & 0x200) == 0 || self->_requestsACL != *((_QWORD *)a3 + 16))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x200) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x80000) != 0)
                    {
                      if ((v17 & 0x80000) == 0 || self->_requestsSCO != *((_QWORD *)a3 + 26))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x80000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x200000) != 0)
                    {
                      if ((v17 & 0x200000) == 0 || self->_requestseSCO != *((_QWORD *)a3 + 28))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x200000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x100) != 0)
                    {
                      if ((v17 & 0x100) == 0 || self->_requestsA2DP != *((_QWORD *)a3 + 15))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x100) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x100000) != 0)
                    {
                      if ((v17 & 0x100000) == 0 || self->_requestsSniff != *((_QWORD *)a3 + 27))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x100000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x40000) != 0)
                    {
                      if ((v17 & 0x40000) == 0 || self->_requestsPageScan != *((_QWORD *)a3 + 25))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x40000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x2000) != 0)
                    {
                      if ((v17 & 0x2000) == 0 || self->_requestsInquiryScan != *((_QWORD *)a3 + 20))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x2000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x20000) != 0)
                    {
                      if ((v17 & 0x20000) == 0 || self->_requestsPage != *((_QWORD *)a3 + 24))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x20000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x1000) != 0)
                    {
                      if ((v17 & 0x1000) == 0 || self->_requestsInquiry != *((_QWORD *)a3 + 19))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x1000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x400) != 0)
                    {
                      if ((v17 & 0x400) == 0 || self->_requestsBLE != *((_QWORD *)a3 + 17))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x400) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x8000) != 0)
                    {
                      if ((v17 & 0x8000) == 0 || self->_requestsOther != *((_QWORD *)a3 + 22))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x8000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x800) != 0)
                    {
                      if ((v17 & 0x800) == 0 || self->_requestsBLEScan != *((_QWORD *)a3 + 18))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x800) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x4000) != 0)
                    {
                      if ((v17 & 0x4000) == 0 || self->_requestsMSS != *((_QWORD *)a3 + 21))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x4000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x10000) != 0)
                    {
                      if ((v17 & 0x10000) == 0 || self->_requestsPARK != *((_QWORD *)a3 + 23))
                        goto LABEL_169;
                    }
                    else if ((v17 & 0x10000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_BYTE *)&v16 & 4) != 0)
                    {
                      if ((v17 & 4) == 0 || self->_beaconLostCnt != *((_QWORD *)a3 + 9))
                        goto LABEL_169;
                    }
                    else if ((v17 & 4) != 0)
                    {
                      goto LABEL_169;
                    }
                    IsEqual = PBRepeatedUInt64IsEqual();
                    if (IsEqual)
                    {
                      IsEqual = PBRepeatedUInt64IsEqual();
                      if (IsEqual)
                      {
                        v18 = self->_has;
                        v19 = *((_DWORD *)a3 + 90);
                        if ((*(_DWORD *)&v18 & 0x4000000) != 0)
                        {
                          if ((v19 & 0x4000000) == 0 || self->_timeTillResumeAccumulatedMsec != *((_QWORD *)a3 + 33))
                            goto LABEL_169;
                        }
                        else if ((v19 & 0x4000000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_DWORD *)&v18 & 0x400000) != 0)
                        {
                          if ((v19 & 0x400000) == 0 || self->_resumeTimeAccumulatedMsec != *((_QWORD *)a3 + 29))
                            goto LABEL_169;
                        }
                        else if ((v19 & 0x400000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_BYTE *)&v18 & 8) != 0)
                        {
                          if ((v19 & 8) == 0 || self->_envelopeLowToHighAccumulatedMsec != *((_QWORD *)a3 + 10))
                            goto LABEL_169;
                        }
                        else if ((v19 & 8) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_DWORD *)&v18 & 0x800000) != 0)
                        {
                          if ((v19 & 0x800000) == 0 || self->_scoReservedSlotDenyCount != *((_QWORD *)a3 + 30))
                            goto LABEL_169;
                        }
                        else if ((v19 & 0x800000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_DWORD *)&v18 & 0x1000000) != 0)
                        {
                          if ((v19 & 0x1000000) == 0 || self->_scoRetransmission1DenyCount != *((_QWORD *)a3 + 31))
                            goto LABEL_169;
                        }
                        else if ((v19 & 0x1000000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_DWORD *)&v18 & 0x2000000) != 0)
                        {
                          if ((v19 & 0x2000000) == 0 || self->_scoRetransmission2DenyCount != *((_QWORD *)a3 + 32))
                            goto LABEL_169;
                        }
                        else if ((v19 & 0x2000000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_BYTE *)&v18 & 0x10) != 0)
                        {
                          if ((v19 & 0x10) == 0 || self->_guardTimeMicroseconds != *((_QWORD *)a3 + 11))
                            goto LABEL_169;
                        }
                        else if ((v19 & 0x10) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_BYTE *)&v18 & 0x40) != 0)
                        {
                          if ((v19 & 0x40) == 0 || self->_psRequestTxCnt != *((_QWORD *)a3 + 13))
                            goto LABEL_169;
                        }
                        else if ((v19 & 0x40) != 0)
                        {
                          goto LABEL_169;
                        }
                        LOBYTE(IsEqual) = (v19 & 0x10000000) == 0;
                        if ((*(_DWORD *)&v18 & 0x10000000) != 0)
                        {
                          if ((v19 & 0x10000000) == 0 || self->_txCTS2Self != *((_QWORD *)a3 + 35))
                            goto LABEL_169;
                          LOBYTE(IsEqual) = 1;
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
  return IsEqual;
}

- (unint64_t)hash
{
  $0E65A0BFD4F635254F2A60AA8857012C has;
  $0E65A0BFD4F635254F2A60AA8857012C v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $0E65A0BFD4F635254F2A60AA8857012C v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    v46 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v45 = 2654435761u * self->_antennaRequests;
      if ((*(_BYTE *)&has & 1) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v46 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v45 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_4:
    v44 = 2654435761u * self->_antennaGrants;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v44 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_5:
    v43 = 2654435761u * self->_wlanPreempted;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_6;
LABEL_12:
    v42 = 0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v43 = 0;
  if ((*(_BYTE *)&has & 0x80) == 0)
    goto LABEL_12;
LABEL_6:
  v42 = 2654435761u * self->_psnullExceeded;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_7:
    v41 = 2654435761u * self->_highUcodeLatency;
    goto LABEL_14;
  }
LABEL_13:
  v41 = 0;
LABEL_14:
  v40 = -[AWDWiFiMetricsManagerStateMachine hash](self->_antennaOwnership2BT, "hash");
  v39 = -[AWDWiFiMetricsManagerStateMachine hash](self->_antennaOwnership2WLAN, "hash");
  v38 = -[AWDWiFiMetricsManagerStateMachine hash](self->_enbledStateOn, "hash");
  v37 = -[AWDWiFiMetricsManagerStateMachine hash](self->_enbledStateOff, "hash");
  v36 = -[AWDWiFiMetricsManagerStateMachine hash](self->_hybridStateOn, "hash");
  v35 = -[AWDWiFiMetricsManagerStateMachine hash](self->_hybridStateOff, "hash");
  v34 = -[AWDWiFiMetricsManagerStateMachine hash](self->_tdmStateOn, "hash");
  v33 = -[AWDWiFiMetricsManagerStateMachine hash](self->_tdmStateOff, "hash");
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    v32 = 2654435761u * self->_requestsACL;
    if ((*(_DWORD *)&v4 & 0x80000) != 0)
    {
LABEL_16:
      v31 = 2654435761u * self->_requestsSCO;
      if ((*(_DWORD *)&v4 & 0x200000) != 0)
        goto LABEL_17;
      goto LABEL_32;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_DWORD *)&v4 & 0x80000) != 0)
      goto LABEL_16;
  }
  v31 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_17:
    v30 = 2654435761u * self->_requestseSCO;
    if ((*(_WORD *)&v4 & 0x100) != 0)
      goto LABEL_18;
    goto LABEL_33;
  }
LABEL_32:
  v30 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_18:
    v29 = 2654435761u * self->_requestsA2DP;
    if ((*(_DWORD *)&v4 & 0x100000) != 0)
      goto LABEL_19;
    goto LABEL_34;
  }
LABEL_33:
  v29 = 0;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_19:
    v28 = 2654435761u * self->_requestsSniff;
    if ((*(_DWORD *)&v4 & 0x40000) != 0)
      goto LABEL_20;
    goto LABEL_35;
  }
LABEL_34:
  v28 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_20:
    v27 = 2654435761u * self->_requestsPageScan;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_21;
    goto LABEL_36;
  }
LABEL_35:
  v27 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_21:
    v26 = 2654435761u * self->_requestsInquiryScan;
    if ((*(_DWORD *)&v4 & 0x20000) != 0)
      goto LABEL_22;
    goto LABEL_37;
  }
LABEL_36:
  v26 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_22:
    v25 = 2654435761u * self->_requestsPage;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_23;
    goto LABEL_38;
  }
LABEL_37:
  v25 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_23:
    v24 = 2654435761u * self->_requestsInquiry;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_24;
    goto LABEL_39;
  }
LABEL_38:
  v24 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_24:
    v5 = 2654435761u * self->_requestsBLE;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
      goto LABEL_25;
    goto LABEL_40;
  }
LABEL_39:
  v5 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_25:
    v6 = 2654435761u * self->_requestsOther;
    if ((*(_WORD *)&v4 & 0x800) != 0)
      goto LABEL_26;
    goto LABEL_41;
  }
LABEL_40:
  v6 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_26:
    v7 = 2654435761u * self->_requestsBLEScan;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_27;
    goto LABEL_42;
  }
LABEL_41:
  v7 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_27:
    v8 = 2654435761u * self->_requestsMSS;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
      goto LABEL_28;
LABEL_43:
    v9 = 0;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_29;
    goto LABEL_44;
  }
LABEL_42:
  v8 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) == 0)
    goto LABEL_43;
LABEL_28:
  v9 = 2654435761u * self->_requestsPARK;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_29:
    v10 = 2654435761u * self->_beaconLostCnt;
    goto LABEL_45;
  }
LABEL_44:
  v10 = 0;
LABEL_45:
  v11 = PBRepeatedUInt64Hash();
  v12 = PBRepeatedUInt64Hash();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) != 0)
  {
    v14 = 2654435761u * self->_timeTillResumeAccumulatedMsec;
    if ((*(_DWORD *)&v13 & 0x400000) != 0)
    {
LABEL_47:
      v15 = 2654435761u * self->_resumeTimeAccumulatedMsec;
      if ((*(_BYTE *)&v13 & 8) != 0)
        goto LABEL_48;
      goto LABEL_57;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_DWORD *)&v13 & 0x400000) != 0)
      goto LABEL_47;
  }
  v15 = 0;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
LABEL_48:
    v16 = 2654435761u * self->_envelopeLowToHighAccumulatedMsec;
    if ((*(_DWORD *)&v13 & 0x800000) != 0)
      goto LABEL_49;
    goto LABEL_58;
  }
LABEL_57:
  v16 = 0;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
LABEL_49:
    v17 = 2654435761u * self->_scoReservedSlotDenyCount;
    if ((*(_DWORD *)&v13 & 0x1000000) != 0)
      goto LABEL_50;
    goto LABEL_59;
  }
LABEL_58:
  v17 = 0;
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
  {
LABEL_50:
    v18 = 2654435761u * self->_scoRetransmission1DenyCount;
    if ((*(_DWORD *)&v13 & 0x2000000) != 0)
      goto LABEL_51;
    goto LABEL_60;
  }
LABEL_59:
  v18 = 0;
  if ((*(_DWORD *)&v13 & 0x2000000) != 0)
  {
LABEL_51:
    v19 = 2654435761u * self->_scoRetransmission2DenyCount;
    if ((*(_BYTE *)&v13 & 0x10) != 0)
      goto LABEL_52;
    goto LABEL_61;
  }
LABEL_60:
  v19 = 0;
  if ((*(_BYTE *)&v13 & 0x10) != 0)
  {
LABEL_52:
    v20 = 2654435761u * self->_guardTimeMicroseconds;
    if ((*(_BYTE *)&v13 & 0x40) != 0)
      goto LABEL_53;
LABEL_62:
    v21 = 0;
    if ((*(_DWORD *)&v13 & 0x10000000) != 0)
      goto LABEL_54;
LABEL_63:
    v22 = 0;
    return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_61:
  v20 = 0;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
    goto LABEL_62;
LABEL_53:
  v21 = 2654435761u * self->_psRequestTxCnt;
  if ((*(_DWORD *)&v13 & 0x10000000) == 0)
    goto LABEL_63;
LABEL_54:
  v22 = 2654435761u * self->_txCTS2Self;
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  AWDWiFiMetricsManagerStateMachine *antennaOwnership2BT;
  uint64_t v7;
  AWDWiFiMetricsManagerStateMachine *antennaOwnership2WLAN;
  uint64_t v9;
  AWDWiFiMetricsManagerStateMachine *enbledStateOn;
  uint64_t v11;
  AWDWiFiMetricsManagerStateMachine *enbledStateOff;
  uint64_t v13;
  AWDWiFiMetricsManagerStateMachine *hybridStateOn;
  uint64_t v15;
  AWDWiFiMetricsManagerStateMachine *hybridStateOff;
  uint64_t v17;
  AWDWiFiMetricsManagerStateMachine *tdmStateOn;
  uint64_t v19;
  AWDWiFiMetricsManagerStateMachine *tdmStateOff;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  int v29;

  v5 = *((_DWORD *)a3 + 90);
  if ((v5 & 0x8000000) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 34);
    *(_DWORD *)&self->_has |= 0x8000000u;
    v5 = *((_DWORD *)a3 + 90);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_antennaRequests = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)a3 + 90);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_antennaGrants = *((_QWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)a3 + 90);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_wlanPreempted = *((_QWORD *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x20000000u;
  v5 = *((_DWORD *)a3 + 90);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  self->_psnullExceeded = *((_QWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)a3 + 90) & 0x20) != 0)
  {
LABEL_7:
    self->_highUcodeLatency = *((_QWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_8:
  antennaOwnership2BT = self->_antennaOwnership2BT;
  v7 = *((_QWORD *)a3 + 37);
  if (antennaOwnership2BT)
  {
    if (v7)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](antennaOwnership2BT, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setAntennaOwnership2BT:](self, "setAntennaOwnership2BT:");
  }
  antennaOwnership2WLAN = self->_antennaOwnership2WLAN;
  v9 = *((_QWORD *)a3 + 38);
  if (antennaOwnership2WLAN)
  {
    if (v9)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](antennaOwnership2WLAN, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setAntennaOwnership2WLAN:](self, "setAntennaOwnership2WLAN:");
  }
  enbledStateOn = self->_enbledStateOn;
  v11 = *((_QWORD *)a3 + 40);
  if (enbledStateOn)
  {
    if (v11)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](enbledStateOn, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setEnbledStateOn:](self, "setEnbledStateOn:");
  }
  enbledStateOff = self->_enbledStateOff;
  v13 = *((_QWORD *)a3 + 39);
  if (enbledStateOff)
  {
    if (v13)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](enbledStateOff, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setEnbledStateOff:](self, "setEnbledStateOff:");
  }
  hybridStateOn = self->_hybridStateOn;
  v15 = *((_QWORD *)a3 + 42);
  if (hybridStateOn)
  {
    if (v15)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](hybridStateOn, "mergeFrom:");
  }
  else if (v15)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setHybridStateOn:](self, "setHybridStateOn:");
  }
  hybridStateOff = self->_hybridStateOff;
  v17 = *((_QWORD *)a3 + 41);
  if (hybridStateOff)
  {
    if (v17)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](hybridStateOff, "mergeFrom:");
  }
  else if (v17)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setHybridStateOff:](self, "setHybridStateOff:");
  }
  tdmStateOn = self->_tdmStateOn;
  v19 = *((_QWORD *)a3 + 44);
  if (tdmStateOn)
  {
    if (v19)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](tdmStateOn, "mergeFrom:");
  }
  else if (v19)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setTdmStateOn:](self, "setTdmStateOn:");
  }
  tdmStateOff = self->_tdmStateOff;
  v21 = *((_QWORD *)a3 + 43);
  if (tdmStateOff)
  {
    if (v21)
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](tdmStateOff, "mergeFrom:");
  }
  else if (v21)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setTdmStateOff:](self, "setTdmStateOff:");
  }
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x200) != 0)
  {
    self->_requestsACL = *((_QWORD *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x200u;
    v22 = *((_DWORD *)a3 + 90);
    if ((v22 & 0x80000) == 0)
    {
LABEL_56:
      if ((v22 & 0x200000) == 0)
        goto LABEL_57;
      goto LABEL_89;
    }
  }
  else if ((v22 & 0x80000) == 0)
  {
    goto LABEL_56;
  }
  self->_requestsSCO = *((_QWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x80000u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x200000) == 0)
  {
LABEL_57:
    if ((v22 & 0x100) == 0)
      goto LABEL_58;
    goto LABEL_90;
  }
LABEL_89:
  self->_requestseSCO = *((_QWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x200000u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x100) == 0)
  {
LABEL_58:
    if ((v22 & 0x100000) == 0)
      goto LABEL_59;
    goto LABEL_91;
  }
LABEL_90:
  self->_requestsA2DP = *((_QWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x100u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x100000) == 0)
  {
LABEL_59:
    if ((v22 & 0x40000) == 0)
      goto LABEL_60;
    goto LABEL_92;
  }
LABEL_91:
  self->_requestsSniff = *((_QWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x100000u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x40000) == 0)
  {
LABEL_60:
    if ((v22 & 0x2000) == 0)
      goto LABEL_61;
    goto LABEL_93;
  }
LABEL_92:
  self->_requestsPageScan = *((_QWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x40000u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x2000) == 0)
  {
LABEL_61:
    if ((v22 & 0x20000) == 0)
      goto LABEL_62;
    goto LABEL_94;
  }
LABEL_93:
  self->_requestsInquiryScan = *((_QWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x2000u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x20000) == 0)
  {
LABEL_62:
    if ((v22 & 0x1000) == 0)
      goto LABEL_63;
    goto LABEL_95;
  }
LABEL_94:
  self->_requestsPage = *((_QWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x20000u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x1000) == 0)
  {
LABEL_63:
    if ((v22 & 0x400) == 0)
      goto LABEL_64;
    goto LABEL_96;
  }
LABEL_95:
  self->_requestsInquiry = *((_QWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x1000u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x400) == 0)
  {
LABEL_64:
    if ((v22 & 0x8000) == 0)
      goto LABEL_65;
    goto LABEL_97;
  }
LABEL_96:
  self->_requestsBLE = *((_QWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x400u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x8000) == 0)
  {
LABEL_65:
    if ((v22 & 0x800) == 0)
      goto LABEL_66;
    goto LABEL_98;
  }
LABEL_97:
  self->_requestsOther = *((_QWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x8000u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x800) == 0)
  {
LABEL_66:
    if ((v22 & 0x4000) == 0)
      goto LABEL_67;
    goto LABEL_99;
  }
LABEL_98:
  self->_requestsBLEScan = *((_QWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x800u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x4000) == 0)
  {
LABEL_67:
    if ((v22 & 0x10000) == 0)
      goto LABEL_68;
    goto LABEL_100;
  }
LABEL_99:
  self->_requestsMSS = *((_QWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x4000u;
  v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x10000) == 0)
  {
LABEL_68:
    if ((v22 & 4) == 0)
      goto LABEL_70;
    goto LABEL_69;
  }
LABEL_100:
  self->_requestsPARK = *((_QWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)a3 + 90) & 4) != 0)
  {
LABEL_69:
    self->_beaconLostCnt = *((_QWORD *)a3 + 9);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_70:
  v23 = objc_msgSend(a3, "rxMPDUCountPerMCSsCount");
  if (v23)
  {
    v24 = v23;
    for (i = 0; i != v24; ++i)
      -[AWDWiFiMetricsManagerBTCoexStats addRxMPDUCountPerMCS:](self, "addRxMPDUCountPerMCS:", objc_msgSend(a3, "rxMPDUCountPerMCSAtIndex:", i));
  }
  v26 = objc_msgSend(a3, "txMPDUCountPerMCSsCount");
  if (v26)
  {
    v27 = v26;
    for (j = 0; j != v27; ++j)
      -[AWDWiFiMetricsManagerBTCoexStats addTxMPDUCountPerMCS:](self, "addTxMPDUCountPerMCS:", objc_msgSend(a3, "txMPDUCountPerMCSAtIndex:", j));
  }
  v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x4000000) != 0)
  {
    self->_timeTillResumeAccumulatedMsec = *((_QWORD *)a3 + 33);
    *(_DWORD *)&self->_has |= 0x4000000u;
    v29 = *((_DWORD *)a3 + 90);
    if ((v29 & 0x400000) == 0)
    {
LABEL_78:
      if ((v29 & 8) == 0)
        goto LABEL_79;
      goto LABEL_104;
    }
  }
  else if ((v29 & 0x400000) == 0)
  {
    goto LABEL_78;
  }
  self->_resumeTimeAccumulatedMsec = *((_QWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x400000u;
  v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 8) == 0)
  {
LABEL_79:
    if ((v29 & 0x800000) == 0)
      goto LABEL_80;
    goto LABEL_105;
  }
LABEL_104:
  self->_envelopeLowToHighAccumulatedMsec = *((_QWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 8u;
  v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x800000) == 0)
  {
LABEL_80:
    if ((v29 & 0x1000000) == 0)
      goto LABEL_81;
    goto LABEL_106;
  }
LABEL_105:
  self->_scoReservedSlotDenyCount = *((_QWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x800000u;
  v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x1000000) == 0)
  {
LABEL_81:
    if ((v29 & 0x2000000) == 0)
      goto LABEL_82;
    goto LABEL_107;
  }
LABEL_106:
  self->_scoRetransmission1DenyCount = *((_QWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x2000000) == 0)
  {
LABEL_82:
    if ((v29 & 0x10) == 0)
      goto LABEL_83;
    goto LABEL_108;
  }
LABEL_107:
  self->_scoRetransmission2DenyCount = *((_QWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x10) == 0)
  {
LABEL_83:
    if ((v29 & 0x40) == 0)
      goto LABEL_84;
    goto LABEL_109;
  }
LABEL_108:
  self->_guardTimeMicroseconds = *((_QWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x10u;
  v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x40) == 0)
  {
LABEL_84:
    if ((v29 & 0x10000000) == 0)
      return;
    goto LABEL_85;
  }
LABEL_109:
  self->_psRequestTxCnt = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)a3 + 90) & 0x10000000) == 0)
    return;
LABEL_85:
  self->_txCTS2Self = *((_QWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x10000000u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)antennaRequests
{
  return self->_antennaRequests;
}

- (unint64_t)antennaGrants
{
  return self->_antennaGrants;
}

- (unint64_t)wlanPreempted
{
  return self->_wlanPreempted;
}

- (unint64_t)psnullExceeded
{
  return self->_psnullExceeded;
}

- (unint64_t)highUcodeLatency
{
  return self->_highUcodeLatency;
}

- (AWDWiFiMetricsManagerStateMachine)antennaOwnership2BT
{
  return self->_antennaOwnership2BT;
}

- (void)setAntennaOwnership2BT:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (AWDWiFiMetricsManagerStateMachine)antennaOwnership2WLAN
{
  return self->_antennaOwnership2WLAN;
}

- (void)setAntennaOwnership2WLAN:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (AWDWiFiMetricsManagerStateMachine)enbledStateOn
{
  return self->_enbledStateOn;
}

- (void)setEnbledStateOn:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (AWDWiFiMetricsManagerStateMachine)enbledStateOff
{
  return self->_enbledStateOff;
}

- (void)setEnbledStateOff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (AWDWiFiMetricsManagerStateMachine)hybridStateOn
{
  return self->_hybridStateOn;
}

- (void)setHybridStateOn:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (AWDWiFiMetricsManagerStateMachine)hybridStateOff
{
  return self->_hybridStateOff;
}

- (void)setHybridStateOff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (AWDWiFiMetricsManagerStateMachine)tdmStateOn
{
  return self->_tdmStateOn;
}

- (void)setTdmStateOn:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (AWDWiFiMetricsManagerStateMachine)tdmStateOff
{
  return self->_tdmStateOff;
}

- (void)setTdmStateOff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (unint64_t)requestsACL
{
  return self->_requestsACL;
}

- (unint64_t)requestsSCO
{
  return self->_requestsSCO;
}

- (unint64_t)requestseSCO
{
  return self->_requestseSCO;
}

- (unint64_t)requestsA2DP
{
  return self->_requestsA2DP;
}

- (unint64_t)requestsSniff
{
  return self->_requestsSniff;
}

- (unint64_t)requestsPageScan
{
  return self->_requestsPageScan;
}

- (unint64_t)requestsInquiryScan
{
  return self->_requestsInquiryScan;
}

- (unint64_t)requestsPage
{
  return self->_requestsPage;
}

- (unint64_t)requestsInquiry
{
  return self->_requestsInquiry;
}

- (unint64_t)requestsBLE
{
  return self->_requestsBLE;
}

- (unint64_t)requestsOther
{
  return self->_requestsOther;
}

- (unint64_t)requestsBLEScan
{
  return self->_requestsBLEScan;
}

- (unint64_t)requestsMSS
{
  return self->_requestsMSS;
}

- (unint64_t)requestsPARK
{
  return self->_requestsPARK;
}

- (unint64_t)beaconLostCnt
{
  return self->_beaconLostCnt;
}

- (unint64_t)timeTillResumeAccumulatedMsec
{
  return self->_timeTillResumeAccumulatedMsec;
}

- (unint64_t)resumeTimeAccumulatedMsec
{
  return self->_resumeTimeAccumulatedMsec;
}

- (unint64_t)envelopeLowToHighAccumulatedMsec
{
  return self->_envelopeLowToHighAccumulatedMsec;
}

- (unint64_t)scoReservedSlotDenyCount
{
  return self->_scoReservedSlotDenyCount;
}

- (unint64_t)scoRetransmission1DenyCount
{
  return self->_scoRetransmission1DenyCount;
}

- (unint64_t)scoRetransmission2DenyCount
{
  return self->_scoRetransmission2DenyCount;
}

- (unint64_t)guardTimeMicroseconds
{
  return self->_guardTimeMicroseconds;
}

- (unint64_t)psRequestTxCnt
{
  return self->_psRequestTxCnt;
}

- (unint64_t)txCTS2Self
{
  return self->_txCTS2Self;
}

@end
