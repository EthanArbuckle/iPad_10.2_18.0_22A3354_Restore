@implementation AWDWRMWiFiCell5GData

- (void)dealloc
{
  objc_super v3;

  -[AWDWRMWiFiCell5GData setCellRatType:](self, "setCellRatType:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMWiFiCell5GData;
  -[AWDWRMWiFiCell5GData dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setWifiRssi:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasWifiRssi
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setWifiSnr:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_wifiSnr = a3;
}

- (void)setHasWifiSnr:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiSnr
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setWifiTxPER:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_wifiTxPER = a3;
}

- (void)setHasWifiTxPER:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiTxPER
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setWifiRxRetry:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_wifiRxRetry = a3;
}

- (void)setHasWifiRxRetry:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiRxRetry
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setWifiCca:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_wifiCca = a3;
}

- (void)setHasWifiCca:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasWifiCca
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setWifiQbssLoad:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_wifiQbssLoad = a3;
}

- (void)setHasWifiQbssLoad:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiQbssLoad
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setWifiStationCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_wifiStationCount = a3;
}

- (void)setHasWifiStationCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiStationCount
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setWifPoi:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_wifPoi = a3;
}

- (void)setHasWifPoi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasWifPoi
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setWifiWgtAVGRSSI:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_wifiWgtAVGRSSI = a3;
}

- (void)setHasWifiWgtAVGRSSI:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWgtAVGRSSI
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setWifiWghtAVGSNR:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_wifiWghtAVGSNR = a3;
}

- (void)setHasWifiWghtAVGSNR:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWghtAVGSNR
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setWifiWghtAVGTXPHYRATE:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_wifiWghtAVGTXPHYRATE = a3;
}

- (void)setHasWifiWghtAVGTXPHYRATE:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWghtAVGTXPHYRATE
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setWifiWghtAVGRXPHYRATE:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_wifiWghtAVGRXPHYRATE = a3;
}

- (void)setHasWifiWghtAVGRXPHYRATE:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWghtAVGRXPHYRATE
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setWifiEstThoughtput:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_wifiEstThoughtput = a3;
}

- (void)setHasWifiEstThoughtput:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasWifiEstThoughtput
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setWifiWifiEstThoughtputConfidence:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_wifiWifiEstThoughtputConfidence = a3;
}

- (void)setHasWifiWifiEstThoughtputConfidence:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWifiEstThoughtputConfidence
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (BOOL)hasCellRatType
{
  return self->_cellRatType != 0;
}

- (void)setCellLteRSRP:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_cellLteRSRP = a3;
}

- (void)setHasCellLteRSRP:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCellLteRSRP
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCellLteSNR:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_cellLteSNR = a3;
}

- (void)setHasCellLteSNR:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCellLteSNR
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCellLteRSRQ:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_cellLteRSRQ = a3;
}

- (void)setHasCellLteRSRQ:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCellLteRSRQ
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setCellNrRSRP:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_cellNrRSRP = a3;
}

- (void)setHasCellNrRSRP:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasCellNrRSRP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCellNrRSRQ:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_cellNrRSRQ = a3;
}

- (void)setHasCellNrRSRQ:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasCellNrRSRQ
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCellNrSNR:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_cellNrSNR = a3;
}

- (void)setHasCellNrSNR:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasCellNrSNR
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCellDataLQM:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_cellDataLQM = a3;
}

- (void)setHasCellDataLQM:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasCellDataLQM
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCellRrcState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_cellRrcState = a3;
}

- (void)setHasCellRrcState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasCellRrcState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCellNrFR2active:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_cellNrFR2active = a3;
}

- (void)setHasCellNrFR2active:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCellNrFR2active
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCellLteEstimatedThroughput:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_cellLteEstimatedThroughput = a3;
}

- (void)setHasCellLteEstimatedThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCellLteEstimatedThroughput
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCellNrEstimatedThroughput:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_cellNrEstimatedThroughput = a3;
}

- (void)setHasCellNrEstimatedThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCellNrEstimatedThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCellNsaEnabled:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_cellNsaEnabled = a3;
}

- (void)setHasCellNsaEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasCellNsaEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCellDlBw:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_cellDlBw = a3;
}

- (void)setHasCellDlBw:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasCellDlBw
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCellUlBw:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_cellUlBw = a3;
}

- (void)setHasCellUlBw:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasCellUlBw
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCellMaxDlCaNumConfigured:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_cellMaxDlCaNumConfigured = a3;
}

- (void)setHasCellMaxDlCaNumConfigured:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCellMaxDlCaNumConfigured
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCellMaxUlCaNumConfigured:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_cellMaxUlCaNumConfigured = a3;
}

- (void)setHasCellMaxUlCaNumConfigured:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCellMaxUlCaNumConfigured
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCellEstimatedLoad:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_cellEstimatedLoad = a3;
}

- (void)setHasCellEstimatedLoad:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCellEstimatedLoad
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCellEstimatedBw:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_cellEstimatedBw = a3;
}

- (void)setHasCellEstimatedBw:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasCellEstimatedBw
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRecommendedlink:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_recommendedlink = a3;
}

- (void)setHasRecommendedlink:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasRecommendedlink
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setFr2DBRecommendation:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_fr2DBRecommendation = a3;
}

- (void)setHasFr2DBRecommendation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFr2DBRecommendation
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setLocationDBFR1Count:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_locationDBFR1Count = a3;
}

- (void)setHasLocationDBFR1Count:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasLocationDBFR1Count
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLocationDBFR2Count:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_locationDBFR2Count = a3;
}

- (void)setHasLocationDBFR2Count:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasLocationDBFR2Count
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHighThermalTemperatureNotification:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_highThermalTemperatureNotification = a3;
}

- (void)setHasHighThermalTemperatureNotification:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasHighThermalTemperatureNotification
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setWiFiThroughput:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_wiFiThroughput = a3;
}

- (void)setHasWiFiThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasWiFiThroughput
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setWiFiPredictedThroughput:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_wiFiPredictedThroughput = a3;
}

- (void)setHasWiFiPredictedThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasWiFiPredictedThroughput
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setWRMRecommendationReason:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_wRMRecommendationReason = a3;
}

- (void)setHasWRMRecommendationReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasWRMRecommendationReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setWifiRecommendationScore:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_wifiRecommendationScore = a3;
}

- (void)setHasWifiRecommendationScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiRecommendationScore
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setWifiRecommendationConfidence:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_wifiRecommendationConfidence = a3;
}

- (void)setHasWifiRecommendationConfidence:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiRecommendationConfidence
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setCellularRecommendationScore:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_cellularRecommendationScore = a3;
}

- (void)setHasCellularRecommendationScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasCellularRecommendationScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setCellularRecommendationConfidence:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_cellularRecommendationConfidence = a3;
}

- (void)setHasCellularRecommendationConfidence:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasCellularRecommendationConfidence
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setRadioCoverage:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_radioCoverage = a3;
}

- (void)setHasRadioCoverage:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasRadioCoverage
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setRadioFrequency:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_radioFrequency = a3;
}

- (void)setHasRadioFrequency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasRadioFrequency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTriggerReason:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_triggerReason = a3;
}

- (void)setHasTriggerReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasTriggerReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setApplicationCategory:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_applicationCategory = a3;
}

- (void)setHasApplicationCategory:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasApplicationCategory
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCellTotalMimoLayers:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_cellTotalMimoLayers = a3;
}

- (void)setHasCellTotalMimoLayers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasCellTotalMimoLayers
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTotalNrBandwidth:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_totalNrBandwidth = a3;
}

