@implementation AWDWiFiWcpsStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setDurationBucket:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_durationBucket = a3;
}

- (void)setHasDurationBucket:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDurationBucket
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPercentageActive:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_percentageActive = a3;
}

- (void)setHasPercentageActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasPercentageActive
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setPercentagePowerSave:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_percentagePowerSave = a3;
}

- (void)setHasPercentagePowerSave:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasPercentagePowerSave
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setPercentageWcpsEnabled:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_percentageWcpsEnabled = a3;
}

- (void)setHasPercentageWcpsEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasPercentageWcpsEnabled
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setPercentageWcpsReduced:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_percentageWcpsReduced = a3;
}

- (void)setHasPercentageWcpsReduced:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasPercentageWcpsReduced
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setPercentageWcpsDisabled:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_percentageWcpsDisabled = a3;
}

- (void)setHasPercentageWcpsDisabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasPercentageWcpsDisabled
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCntVoGoodPeriods:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_cntVoGoodPeriods = a3;
}

- (void)setHasCntVoGoodPeriods:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCntVoGoodPeriods
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCntVoBadPeriods:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_cntVoBadPeriods = a3;
}

- (void)setHasCntVoBadPeriods:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCntVoBadPeriods
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setAvgRssi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_avgRssi = a3;
}

- (void)setHasAvgRssi:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAvgRssi
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAvgSnr:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_avgSnr = a3;
}

- (void)setHasAvgSnr:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAvgSnr
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAvgCca:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_avgCca = a3;
}

- (void)setHasAvgCca:(BOOL)a3
{
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAvgCca
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAvgTxAirLatency:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_avgTxAirLatency = a3;
}

- (void)setHasAvgTxAirLatency:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasAvgTxAirLatency
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAvgTxPacketLoss:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_avgTxPacketLoss = a3;
}

- (void)setHasAvgTxPacketLoss:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasAvgTxPacketLoss
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAvgTxRetrans:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_avgTxRetrans = a3;
}

- (void)setHasAvgTxRetrans:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAvgTxRetrans
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setAvgRxRetry:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_avgRxRetry = a3;
}

- (void)setHasAvgRxRetry:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAvgRxRetry
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEndRssi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_endRssi = a3;
}

- (void)setHasEndRssi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasEndRssi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setEndSnr:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_endSnr = a3;
}

- (void)setHasEndSnr:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasEndSnr
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setEndCca:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_endCca = a3;
}

- (void)setHasEndCca:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasEndCca
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setEndTxAirLatency:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_endTxAirLatency = a3;
}

- (void)setHasEndTxAirLatency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasEndTxAirLatency
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setEndTxPacketLoss:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_endTxPacketLoss = a3;
}

- (void)setHasEndTxPacketLoss:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasEndTxPacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setEndTxRetrans:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_endTxRetrans = a3;
}

- (void)setHasEndTxRetrans:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasEndTxRetrans
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setEndRxRetry:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_endRxRetry = a3;
}

- (void)setHasEndRxRetry:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasEndRxRetry
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMinRssi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_minRssi = a3;
}

- (void)setHasMinRssi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasMinRssi
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setMinSnr:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_minSnr = a3;
}

- (void)setHasMinSnr:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasMinSnr
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setMinCca:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_minCca = a3;
}

- (void)setHasMinCca:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasMinCca
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setMinTxAirLatency:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_minTxAirLatency = a3;
}

- (void)setHasMinTxAirLatency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasMinTxAirLatency
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setMinTxPacketLoss:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_minTxPacketLoss = a3;
}

- (void)setHasMinTxPacketLoss:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasMinTxPacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setMinTxRetrans:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_minTxRetrans = a3;
}

- (void)setHasMinTxRetrans:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasMinTxRetrans
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setMinRxRetry:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_minRxRetry = a3;
}

- (void)setHasMinRxRetry:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasMinRxRetry
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setMaxRssi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_maxRssi = a3;
}

- (void)setHasMaxRssi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMaxRssi
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setMaxnSnr:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_maxnSnr = a3;
}

- (void)setHasMaxnSnr:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasMaxnSnr
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setMaxCca:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_maxCca = a3;
}

- (void)setHasMaxCca:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasMaxCca
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setMaxTxAirLatency:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_maxTxAirLatency = a3;
}

- (void)setHasMaxTxAirLatency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasMaxTxAirLatency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMaxTxPacketLoss:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_maxTxPacketLoss = a3;
}

- (void)setHasMaxTxPacketLoss:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasMaxTxPacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setMaxTxRetrans:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_maxTxRetrans = a3;
}

- (void)setHasMaxTxRetrans:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasMaxTxRetrans
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setMaxRxRetry:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_maxRxRetry = a3;
}

- (void)setHasMaxRxRetry:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasMaxRxRetry
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCntRedBtConnLatLow:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_cntRedBtConnLatLow = a3;
}

- (void)setHasCntRedBtConnLatLow:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCntRedBtConnLatLow
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCntRedBtDisconnLatHi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_cntRedBtDisconnLatHi = a3;
}

- (void)setHasCntRedBtDisconnLatHi:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCntRedBtDisconnLatHi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCntDisBtConnLatHi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_cntDisBtConnLatHi = a3;
}

