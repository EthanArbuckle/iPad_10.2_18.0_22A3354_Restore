@implementation AWDWRMWiFiCallingEnd

- (void)dealloc
{
  objc_super v3;

  -[AWDWRMWiFiCallingEnd setWRMRecommendedRAT:](self, "setWRMRecommendedRAT:", 0);
  -[AWDWRMWiFiCallingEnd setCallId:](self, "setCallId:", 0);
  -[AWDWRMWiFiCallingEnd setCallEndReason:](self, "setCallEndReason:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMWiFiCallingEnd;
  -[AWDWRMWiFiCallingEnd dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setWiFiRSSI:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_wiFiRSSI = a3;
}

- (void)setHasWiFiRSSI:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasWiFiRSSI
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setWiFiTxPER:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_wiFiTxPER = a3;
}

- (void)setHasWiFiTxPER:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasWiFiTxPER
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setWiFiSINR:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_wiFiSINR = a3;
}

- (void)setHasWiFiSINR:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasWiFiSINR
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setWiFiBSSIDChange:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_wiFiBSSIDChange = a3;
}

- (void)setHasWiFiBSSIDChange:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasWiFiBSSIDChange
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setBeaconRate:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_beaconRate = a3;
}

- (void)setHasBeaconRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasBeaconRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCaptiveNetwork:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_captiveNetwork = a3;
}

- (void)setHasCaptiveNetwork:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasCaptiveNetwork
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setWOWEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_wOWEnabled = a3;
}

- (void)setHasWOWEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasWOWEnabled
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setWiFiRxRetry:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_wiFiRxRetry = a3;
}

- (void)setHasWiFiRxRetry:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasWiFiRxRetry
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLTEDataLQM:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_lTEDataLQM = a3;
}

- (void)setHasLTEDataLQM:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasLTEDataLQM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setLTETxPower:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_lTETxPower = a3;
}

- (void)setHasLTETxPower:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasLTETxPower
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setLTEQoSAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_lTEQoSAvailable = a3;
}

- (void)setHasLTEQoSAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasLTEQoSAvailable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setBSSLoad:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_bSSLoad = a3;
}

- (void)setHasBSSLoad:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasBSSLoad
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setLTEVoiceLQM:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_lTEVoiceLQM = a3;
}

- (void)setHasLTEVoiceLQM:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasLTEVoiceLQM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setLTESINR:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_lTESINR = a3;
}

- (void)setHasLTESINR:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasLTESINR
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLTERSRP:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_lTERSRP = a3;
}

- (void)setHasLTERSRP:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasLTERSRP
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLTECTRSRP:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_lTECTRSRP = a3;
}

- (void)setHasLTECTRSRP:(BOOL)a3
{
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasLTECTRSRP
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSignalBar:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_signalBar = a3;
}

- (void)setHasSignalBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSignalBar
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLatteNominalJitterBufferSize:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_latteNominalJitterBufferSize = a3;
}

- (void)setHasLatteNominalJitterBufferSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasLatteNominalJitterBufferSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setLatteDejitterBufferUnderflow:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_latteDejitterBufferUnderflow = a3;
}

- (void)setHasLatteDejitterBufferUnderflow:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasLatteDejitterBufferUnderflow
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setLatteRTPPacketLoss:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_latteRTPPacketLoss = a3;
}

- (void)setHasLatteRTPPacketLoss:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasLatteRTPPacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setLatteErasures:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_latteErasures = a3;
}

- (void)setHasLatteErasures:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasLatteErasures
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHOCapability:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_hOCapability = a3;
}

- (void)setHasHOCapability:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasHOCapability
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHOBool:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_hOBool = a3;
}

- (void)setHasHOBool:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasHOBool
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasWRMRecommendedRAT
{
  return self->_wRMRecommendedRAT != 0;
}

- (void)setIWLANStatus:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_iWLANStatus = a3;
}

- (void)setHasIWLANStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIWLANStatus
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (BOOL)hasCallId
{
  return self->_callId != 0;
}

- (void)setSessionId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_sessionId = a3;
}

- (void)setHasSessionId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSessionId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIPSecTunnelStatus:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_iPSecTunnelStatus = a3;
}

- (void)setHasIPSecTunnelStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIPSecTunnelStatus
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasCallEndReason
{
  return self->_callEndReason != 0;
}

- (void)setATMRegistrationState:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_aTMRegistrationState = a3;
}

- (void)setHasATMRegistrationState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasATMRegistrationState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setBBAudioPacketLoss:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_bBAudioPacketLoss = a3;
}

- (void)setHasBBAudioPacketLoss:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasBBAudioPacketLoss
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setBBAudioErasures:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_bBAudioErasures = a3;
}

- (void)setHasBBAudioErasures:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasBBAudioErasures
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setWiFiPreferred:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_wiFiPreferred = a3;
}

- (void)setHasWiFiPreferred:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasWiFiPreferred
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setServingCellRAT:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_servingCellRAT = a3;
}

- (void)setHasServingCellRAT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasServingCellRAT
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setServingCellSINR:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_servingCellSINR = a3;
}

- (void)setHasServingCellSINR:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasServingCellSINR
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setServingCellRSRP:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_servingCellRSRP = a3;
}