- (void)setHasTotalNrBandwidth:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasTotalNrBandwidth
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWRMWiFiCell5GData;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWRMWiFiCell5GData description](&v3, sel_description), -[AWDWRMWiFiCell5GData dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has;
  NSString *cellRatType;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x20000000000) == 0)
        goto LABEL_4;
      goto LABEL_59;
    }
  }
  else if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_wifiRssi), CFSTR("wifi_rssi"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiSnr), CFSTR("wifi_snr"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiTxPER), CFSTR("wifi_txPER"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_7;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiRxRetry), CFSTR("wifi_rxRetry"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_8;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiCca), CFSTR("wifi_cca"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_9;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiQbssLoad), CFSTR("wifi_qbssLoad"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_10;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiStationCount), CFSTR("wifi_stationCount"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_11;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifPoi), CFSTR("wif_poi"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_12;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_wifiWgtAVGRSSI), CFSTR("wifi_wgtAVG_RSSI"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_13;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiWghtAVGSNR), CFSTR("wifi_wghtAVG_SNR"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_14;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiWghtAVGTXPHYRATE), CFSTR("wifi_wghtAVG_TX_PHY_RATE"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_15;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiWghtAVGRXPHYRATE), CFSTR("wifi_wghtAVG_RX_PHY_RATE"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiEstThoughtput), CFSTR("wifi_EstThoughtput"));
  if ((*(_QWORD *)&self->_has & 0x1000000000000) != 0)
LABEL_16:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiWifiEstThoughtputConfidence), CFSTR("wifi_wifi_EstThoughtput_confidence"));
LABEL_17:
  cellRatType = self->_cellRatType;
  if (cellRatType)
    objc_msgSend(v3, "setObject:forKey:", cellRatType, CFSTR("cell_ratType"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellLteRSRP), CFSTR("cell_lteRSRP"));
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x100) == 0)
        goto LABEL_22;
      goto LABEL_74;
    }
  }
  else if ((*(_WORD *)&v6 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellLteSNR), CFSTR("cell_lteSNR"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellLteRSRQ), CFSTR("cell_lteRSRQ"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellNrRSRP), CFSTR("cell_nrRSRP"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellNrRSRQ), CFSTR("cell_nrRSRQ"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellNrSNR), CFSTR("cell_nrSNR"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellDataLQM), CFSTR("cell_dataLQM"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellRrcState), CFSTR("cell_rrcState"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellNrFR2active), CFSTR("cell_nrFR2active"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellLteEstimatedThroughput), CFSTR("cell_lteEstimatedThroughput"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellNrEstimatedThroughput), CFSTR("cell_nrEstimatedThroughput"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellNsaEnabled), CFSTR("cell_nsaEnabled"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellDlBw), CFSTR("cell_dl_bw"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellUlBw), CFSTR("cell_ul_bw"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellMaxDlCaNumConfigured), CFSTR("cell_max_dl_ca_num_configured"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellMaxUlCaNumConfigured), CFSTR("cell_max_ul_ca_num_configured"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellEstimatedLoad), CFSTR("cell_estimated_load"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellEstimatedBw), CFSTR("cell_estimated_bw"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&v6 & 0x2000000000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_recommendedlink), CFSTR("recommendedlink"));
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fr2DBRecommendation), CFSTR("fr2DBRecommendation"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_locationDBFR1Count), CFSTR("locationDBFR1Count"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&v6 & 0x4000000000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_locationDBFR2Count), CFSTR("locationDBFR2Count"));
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x4000000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&v6 & 0x100000000) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_highThermalTemperatureNotification), CFSTR("highThermalTemperatureNotification"));
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x100000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
      goto LABEL_44;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wiFiThroughput), CFSTR("WiFiThroughput"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v6 & 0x40000000) == 0)
      goto LABEL_45;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wiFiPredictedThroughput), CFSTR("WiFiPredictedThroughput"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
      goto LABEL_46;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wRMRecommendationReason), CFSTR("WRMRecommendationReason"));
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&v6 & 0x2000000000) == 0)
      goto LABEL_47;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiRecommendationScore), CFSTR("wifiRecommendationScore"));
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x2000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_48;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiRecommendationConfidence), CFSTR("wifiRecommendationConfidence"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellularRecommendationScore), CFSTR("cellularRecommendationScore"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
      goto LABEL_50;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellularRecommendationConfidence), CFSTR("cellularRecommendationConfidence"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0)
      goto LABEL_51;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_radioCoverage), CFSTR("radioCoverage"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
      goto LABEL_52;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_radioFrequency), CFSTR("radioFrequency"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_52:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_53;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_triggerReason), CFSTR("trigger_reason"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_54;
LABEL_106:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cellTotalMimoLayers), CFSTR("cell_total_mimo_layers"));
    if ((*(_QWORD *)&self->_has & 0x10000000) == 0)
      return v3;
    goto LABEL_55;
  }
LABEL_105:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_applicationCategory), CFSTR("applicationCategory"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
    goto LABEL_106;
LABEL_54:
  if ((*(_DWORD *)&v6 & 0x10000000) != 0)
LABEL_55:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalNrBandwidth), CFSTR("total_nr_bandwidth"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMWiFiCell5GDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x20000000000) == 0)
        goto LABEL_4;
      goto LABEL_58;
    }
  }
  else if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_7;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_8;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_9;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_10;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_11;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_12;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteSint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_13;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_14;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_15;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x1000000000000) != 0)
LABEL_16:
    PBDataWriterWriteUint32Field();
LABEL_17:
  if (self->_cellRatType)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x80) != 0)
  {
    PBDataWriterWriteSint32Field();
    v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v5 & 0x100) == 0)
        goto LABEL_22;
      goto LABEL_73;
    }
  }
  else if ((*(_WORD *)&v5 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteSint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v5 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteSint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v5 & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteSint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v5 & 0x10000) == 0)
      goto LABEL_25;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteSint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v5 & 4) == 0)
      goto LABEL_26;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteSint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 4) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v5 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v5 & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v5 & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v5 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v5 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v5 & 8) == 0)
      goto LABEL_32;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v5 & 0x100000) == 0)
      goto LABEL_33;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v5 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v5 & 0x800) == 0)
      goto LABEL_35;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v5 & 0x20) == 0)
      goto LABEL_36;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x20) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v5 & 0x10) == 0)
      goto LABEL_37;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x10) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v5 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x8000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&v5 & 0x2000000000000) == 0)
      goto LABEL_39;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v5 & 0x800000) == 0)
      goto LABEL_40;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0)
      goto LABEL_41;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&v5 & 0x4000000000000) == 0)
      goto LABEL_42;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x4000000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&v5 & 0x100000000) == 0)
      goto LABEL_43;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x100000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v5 & 0x80000000) == 0)
      goto LABEL_44;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v5 & 0x40000000) == 0)
      goto LABEL_45;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&v5 & 0x4000000000) == 0)
      goto LABEL_46;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x4000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&v5 & 0x2000000000) == 0)
      goto LABEL_47;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x2000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v5 & 0x400000) == 0)
      goto LABEL_48;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x400000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v5 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v5 & 0x2000000) == 0)
      goto LABEL_50;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v5 & 0x4000000) == 0)
      goto LABEL_51;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x4000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v5 & 0x20000000) == 0)
      goto LABEL_52;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000000) == 0)
  {
LABEL_52:
    if ((*(_BYTE *)&v5 & 2) == 0)
      goto LABEL_53;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 2) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v5 & 0x80000) == 0)
      goto LABEL_54;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v5 & 0x10000000) == 0)
      return;
LABEL_106:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
    goto LABEL_106;
}