- (void)setHasCntDisBtConnLatHi:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCntDisBtConnLatHi
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setCntDisBtEv3:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_cntDisBtEv3 = a3;
}

- (void)setHasCntDisBtEv3:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCntDisBtEv3
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCntAwdlActive:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_cntAwdlActive = a3;
}

- (void)setHasCntAwdlActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCntAwdlActive
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setEndLinkState:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_endLinkState = a3;
}

- (void)setHasEndLinkState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasEndLinkState
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiWcpsStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiWcpsStats description](&v3, sel_description), -[AWDWiFiWcpsStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $E61337C3C8DF5C121F217BB1569CBB9D has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x2000000000) == 0)
        goto LABEL_4;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_durationBucket), CFSTR("durationBucket"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_5;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_percentageActive), CFSTR("percentageActive"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_percentagePowerSave), CFSTR("percentagePowerSave"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_7;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_percentageWcpsEnabled), CFSTR("percentageWcpsEnabled"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_8;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_percentageWcpsReduced), CFSTR("percentageWcpsReduced"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_percentageWcpsDisabled), CFSTR("percentageWcpsDisabled"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cntVoGoodPeriods), CFSTR("cntVoGoodPeriods"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cntVoBadPeriods), CFSTR("cntVoBadPeriods"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_avgRssi), CFSTR("avgRssi"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_avgSnr), CFSTR("avgSnr"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_avgCca), CFSTR("avgCca"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_avgTxAirLatency), CFSTR("avgTxAirLatency"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_avgTxPacketLoss), CFSTR("avgTxPacketLoss"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_avgTxRetrans), CFSTR("avgTxRetrans"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_avgRxRetry), CFSTR("avgRxRetry"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endRssi), CFSTR("endRssi"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endSnr), CFSTR("endSnr"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endCca), CFSTR("endCca"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endTxAirLatency), CFSTR("endTxAirLatency"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endTxPacketLoss), CFSTR("endTxPacketLoss"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_24;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endTxRetrans), CFSTR("endTxRetrans"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_25;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endRxRetry), CFSTR("endRxRetry"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minRssi), CFSTR("minRssi"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_27;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minSnr), CFSTR("minSnr"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_28;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minCca), CFSTR("minCca"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_29;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minTxAirLatency), CFSTR("minTxAirLatency"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_30;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minTxPacketLoss), CFSTR("minTxPacketLoss"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minTxRetrans), CFSTR("minTxRetrans"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minRxRetry), CFSTR("minRxRetry"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_33;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxRssi), CFSTR("maxRssi"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_34;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxnSnr), CFSTR("maxnSnr"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxCca), CFSTR("maxCca"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxTxAirLatency), CFSTR("maxTxAirLatency"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_37;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxTxPacketLoss), CFSTR("maxTxPacketLoss"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_38;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxTxRetrans), CFSTR("maxTxRetrans"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_39;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxRxRetry), CFSTR("maxRxRetry"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cntRedBtConnLatLow), CFSTR("cntRedBtConnLatLow"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_41;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cntRedBtDisconnLatHi), CFSTR("cntRedBtDisconnLatHi"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_42;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cntDisBtConnLatHi), CFSTR("cntDisBtConnLatHi"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_43;
LABEL_87:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cntAwdlActive), CFSTR("cntAwdlActive"));
    if ((*(_QWORD *)&self->_has & 0x10000) == 0)
      return v3;
    goto LABEL_44;
  }
LABEL_86:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cntDisBtEv3), CFSTR("cntDisBtEv3"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
    goto LABEL_87;
LABEL_43:
  if ((*(_DWORD *)&has & 0x10000) != 0)
LABEL_44:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endLinkState), CFSTR("endLinkState"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiWcpsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E61337C3C8DF5C121F217BB1569CBB9D has;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x2000000000) == 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_7;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_8;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_12;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_13;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_17;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_24;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_25;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_27;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_28;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_29;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_30;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_43;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      return;
LABEL_87:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_86:
  PBDataWriterWriteUint64Field();
  if ((*(_QWORD *)&self->_has & 0x10000) != 0)
    goto LABEL_87;
}