- (void)setHasServingCellRSRP:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasServingCellRSRP
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWRMWiFiCallingEnd;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWRMWiFiCallingEnd description](&v3, sel_description), -[AWDWRMWiFiCallingEnd dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $E13B6317796A15400D7522EDCFAEA1D1 has;
  NSString *wRMRecommendedRAT;
  NSString *callId;
  $E13B6317796A15400D7522EDCFAEA1D1 v7;
  NSString *callEndReason;
  $E13B6317796A15400D7522EDCFAEA1D1 v9;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_wiFiRSSI), CFSTR("WiFi_RSSI"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wiFiTxPER), CFSTR("WiFi_TxPER"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_6;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_wiFiSINR), CFSTR("WiFi_SINR"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wiFiBSSIDChange), CFSTR("WiFi_BSSID_Change"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_beaconRate), CFSTR("Beacon_Rate"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_captiveNetwork), CFSTR("Captive_Network"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_10;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wOWEnabled), CFSTR("WOW_Enabled"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wiFiRxRetry), CFSTR("WiFi_RxRetry"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_lTEDataLQM), CFSTR("LTE_Data_LQM"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_13;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lTETxPower), CFSTR("LTE_Tx_Power"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_lTEQoSAvailable), CFSTR("LTE_QoS_Available"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bSSLoad), CFSTR("BSS_Load"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_lTEVoiceLQM), CFSTR("LTE_Voice_LQM"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_lTESINR), CFSTR("LTE_SINR"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_18;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lTERSRP), CFSTR("LTE_RSRP"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lTECTRSRP), CFSTR("LTE_CT_RSRP"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_signalBar), CFSTR("Signal_bar"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_latteNominalJitterBufferSize), CFSTR("Latte_Nominal_Jitter_Buffer_Size"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_latteDejitterBufferUnderflow), CFSTR("Latte_Dejitter_Buffer_Underflow"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_latteRTPPacketLoss), CFSTR("Latte_RTP_Packet_Loss"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_latteErasures), CFSTR("Latte_Erasures"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hOCapability), CFSTR("HO_Capability"));
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
LABEL_25:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hOBool), CFSTR("HO_Bool"));
LABEL_26:
  wRMRecommendedRAT = self->_wRMRecommendedRAT;
  if (wRMRecommendedRAT)
    objc_msgSend(v3, "setObject:forKey:", wRMRecommendedRAT, CFSTR("WRM_Recommended_RAT"));
  if ((*((_BYTE *)&self->_has + 3) & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iWLANStatus), CFSTR("iWLAN_Status"));
  callId = self->_callId;
  if (callId)
    objc_msgSend(v3, "setObject:forKey:", callId, CFSTR("call_id"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sessionId), CFSTR("session_id"));
    v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x10000000) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iPSecTunnelStatus), CFSTR("IPSec_Tunnel_status"));
  callEndReason = self->_callEndReason;
  if (callEndReason)
    objc_msgSend(v3, "setObject:forKey:", callEndReason, CFSTR("Call_End_Reason"));
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_aTMRegistrationState), CFSTR("ATM_Registration_State"));
    v9 = self->_has;
    if ((*(_BYTE *)&v9 & 0x80) == 0)
    {
LABEL_40:
      if ((*(_BYTE *)&v9 & 0x40) == 0)
        goto LABEL_41;
      goto LABEL_73;
    }
  }
  else if ((*(_BYTE *)&v9 & 0x80) == 0)
  {
    goto LABEL_40;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bBAudioPacketLoss), CFSTR("BB_Audio_Packet_Loss"));
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x40) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&v9 & 0x200000000) == 0)
      goto LABEL_42;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bBAudioErasures), CFSTR("BB_Audio_Erasures"));
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x200000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v9 & 0x80000) == 0)
      goto LABEL_43;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wiFiPreferred), CFSTR("WiFi_Preferred"));
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v9 & 0x100000) == 0)
      goto LABEL_44;
LABEL_76:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_servingCellSINR), CFSTR("ServingCell_SINR"));
    if ((*(_QWORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_45;
  }
LABEL_75:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_servingCellRAT), CFSTR("ServingCell_RAT"));
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) != 0)
    goto LABEL_76;
LABEL_44:
  if ((*(_BYTE *)&v9 & 4) != 0)
LABEL_45:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_servingCellRSRP), CFSTR("ServingCell_RSRP"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMWiFiCallingEndReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E13B6317796A15400D7522EDCFAEA1D1 has;
  $E13B6317796A15400D7522EDCFAEA1D1 v5;
  $E13B6317796A15400D7522EDCFAEA1D1 v6;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_6;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteSint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_10;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteSint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteSint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteSint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteSint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteSint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
LABEL_25:
    PBDataWriterWriteUint32Field();
LABEL_26:
  if (self->_wRMRecommendedRAT)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 3) & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_callId)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = self->_has;
  }
  if ((*(_DWORD *)&v5 & 0x10000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_callEndReason)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 0x80) == 0)
    {
LABEL_40:
      if ((*(_BYTE *)&v6 & 0x40) == 0)
        goto LABEL_41;
      goto LABEL_72;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&v6 & 0x200000000) == 0)
      goto LABEL_42;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x200000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_43;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_44;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v6 & 4) == 0)
      return;
LABEL_76:
    PBDataWriterWriteSint64Field();
    return;
  }
LABEL_75:
  PBDataWriterWriteSint32Field();
  if ((*(_QWORD *)&self->_has & 4) != 0)
    goto LABEL_76;
}

- (void)copyTo:(id)a3
{
  $E13B6317796A15400D7522EDCFAEA1D1 has;
  $E13B6317796A15400D7522EDCFAEA1D1 v6;
  $E13B6317796A15400D7522EDCFAEA1D1 v7;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *(_QWORD *)((char *)a3 + 172) |= 8uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 5) = self->_wiFiRSSI;
  *(_QWORD *)((char *)a3 + 172) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 39) = self->_wiFiTxPER;
  *(_QWORD *)((char *)a3 + 172) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_6;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)a3 + 6) = self->_wiFiSINR;
  *(_QWORD *)((char *)a3 + 172) |= 0x20uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_52;
  }