- (void)copyTo:(id)a3
{
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_QWORD *)a3 + 28) |= 1uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x20000000000) == 0)
        goto LABEL_4;
      goto LABEL_59;
    }
  }
  else if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 45) = self->_wifiRssi;
  *((_QWORD *)a3 + 28) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 47) = self->_wifiSnr;
  *((_QWORD *)a3 + 28) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 49) = self->_wifiTxPER;
  *((_QWORD *)a3 + 28) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_7;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 46) = self->_wifiRxRetry;
  *((_QWORD *)a3 + 28) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_8;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 40) = self->_wifiCca;
  *((_QWORD *)a3 + 28) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_9;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)a3 + 42) = self->_wifiQbssLoad;
  *((_QWORD *)a3 + 28) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_10;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 48) = self->_wifiStationCount;
  *((_QWORD *)a3 + 28) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_11;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 39) = self->_wifPoi;
  *((_QWORD *)a3 + 28) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_12;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 53) = self->_wifiWgtAVGRSSI;
  *((_QWORD *)a3 + 28) |= 0x800000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_13;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 51) = self->_wifiWghtAVGSNR;
  *((_QWORD *)a3 + 28) |= 0x200000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_14;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 52) = self->_wifiWghtAVGTXPHYRATE;
  *((_QWORD *)a3 + 28) |= 0x400000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_15;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)a3 + 50) = self->_wifiWghtAVGRXPHYRATE;
  *((_QWORD *)a3 + 28) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_70:
  *((_DWORD *)a3 + 41) = self->_wifiEstThoughtput;
  *((_QWORD *)a3 + 28) |= 0x800000000uLL;
  if ((*(_QWORD *)&self->_has & 0x1000000000000) != 0)
  {
LABEL_16:
    *((_DWORD *)a3 + 54) = self->_wifiWifiEstThoughtputConfidence;
    *((_QWORD *)a3 + 28) |= 0x1000000000000uLL;
  }
LABEL_17:
  if (self->_cellRatType)
    objc_msgSend(a3, "setCellRatType:");
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_cellLteRSRP;
    *((_QWORD *)a3 + 28) |= 0x80uLL;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x100) == 0)
        goto LABEL_22;
      goto LABEL_74;
    }
  }
  else if ((*(_WORD *)&v6 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)a3 + 12) = self->_cellLteSNR;
  *((_QWORD *)a3 + 28) |= 0x200uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 11) = self->_cellLteRSRQ;
  *((_QWORD *)a3 + 28) |= 0x100uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 17) = self->_cellNrRSRP;
  *((_QWORD *)a3 + 28) |= 0x4000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)a3 + 18) = self->_cellNrRSRQ;
  *((_QWORD *)a3 + 28) |= 0x8000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 19) = self->_cellNrSNR;
  *((_QWORD *)a3 + 28) |= 0x10000uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)a3 + 5) = self->_cellDataLQM;
  *((_QWORD *)a3 + 28) |= 4uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)a3 + 24) = self->_cellRrcState;
  *((_QWORD *)a3 + 28) |= 0x40000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)a3 + 16) = self->_cellNrFR2active;
  *((_QWORD *)a3 + 28) |= 0x2000uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)a3 + 9) = self->_cellLteEstimatedThroughput;
  *((_QWORD *)a3 + 28) |= 0x40uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)a3 + 15) = self->_cellNrEstimatedThroughput;
  *((_QWORD *)a3 + 28) |= 0x1000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)a3 + 20) = self->_cellNsaEnabled;
  *((_QWORD *)a3 + 28) |= 0x20000uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)a3 + 6) = self->_cellDlBw;
  *((_QWORD *)a3 + 28) |= 8uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)a3 + 26) = self->_cellUlBw;
  *((_QWORD *)a3 + 28) |= 0x100000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)a3 + 13) = self->_cellMaxDlCaNumConfigured;
  *((_QWORD *)a3 + 28) |= 0x400uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)a3 + 14) = self->_cellMaxUlCaNumConfigured;
  *((_QWORD *)a3 + 28) |= 0x800uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)a3 + 8) = self->_cellEstimatedLoad;
  *((_QWORD *)a3 + 28) |= 0x20uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)a3 + 7) = self->_cellEstimatedBw;
  *((_QWORD *)a3 + 28) |= 0x10uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&v6 & 0x2000000000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)a3 + 33) = self->_recommendedlink;
  *((_QWORD *)a3 + 28) |= 0x8000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  *((_BYTE *)a3 + 220) = self->_fr2DBRecommendation;
  *((_QWORD *)a3 + 28) |= 0x2000000000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)a3 + 29) = self->_locationDBFR1Count;
  *((_QWORD *)a3 + 28) |= 0x800000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&v6 & 0x4000000000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)a3 + 30) = self->_locationDBFR2Count;
  *((_QWORD *)a3 + 28) |= 0x1000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x4000000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&v6 & 0x100000000) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  *((_BYTE *)a3 + 221) = self->_highThermalTemperatureNotification;
  *((_QWORD *)a3 + 28) |= 0x4000000000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x100000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
      goto LABEL_44;
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)a3 + 38) = self->_wiFiThroughput;
  *((_QWORD *)a3 + 28) |= 0x100000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v6 & 0x40000000) == 0)
      goto LABEL_45;
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 37) = self->_wiFiPredictedThroughput;
  *((_QWORD *)a3 + 28) |= 0x80000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
      goto LABEL_46;
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 36) = self->_wRMRecommendationReason;
  *((_QWORD *)a3 + 28) |= 0x40000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&v6 & 0x2000000000) == 0)
      goto LABEL_47;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)a3 + 44) = self->_wifiRecommendationScore;
  *((_QWORD *)a3 + 28) |= 0x4000000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x2000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_48;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)a3 + 43) = self->_wifiRecommendationConfidence;
  *((_QWORD *)a3 + 28) |= 0x2000000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)a3 + 28) = self->_cellularRecommendationScore;
  *((_QWORD *)a3 + 28) |= 0x400000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
      goto LABEL_50;
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)a3 + 27) = self->_cellularRecommendationConfidence;
  *((_QWORD *)a3 + 28) |= 0x200000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0)
      goto LABEL_51;
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)a3 + 31) = self->_radioCoverage;
  *((_QWORD *)a3 + 28) |= 0x2000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
      goto LABEL_52;
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)a3 + 32) = self->_radioFrequency;
  *((_QWORD *)a3 + 28) |= 0x4000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_52:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_53;
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)a3 + 35) = self->_triggerReason;
  *((_QWORD *)a3 + 28) |= 0x20000000uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_54;
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)a3 + 4) = self->_applicationCategory;
  *((_QWORD *)a3 + 28) |= 2uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0)
      return;
    goto LABEL_55;
  }
LABEL_106:
  *((_DWORD *)a3 + 25) = self->_cellTotalMimoLayers;
  *((_QWORD *)a3 + 28) |= 0x80000uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000) == 0)
    return;
LABEL_55:
  *((_DWORD *)a3 + 34) = self->_totalNrBandwidth;
  *((_QWORD *)a3 + 28) |= 0x10000000uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_QWORD *)(v5 + 224) |= 1uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x20000000000) == 0)
        goto LABEL_4;
      goto LABEL_57;
    }
  }
  else if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 180) = self->_wifiRssi;
  *(_QWORD *)(v5 + 224) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v5 + 188) = self->_wifiSnr;
  *(_QWORD *)(v5 + 224) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 196) = self->_wifiTxPER;
  *(_QWORD *)(v5 + 224) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_7;
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v5 + 184) = self->_wifiRxRetry;
  *(_QWORD *)(v5 + 224) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_8;
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v5 + 160) = self->_wifiCca;
  *(_QWORD *)(v5 + 224) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_9;
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v5 + 168) = self->_wifiQbssLoad;
  *(_QWORD *)(v5 + 224) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_10;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 192) = self->_wifiStationCount;
  *(_QWORD *)(v5 + 224) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_11;
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v5 + 156) = self->_wifPoi;
  *(_QWORD *)(v5 + 224) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_12;
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v5 + 212) = self->_wifiWgtAVGRSSI;
  *(_QWORD *)(v5 + 224) |= 0x800000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_13;
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v5 + 204) = self->_wifiWghtAVGSNR;
  *(_QWORD *)(v5 + 224) |= 0x200000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_14;
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v5 + 208) = self->_wifiWghtAVGTXPHYRATE;
  *(_QWORD *)(v5 + 224) |= 0x400000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_15;
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v5 + 200) = self->_wifiWghtAVGRXPHYRATE;
  *(_QWORD *)(v5 + 224) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_68:
  *(_DWORD *)(v5 + 164) = self->_wifiEstThoughtput;
  *(_QWORD *)(v5 + 224) |= 0x800000000uLL;
  if ((*(_QWORD *)&self->_has & 0x1000000000000) != 0)
  {
LABEL_16:
    *(_DWORD *)(v5 + 216) = self->_wifiWifiEstThoughtputConfidence;
    *(_QWORD *)(v5 + 224) |= 0x1000000000000uLL;
  }