- (void)copyTo:(id)a3
{
  $E61337C3C8DF5C121F217BB1569CBB9D has;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    *((_QWORD *)a3 + 43) = self->_timestamp;
    *((_QWORD *)a3 + 44) |= 0x40000000000uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x2000000000) == 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 15) = self->_durationBucket;
  *((_QWORD *)a3 + 44) |= 0x4000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)a3 + 38) = self->_percentageActive;
  *((_QWORD *)a3 + 44) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)a3 + 39) = self->_percentagePowerSave;
  *((_QWORD *)a3 + 44) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_7;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)a3 + 41) = self->_percentageWcpsEnabled;
  *((_QWORD *)a3 + 44) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_8;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)a3 + 42) = self->_percentageWcpsReduced;
  *((_QWORD *)a3 + 44) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)a3 + 40) = self->_percentageWcpsDisabled;
  *((_QWORD *)a3 + 44) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)a3 + 14) = self->_cntVoGoodPeriods;
  *((_QWORD *)a3 + 44) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)a3 + 13) = self->_cntVoBadPeriods;
  *((_QWORD *)a3 + 44) |= 0x1000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_12;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)a3 + 2) = self->_avgRssi;
  *((_QWORD *)a3 + 44) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_13;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)a3 + 4) = self->_avgSnr;
  *((_QWORD *)a3 + 44) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)a3 + 1) = self->_avgCca;
  *((_QWORD *)a3 + 44) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)a3 + 5) = self->_avgTxAirLatency;
  *((_QWORD *)a3 + 44) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)a3 + 6) = self->_avgTxPacketLoss;
  *((_QWORD *)a3 + 44) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_17;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)a3 + 7) = self->_avgTxRetrans;
  *((_QWORD *)a3 + 44) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)a3 + 3) = self->_avgRxRetry;
  *((_QWORD *)a3 + 44) |= 4uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)a3 + 18) = self->_endRssi;
  *((_QWORD *)a3 + 44) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)a3 + 20) = self->_endSnr;
  *((_QWORD *)a3 + 44) |= 0x80000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)a3 + 16) = self->_endCca;
  *((_QWORD *)a3 + 44) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)a3 + 21) = self->_endTxAirLatency;
  *((_QWORD *)a3 + 44) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)a3 + 22) = self->_endTxPacketLoss;
  *((_QWORD *)a3 + 44) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_24;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)a3 + 23) = self->_endTxRetrans;
  *((_QWORD *)a3 + 44) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_25;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)a3 + 19) = self->_endRxRetry;
  *((_QWORD *)a3 + 44) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)a3 + 32) = self->_minRssi;
  *((_QWORD *)a3 + 44) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_27;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)a3 + 34) = self->_minSnr;
  *((_QWORD *)a3 + 44) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_28;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)a3 + 31) = self->_minCca;
  *((_QWORD *)a3 + 44) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_29;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)a3 + 35) = self->_minTxAirLatency;
  *((_QWORD *)a3 + 44) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_30;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)a3 + 36) = self->_minTxPacketLoss;
  *((_QWORD *)a3 + 44) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)a3 + 37) = self->_minTxRetrans;
  *((_QWORD *)a3 + 44) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)a3 + 33) = self->_minRxRetry;
  *((_QWORD *)a3 + 44) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)a3 + 25) = self->_maxRssi;
  *((_QWORD *)a3 + 44) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)a3 + 30) = self->_maxnSnr;
  *((_QWORD *)a3 + 44) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)a3 + 24) = self->_maxCca;
  *((_QWORD *)a3 + 44) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)a3 + 27) = self->_maxTxAirLatency;
  *((_QWORD *)a3 + 44) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)a3 + 28) = self->_maxTxPacketLoss;
  *((_QWORD *)a3 + 44) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  *((_QWORD *)a3 + 29) = self->_maxTxRetrans;
  *((_QWORD *)a3 + 44) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  *((_QWORD *)a3 + 26) = self->_maxRxRetry;
  *((_QWORD *)a3 + 44) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  *((_QWORD *)a3 + 11) = self->_cntRedBtConnLatLow;
  *((_QWORD *)a3 + 44) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  *((_QWORD *)a3 + 12) = self->_cntRedBtDisconnLatHi;
  *((_QWORD *)a3 + 44) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)a3 + 9) = self->_cntDisBtConnLatHi;
  *((_QWORD *)a3 + 44) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_43;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)a3 + 10) = self->_cntDisBtEv3;
  *((_QWORD *)a3 + 44) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      return;
LABEL_87:
    *((_QWORD *)a3 + 17) = self->_endLinkState;
    *((_QWORD *)a3 + 44) |= 0x10000uLL;
    return;
  }