LABEL_51:
  *((_BYTE *)a3 + 167) = self->_wiFiBSSIDChange;
  *(_QWORD *)((char *)a3 + 172) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 17) = self->_beaconRate;
  *(_QWORD *)((char *)a3 + 172) |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_54;
  }
LABEL_53:
  *((_BYTE *)a3 + 161) = self->_captiveNetwork;
  *(_QWORD *)((char *)a3 + 172) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_10;
    goto LABEL_55;
  }
LABEL_54:
  *((_BYTE *)a3 + 166) = self->_wOWEnabled;
  *(_QWORD *)((char *)a3 + 172) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 38) = self->_wiFiRxRetry;
  *(_QWORD *)((char *)a3 + 172) |= 0x800000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 23) = self->_lTEDataLQM;
  *(_QWORD *)((char *)a3 + 172) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_13;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 25) = self->_lTETxPower;
  *(_QWORD *)((char *)a3 + 172) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_59;
  }
LABEL_58:
  *((_BYTE *)a3 + 165) = self->_lTEQoSAvailable;
  *(_QWORD *)((char *)a3 + 172) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 16) = self->_bSSLoad;
  *(_QWORD *)((char *)a3 + 172) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 26) = self->_lTEVoiceLQM;
  *(_QWORD *)((char *)a3 + 172) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 24) = self->_lTESINR;
  *(_QWORD *)((char *)a3 + 172) |= 0x1000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_18;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)a3 + 2) = self->_lTERSRP;
  *(_QWORD *)((char *)a3 + 172) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)a3 + 1) = self->_lTECTRSRP;
  *(_QWORD *)((char *)a3 + 172) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 34) = self->_signalBar;
  *(_QWORD *)((char *)a3 + 172) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 29) = self->_latteNominalJitterBufferSize;
  *(_QWORD *)((char *)a3 + 172) |= 0x20000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 27) = self->_latteDejitterBufferUnderflow;
  *(_QWORD *)((char *)a3 + 172) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 30) = self->_latteRTPPacketLoss;
  *(_QWORD *)((char *)a3 + 172) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 28) = self->_latteErasures;
  *(_QWORD *)((char *)a3 + 172) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_69:
  *((_BYTE *)a3 + 162) = self->_hOCapability;
  *(_QWORD *)((char *)a3 + 172) |= 0x8000000uLL;
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
  {
LABEL_25:
    *((_DWORD *)a3 + 22) = self->_hOBool;
    *(_QWORD *)((char *)a3 + 172) |= 0x400uLL;
  }
LABEL_26:
  if (self->_wRMRecommendedRAT)
    objc_msgSend(a3, "setWRMRecommendedRAT:");
  if ((*((_BYTE *)&self->_has + 3) & 0x20) != 0)
  {
    *((_BYTE *)a3 + 164) = self->_iWLANStatus;
    *(_QWORD *)((char *)a3 + 172) |= 0x20000000uLL;
  }
  if (self->_callId)
    objc_msgSend(a3, "setCallId:");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) != 0)
  {
    *((_DWORD *)a3 + 33) = self->_sessionId;
    *(_QWORD *)((char *)a3 + 172) |= 0x200000uLL;
    v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x10000000) != 0)
  {
    *((_BYTE *)a3 + 163) = self->_iPSecTunnelStatus;
    *(_QWORD *)((char *)a3 + 172) |= 0x10000000uLL;
  }
  if (self->_callEndReason)
    objc_msgSend(a3, "setCallEndReason:");
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    *((_BYTE *)a3 + 160) = self->_aTMRegistrationState;
    *(_QWORD *)((char *)a3 + 172) |= 0x2000000uLL;
    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 0x80) == 0)
    {
LABEL_40:
      if ((*(_BYTE *)&v7 & 0x40) == 0)
        goto LABEL_41;
      goto LABEL_73;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
    goto LABEL_40;
  }
  *((_DWORD *)a3 + 15) = self->_bBAudioPacketLoss;
  *(_QWORD *)((char *)a3 + 172) |= 0x80uLL;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&v7 & 0x200000000) == 0)
      goto LABEL_42;
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 14) = self->_bBAudioErasures;
  *(_QWORD *)((char *)a3 + 172) |= 0x40uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x200000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
      goto LABEL_43;
    goto LABEL_75;
  }
LABEL_74:
  *((_BYTE *)a3 + 168) = self->_wiFiPreferred;
  *(_QWORD *)((char *)a3 + 172) |= 0x200000000uLL;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_44;
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 31) = self->_servingCellRAT;
  *(_QWORD *)((char *)a3 + 172) |= 0x80000uLL;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v7 & 4) == 0)
      return;
    goto LABEL_45;
  }
LABEL_76:
  *((_DWORD *)a3 + 32) = self->_servingCellSINR;
  *(_QWORD *)((char *)a3 + 172) |= 0x100000uLL;
  if ((*(_QWORD *)&self->_has & 4) == 0)
    return;