LABEL_17:

  *(_QWORD *)(v6 + 88) = -[NSString copyWithZone:](self->_cellRatType, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_cellLteRSRP;
    *(_QWORD *)(v6 + 224) |= 0x80uLL;
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x200) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v8 & 0x100) == 0)
        goto LABEL_20;
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&v8 & 0x200) == 0)
  {
    goto LABEL_19;
  }
  *(_DWORD *)(v6 + 48) = self->_cellLteSNR;
  *(_QWORD *)(v6 + 224) |= 0x200uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v6 + 44) = self->_cellLteRSRQ;
  *(_QWORD *)(v6 + 224) |= 0x100uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v8 & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v6 + 68) = self->_cellNrRSRP;
  *(_QWORD *)(v6 + 224) |= 0x4000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v6 + 72) = self->_cellNrRSRQ;
  *(_QWORD *)(v6 + 224) |= 0x8000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v6 + 76) = self->_cellNrSNR;
  *(_QWORD *)(v6 + 224) |= 0x10000uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v8 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v6 + 20) = self->_cellDataLQM;
  *(_QWORD *)(v6 + 224) |= 4uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v8 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v6 + 96) = self->_cellRrcState;
  *(_QWORD *)(v6 + 224) |= 0x40000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v6 + 64) = self->_cellNrFR2active;
  *(_QWORD *)(v6 + 224) |= 0x2000uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v6 + 36) = self->_cellLteEstimatedThroughput;
  *(_QWORD *)(v6 + 224) |= 0x40uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v8 & 0x20000) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v6 + 60) = self->_cellNrEstimatedThroughput;
  *(_QWORD *)(v6 + 224) |= 0x1000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v8 & 8) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v6 + 80) = self->_cellNsaEnabled;
  *(_QWORD *)(v6 + 224) |= 0x20000uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v8 & 0x100000) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v6 + 24) = self->_cellDlBw;
  *(_QWORD *)(v6 + 224) |= 8uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v8 & 0x400) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v6 + 104) = self->_cellUlBw;
  *(_QWORD *)(v6 + 224) |= 0x100000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v8 & 0x800) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v6 + 52) = self->_cellMaxDlCaNumConfigured;
  *(_QWORD *)(v6 + 224) |= 0x400uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v8 & 0x20) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v6 + 56) = self->_cellMaxUlCaNumConfigured;
  *(_QWORD *)(v6 + 224) |= 0x800uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x20) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v8 & 0x10) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v6 + 32) = self->_cellEstimatedLoad;
  *(_QWORD *)(v6 + 224) |= 0x20uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v6 + 28) = self->_cellEstimatedBw;
  *(_QWORD *)(v6 + 224) |= 0x10uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&v8 & 0x2000000000000) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v6 + 132) = self->_recommendedlink;
  *(_QWORD *)(v6 + 224) |= 0x8000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x2000000000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v8 & 0x800000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  *(_BYTE *)(v6 + 220) = self->_fr2DBRecommendation;
  *(_QWORD *)(v6 + 224) |= 0x2000000000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v6 + 116) = self->_locationDBFR1Count;
  *(_QWORD *)(v6 + 224) |= 0x800000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_39:
    if ((*(_QWORD *)&v8 & 0x4000000000000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v6 + 120) = self->_locationDBFR2Count;
  *(_QWORD *)(v6 + 224) |= 0x1000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x4000000000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&v8 & 0x100000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  *(_BYTE *)(v6 + 221) = self->_highThermalTemperatureNotification;
  *(_QWORD *)(v6 + 224) |= 0x4000000000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x100000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v8 & 0x80000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v6 + 152) = self->_wiFiThroughput;
  *(_QWORD *)(v6 + 224) |= 0x100000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v8 & 0x40000000) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v6 + 148) = self->_wiFiPredictedThroughput;
  *(_QWORD *)(v6 + 224) |= 0x80000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&v8 & 0x4000000000) == 0)
      goto LABEL_44;
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v6 + 144) = self->_wRMRecommendationReason;
  *(_QWORD *)(v6 + 224) |= 0x40000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x4000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&v8 & 0x2000000000) == 0)
      goto LABEL_45;
    goto LABEL_97;
  }
LABEL_96:
  *(_DWORD *)(v6 + 176) = self->_wifiRecommendationScore;
  *(_QWORD *)(v6 + 224) |= 0x4000000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x2000000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
      goto LABEL_46;
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v6 + 172) = self->_wifiRecommendationConfidence;
  *(_QWORD *)(v6 + 224) |= 0x2000000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v8 & 0x200000) == 0)
      goto LABEL_47;
    goto LABEL_99;
  }
LABEL_98:
  *(_DWORD *)(v6 + 112) = self->_cellularRecommendationScore;
  *(_QWORD *)(v6 + 224) |= 0x400000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v8 & 0x2000000) == 0)
      goto LABEL_48;
    goto LABEL_100;
  }
LABEL_99:
  *(_DWORD *)(v6 + 108) = self->_cellularRecommendationConfidence;
  *(_QWORD *)(v6 + 224) |= 0x200000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v8 & 0x4000000) == 0)
      goto LABEL_49;
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v6 + 124) = self->_radioCoverage;
  *(_QWORD *)(v6 + 224) |= 0x2000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v8 & 0x20000000) == 0)
      goto LABEL_50;
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v6 + 128) = self->_radioFrequency;
  *(_QWORD *)(v6 + 224) |= 0x4000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000000) == 0)
  {
LABEL_50:
    if ((*(_BYTE *)&v8 & 2) == 0)
      goto LABEL_51;
    goto LABEL_103;
  }
LABEL_102:
  *(_DWORD *)(v6 + 140) = self->_triggerReason;
  *(_QWORD *)(v6 + 224) |= 0x20000000uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 2) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v8 & 0x80000) == 0)
      goto LABEL_52;
LABEL_104:
    *(_DWORD *)(v6 + 100) = self->_cellTotalMimoLayers;
    *(_QWORD *)(v6 + 224) |= 0x80000uLL;
    if ((*(_QWORD *)&self->_has & 0x10000000) == 0)
      return (id)v6;
    goto LABEL_53;
  }
LABEL_103:
  *(_DWORD *)(v6 + 16) = self->_applicationCategory;
  *(_QWORD *)(v6 + 224) |= 2uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) != 0)
    goto LABEL_104;