LABEL_86:
  *((_QWORD *)a3 + 8) = self->_cntAwdlActive;
  *((_QWORD *)a3 + 44) |= 0x80uLL;
  if ((*(_QWORD *)&self->_has & 0x10000) != 0)
    goto LABEL_87;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $E61337C3C8DF5C121F217BB1569CBB9D has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    *((_QWORD *)result + 43) = self->_timestamp;
    *((_QWORD *)result + 44) |= 0x40000000000uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x2000000000) == 0)
        goto LABEL_4;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 15) = self->_durationBucket;
  *((_QWORD *)result + 44) |= 0x4000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_5;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)result + 38) = self->_percentageActive;
  *((_QWORD *)result + 44) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)result + 39) = self->_percentagePowerSave;
  *((_QWORD *)result + 44) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_7;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)result + 41) = self->_percentageWcpsEnabled;
  *((_QWORD *)result + 44) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_8;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)result + 42) = self->_percentageWcpsReduced;
  *((_QWORD *)result + 44) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)result + 40) = self->_percentageWcpsDisabled;
  *((_QWORD *)result + 44) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)result + 14) = self->_cntVoGoodPeriods;
  *((_QWORD *)result + 44) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)result + 13) = self->_cntVoBadPeriods;
  *((_QWORD *)result + 44) |= 0x1000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)result + 2) = self->_avgRssi;
  *((_QWORD *)result + 44) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)result + 4) = self->_avgSnr;
  *((_QWORD *)result + 44) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)result + 1) = self->_avgCca;
  *((_QWORD *)result + 44) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)result + 5) = self->_avgTxAirLatency;
  *((_QWORD *)result + 44) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)result + 6) = self->_avgTxPacketLoss;
  *((_QWORD *)result + 44) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)result + 7) = self->_avgTxRetrans;
  *((_QWORD *)result + 44) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)result + 3) = self->_avgRxRetry;
  *((_QWORD *)result + 44) |= 4uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)result + 18) = self->_endRssi;
  *((_QWORD *)result + 44) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)result + 20) = self->_endSnr;
  *((_QWORD *)result + 44) |= 0x80000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)result + 16) = self->_endCca;
  *((_QWORD *)result + 44) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)result + 21) = self->_endTxAirLatency;
  *((_QWORD *)result + 44) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)result + 22) = self->_endTxPacketLoss;
  *((_QWORD *)result + 44) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_24;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)result + 23) = self->_endTxRetrans;
  *((_QWORD *)result + 44) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_25;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)result + 19) = self->_endRxRetry;
  *((_QWORD *)result + 44) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)result + 32) = self->_minRssi;
  *((_QWORD *)result + 44) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_27;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)result + 34) = self->_minSnr;
  *((_QWORD *)result + 44) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_28;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)result + 31) = self->_minCca;
  *((_QWORD *)result + 44) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_29;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)result + 35) = self->_minTxAirLatency;
  *((_QWORD *)result + 44) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_30;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)result + 36) = self->_minTxPacketLoss;
  *((_QWORD *)result + 44) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)result + 37) = self->_minTxRetrans;
  *((_QWORD *)result + 44) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)result + 33) = self->_minRxRetry;
  *((_QWORD *)result + 44) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_33;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)result + 25) = self->_maxRssi;
  *((_QWORD *)result + 44) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_34;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)result + 30) = self->_maxnSnr;
  *((_QWORD *)result + 44) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)result + 24) = self->_maxCca;
  *((_QWORD *)result + 44) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)result + 27) = self->_maxTxAirLatency;
  *((_QWORD *)result + 44) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_37;
    goto LABEL_81;
  }
LABEL_80:
  *((_QWORD *)result + 28) = self->_maxTxPacketLoss;
  *((_QWORD *)result + 44) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_38;
    goto LABEL_82;
  }
LABEL_81:
  *((_QWORD *)result + 29) = self->_maxTxRetrans;
  *((_QWORD *)result + 44) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_39;
    goto LABEL_83;
  }
LABEL_82:
  *((_QWORD *)result + 26) = self->_maxRxRetry;
  *((_QWORD *)result + 44) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_84;
  }
LABEL_83:
  *((_QWORD *)result + 11) = self->_cntRedBtConnLatLow;
  *((_QWORD *)result + 44) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_41;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)result + 12) = self->_cntRedBtDisconnLatHi;
  *((_QWORD *)result + 44) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_42;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)result + 9) = self->_cntDisBtConnLatHi;
  *((_QWORD *)result + 44) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_43;
    goto LABEL_87;
  }
LABEL_86:
  *((_QWORD *)result + 10) = self->_cntDisBtEv3;
  *((_QWORD *)result + 44) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      return result;
    goto LABEL_44;
  }
LABEL_87:
  *((_QWORD *)result + 8) = self->_cntAwdlActive;
  *((_QWORD *)result + 44) |= 0x80uLL;
  if ((*(_QWORD *)&self->_has & 0x10000) == 0)
    return result;