LABEL_45:
  *((_QWORD *)a3 + 3) = self->_servingCellRSRP;
  *(_QWORD *)((char *)a3 + 172) |= 4uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $E13B6317796A15400D7522EDCFAEA1D1 has;
  $E13B6317796A15400D7522EDCFAEA1D1 v8;
  $E13B6317796A15400D7522EDCFAEA1D1 v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_QWORD *)(v5 + 172) |= 8uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_43;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 40) = self->_wiFiRSSI;
  *(_QWORD *)(v5 + 172) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 156) = self->_wiFiTxPER;
  *(_QWORD *)(v5 + 172) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_6;
    goto LABEL_45;
  }
LABEL_44:
  *(_QWORD *)(v5 + 48) = self->_wiFiSINR;
  *(_QWORD *)(v5 + 172) |= 0x20uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v5 + 167) = self->_wiFiBSSIDChange;
  *(_QWORD *)(v5 + 172) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 68) = self->_beaconRate;
  *(_QWORD *)(v5 + 172) |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_48;
  }
LABEL_47:
  *(_BYTE *)(v5 + 161) = self->_captiveNetwork;
  *(_QWORD *)(v5 + 172) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_10;
    goto LABEL_49;
  }
LABEL_48:
  *(_BYTE *)(v5 + 166) = self->_wOWEnabled;
  *(_QWORD *)(v5 + 172) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 152) = self->_wiFiRxRetry;
  *(_QWORD *)(v5 + 172) |= 0x800000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 92) = self->_lTEDataLQM;
  *(_QWORD *)(v5 + 172) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_13;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 100) = self->_lTETxPower;
  *(_QWORD *)(v5 + 172) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_53;
  }
LABEL_52:
  *(_BYTE *)(v5 + 165) = self->_lTEQoSAvailable;
  *(_QWORD *)(v5 + 172) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 64) = self->_bSSLoad;
  *(_QWORD *)(v5 + 172) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 104) = self->_lTEVoiceLQM;
  *(_QWORD *)(v5 + 172) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 96) = self->_lTESINR;
  *(_QWORD *)(v5 + 172) |= 0x1000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_18;
    goto LABEL_57;
  }
LABEL_56:
  *(_QWORD *)(v5 + 16) = self->_lTERSRP;
  *(_QWORD *)(v5 + 172) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_58;
  }
LABEL_57:
  *(_QWORD *)(v5 + 8) = self->_lTECTRSRP;
  *(_QWORD *)(v5 + 172) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 136) = self->_signalBar;
  *(_QWORD *)(v5 + 172) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v5 + 116) = self->_latteNominalJitterBufferSize;
  *(_QWORD *)(v5 + 172) |= 0x20000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v5 + 108) = self->_latteDejitterBufferUnderflow;
  *(_QWORD *)(v5 + 172) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v5 + 120) = self->_latteRTPPacketLoss;
  *(_QWORD *)(v5 + 172) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 112) = self->_latteErasures;
  *(_QWORD *)(v5 + 172) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_63:
  *(_BYTE *)(v5 + 162) = self->_hOCapability;
  *(_QWORD *)(v5 + 172) |= 0x8000000uLL;
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
  {
LABEL_25:
    *(_DWORD *)(v5 + 88) = self->_hOBool;
    *(_QWORD *)(v5 + 172) |= 0x400uLL;
  }
LABEL_26:

  *(_QWORD *)(v6 + 144) = -[NSString copyWithZone:](self->_wRMRecommendedRAT, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 3) & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 164) = self->_iWLANStatus;
    *(_QWORD *)(v6 + 172) |= 0x20000000uLL;
  }

  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_callId, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    *(_DWORD *)(v6 + 132) = self->_sessionId;
    *(_QWORD *)(v6 + 172) |= 0x200000uLL;
    v8 = self->_has;
  }
  if ((*(_DWORD *)&v8 & 0x10000000) != 0)
  {
    *(_BYTE *)(v6 + 163) = self->_iPSecTunnelStatus;
    *(_QWORD *)(v6 + 172) |= 0x10000000uLL;
  }

  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_callEndReason, "copyWithZone:", a3);
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) != 0)
  {
    *(_BYTE *)(v6 + 160) = self->_aTMRegistrationState;
    *(_QWORD *)(v6 + 172) |= 0x2000000uLL;
    v9 = self->_has;
    if ((*(_BYTE *)&v9 & 0x80) == 0)
    {
LABEL_34:
      if ((*(_BYTE *)&v9 & 0x40) == 0)
        goto LABEL_35;
      goto LABEL_67;
    }
  }
  else if ((*(_BYTE *)&v9 & 0x80) == 0)
  {
    goto LABEL_34;
  }
  *(_DWORD *)(v6 + 60) = self->_bBAudioPacketLoss;
  *(_QWORD *)(v6 + 172) |= 0x80uLL;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x40) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&v9 & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v6 + 56) = self->_bBAudioErasures;
  *(_QWORD *)(v6 + 172) |= 0x40uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v9 & 0x80000) == 0)
      goto LABEL_37;
    goto LABEL_69;
  }
LABEL_68:
  *(_BYTE *)(v6 + 168) = self->_wiFiPreferred;
  *(_QWORD *)(v6 + 172) |= 0x200000000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v9 & 0x100000) == 0)
      goto LABEL_38;
LABEL_70:
    *(_DWORD *)(v6 + 128) = self->_servingCellSINR;
    *(_QWORD *)(v6 + 172) |= 0x100000uLL;
    if ((*(_QWORD *)&self->_has & 4) == 0)
      return (id)v6;
    goto LABEL_39;
  }
LABEL_69:
  *(_DWORD *)(v6 + 124) = self->_servingCellRAT;
  *(_QWORD *)(v6 + 172) |= 0x80000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) != 0)
    goto LABEL_70;