LABEL_52:
  if ((*(_DWORD *)&v8 & 0x10000000) != 0)
  {
LABEL_53:
    *(_DWORD *)(v6 + 136) = self->_totalNrBandwidth;
    *(_QWORD *)(v6 + 224) |= 0x10000000uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has;
  uint64_t v7;
  NSString *cellRatType;
  uint64_t v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *((_QWORD *)a3 + 28);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_265;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0 || self->_wifiRssi != *((_DWORD *)a3 + 45))
      goto LABEL_265;
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0 || self->_wifiSnr != *((_DWORD *)a3 + 47))
      goto LABEL_265;
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_wifiTxPER != *((_DWORD *)a3 + 49))
      goto LABEL_265;
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0 || self->_wifiRxRetry != *((_DWORD *)a3 + 46))
      goto LABEL_265;
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_wifiCca != *((_DWORD *)a3 + 40))
      goto LABEL_265;
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0 || self->_wifiQbssLoad != *((_DWORD *)a3 + 42))
      goto LABEL_265;
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0 || self->_wifiStationCount != *((_DWORD *)a3 + 48))
      goto LABEL_265;
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_wifPoi != *((_DWORD *)a3 + 39))
      goto LABEL_265;
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x800000000000) != 0)
  {
    if ((v7 & 0x800000000000) == 0 || self->_wifiWgtAVGRSSI != *((_DWORD *)a3 + 53))
      goto LABEL_265;
  }
  else if ((v7 & 0x800000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0 || self->_wifiWghtAVGSNR != *((_DWORD *)a3 + 51))
      goto LABEL_265;
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x400000000000) != 0)
  {
    if ((v7 & 0x400000000000) == 0 || self->_wifiWghtAVGTXPHYRATE != *((_DWORD *)a3 + 52))
      goto LABEL_265;
  }
  else if ((v7 & 0x400000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x100000000000) != 0)
  {
    if ((v7 & 0x100000000000) == 0 || self->_wifiWghtAVGRXPHYRATE != *((_DWORD *)a3 + 50))
      goto LABEL_265;
  }
  else if ((v7 & 0x100000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_wifiEstThoughtput != *((_DWORD *)a3 + 41))
      goto LABEL_265;
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    if ((v7 & 0x1000000000000) == 0 || self->_wifiWifiEstThoughtputConfidence != *((_DWORD *)a3 + 54))
      goto LABEL_265;
  }
  else if ((v7 & 0x1000000000000) != 0)
  {
    goto LABEL_265;
  }
  cellRatType = self->_cellRatType;
  if ((unint64_t)cellRatType | *((_QWORD *)a3 + 11))
  {
    v5 = -[NSString isEqual:](cellRatType, "isEqual:");
    if (!v5)
      return v5;
    has = self->_has;
  }
  v9 = *((_QWORD *)a3 + 28);
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_cellLteRSRP != *((_DWORD *)a3 + 10))
      goto LABEL_265;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_cellLteSNR != *((_DWORD *)a3 + 12))
      goto LABEL_265;
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_cellLteRSRQ != *((_DWORD *)a3 + 11))
      goto LABEL_265;
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_cellNrRSRP != *((_DWORD *)a3 + 17))
      goto LABEL_265;
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_cellNrRSRQ != *((_DWORD *)a3 + 18))
      goto LABEL_265;
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_cellNrSNR != *((_DWORD *)a3 + 19))
      goto LABEL_265;
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_cellDataLQM != *((_DWORD *)a3 + 5))
      goto LABEL_265;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0 || self->_cellRrcState != *((_DWORD *)a3 + 24))
      goto LABEL_265;
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_cellNrFR2active != *((_DWORD *)a3 + 16))
      goto LABEL_265;
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_cellLteEstimatedThroughput != *((_DWORD *)a3 + 9))
      goto LABEL_265;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_cellNrEstimatedThroughput != *((_DWORD *)a3 + 15))
      goto LABEL_265;
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v9 & 0x20000) == 0 || self->_cellNsaEnabled != *((_DWORD *)a3 + 20))
      goto LABEL_265;
  }
  else if ((v9 & 0x20000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_cellDlBw != *((_DWORD *)a3 + 6))
      goto LABEL_265;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) == 0 || self->_cellUlBw != *((_DWORD *)a3 + 26))
      goto LABEL_265;
  }
  else if ((v9 & 0x100000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_cellMaxDlCaNumConfigured != *((_DWORD *)a3 + 13))
      goto LABEL_265;
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_cellMaxUlCaNumConfigured != *((_DWORD *)a3 + 14))
      goto LABEL_265;
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_cellEstimatedLoad != *((_DWORD *)a3 + 8))
      goto LABEL_265;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_cellEstimatedBw != *((_DWORD *)a3 + 7))
      goto LABEL_265;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v9 & 0x8000000) == 0 || self->_recommendedlink != *((_DWORD *)a3 + 33))
      goto LABEL_265;
  }
  else if ((v9 & 0x8000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x2000000000000) != 0)
  {
    if ((v9 & 0x2000000000000) == 0)
      goto LABEL_265;
    if (self->_fr2DBRecommendation)
    {
      if (!*((_BYTE *)a3 + 220))
        goto LABEL_265;
    }
    else if (*((_BYTE *)a3 + 220))
    {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x2000000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v9 & 0x800000) == 0 || self->_locationDBFR1Count != *((_DWORD *)a3 + 29))
      goto LABEL_265;
  }
  else if ((v9 & 0x800000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v9 & 0x1000000) == 0 || self->_locationDBFR2Count != *((_DWORD *)a3 + 30))
      goto LABEL_265;
  }
  else if ((v9 & 0x1000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x4000000000000) != 0)
  {
    if ((v9 & 0x4000000000000) == 0)
      goto LABEL_265;
    if (self->_highThermalTemperatureNotification)
    {
      if (!*((_BYTE *)a3 + 221))
        goto LABEL_265;
    }
    else if (*((_BYTE *)a3 + 221))
    {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x4000000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v9 & 0x100000000) == 0 || self->_wiFiThroughput != *((_DWORD *)a3 + 38))
      goto LABEL_265;
  }
  else if ((v9 & 0x100000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v9 & 0x80000000) == 0 || self->_wiFiPredictedThroughput != *((_DWORD *)a3 + 37))
      goto LABEL_265;
  }
  else if ((v9 & 0x80000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v9 & 0x40000000) == 0 || self->_wRMRecommendationReason != *((_DWORD *)a3 + 36))
      goto LABEL_265;
  }
  else if ((v9 & 0x40000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v9 & 0x4000000000) == 0 || self->_wifiRecommendationScore != *((_DWORD *)a3 + 44))
      goto LABEL_265;
  }
  else if ((v9 & 0x4000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    if ((v9 & 0x2000000000) == 0 || self->_wifiRecommendationConfidence != *((_DWORD *)a3 + 43))
      goto LABEL_265;
  }
  else if ((v9 & 0x2000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v9 & 0x400000) == 0 || self->_cellularRecommendationScore != *((_DWORD *)a3 + 28))
      goto LABEL_265;
  }
  else if ((v9 & 0x400000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v9 & 0x200000) == 0 || self->_cellularRecommendationConfidence != *((_DWORD *)a3 + 27))
      goto LABEL_265;
  }
  else if ((v9 & 0x200000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v9 & 0x2000000) == 0 || self->_radioCoverage != *((_DWORD *)a3 + 31))
      goto LABEL_265;
  }
  else if ((v9 & 0x2000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v9 & 0x4000000) == 0 || self->_radioFrequency != *((_DWORD *)a3 + 32))
      goto LABEL_265;
  }
  else if ((v9 & 0x4000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v9 & 0x20000000) == 0 || self->_triggerReason != *((_DWORD *)a3 + 35))
      goto LABEL_265;
  }
  else if ((v9 & 0x20000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_applicationCategory != *((_DWORD *)a3 + 4))
      goto LABEL_265;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    if ((v9 & 0x80000) == 0)
      goto LABEL_261;
LABEL_265:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v9 & 0x80000) == 0 || self->_cellTotalMimoLayers != *((_DWORD *)a3 + 25))
    goto LABEL_265;