LABEL_44:
  *((_QWORD *)result + 17) = self->_endLinkState;
  *((_QWORD *)result + 44) |= 0x10000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $E61337C3C8DF5C121F217BB1569CBB9D has;
  uint64_t v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_QWORD *)a3 + 44);
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
    {
      if ((v7 & 0x40000000000) == 0 || self->_timestamp != *((_QWORD *)a3 + 43))
        goto LABEL_216;
    }
    else if ((v7 & 0x40000000000) != 0)
    {
LABEL_216:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_durationBucket != *((_QWORD *)a3 + 15))
        goto LABEL_216;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
    {
      if ((v7 & 0x2000000000) == 0 || self->_percentageActive != *((_QWORD *)a3 + 38))
        goto LABEL_216;
    }
    else if ((v7 & 0x2000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
    {
      if ((v7 & 0x4000000000) == 0 || self->_percentagePowerSave != *((_QWORD *)a3 + 39))
        goto LABEL_216;
    }
    else if ((v7 & 0x4000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
    {
      if ((v7 & 0x10000000000) == 0 || self->_percentageWcpsEnabled != *((_QWORD *)a3 + 41))
        goto LABEL_216;
    }
    else if ((v7 & 0x10000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
    {
      if ((v7 & 0x20000000000) == 0 || self->_percentageWcpsReduced != *((_QWORD *)a3 + 42))
        goto LABEL_216;
    }
    else if ((v7 & 0x20000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
    {
      if ((v7 & 0x8000000000) == 0 || self->_percentageWcpsDisabled != *((_QWORD *)a3 + 40))
        goto LABEL_216;
    }
    else if ((v7 & 0x8000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_cntVoGoodPeriods != *((_QWORD *)a3 + 14))
        goto LABEL_216;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_cntVoBadPeriods != *((_QWORD *)a3 + 13))
        goto LABEL_216;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_avgRssi != *((_QWORD *)a3 + 2))
        goto LABEL_216;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_avgSnr != *((_QWORD *)a3 + 4))
        goto LABEL_216;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_avgCca != *((_QWORD *)a3 + 1))
        goto LABEL_216;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_avgTxAirLatency != *((_QWORD *)a3 + 5))
        goto LABEL_216;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_avgTxPacketLoss != *((_QWORD *)a3 + 6))
        goto LABEL_216;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_avgTxRetrans != *((_QWORD *)a3 + 7))
        goto LABEL_216;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_avgRxRetry != *((_QWORD *)a3 + 3))
        goto LABEL_216;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_endRssi != *((_QWORD *)a3 + 18))
        goto LABEL_216;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_endSnr != *((_QWORD *)a3 + 20))
        goto LABEL_216;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_endCca != *((_QWORD *)a3 + 16))
        goto LABEL_216;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_endTxAirLatency != *((_QWORD *)a3 + 21))
        goto LABEL_216;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_endTxPacketLoss != *((_QWORD *)a3 + 22))
        goto LABEL_216;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_endTxRetrans != *((_QWORD *)a3 + 23))
        goto LABEL_216;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_endRxRetry != *((_QWORD *)a3 + 19))
        goto LABEL_216;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_minRssi != *((_QWORD *)a3 + 32))
        goto LABEL_216;
    }
    else if ((v7 & 0x80000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x200000000) != 0)
    {
      if ((v7 & 0x200000000) == 0 || self->_minSnr != *((_QWORD *)a3 + 34))
        goto LABEL_216;
    }
    else if ((v7 & 0x200000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_minCca != *((_QWORD *)a3 + 31))
        goto LABEL_216;
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x400000000) != 0)
    {
      if ((v7 & 0x400000000) == 0 || self->_minTxAirLatency != *((_QWORD *)a3 + 35))
        goto LABEL_216;
    }
    else if ((v7 & 0x400000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x800000000) != 0)
    {
      if ((v7 & 0x800000000) == 0 || self->_minTxPacketLoss != *((_QWORD *)a3 + 36))
        goto LABEL_216;
    }
    else if ((v7 & 0x800000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
    {
      if ((v7 & 0x1000000000) == 0 || self->_minTxRetrans != *((_QWORD *)a3 + 37))
        goto LABEL_216;
    }
    else if ((v7 & 0x1000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_QWORD *)&has & 0x100000000) != 0)
    {
      if ((v7 & 0x100000000) == 0 || self->_minRxRetry != *((_QWORD *)a3 + 33))
        goto LABEL_216;
    }
    else if ((v7 & 0x100000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_maxRssi != *((_QWORD *)a3 + 25))
        goto LABEL_216;
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_maxnSnr != *((_QWORD *)a3 + 30))
        goto LABEL_216;
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_maxCca != *((_QWORD *)a3 + 24))
        goto LABEL_216;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_maxTxAirLatency != *((_QWORD *)a3 + 27))
        goto LABEL_216;
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_maxTxPacketLoss != *((_QWORD *)a3 + 28))
        goto LABEL_216;
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_maxTxRetrans != *((_QWORD *)a3 + 29))
        goto LABEL_216;
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_maxRxRetry != *((_QWORD *)a3 + 26))
        goto LABEL_216;
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_cntRedBtConnLatLow != *((_QWORD *)a3 + 11))
        goto LABEL_216;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_cntRedBtDisconnLatHi != *((_QWORD *)a3 + 12))
        goto LABEL_216;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_cntDisBtConnLatHi != *((_QWORD *)a3 + 9))
        goto LABEL_216;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_cntDisBtEv3 != *((_QWORD *)a3 + 10))
        goto LABEL_216;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_cntAwdlActive != *((_QWORD *)a3 + 8))
        goto LABEL_216;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_216;
    }
    LOBYTE(v5) = (v7 & 0x10000) == 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_endLinkState != *((_QWORD *)a3 + 17))
        goto LABEL_216;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $E61337C3C8DF5C121F217BB1569CBB9D has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
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
  unint64_t v27;
  unint64_t v28;
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
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    v46 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      v45 = 2654435761u * self->_durationBucket;
      if ((*(_QWORD *)&has & 0x2000000000) != 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else
  {
    v46 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_3;
  }
  v45 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
LABEL_4:
    v44 = 2654435761u * self->_percentageActive;
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_47:
  v44 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_5:
    v43 = 2654435761u * self->_percentagePowerSave;
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  v43 = 0;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
LABEL_6:
    v42 = 2654435761u * self->_percentageWcpsEnabled;
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
      goto LABEL_7;
    goto LABEL_50;
  }
LABEL_49:
  v42 = 0;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
LABEL_7:
    v41 = 2654435761u * self->_percentageWcpsReduced;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_8;
    goto LABEL_51;
  }