LABEL_38:
  if ((*(_BYTE *)&v9 & 4) != 0)
  {
LABEL_39:
    *(_QWORD *)(v6 + 24) = self->_servingCellRSRP;
    *(_QWORD *)(v6 + 172) |= 4uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $E13B6317796A15400D7522EDCFAEA1D1 has;
  uint64_t v7;
  NSString *wRMRecommendedRAT;
  uint64_t v9;
  NSString *callId;
  uint64_t v11;
  NSString *callEndReason;
  uint64_t v13;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *(_QWORD *)((char *)a3 + 172);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
      goto LABEL_207;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_wiFiRSSI != *((_QWORD *)a3 + 5))
      goto LABEL_207;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_wiFiTxPER != *((_DWORD *)a3 + 39))
      goto LABEL_207;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_wiFiSINR != *((_QWORD *)a3 + 6))
      goto LABEL_207;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0)
      goto LABEL_207;
    if (self->_wiFiBSSIDChange)
    {
      if (!*((_BYTE *)a3 + 167))
        goto LABEL_207;
    }
    else if (*((_BYTE *)a3 + 167))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_beaconRate != *((_DWORD *)a3 + 17))
      goto LABEL_207;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0)
      goto LABEL_207;
    if (self->_captiveNetwork)
    {
      if (!*((_BYTE *)a3 + 161))
        goto LABEL_207;
    }
    else if (*((_BYTE *)a3 + 161))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0)
      goto LABEL_207;
    if (self->_wOWEnabled)
    {
      if (!*((_BYTE *)a3 + 166))
        goto LABEL_207;
    }
    else if (*((_BYTE *)a3 + 166))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_wiFiRxRetry != *((_DWORD *)a3 + 38))
      goto LABEL_207;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_lTEDataLQM != *((_DWORD *)a3 + 23))
      goto LABEL_207;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_lTETxPower != *((_DWORD *)a3 + 25))
      goto LABEL_207;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0)
      goto LABEL_207;
    if (self->_lTEQoSAvailable)
    {
      if (!*((_BYTE *)a3 + 165))
        goto LABEL_207;
    }
    else if (*((_BYTE *)a3 + 165))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_bSSLoad != *((_DWORD *)a3 + 16))
      goto LABEL_207;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_lTEVoiceLQM != *((_DWORD *)a3 + 26))
      goto LABEL_207;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_lTESINR != *((_DWORD *)a3 + 24))
      goto LABEL_207;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_lTERSRP != *((_QWORD *)a3 + 2))
      goto LABEL_207;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_lTECTRSRP != *((_QWORD *)a3 + 1))
      goto LABEL_207;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_signalBar != *((_DWORD *)a3 + 34))
      goto LABEL_207;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_latteNominalJitterBufferSize != *((_DWORD *)a3 + 29))
      goto LABEL_207;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_latteDejitterBufferUnderflow != *((_DWORD *)a3 + 27))
      goto LABEL_207;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_latteRTPPacketLoss != *((_DWORD *)a3 + 30))
      goto LABEL_207;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_latteErasures != *((_DWORD *)a3 + 28))
      goto LABEL_207;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0)
      goto LABEL_207;
    if (self->_hOCapability)
    {
      if (!*((_BYTE *)a3 + 162))
        goto LABEL_207;
    }
    else if (*((_BYTE *)a3 + 162))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_hOBool != *((_DWORD *)a3 + 22))
      goto LABEL_207;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_207;
  }
  wRMRecommendedRAT = self->_wRMRecommendedRAT;
  if ((unint64_t)wRMRecommendedRAT | *((_QWORD *)a3 + 18))
  {
    v5 = -[NSString isEqual:](wRMRecommendedRAT, "isEqual:");
    if (!v5)
      return v5;
    has = self->_has;
  }
  v9 = *(_QWORD *)((char *)a3 + 172);
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v9 & 0x20000000) == 0)
      goto LABEL_207;
    if (self->_iWLANStatus)
    {
      if (!*((_BYTE *)a3 + 164))
        goto LABEL_207;
    }
    else if (*((_BYTE *)a3 + 164))
    {
      goto LABEL_207;
    }
  }
  else if ((v9 & 0x20000000) != 0)
  {
    goto LABEL_207;
  }
  callId = self->_callId;
  if ((unint64_t)callId | *((_QWORD *)a3 + 10))
  {
    v5 = -[NSString isEqual:](callId, "isEqual:");
    if (!v5)
      return v5;
    has = self->_has;
  }
  v11 = *(_QWORD *)((char *)a3 + 172);
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v11 & 0x200000) == 0 || self->_sessionId != *((_DWORD *)a3 + 33))
      goto LABEL_207;
  }
  else if ((v11 & 0x200000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v11 & 0x10000000) == 0)
      goto LABEL_207;
    if (self->_iPSecTunnelStatus)
    {
      if (!*((_BYTE *)a3 + 163))
        goto LABEL_207;
    }
    else if (*((_BYTE *)a3 + 163))
    {
      goto LABEL_207;
    }
  }
  else if ((v11 & 0x10000000) != 0)
  {
    goto LABEL_207;
  }
  callEndReason = self->_callEndReason;
  if ((unint64_t)callEndReason | *((_QWORD *)a3 + 9))
  {
    v5 = -[NSString isEqual:](callEndReason, "isEqual:");
    if (!v5)
      return v5;
    has = self->_has;
  }
  v13 = *(_QWORD *)((char *)a3 + 172);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v13 & 0x2000000) == 0)
      goto LABEL_207;
    if (self->_aTMRegistrationState)
    {
      if (!*((_BYTE *)a3 + 160))
        goto LABEL_207;
    }
    else if (*((_BYTE *)a3 + 160))
    {
      goto LABEL_207;
    }
  }
  else if ((v13 & 0x2000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_bBAudioPacketLoss != *((_DWORD *)a3 + 15))
      goto LABEL_207;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_bBAudioErasures != *((_DWORD *)a3 + 14))
      goto LABEL_207;
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
    if ((v13 & 0x200000000) != 0)
      goto LABEL_207;
    goto LABEL_193;
  }
  if ((v13 & 0x200000000) == 0)
    goto LABEL_207;
  if (self->_wiFiPreferred)
  {
    if (!*((_BYTE *)a3 + 168))
      goto LABEL_207;
    goto LABEL_193;
  }
  if (*((_BYTE *)a3 + 168))
  {
LABEL_207:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_193:
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v13 & 0x80000) == 0 || self->_servingCellRAT != *((_DWORD *)a3 + 31))
      goto LABEL_207;
  }
  else if ((v13 & 0x80000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v13 & 0x100000) == 0 || self->_servingCellSINR != *((_DWORD *)a3 + 32))
      goto LABEL_207;
  }
  else if ((v13 & 0x100000) != 0)
  {
    goto LABEL_207;
  }
  LOBYTE(v5) = (*(_QWORD *)((_BYTE *)a3 + 172) & 4) == 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_servingCellRSRP != *((_QWORD *)a3 + 3))
      goto LABEL_207;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $E13B6317796A15400D7522EDCFAEA1D1 has;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  $E13B6317796A15400D7522EDCFAEA1D1 v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  $E13B6317796A15400D7522EDCFAEA1D1 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  unint64_t v43;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v43 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