LABEL_261:
  LOBYTE(v5) = (*((_QWORD *)a3 + 28) & 0x10000000) == 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v9 & 0x10000000) == 0 || self->_totalNrBandwidth != *((_DWORD *)a3 + 34))
      goto LABEL_265;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v4;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  NSUInteger v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v57 = 2654435761u * self->_timestamp;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
    {
LABEL_3:
      v56 = 2654435761 * self->_wifiRssi;
      if ((*(_QWORD *)&has & 0x20000000000) != 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else
  {
    v57 = 0;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_3;
  }
  v56 = 0;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
LABEL_4:
    v55 = 2654435761 * self->_wifiSnr;
    if ((*(_QWORD *)&has & 0x80000000000) != 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v55 = 0;
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
LABEL_5:
    v54 = 2654435761 * self->_wifiTxPER;
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v54 = 0;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
LABEL_6:
    v53 = 2654435761 * self->_wifiRxRetry;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v53 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_7:
    v52 = 2654435761 * self->_wifiCca;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v52 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_8:
    v51 = 2654435761 * self->_wifiQbssLoad;
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  v51 = 0;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
LABEL_9:
    v50 = 2654435761 * self->_wifiStationCount;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  v50 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_10:
    v49 = 2654435761 * self->_wifPoi;
    if ((*(_QWORD *)&has & 0x800000000000) != 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  v49 = 0;
  if ((*(_QWORD *)&has & 0x800000000000) != 0)
  {
LABEL_11:
    v48 = 2654435761 * self->_wifiWgtAVGRSSI;
    if ((*(_QWORD *)&has & 0x200000000000) != 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  v48 = 0;
  if ((*(_QWORD *)&has & 0x200000000000) != 0)
  {
LABEL_12:
    v47 = 2654435761 * self->_wifiWghtAVGSNR;
    if ((*(_QWORD *)&has & 0x400000000000) != 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  v47 = 0;
  if ((*(_QWORD *)&has & 0x400000000000) != 0)
  {
LABEL_13:
    v46 = 2654435761 * self->_wifiWghtAVGTXPHYRATE;
    if ((*(_QWORD *)&has & 0x100000000000) != 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  v46 = 0;
  if ((*(_QWORD *)&has & 0x100000000000) != 0)
  {
LABEL_14:
    v45 = 2654435761 * self->_wifiWghtAVGRXPHYRATE;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_15;
LABEL_30:
    v44 = 0;
    if ((*(_QWORD *)&has & 0x1000000000000) != 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_29:
  v45 = 0;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
    goto LABEL_30;
LABEL_15:
  v44 = 2654435761 * self->_wifiEstThoughtput;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
LABEL_16:
    v43 = 2654435761 * self->_wifiWifiEstThoughtputConfidence;
    goto LABEL_32;
  }
LABEL_31:
  v43 = 0;
LABEL_32:
  v42 = -[NSString hash](self->_cellRatType, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
    v41 = 2654435761 * self->_cellLteRSRP;
    if ((*(_WORD *)&v4 & 0x200) != 0)
    {
LABEL_34:
      v40 = 2654435761 * self->_cellLteSNR;
      if ((*(_WORD *)&v4 & 0x100) != 0)
        goto LABEL_35;
      goto LABEL_71;
    }
  }
  else
  {
    v41 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0)
      goto LABEL_34;
  }
  v40 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_35:
    v39 = 2654435761 * self->_cellLteRSRQ;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_36;
    goto LABEL_72;
  }
LABEL_71:
  v39 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_36:
    v38 = 2654435761 * self->_cellNrRSRP;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
      goto LABEL_37;
    goto LABEL_73;
  }
LABEL_72:
  v38 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_37:
    v37 = 2654435761 * self->_cellNrRSRQ;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
      goto LABEL_38;
    goto LABEL_74;
  }
LABEL_73:
  v37 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_38:
    v36 = 2654435761 * self->_cellNrSNR;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_39;
    goto LABEL_75;
  }
LABEL_74:
  v36 = 0;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_39:
    v35 = 2654435761 * self->_cellDataLQM;
    if ((*(_DWORD *)&v4 & 0x40000) != 0)
      goto LABEL_40;
    goto LABEL_76;
  }
LABEL_75:
  v35 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_40:
    v34 = 2654435761 * self->_cellRrcState;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_41;
    goto LABEL_77;
  }
LABEL_76:
  v34 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_41:
    v33 = 2654435761 * self->_cellNrFR2active;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_42;
    goto LABEL_78;
  }
LABEL_77:
  v33 = 0;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
LABEL_42:
    v32 = 2654435761 * self->_cellLteEstimatedThroughput;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_43;
    goto LABEL_79;
  }
LABEL_78:
  v32 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_43:
    v5 = 2654435761 * self->_cellNrEstimatedThroughput;
    if ((*(_DWORD *)&v4 & 0x20000) != 0)
      goto LABEL_44;
    goto LABEL_80;
  }
LABEL_79:
  v5 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_44:
    v6 = 2654435761 * self->_cellNsaEnabled;
    if ((*(_BYTE *)&v4 & 8) != 0)
      goto LABEL_45;
    goto LABEL_81;
  }
LABEL_80:
  v6 = 0;
  if ((*(_BYTE *)&v4 & 8) != 0)
  {
LABEL_45:
    v7 = 2654435761 * self->_cellDlBw;
    if ((*(_DWORD *)&v4 & 0x100000) != 0)
      goto LABEL_46;
    goto LABEL_82;
  }
LABEL_81:
  v7 = 0;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_46:
    v8 = 2654435761 * self->_cellUlBw;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_47;
    goto LABEL_83;
  }
LABEL_82:
  v8 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_47:
    v9 = 2654435761 * self->_cellMaxDlCaNumConfigured;
    if ((*(_WORD *)&v4 & 0x800) != 0)
      goto LABEL_48;
    goto LABEL_84;
  }
LABEL_83:
  v9 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_48:
    v10 = 2654435761 * self->_cellMaxUlCaNumConfigured;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
      goto LABEL_49;
    goto LABEL_85;
  }
LABEL_84:
  v10 = 0;
  if ((*(_BYTE *)&v4 & 0x20) != 0)
  {
LABEL_49:
    v11 = 2654435761 * self->_cellEstimatedLoad;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_50;
    goto LABEL_86;
  }
LABEL_85:
  v11 = 0;
  if ((*(_BYTE *)&v4 & 0x10) != 0)
  {
LABEL_50:
    v12 = 2654435761 * self->_cellEstimatedBw;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0)
      goto LABEL_51;
    goto LABEL_87;
  }
LABEL_86:
  v12 = 0;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
LABEL_51:
    v13 = 2654435761 * self->_recommendedlink;
    if ((*(_QWORD *)&v4 & 0x2000000000000) != 0)
      goto LABEL_52;
    goto LABEL_88;
  }
LABEL_87:
  v13 = 0;
  if ((*(_QWORD *)&v4 & 0x2000000000000) != 0)
  {
LABEL_52:
    v14 = 2654435761 * self->_fr2DBRecommendation;
    if ((*(_DWORD *)&v4 & 0x800000) != 0)
      goto LABEL_53;
    goto LABEL_89;
  }
LABEL_88:
  v14 = 0;
  if ((*(_DWORD *)&v4 & 0x800000) != 0)
  {
LABEL_53:
    v15 = 2654435761 * self->_locationDBFR1Count;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0)
      goto LABEL_54;
    goto LABEL_90;
  }
LABEL_89:
  v15 = 0;
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
  {
LABEL_54:
    v16 = 2654435761 * self->_locationDBFR2Count;
    if ((*(_QWORD *)&v4 & 0x4000000000000) != 0)
      goto LABEL_55;
    goto LABEL_91;
  }
LABEL_90:
  v16 = 0;
  if ((*(_QWORD *)&v4 & 0x4000000000000) != 0)
  {
LABEL_55:
    v17 = 2654435761 * self->_highThermalTemperatureNotification;
    if ((*(_QWORD *)&v4 & 0x100000000) != 0)
      goto LABEL_56;
    goto LABEL_92;
  }
LABEL_91:
  v17 = 0;
  if ((*(_QWORD *)&v4 & 0x100000000) != 0)
  {
LABEL_56:
    v18 = 2654435761 * self->_wiFiThroughput;
    if ((*(_DWORD *)&v4 & 0x80000000) != 0)
      goto LABEL_57;
    goto LABEL_93;
  }
LABEL_92:
  v18 = 0;
  if ((*(_DWORD *)&v4 & 0x80000000) != 0)
  {
LABEL_57:
    v19 = 2654435761 * self->_wiFiPredictedThroughput;
    if ((*(_DWORD *)&v4 & 0x40000000) != 0)
      goto LABEL_58;
    goto LABEL_94;
  }
LABEL_93:
  v19 = 0;
  if ((*(_DWORD *)&v4 & 0x40000000) != 0)
  {
LABEL_58:
    v20 = 2654435761 * self->_wRMRecommendationReason;
    if ((*(_QWORD *)&v4 & 0x4000000000) != 0)
      goto LABEL_59;
    goto LABEL_95;
  }
LABEL_94:
  v20 = 0;
  if ((*(_QWORD *)&v4 & 0x4000000000) != 0)
  {
LABEL_59:
    v21 = 2654435761 * self->_wifiRecommendationScore;
    if ((*(_QWORD *)&v4 & 0x2000000000) != 0)
      goto LABEL_60;
    goto LABEL_96;
  }
LABEL_95:
  v21 = 0;
  if ((*(_QWORD *)&v4 & 0x2000000000) != 0)
  {
LABEL_60:
    v22 = 2654435761 * self->_wifiRecommendationConfidence;
    if ((*(_DWORD *)&v4 & 0x400000) != 0)
      goto LABEL_61;
    goto LABEL_97;
  }