LABEL_50:
  v41 = 0;
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
LABEL_8:
    v40 = 2654435761u * self->_percentageWcpsDisabled;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_9;
    goto LABEL_52;
  }
LABEL_51:
  v40 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_9:
    v39 = 2654435761u * self->_cntVoGoodPeriods;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_10;
    goto LABEL_53;
  }
LABEL_52:
  v39 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_10:
    v38 = 2654435761u * self->_cntVoBadPeriods;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_11;
    goto LABEL_54;
  }
LABEL_53:
  v38 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_11:
    v37 = 2654435761u * self->_avgRssi;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_12;
    goto LABEL_55;
  }
LABEL_54:
  v37 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_12:
    v36 = 2654435761u * self->_avgSnr;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_13;
    goto LABEL_56;
  }
LABEL_55:
  v36 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_13:
    v35 = 2654435761u * self->_avgCca;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_14;
    goto LABEL_57;
  }
LABEL_56:
  v35 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_14:
    v34 = 2654435761u * self->_avgTxAirLatency;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_15;
    goto LABEL_58;
  }
LABEL_57:
  v34 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_15:
    v33 = 2654435761u * self->_avgTxPacketLoss;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_58:
  v33 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_16:
    v32 = 2654435761u * self->_avgTxRetrans;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_17;
    goto LABEL_60;
  }
LABEL_59:
  v32 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_17:
    v31 = 2654435761u * self->_avgRxRetry;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_60:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_18:
    v30 = 2654435761u * self->_endRssi;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_19;
    goto LABEL_62;
  }
LABEL_61:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_19:
    v3 = 2654435761u * self->_endSnr;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_20;
    goto LABEL_63;
  }
LABEL_62:
  v3 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_20:
    v4 = 2654435761u * self->_endCca;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_21;
    goto LABEL_64;
  }
LABEL_63:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_21:
    v5 = 2654435761u * self->_endTxAirLatency;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_22;
    goto LABEL_65;
  }
LABEL_64:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_22:
    v6 = 2654435761u * self->_endTxPacketLoss;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_23;
    goto LABEL_66;
  }
LABEL_65:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_23:
    v7 = 2654435761u * self->_endTxRetrans;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_24;
    goto LABEL_67;
  }
LABEL_66:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_24:
    v8 = 2654435761u * self->_endRxRetry;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_25;
    goto LABEL_68;
  }
LABEL_67:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_25:
    v9 = 2654435761u * self->_minRssi;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_26;
    goto LABEL_69;
  }
LABEL_68:
  v9 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_26:
    v10 = 2654435761u * self->_minSnr;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_27;
    goto LABEL_70;
  }
LABEL_69:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_27:
    v11 = 2654435761u * self->_minCca;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_28;
    goto LABEL_71;
  }
LABEL_70:
  v11 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_28:
    v12 = 2654435761u * self->_minTxAirLatency;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_29;
    goto LABEL_72;
  }
LABEL_71:
  v12 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_29:
    v13 = 2654435761u * self->_minTxPacketLoss;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_30;
    goto LABEL_73;
  }
LABEL_72:
  v13 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_30:
    v14 = 2654435761u * self->_minTxRetrans;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  v14 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_31:
    v15 = 2654435761u * self->_minRxRetry;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_32:
    v16 = 2654435761u * self->_maxRssi;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_33:
    v17 = 2654435761u * self->_maxnSnr;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_34:
    v18 = 2654435761u * self->_maxCca;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_35:
    v19 = 2654435761u * self->_maxTxAirLatency;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_36:
    v20 = 2654435761u * self->_maxTxPacketLoss;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_37:
    v21 = 2654435761u * self->_maxTxRetrans;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_38:
    v22 = 2654435761u * self->_maxRxRetry;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  v22 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_39:
    v23 = 2654435761u * self->_cntRedBtConnLatLow;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  v23 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_40:
    v24 = 2654435761u * self->_cntRedBtDisconnLatHi;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  v24 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_41:
    v25 = 2654435761u * self->_cntDisBtConnLatHi;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  v25 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_42:
    v26 = 2654435761u * self->_cntDisBtEv3;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_43;
LABEL_86:
    v27 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_44;
LABEL_87:
    v28 = 0;
    return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_85:
  v26 = 0;
  if ((*(_BYTE *)&has & 0x80) == 0)
    goto LABEL_86;
LABEL_43:
  v27 = 2654435761u * self->_cntAwdlActive;
  if ((*(_DWORD *)&has & 0x10000) == 0)
    goto LABEL_87;