LABEL_3:
      v42 = 2654435761 * self->_wiFiRSSI;
      if ((*(_DWORD *)&has & 0x1000000) != 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else
  {
    v43 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_3;
  }
  v42 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_4:
    v41 = 2654435761 * self->_wiFiTxPER;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  v41 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_5:
    v40 = 2654435761 * self->_wiFiSINR;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  v40 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_6:
    v39 = 2654435761 * self->_wiFiBSSIDChange;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  v39 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_7:
    v38 = 2654435761 * self->_beaconRate;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  v38 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_8:
    v37 = 2654435761 * self->_captiveNetwork;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  v37 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_9:
    v36 = 2654435761 * self->_wOWEnabled;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_10:
    v35 = 2654435761 * self->_wiFiRxRetry;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  v35 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    v34 = 2654435761 * self->_lTEDataLQM;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  v34 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_12:
    v33 = 2654435761 * self->_lTETxPower;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_13:
    v32 = 2654435761 * self->_lTEQoSAvailable;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  v32 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_14:
    v31 = 2654435761 * self->_bSSLoad;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  v31 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_15:
    v30 = 2654435761 * self->_lTEVoiceLQM;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  v30 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_16:
    v29 = 2654435761 * self->_lTESINR;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  v29 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_17:
    v28 = 2654435761 * self->_lTERSRP;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  v28 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_18:
    v27 = 2654435761 * self->_lTECTRSRP;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  v27 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_19:
    v26 = 2654435761 * self->_signalBar;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_20:
    v25 = 2654435761 * self->_latteNominalJitterBufferSize;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  v25 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_21:
    v24 = 2654435761 * self->_latteDejitterBufferUnderflow;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_22:
    v23 = 2654435761 * self->_latteRTPPacketLoss;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_23:
    v22 = 2654435761 * self->_latteErasures;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_24;
LABEL_48:
    v4 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_47:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
    goto LABEL_48;
LABEL_24:
  v4 = 2654435761 * self->_hOCapability;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_25:
    v5 = 2654435761 * self->_hOBool;
    goto LABEL_50;
  }
LABEL_49:
  v5 = 0;
LABEL_50:
  v6 = -[NSString hash](self->_wRMRecommendedRAT, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 0x20) != 0)
    v7 = 2654435761 * self->_iWLANStatus;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_callId, "hash");
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) != 0)
  {
    v10 = 2654435761 * self->_sessionId;
    if ((*(_DWORD *)&v9 & 0x10000000) != 0)
      goto LABEL_55;
  }
  else
  {
    v10 = 0;
    if ((*(_DWORD *)&v9 & 0x10000000) != 0)
    {
LABEL_55:
      v11 = 2654435761 * self->_iPSecTunnelStatus;
      goto LABEL_58;
    }
  }
  v11 = 0;
LABEL_58:
  v12 = -[NSString hash](self->_callEndReason, "hash");
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) != 0)
  {
    v14 = 2654435761 * self->_aTMRegistrationState;
    if ((*(_BYTE *)&v13 & 0x80) != 0)
    {
LABEL_60:
      v15 = 2654435761 * self->_bBAudioPacketLoss;
      if ((*(_BYTE *)&v13 & 0x40) != 0)
        goto LABEL_61;
      goto LABEL_68;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_BYTE *)&v13 & 0x80) != 0)
      goto LABEL_60;
  }
  v15 = 0;
  if ((*(_BYTE *)&v13 & 0x40) != 0)
  {
LABEL_61:
    v16 = 2654435761 * self->_bBAudioErasures;
    if ((*(_QWORD *)&v13 & 0x200000000) != 0)
      goto LABEL_62;
    goto LABEL_69;
  }