LABEL_96:
  v22 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_61:
    v23 = 2654435761 * self->_cellularRecommendationScore;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
      goto LABEL_62;
    goto LABEL_98;
  }
LABEL_97:
  v23 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_62:
    v24 = 2654435761 * self->_cellularRecommendationConfidence;
    if ((*(_DWORD *)&v4 & 0x2000000) != 0)
      goto LABEL_63;
    goto LABEL_99;
  }
LABEL_98:
  v24 = 0;
  if ((*(_DWORD *)&v4 & 0x2000000) != 0)
  {
LABEL_63:
    v25 = 2654435761 * self->_radioCoverage;
    if ((*(_DWORD *)&v4 & 0x4000000) != 0)
      goto LABEL_64;
    goto LABEL_100;
  }
LABEL_99:
  v25 = 0;
  if ((*(_DWORD *)&v4 & 0x4000000) != 0)
  {
LABEL_64:
    v26 = 2654435761 * self->_radioFrequency;
    if ((*(_DWORD *)&v4 & 0x20000000) != 0)
      goto LABEL_65;
    goto LABEL_101;
  }
LABEL_100:
  v26 = 0;
  if ((*(_DWORD *)&v4 & 0x20000000) != 0)
  {
LABEL_65:
    v27 = 2654435761 * self->_triggerReason;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_66;
    goto LABEL_102;
  }
LABEL_101:
  v27 = 0;
  if ((*(_BYTE *)&v4 & 2) != 0)
  {
LABEL_66:
    v28 = 2654435761 * self->_applicationCategory;
    if ((*(_DWORD *)&v4 & 0x80000) != 0)
      goto LABEL_67;
LABEL_103:
    v29 = 0;
    if ((*(_DWORD *)&v4 & 0x10000000) != 0)
      goto LABEL_68;
LABEL_104:
    v30 = 0;
    return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v42 ^ v35 ^ v34 ^ v33 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
  }
LABEL_102:
  v28 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) == 0)
    goto LABEL_103;
LABEL_67:
  v29 = 2654435761 * self->_cellTotalMimoLayers;
  if ((*(_DWORD *)&v4 & 0x10000000) == 0)
    goto LABEL_104;
LABEL_68:
  v30 = 2654435761 * self->_totalNrBandwidth;
  return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v42 ^ v35 ^ v34 ^ v33 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
    v5 = *((_QWORD *)a3 + 28);
    if ((v5 & 0x8000000000) == 0)
    {
LABEL_3:
      if ((v5 & 0x20000000000) == 0)
        goto LABEL_4;
      goto LABEL_59;
    }
  }
  else if ((v5 & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_wifiRssi = *((_DWORD *)a3 + 45);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_60;
  }
LABEL_59:
  self->_wifiSnr = *((_DWORD *)a3 + 47);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_61;
  }
LABEL_60:
  self->_wifiTxPER = *((_DWORD *)a3 + 49);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_7;
    goto LABEL_62;
  }
LABEL_61:
  self->_wifiRxRetry = *((_DWORD *)a3 + 46);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_8;
    goto LABEL_63;
  }
LABEL_62:
  self->_wifiCca = *((_DWORD *)a3 + 40);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_9;
    goto LABEL_64;
  }
LABEL_63:
  self->_wifiQbssLoad = *((_DWORD *)a3 + 42);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_10;
    goto LABEL_65;
  }
LABEL_64:
  self->_wifiStationCount = *((_DWORD *)a3 + 48);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x800000000000) == 0)
      goto LABEL_11;
    goto LABEL_66;
  }
LABEL_65:
  self->_wifPoi = *((_DWORD *)a3 + 39);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x800000000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x200000000000) == 0)
      goto LABEL_12;
    goto LABEL_67;
  }
LABEL_66:
  self->_wifiWgtAVGRSSI = *((_DWORD *)a3 + 53);
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x400000000000) == 0)
      goto LABEL_13;
    goto LABEL_68;
  }
LABEL_67:
  self->_wifiWghtAVGSNR = *((_DWORD *)a3 + 51);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x400000000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x100000000000) == 0)
      goto LABEL_14;
    goto LABEL_69;
  }
LABEL_68:
  self->_wifiWghtAVGTXPHYRATE = *((_DWORD *)a3 + 52);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_15;
    goto LABEL_70;
  }
LABEL_69:
  self->_wifiWghtAVGRXPHYRATE = *((_DWORD *)a3 + 50);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v5 = *((_QWORD *)a3 + 28);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000000000000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_70:
  self->_wifiEstThoughtput = *((_DWORD *)a3 + 41);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  if ((*((_QWORD *)a3 + 28) & 0x1000000000000) != 0)
  {
LABEL_16:
    self->_wifiWifiEstThoughtputConfidence = *((_DWORD *)a3 + 54);
    *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  }