LABEL_44:
  v28 = 2654435761u * self->_endLinkState;
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x40000000000) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 43);
    *(_QWORD *)&self->_has |= 0x40000000000uLL;
    v3 = *((_QWORD *)a3 + 44);
    if ((v3 & 0x4000) == 0)
    {
LABEL_3:
      if ((v3 & 0x2000000000) == 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else if ((v3 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_durationBucket = *((_QWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x2000000000) == 0)
  {
LABEL_4:
    if ((v3 & 0x4000000000) == 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_47:
  self->_percentageActive = *((_QWORD *)a3 + 38);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x4000000000) == 0)
  {
LABEL_5:
    if ((v3 & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  self->_percentagePowerSave = *((_QWORD *)a3 + 39);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x10000000000) == 0)
  {
LABEL_6:
    if ((v3 & 0x20000000000) == 0)
      goto LABEL_7;
    goto LABEL_50;
  }
LABEL_49:
  self->_percentageWcpsEnabled = *((_QWORD *)a3 + 41);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x20000000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x8000000000) == 0)
      goto LABEL_8;
    goto LABEL_51;
  }
LABEL_50:
  self->_percentageWcpsReduced = *((_QWORD *)a3 + 42);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x8000000000) == 0)
  {
LABEL_8:
    if ((v3 & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_52;
  }
LABEL_51:
  self->_percentageWcpsDisabled = *((_QWORD *)a3 + 40);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x2000) == 0)
  {
LABEL_9:
    if ((v3 & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_53;
  }
LABEL_52:
  self->_cntVoGoodPeriods = *((_QWORD *)a3 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x1000) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0)
      goto LABEL_11;
    goto LABEL_54;
  }
LABEL_53:
  self->_cntVoBadPeriods = *((_QWORD *)a3 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_11:
    if ((v3 & 8) == 0)
      goto LABEL_12;
    goto LABEL_55;
  }
LABEL_54:
  self->_avgRssi = *((_QWORD *)a3 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 8) == 0)
  {
LABEL_12:
    if ((v3 & 1) == 0)
      goto LABEL_13;
    goto LABEL_56;
  }