LABEL_68:
  v16 = 0;
  if ((*(_QWORD *)&v13 & 0x200000000) != 0)
  {
LABEL_62:
    v17 = 2654435761 * self->_wiFiPreferred;
    if ((*(_DWORD *)&v13 & 0x80000) != 0)
      goto LABEL_63;
    goto LABEL_70;
  }
LABEL_69:
  v17 = 0;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
LABEL_63:
    v18 = 2654435761 * self->_servingCellRAT;
    if ((*(_DWORD *)&v13 & 0x100000) != 0)
      goto LABEL_64;
LABEL_71:
    v19 = 0;
    if ((*(_BYTE *)&v13 & 4) != 0)
      goto LABEL_65;
LABEL_72:
    v20 = 0;
    return v42 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v7 ^ v6 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
  }
LABEL_70:
  v18 = 0;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
    goto LABEL_71;
LABEL_64:
  v19 = 2654435761 * self->_servingCellSINR;
  if ((*(_BYTE *)&v13 & 4) == 0)
    goto LABEL_72;
LABEL_65:
  v20 = 2654435761 * self->_servingCellRSRP;
  return v42 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v7 ^ v6 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_QWORD *)&self->_has |= 8uLL;
    v5 = *(_QWORD *)((char *)a3 + 172);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_49;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_wiFiRSSI = *((_QWORD *)a3 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_49:
  self->_wiFiTxPER = *((_DWORD *)a3 + 39);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_6;
    goto LABEL_51;
  }
LABEL_50:
  self->_wiFiSINR = *((_QWORD *)a3 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_52;
  }
LABEL_51:
  self->_wiFiBSSIDChange = *((_BYTE *)a3 + 167);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_53;
  }
LABEL_52:
  self->_beaconRate = *((_DWORD *)a3 + 17);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_54;
  }
LABEL_53:
  self->_captiveNetwork = *((_BYTE *)a3 + 161);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x800000) == 0)
      goto LABEL_10;
    goto LABEL_55;
  }
LABEL_54:
  self->_wOWEnabled = *((_BYTE *)a3 + 166);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x800000) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_56;
  }
LABEL_55:
  self->_wiFiRxRetry = *((_DWORD *)a3 + 38);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_57;
  }
LABEL_56:
  self->_lTEDataLQM = *((_DWORD *)a3 + 23);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x2000) == 0)
  {
LABEL_12:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_13;
    goto LABEL_58;
  }
LABEL_57:
  self->_lTETxPower = *((_DWORD *)a3 + 25);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_59;
  }
LABEL_58:
  self->_lTEQoSAvailable = *((_BYTE *)a3 + 165);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_60;
  }
LABEL_59:
  self->_bSSLoad = *((_DWORD *)a3 + 16);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x4000) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_61;
  }
LABEL_60:
  self->_lTEVoiceLQM = *((_DWORD *)a3 + 26);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x1000) == 0)
  {
LABEL_16:
    if ((v5 & 2) == 0)
      goto LABEL_17;
    goto LABEL_62;
  }
LABEL_61:
  self->_lTESINR = *((_DWORD *)a3 + 24);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 2) == 0)
  {
LABEL_17:
    if ((v5 & 1) == 0)
      goto LABEL_18;
    goto LABEL_63;
  }