LABEL_17:
  if (*((_QWORD *)a3 + 11))
    -[AWDWRMWiFiCell5GData setCellRatType:](self, "setCellRatType:");
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x80) != 0)
  {
    self->_cellLteRSRP = *((_DWORD *)a3 + 10);
    *(_QWORD *)&self->_has |= 0x80uLL;
    v6 = *((_QWORD *)a3 + 28);
    if ((v6 & 0x200) == 0)
    {
LABEL_21:
      if ((v6 & 0x100) == 0)
        goto LABEL_22;
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  self->_cellLteSNR = *((_DWORD *)a3 + 12);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x100) == 0)
  {
LABEL_22:
    if ((v6 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  self->_cellLteRSRQ = *((_DWORD *)a3 + 11);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x4000) == 0)
  {
LABEL_23:
    if ((v6 & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  self->_cellNrRSRP = *((_DWORD *)a3 + 17);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x8000) == 0)
  {
LABEL_24:
    if ((v6 & 0x10000) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  self->_cellNrRSRQ = *((_DWORD *)a3 + 18);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x10000) == 0)
  {
LABEL_25:
    if ((v6 & 4) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  self->_cellNrSNR = *((_DWORD *)a3 + 19);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 4) == 0)
  {
LABEL_26:
    if ((v6 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  self->_cellDataLQM = *((_DWORD *)a3 + 5);
  *(_QWORD *)&self->_has |= 4uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  self->_cellRrcState = *((_DWORD *)a3 + 24);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x2000) == 0)
  {
LABEL_28:
    if ((v6 & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  self->_cellNrFR2active = *((_DWORD *)a3 + 16);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x40) == 0)
  {
LABEL_29:
    if ((v6 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  self->_cellLteEstimatedThroughput = *((_DWORD *)a3 + 9);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x1000) == 0)
  {
LABEL_30:
    if ((v6 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  self->_cellNrEstimatedThroughput = *((_DWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((v6 & 8) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  self->_cellNsaEnabled = *((_DWORD *)a3 + 20);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 8) == 0)
  {
LABEL_32:
    if ((v6 & 0x100000) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  self->_cellDlBw = *((_DWORD *)a3 + 6);
  *(_QWORD *)&self->_has |= 8uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x100000) == 0)
  {
LABEL_33:
    if ((v6 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  self->_cellUlBw = *((_DWORD *)a3 + 26);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x400) == 0)
  {
LABEL_34:
    if ((v6 & 0x800) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  self->_cellMaxDlCaNumConfigured = *((_DWORD *)a3 + 13);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x800) == 0)
  {
LABEL_35:
    if ((v6 & 0x20) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  self->_cellMaxUlCaNumConfigured = *((_DWORD *)a3 + 14);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x20) == 0)
  {
LABEL_36:
    if ((v6 & 0x10) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  self->_cellEstimatedLoad = *((_DWORD *)a3 + 8);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x10) == 0)
  {
LABEL_37:
    if ((v6 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  self->_cellEstimatedBw = *((_DWORD *)a3 + 7);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_38:
    if ((v6 & 0x2000000000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  self->_recommendedlink = *((_DWORD *)a3 + 33);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((v6 & 0x800000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  self->_fr2DBRecommendation = *((_BYTE *)a3 + 220);
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x800000) == 0)
  {
LABEL_40:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  self->_locationDBFR1Count = *((_DWORD *)a3 + 29);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_41:
    if ((v6 & 0x4000000000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  self->_locationDBFR2Count = *((_DWORD *)a3 + 30);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x4000000000000) == 0)
  {
LABEL_42:
    if ((v6 & 0x100000000) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  self->_highThermalTemperatureNotification = *((_BYTE *)a3 + 221);
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x100000000) == 0)
  {
LABEL_43:
    if ((v6 & 0x80000000) == 0)
      goto LABEL_44;
    goto LABEL_96;
  }
LABEL_95:
  self->_wiFiThroughput = *((_DWORD *)a3 + 38);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_44:
    if ((v6 & 0x40000000) == 0)
      goto LABEL_45;
    goto LABEL_97;
  }
LABEL_96:
  self->_wiFiPredictedThroughput = *((_DWORD *)a3 + 37);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_45:
    if ((v6 & 0x4000000000) == 0)
      goto LABEL_46;
    goto LABEL_98;
  }
LABEL_97:
  self->_wRMRecommendationReason = *((_DWORD *)a3 + 36);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_46:
    if ((v6 & 0x2000000000) == 0)
      goto LABEL_47;
    goto LABEL_99;
  }
LABEL_98:
  self->_wifiRecommendationScore = *((_DWORD *)a3 + 44);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x2000000000) == 0)
  {
LABEL_47:
    if ((v6 & 0x400000) == 0)
      goto LABEL_48;
    goto LABEL_100;
  }
LABEL_99:
  self->_wifiRecommendationConfidence = *((_DWORD *)a3 + 43);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x400000) == 0)
  {
LABEL_48:
    if ((v6 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_101;
  }
LABEL_100:
  self->_cellularRecommendationScore = *((_DWORD *)a3 + 28);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x200000) == 0)
  {
LABEL_49:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_50;
    goto LABEL_102;
  }
LABEL_101:
  self->_cellularRecommendationConfidence = *((_DWORD *)a3 + 27);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_50:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_51;
    goto LABEL_103;
  }
LABEL_102:
  self->_radioCoverage = *((_DWORD *)a3 + 31);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_51:
    if ((v6 & 0x20000000) == 0)
      goto LABEL_52;
    goto LABEL_104;
  }
LABEL_103:
  self->_radioFrequency = *((_DWORD *)a3 + 32);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_52:
    if ((v6 & 2) == 0)
      goto LABEL_53;
    goto LABEL_105;
  }
LABEL_104:
  self->_triggerReason = *((_DWORD *)a3 + 35);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 2) == 0)
  {
LABEL_53:
    if ((v6 & 0x80000) == 0)
      goto LABEL_54;
    goto LABEL_106;
  }
LABEL_105:
  self->_applicationCategory = *((_DWORD *)a3 + 4);
  *(_QWORD *)&self->_has |= 2uLL;
  v6 = *((_QWORD *)a3 + 28);
  if ((v6 & 0x80000) == 0)
  {
LABEL_54:
    if ((v6 & 0x10000000) == 0)
      return;
    goto LABEL_55;
  }
LABEL_106:
  self->_cellTotalMimoLayers = *((_DWORD *)a3 + 25);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  if ((*((_QWORD *)a3 + 28) & 0x10000000) == 0)
    return;
LABEL_55:
  self->_totalNrBandwidth = *((_DWORD *)a3 + 34);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)wifiRssi
{
  return self->_wifiRssi;
}

- (unsigned)wifiSnr
{
  return self->_wifiSnr;
}

- (unsigned)wifiTxPER
{
  return self->_wifiTxPER;
}

- (unsigned)wifiRxRetry
{
  return self->_wifiRxRetry;
}

- (unsigned)wifiCca
{
  return self->_wifiCca;
}

- (unsigned)wifiQbssLoad
{
  return self->_wifiQbssLoad;
}

- (unsigned)wifiStationCount
{
  return self->_wifiStationCount;
}

- (unsigned)wifPoi
{
  return self->_wifPoi;
}

- (int)wifiWgtAVGRSSI
{
  return self->_wifiWgtAVGRSSI;
}

- (unsigned)wifiWghtAVGSNR
{
  return self->_wifiWghtAVGSNR;
}

- (unsigned)wifiWghtAVGTXPHYRATE
{
  return self->_wifiWghtAVGTXPHYRATE;
}

- (unsigned)wifiWghtAVGRXPHYRATE
{
  return self->_wifiWghtAVGRXPHYRATE;
}

- (unsigned)wifiEstThoughtput
{
  return self->_wifiEstThoughtput;
}

- (unsigned)wifiWifiEstThoughtputConfidence
{
  return self->_wifiWifiEstThoughtputConfidence;
}

- (NSString)cellRatType
{
  return self->_cellRatType;
}

- (void)setCellRatType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (int)cellLteRSRP
{
  return self->_cellLteRSRP;
}

- (int)cellLteSNR
{
  return self->_cellLteSNR;
}

- (int)cellLteRSRQ
{
  return self->_cellLteRSRQ;
}

- (int)cellNrRSRP
{
  return self->_cellNrRSRP;
}

- (int)cellNrRSRQ
{
  return self->_cellNrRSRQ;
}

- (int)cellNrSNR
{
  return self->_cellNrSNR;
}

- (unsigned)cellDataLQM
{
  return self->_cellDataLQM;
}

- (unsigned)cellRrcState
{
  return self->_cellRrcState;
}

- (unsigned)cellNrFR2active
{
  return self->_cellNrFR2active;
}

- (unsigned)cellLteEstimatedThroughput
{
  return self->_cellLteEstimatedThroughput;
}

- (unsigned)cellNrEstimatedThroughput
{
  return self->_cellNrEstimatedThroughput;
}

- (unsigned)cellNsaEnabled
{
  return self->_cellNsaEnabled;
}

- (unsigned)cellDlBw
{
  return self->_cellDlBw;
}

- (unsigned)cellUlBw
{
  return self->_cellUlBw;
}

- (unsigned)cellMaxDlCaNumConfigured
{
  return self->_cellMaxDlCaNumConfigured;
}

- (unsigned)cellMaxUlCaNumConfigured
{
  return self->_cellMaxUlCaNumConfigured;
}

- (unsigned)cellEstimatedLoad
{
  return self->_cellEstimatedLoad;
}

- (unsigned)cellEstimatedBw
{
  return self->_cellEstimatedBw;
}

- (unsigned)recommendedlink
{
  return self->_recommendedlink;
}

- (BOOL)fr2DBRecommendation
{
  return self->_fr2DBRecommendation;
}

- (unsigned)locationDBFR1Count
{
  return self->_locationDBFR1Count;
}

- (unsigned)locationDBFR2Count
{
  return self->_locationDBFR2Count;
}

- (BOOL)highThermalTemperatureNotification
{
  return self->_highThermalTemperatureNotification;
}

- (unsigned)wiFiThroughput
{
  return self->_wiFiThroughput;
}

- (unsigned)wiFiPredictedThroughput
{
  return self->_wiFiPredictedThroughput;
}

- (unsigned)wRMRecommendationReason
{
  return self->_wRMRecommendationReason;
}

- (unsigned)wifiRecommendationScore
{
  return self->_wifiRecommendationScore;
}

- (unsigned)wifiRecommendationConfidence
{
  return self->_wifiRecommendationConfidence;
}

- (unsigned)cellularRecommendationScore
{
  return self->_cellularRecommendationScore;
}

- (unsigned)cellularRecommendationConfidence
{
  return self->_cellularRecommendationConfidence;
}

- (unsigned)radioCoverage
{
  return self->_radioCoverage;
}

- (unsigned)radioFrequency
{
  return self->_radioFrequency;
}

- (unsigned)triggerReason
{
  return self->_triggerReason;
}

- (unsigned)applicationCategory
{
  return self->_applicationCategory;
}

- (unsigned)cellTotalMimoLayers
{
  return self->_cellTotalMimoLayers;
}

- (unsigned)totalNrBandwidth
{
  return self->_totalNrBandwidth;
}

@end