LABEL_55:
  self->_avgSnr = *((_QWORD *)a3 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 1) == 0)
  {
LABEL_13:
    if ((v3 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_57;
  }
LABEL_56:
  self->_avgCca = *((_QWORD *)a3 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_14:
    if ((v3 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_58;
  }
LABEL_57:
  self->_avgTxAirLatency = *((_QWORD *)a3 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x20) == 0)
  {
LABEL_15:
    if ((v3 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_58:
  self->_avgTxPacketLoss = *((_QWORD *)a3 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_16:
    if ((v3 & 4) == 0)
      goto LABEL_17;
    goto LABEL_60;
  }
LABEL_59:
  self->_avgTxRetrans = *((_QWORD *)a3 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 4) == 0)
  {
LABEL_17:
    if ((v3 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_60:
  self->_avgRxRetry = *((_QWORD *)a3 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x20000) == 0)
  {
LABEL_18:
    if ((v3 & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_62;
  }
LABEL_61:
  self->_endRssi = *((_QWORD *)a3 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x80000) == 0)
  {
LABEL_19:
    if ((v3 & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_63;
  }
LABEL_62:
  self->_endSnr = *((_QWORD *)a3 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x8000) == 0)
  {
LABEL_20:
    if ((v3 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_64;
  }
LABEL_63:
  self->_endCca = *((_QWORD *)a3 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x100000) == 0)
  {
LABEL_21:
    if ((v3 & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_65;
  }
LABEL_64:
  self->_endTxAirLatency = *((_QWORD *)a3 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x200000) == 0)
  {
LABEL_22:
    if ((v3 & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_66;
  }
LABEL_65:
  self->_endTxPacketLoss = *((_QWORD *)a3 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x400000) == 0)
  {
LABEL_23:
    if ((v3 & 0x40000) == 0)
      goto LABEL_24;
    goto LABEL_67;
  }
LABEL_66:
  self->_endTxRetrans = *((_QWORD *)a3 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x40000) == 0)
  {
LABEL_24:
    if ((v3 & 0x80000000) == 0)
      goto LABEL_25;
    goto LABEL_68;
  }
LABEL_67:
  self->_endRxRetry = *((_QWORD *)a3 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_69;
  }
LABEL_68:
  self->_minRssi = *((_QWORD *)a3 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x40000000) == 0)
      goto LABEL_27;
    goto LABEL_70;
  }
LABEL_69:
  self->_minSnr = *((_QWORD *)a3 + 34);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x400000000) == 0)
      goto LABEL_28;
    goto LABEL_71;
  }
LABEL_70:
  self->_minCca = *((_QWORD *)a3 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x800000000) == 0)
      goto LABEL_29;
    goto LABEL_72;
  }
LABEL_71:
  self->_minTxAirLatency = *((_QWORD *)a3 + 35);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x1000000000) == 0)
      goto LABEL_30;
    goto LABEL_73;
  }
LABEL_72:
  self->_minTxPacketLoss = *((_QWORD *)a3 + 36);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x1000000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  self->_minTxRetrans = *((_QWORD *)a3 + 37);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_31:
    if ((v3 & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  self->_minRxRetry = *((_QWORD *)a3 + 33);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  self->_maxRssi = *((_QWORD *)a3 + 25);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_33:
    if ((v3 & 0x800000) == 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  self->_maxnSnr = *((_QWORD *)a3 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x800000) == 0)
  {
LABEL_34:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  self->_maxCca = *((_QWORD *)a3 + 24);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_35:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  self->_maxTxAirLatency = *((_QWORD *)a3 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_36:
    if ((v3 & 0x10000000) == 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  self->_maxTxPacketLoss = *((_QWORD *)a3 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_37:
    if ((v3 & 0x2000000) == 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  self->_maxTxRetrans = *((_QWORD *)a3 + 29);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_38:
    if ((v3 & 0x400) == 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  self->_maxRxRetry = *((_QWORD *)a3 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x400) == 0)
  {
LABEL_39:
    if ((v3 & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  self->_cntRedBtConnLatLow = *((_QWORD *)a3 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x800) == 0)
  {
LABEL_40:
    if ((v3 & 0x100) == 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  self->_cntRedBtDisconnLatHi = *((_QWORD *)a3 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x100) == 0)
  {
LABEL_41:
    if ((v3 & 0x200) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  self->_cntDisBtConnLatHi = *((_QWORD *)a3 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x200) == 0)
  {
LABEL_42:
    if ((v3 & 0x80) == 0)
      goto LABEL_43;
    goto LABEL_86;
  }
LABEL_85:
  self->_cntDisBtEv3 = *((_QWORD *)a3 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v3 = *((_QWORD *)a3 + 44);
  if ((v3 & 0x80) == 0)
  {
LABEL_43:
    if ((v3 & 0x10000) == 0)
      return;
LABEL_87:
    self->_endLinkState = *((_QWORD *)a3 + 17);
    *(_QWORD *)&self->_has |= 0x10000uLL;
    return;
  }
LABEL_86:
  self->_cntAwdlActive = *((_QWORD *)a3 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  if ((*((_QWORD *)a3 + 44) & 0x10000) != 0)
    goto LABEL_87;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)durationBucket
{
  return self->_durationBucket;
}

- (unint64_t)percentageActive
{
  return self->_percentageActive;
}

- (unint64_t)percentagePowerSave
{
  return self->_percentagePowerSave;
}

- (unint64_t)percentageWcpsEnabled
{
  return self->_percentageWcpsEnabled;
}

- (unint64_t)percentageWcpsReduced
{
  return self->_percentageWcpsReduced;
}

- (unint64_t)percentageWcpsDisabled
{
  return self->_percentageWcpsDisabled;
}

- (unint64_t)cntVoGoodPeriods
{
  return self->_cntVoGoodPeriods;
}

- (unint64_t)cntVoBadPeriods
{
  return self->_cntVoBadPeriods;
}

- (unint64_t)avgRssi
{
  return self->_avgRssi;
}

- (unint64_t)avgSnr
{
  return self->_avgSnr;
}

- (unint64_t)avgCca
{
  return self->_avgCca;
}

- (unint64_t)avgTxAirLatency
{
  return self->_avgTxAirLatency;
}

- (unint64_t)avgTxPacketLoss
{
  return self->_avgTxPacketLoss;
}

- (unint64_t)avgTxRetrans
{
  return self->_avgTxRetrans;
}

- (unint64_t)avgRxRetry
{
  return self->_avgRxRetry;
}

- (unint64_t)endRssi
{
  return self->_endRssi;
}

- (unint64_t)endSnr
{
  return self->_endSnr;
}

- (unint64_t)endCca
{
  return self->_endCca;
}

- (unint64_t)endTxAirLatency
{
  return self->_endTxAirLatency;
}

- (unint64_t)endTxPacketLoss
{
  return self->_endTxPacketLoss;
}

- (unint64_t)endTxRetrans
{
  return self->_endTxRetrans;
}

- (unint64_t)endRxRetry
{
  return self->_endRxRetry;
}

- (unint64_t)minRssi
{
  return self->_minRssi;
}

- (unint64_t)minSnr
{
  return self->_minSnr;
}

- (unint64_t)minCca
{
  return self->_minCca;
}

- (unint64_t)minTxAirLatency
{
  return self->_minTxAirLatency;
}

- (unint64_t)minTxPacketLoss
{
  return self->_minTxPacketLoss;
}

- (unint64_t)minTxRetrans
{
  return self->_minTxRetrans;
}

- (unint64_t)minRxRetry
{
  return self->_minRxRetry;
}

- (unint64_t)maxRssi
{
  return self->_maxRssi;
}

- (unint64_t)maxnSnr
{
  return self->_maxnSnr;
}

- (unint64_t)maxCca
{
  return self->_maxCca;
}

- (unint64_t)maxTxAirLatency
{
  return self->_maxTxAirLatency;
}

- (unint64_t)maxTxPacketLoss
{
  return self->_maxTxPacketLoss;
}

- (unint64_t)maxTxRetrans
{
  return self->_maxTxRetrans;
}

- (unint64_t)maxRxRetry
{
  return self->_maxRxRetry;
}

- (unint64_t)cntRedBtConnLatLow
{
  return self->_cntRedBtConnLatLow;
}

- (unint64_t)cntRedBtDisconnLatHi
{
  return self->_cntRedBtDisconnLatHi;
}

- (unint64_t)cntDisBtConnLatHi
{
  return self->_cntDisBtConnLatHi;
}

- (unint64_t)cntDisBtEv3
{
  return self->_cntDisBtEv3;
}

- (unint64_t)cntAwdlActive
{
  return self->_cntAwdlActive;
}

- (unint64_t)endLinkState
{
  return self->_endLinkState;
}

@end