LABEL_62:
  self->_lTERSRP = *((_QWORD *)a3 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 1) == 0)
  {
LABEL_18:
    if ((v5 & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_64;
  }
LABEL_63:
  self->_lTECTRSRP = *((_QWORD *)a3 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x400000) == 0)
  {
LABEL_19:
    if ((v5 & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_65;
  }
LABEL_64:
  self->_signalBar = *((_DWORD *)a3 + 34);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x20000) == 0)
  {
LABEL_20:
    if ((v5 & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_66;
  }
LABEL_65:
  self->_latteNominalJitterBufferSize = *((_DWORD *)a3 + 29);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x8000) == 0)
  {
LABEL_21:
    if ((v5 & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_67;
  }
LABEL_66:
  self->_latteDejitterBufferUnderflow = *((_DWORD *)a3 + 27);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x40000) == 0)
  {
LABEL_22:
    if ((v5 & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_68;
  }
LABEL_67:
  self->_latteRTPPacketLoss = *((_DWORD *)a3 + 30);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x10000) == 0)
  {
LABEL_23:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_69;
  }
LABEL_68:
  self->_latteErasures = *((_DWORD *)a3 + 28);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *(_QWORD *)((char *)a3 + 172);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_69:
  self->_hOCapability = *((_BYTE *)a3 + 162);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  if ((*(_QWORD *)((_BYTE *)a3 + 172) & 0x400) != 0)
  {
LABEL_25:
    self->_hOBool = *((_DWORD *)a3 + 22);
    *(_QWORD *)&self->_has |= 0x400uLL;
  }
LABEL_26:
  if (*((_QWORD *)a3 + 18))
    -[AWDWRMWiFiCallingEnd setWRMRecommendedRAT:](self, "setWRMRecommendedRAT:");
  if ((*((_BYTE *)a3 + 175) & 0x20) != 0)
  {
    self->_iWLANStatus = *((_BYTE *)a3 + 164);
    *(_QWORD *)&self->_has |= 0x20000000uLL;
  }
  if (*((_QWORD *)a3 + 10))
    -[AWDWRMWiFiCallingEnd setCallId:](self, "setCallId:");
  v6 = *(_QWORD *)((char *)a3 + 172);
  if ((v6 & 0x200000) != 0)
  {
    self->_sessionId = *((_DWORD *)a3 + 33);
    *(_QWORD *)&self->_has |= 0x200000uLL;
    v6 = *(_QWORD *)((char *)a3 + 172);
  }
  if ((v6 & 0x10000000) != 0)
  {
    self->_iPSecTunnelStatus = *((_BYTE *)a3 + 163);
    *(_QWORD *)&self->_has |= 0x10000000uLL;
  }
  if (*((_QWORD *)a3 + 9))
    -[AWDWRMWiFiCallingEnd setCallEndReason:](self, "setCallEndReason:");
  v7 = *(_QWORD *)((char *)a3 + 172);
  if ((v7 & 0x2000000) != 0)
  {
    self->_aTMRegistrationState = *((_BYTE *)a3 + 160);
    *(_QWORD *)&self->_has |= 0x2000000uLL;
    v7 = *(_QWORD *)((char *)a3 + 172);
    if ((v7 & 0x80) == 0)
    {
LABEL_40:
      if ((v7 & 0x40) == 0)
        goto LABEL_41;
      goto LABEL_73;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_40;
  }
  self->_bBAudioPacketLoss = *((_DWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v7 = *(_QWORD *)((char *)a3 + 172);
  if ((v7 & 0x40) == 0)
  {
LABEL_41:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_42;
    goto LABEL_74;
  }
LABEL_73:
  self->_bBAudioErasures = *((_DWORD *)a3 + 14);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v7 = *(_QWORD *)((char *)a3 + 172);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x80000) == 0)
      goto LABEL_43;
    goto LABEL_75;
  }
LABEL_74:
  self->_wiFiPreferred = *((_BYTE *)a3 + 168);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v7 = *(_QWORD *)((char *)a3 + 172);
  if ((v7 & 0x80000) == 0)
  {
LABEL_43:
    if ((v7 & 0x100000) == 0)
      goto LABEL_44;
    goto LABEL_76;
  }
LABEL_75:
  self->_servingCellRAT = *((_DWORD *)a3 + 31);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v7 = *(_QWORD *)((char *)a3 + 172);
  if ((v7 & 0x100000) == 0)
  {
LABEL_44:
    if ((v7 & 4) == 0)
      return;
    goto LABEL_45;
  }
LABEL_76:
  self->_servingCellSINR = *((_DWORD *)a3 + 32);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  if ((*(_QWORD *)((_BYTE *)a3 + 172) & 4) == 0)
    return;
LABEL_45:
  self->_servingCellRSRP = *((_QWORD *)a3 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)wiFiRSSI
{
  return self->_wiFiRSSI;
}

- (unsigned)wiFiTxPER
{
  return self->_wiFiTxPER;
}

- (int64_t)wiFiSINR
{
  return self->_wiFiSINR;
}

- (BOOL)wiFiBSSIDChange
{
  return self->_wiFiBSSIDChange;
}

- (unsigned)beaconRate
{
  return self->_beaconRate;
}

- (BOOL)captiveNetwork
{
  return self->_captiveNetwork;
}

- (BOOL)wOWEnabled
{
  return self->_wOWEnabled;
}

- (unsigned)wiFiRxRetry
{
  return self->_wiFiRxRetry;
}

- (int)lTEDataLQM
{
  return self->_lTEDataLQM;
}

- (unsigned)lTETxPower
{
  return self->_lTETxPower;
}

- (BOOL)lTEQoSAvailable
{
  return self->_lTEQoSAvailable;
}

- (unsigned)bSSLoad
{
  return self->_bSSLoad;
}

- (int)lTEVoiceLQM
{
  return self->_lTEVoiceLQM;
}

- (int)lTESINR
{
  return self->_lTESINR;
}

- (int64_t)lTERSRP
{
  return self->_lTERSRP;
}

- (int64_t)lTECTRSRP
{
  return self->_lTECTRSRP;
}

- (unsigned)signalBar
{
  return self->_signalBar;
}

- (unsigned)latteNominalJitterBufferSize
{
  return self->_latteNominalJitterBufferSize;
}

- (unsigned)latteDejitterBufferUnderflow
{
  return self->_latteDejitterBufferUnderflow;
}

- (unsigned)latteRTPPacketLoss
{
  return self->_latteRTPPacketLoss;
}

- (unsigned)latteErasures
{
  return self->_latteErasures;
}

- (BOOL)hOCapability
{
  return self->_hOCapability;
}

- (unsigned)hOBool
{
  return self->_hOBool;
}

- (NSString)wRMRecommendedRAT
{
  return self->_wRMRecommendedRAT;
}

- (void)setWRMRecommendedRAT:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (BOOL)iWLANStatus
{
  return self->_iWLANStatus;
}

- (NSString)callId
{
  return self->_callId;
}

- (void)setCallId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (unsigned)sessionId
{
  return self->_sessionId;
}

- (BOOL)iPSecTunnelStatus
{
  return self->_iPSecTunnelStatus;
}

- (NSString)callEndReason
{
  return self->_callEndReason;
}

- (void)setCallEndReason:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)aTMRegistrationState
{
  return self->_aTMRegistrationState;
}

- (unsigned)bBAudioPacketLoss
{
  return self->_bBAudioPacketLoss;
}

- (unsigned)bBAudioErasures
{
  return self->_bBAudioErasures;
}

- (BOOL)wiFiPreferred
{
  return self->_wiFiPreferred;
}

- (unsigned)servingCellRAT
{
  return self->_servingCellRAT;
}

- (int)servingCellSINR
{
  return self->_servingCellSINR;
}

- (int64_t)servingCellRSRP
{
  return self->_servingCellRSRP;
}

@end
