@implementation WiFiAnalyticsAWDLinkQualityMeasurements

- (void)setTimestamp:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasTimestamp
{
  return *((unsigned __int8 *)&self->_has + 9) >> 7;
}

- (void)setTxOutputBelowExpectedTrue:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000000uLL;
  self->_txOutputBelowExpectedTrue = a3;
}

- (void)setHasTxOutputBelowExpectedTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasTxOutputBelowExpectedTrue
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 2) & 1;
}

- (void)setTxOutputBelowExpectedFalse:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000000uLL;
  self->_txOutputBelowExpectedFalse = a3;
}

- (void)setHasTxOutputBelowExpectedFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasTxOutputBelowExpectedFalse
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 1) & 1;
}

- (void)setTxOutputBelowInputTrue:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10000000uLL;
  self->_txOutputBelowInputTrue = a3;
}

- (void)setHasTxOutputBelowInputTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasTxOutputBelowInputTrue
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 4) & 1;
}

- (void)setTxOutputBelowInputFalse:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000000uLL;
  self->_txOutputBelowInputFalse = a3;
}

- (void)setHasTxOutputBelowInputFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasTxOutputBelowInputFalse
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 3) & 1;
}

- (void)setTxLowFrameCountTrue:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000000uLL;
  self->_txLowFrameCountTrue = a3;
}

- (void)setHasTxLowFrameCountTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasTxLowFrameCountTrue
{
  return *((_BYTE *)&self->_has + 11) & 1;
}

- (void)setTxLowFrameCountFalse:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800000uLL;
  self->_txLowFrameCountFalse = a3;
}

- (void)setHasTxLowFrameCountFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasTxLowFrameCountFalse
{
  return *((unsigned __int8 *)&self->_has + 10) >> 7;
}

- (void)setRxLowFrameCountTrue:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 8uLL;
  self->_rxLowFrameCountTrue = a3;
}

- (void)setHasRxLowFrameCountTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasRxLowFrameCountTrue
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 3) & 1;
}

- (void)setRxLowFrameCountFalse:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 4uLL;
  self->_rxLowFrameCountFalse = a3;
}

- (void)setHasRxLowFrameCountFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasRxLowFrameCountFalse
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 2) & 1;
}

- (void)setHighTxLatencyTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_highTxLatencyTrue = a3;
}

- (void)setHasHighTxLatencyTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasHighTxLatencyTrue
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHighTxLatencyFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_highTxLatencyFalse = a3;
}

- (void)setHasHighTxLatencyFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasHighTxLatencyFalse
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setLowTxPhyRateTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_lowTxPhyRateTrue = a3;
}

- (void)setHasLowTxPhyRateTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowTxPhyRateTrue
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setLowTxPhyRateFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_lowTxPhyRateFalse = a3;
}

- (void)setHasLowTxPhyRateFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowTxPhyRateFalse
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (void)setHighTxPerTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_highTxPerTrue = a3;
}

- (void)setHasHighTxPerTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasHighTxPerTrue
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setHighTxPerFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_highTxPerFalse = a3;
}

- (void)setHasHighTxPerFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasHighTxPerFalse
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHighTxRetriesTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_highTxRetriesTrue = a3;
}

- (void)setHasHighTxRetriesTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasHighTxRetriesTrue
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHighTxRetriesFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_highTxRetriesFalse = a3;
}

- (void)setHasHighTxRetriesFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasHighTxRetriesFalse
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setTxQueueFullTrue:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80000000uLL;
  self->_txQueueFullTrue = a3;
}

- (void)setHasTxQueueFullTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasTxQueueFullTrue
{
  return *((unsigned __int8 *)&self->_has + 11) >> 7;
}

- (void)setTxQueueFullFalse:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40000000uLL;
  self->_txQueueFullFalse = a3;
}

- (void)setHasTxQueueFullFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasTxQueueFullFalse
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 6) & 1;
}

- (void)setLowTxAMPDUDensityTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_lowTxAMPDUDensityTrue = a3;
}

- (void)setHasLowTxAMPDUDensityTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowTxAMPDUDensityTrue
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setLowTxAMPDUDensityFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_lowTxAMPDUDensityFalse = a3;
}

- (void)setHasLowTxAMPDUDensityFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowTxAMPDUDensityFalse
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setHighRxRetriesTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_highRxRetriesTrue = a3;
}

- (void)setHasHighRxRetriesTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasHighRxRetriesTrue
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHighRxRetriesFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_highRxRetriesFalse = a3;
}

- (void)setHasHighRxRetriesFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasHighRxRetriesFalse
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHighRxPhyPERTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_highRxPhyPERTrue = a3;
}

- (void)setHasHighRxPhyPERTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasHighRxPhyPERTrue
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHighRxPhyPERFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_highRxPhyPERFalse = a3;
}

- (void)setHasHighRxPhyPERFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasHighRxPhyPERFalse
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHighRxFCSErrsTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_highRxFCSErrsTrue = a3;
}

- (void)setHasHighRxFCSErrsTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasHighRxFCSErrsTrue
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHighRxFCSErrsFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_highRxFCSErrsFalse = a3;
}

- (void)setHasHighRxFCSErrsFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasHighRxFCSErrsFalse
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHighRxOverflowsTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_highRxOverflowsTrue = a3;
}

- (void)setHasHighRxOverflowsTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasHighRxOverflowsTrue
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHighRxOverflowsFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_highRxOverflowsFalse = a3;
}

- (void)setHasHighRxOverflowsFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasHighRxOverflowsFalse
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHighRxDupsTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_highRxDupsTrue = a3;
}

- (void)setHasHighRxDupsTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasHighRxDupsTrue
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHighRxDupsFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_highRxDupsFalse = a3;
}

- (void)setHasHighRxDupsFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasHighRxDupsFalse
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHighRxReplaysTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_highRxReplaysTrue = a3;
}

- (void)setHasHighRxReplaysTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasHighRxReplaysTrue
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHighRxReplaysFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_highRxReplaysFalse = a3;
}

- (void)setHasHighRxReplaysFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasHighRxReplaysFalse
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHighRxDecryptErrsTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_highRxDecryptErrsTrue = a3;
}

- (void)setHasHighRxDecryptErrsTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasHighRxDecryptErrsTrue
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHighRxDecryptErrsFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_highRxDecryptErrsFalse = a3;
}

- (void)setHasHighRxDecryptErrsFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasHighRxDecryptErrsFalse
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHighRxDataPERTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_highRxDataPERTrue = a3;
}

- (void)setHasHighRxDataPERTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasHighRxDataPERTrue
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHighRxDataPERFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_highRxDataPERFalse = a3;
}

- (void)setHasHighRxDataPERFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasHighRxDataPERFalse
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLowAvailWLANDurTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_lowAvailWLANDurTrue = a3;
}

- (void)setHasLowAvailWLANDurTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANDurTrue
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setLowAvailWLANDurFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_lowAvailWLANDurFalse = a3;
}

- (void)setHasLowAvailWLANDurFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANDurFalse
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setLowAvailWLANTxDurTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_lowAvailWLANTxDurTrue = a3;
}

- (void)setHasLowAvailWLANTxDurTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANTxDurTrue
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setLowAvailWLANTxDurFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_lowAvailWLANTxDurFalse = a3;
}

- (void)setHasLowAvailWLANTxDurFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANTxDurFalse
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setLowAvailWLANRxDurTrue:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_lowAvailWLANRxDurTrue = a3;
}

- (void)setHasLowAvailWLANRxDurTrue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANRxDurTrue
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setLowAvailWLANRxDurFalse:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_lowAvailWLANRxDurFalse = a3;
}

- (void)setHasLowAvailWLANRxDurFalse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANRxDurFalse
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setCCA:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_cCA = a3;
}

- (void)setHasCCA:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasCCA
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setRSSI:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_rSSI = a3;
}

- (void)setHasRSSI:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRSSI
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (void)setTxPhyRate:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20000000uLL;
  self->_txPhyRate = a3;
}

- (void)setHasTxPhyRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasTxPhyRate
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 5) & 1;
}

- (void)setRxPhyRate:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40uLL;
  self->_rxPhyRate = a3;
}

- (void)setHasRxPhyRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasRxPhyRate
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 6) & 1;
}

- (void)setTxAMPDUDensity:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10000uLL;
  self->_txAMPDUDensity = a3;
}

- (void)setHasTxAMPDUDensity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasTxAMPDUDensity
{
  return *((_BYTE *)&self->_has + 10) & 1;
}

- (void)setMeasurementDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_measurementDurMS = a3;
}

- (void)setHasMeasurementDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMeasurementDurMS
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setConcurrentIntDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_concurrentIntDurMS = a3;
}

- (void)setHasConcurrentIntDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasConcurrentIntDurMS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTVPMActiveDurationMS:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000uLL;
  self->_tVPMActiveDurationMS = a3;
}

- (void)setHasTVPMActiveDurationMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasTVPMActiveDurationMS
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 4) & 1;
}

- (void)setPhyTxActivityDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_phyTxActivityDurMS = a3;
}

- (void)setHasPhyTxActivityDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPhyTxActivityDurMS
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setPhyRxActivityDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_phyRxActivityDurMS = a3;
}

- (void)setHasPhyRxActivityDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPhyRxActivityDurMS
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setTxSubBytes:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200000000uLL;
  self->_txSubBytes = a3;
}

- (void)setHasTxSubBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasTxSubBytes
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 1) & 1;
}

- (void)setTxCompBytes:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20000uLL;
  self->_txCompBytes = a3;
}

- (void)setHasTxCompBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasTxCompBytes
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 1) & 1;
}

- (void)setTxDelayBytes:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80000uLL;
  self->_txDelayBytes = a3;
}

- (void)setHasTxDelayBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasTxDelayBytes
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 3) & 1;
}

- (void)setOffChanDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_offChanDurMS = a3;
}

- (void)setHasOffChanDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasOffChanDurMS
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setTxSubPkts:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400000000uLL;
  self->_txSubPkts = a3;
}

- (void)setHasTxSubPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasTxSubPkts
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 2) & 1;
}

- (void)setTxCompPkts:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40000uLL;
  self->_txCompPkts = a3;
}

- (void)setHasTxCompPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasTxCompPkts
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 2) & 1;
}

- (void)setMaxQueueFullDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_maxQueueFullDurMS = a3;
}

- (void)setHasMaxQueueFullDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMaxQueueFullDurMS
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setAvgTxLatencyMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_avgTxLatencyMS = a3;
}

- (void)setHasAvgTxLatencyMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasAvgTxLatencyMS
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setBTAntennaDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_bTAntennaDurMS = a3;
}

- (void)setHasBTAntennaDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasBTAntennaDurMS
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setOutputThroughput:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_outputThroughput = a3;
}

- (void)setHasOutputThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasOutputThroughput
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setInputThroughput:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_inputThroughput = a3;
}

- (void)setHasInputThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasInputThroughput
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setExpectedThroughput:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_expectedThroughput = a3;
}

- (void)setHasExpectedThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasExpectedThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDelayedThroughput:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_delayedThroughput = a3;
}

- (void)setHasDelayedThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasDelayedThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAvailWLANDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_availWLANDurMS = a3;
}

- (void)setHasAvailWLANDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasAvailWLANDurMS
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAvailWLANTxDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_availWLANTxDurMS = a3;
}

- (void)setHasAvailWLANTxDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasAvailWLANTxDurMS
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAvailWLANRxDurMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_availWLANRxDurMS = a3;
}

- (void)setHasAvailWLANRxDurMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasAvailWLANRxDurMS
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTxRetries:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100000000uLL;
  self->_txRetries = a3;
}

- (void)setHasTxRetries:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasTxRetries
{
  return *((_BYTE *)&self->_has + 12) & 1;
}

- (void)setTxFails:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200000uLL;
  self->_txFails = a3;
}

- (void)setHasTxFails:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasTxFails
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 5) & 1;
}

- (void)setTxFrames:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400000uLL;
  self->_txFrames = a3;
}

- (void)setHasTxFrames:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasTxFrames
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 6) & 1;
}

- (void)setRxOvflErrs:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10uLL;
  self->_rxOvflErrs = a3;
}

- (void)setHasRxOvflErrs:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasRxOvflErrs
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 4) & 1;
}

- (void)setRxFCSErrs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_rxFCSErrs = a3;
}

- (void)setHasRxFCSErrs:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasRxFCSErrs
{
  return *((unsigned __int8 *)&self->_has + 7) >> 7;
}

- (void)setRxPLCPErrs:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20uLL;
  self->_rxPLCPErrs = a3;
}

- (void)setHasRxPLCPErrs:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasRxPLCPErrs
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 5) & 1;
}

- (void)setRxCRSErrs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_rxCRSErrs = a3;
}

- (void)setHasRxCRSErrs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRxCRSErrs
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setRxDupErrs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_rxDupErrs = a3;
}

- (void)setHasRxDupErrs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRxDupErrs
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 6) & 1;
}

- (void)setRxReplayErrs:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80uLL;
  self->_rxReplayErrs = a3;
}

- (void)setHasRxReplayErrs:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasRxReplayErrs
{
  return *((unsigned __int8 *)&self->_has + 8) >> 7;
}

- (void)setRxDecryErrs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_rxDecryErrs = a3;
}

- (void)setHasRxDecryErrs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRxDecryErrs
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (void)setRxRetries:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100uLL;
  self->_rxRetries = a3;
}

- (void)setHasRxRetries:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasRxRetries
{
  return *((_BYTE *)&self->_has + 9) & 1;
}

- (void)setRxGoodPlcps:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 2uLL;
  self->_rxGoodPlcps = a3;
}

- (void)setHasRxGoodPlcps:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasRxGoodPlcps
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 1) & 1;
}

- (void)setRxFrames:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 1uLL;
  self->_rxFrames = a3;
}

- (void)setHasRxFrames:(BOOL)a3
{
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasRxFrames
{
  return *((_BYTE *)&self->_has + 8) & 1;
}

- (void)setSNR:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400uLL;
  self->_sNR = a3;
}

- (void)setHasSNR:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasSNR
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 2) & 1;
}

- (void)setTxExpectedAMPDUDensity:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100000uLL;
  self->_txExpectedAMPDUDensity = a3;
}

- (void)setHasTxExpectedAMPDUDensity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasTxExpectedAMPDUDensity
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 4) & 1;
}

- (void)setRC1CoexDurationMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_rC1CoexDurationMS = a3;
}

- (void)setHasRC1CoexDurationMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRC1CoexDurationMS
{
  return *((_BYTE *)&self->_has + 7) & 1;
}

- (void)setRC2CoexDurationMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_rC2CoexDurationMS = a3;
}

- (void)setHasRC2CoexDurationMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRC2CoexDurationMS
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setLTECoexDurationMS:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_lTECoexDurationMS = a3;
}

- (void)setHasLTECoexDurationMS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasLTECoexDurationMS
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setRxThroughput:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200uLL;
  self->_rxThroughput = a3;
}

- (void)setHasRxThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasRxThroughput
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 1) & 1;
}

- (void)setAPTxDataStall:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_aPTxDataStall = a3;
}

- (void)setHasAPTxDataStall:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasAPTxDataStall
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRxAmpduTxBaMismatch:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_rxAmpduTxBaMismatch = a3;
}

- (void)setHasRxAmpduTxBaMismatch:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRxAmpduTxBaMismatch
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setSymptomsFails:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800uLL;
  self->_symptomsFails = a3;
}

- (void)setHasSymptomsFails:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasSymptomsFails
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 3) & 1;
}

- (void)setIs2GBand:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_is2GBand = a3;
}

- (void)setHasIs2GBand:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasIs2GBand
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setIsFGTraffic:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_isFGTraffic = a3;
}

- (void)setHasIsFGTraffic:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasIsFGTraffic
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setBaselineThroughput:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_baselineThroughput = a3;
}

- (void)setHasBaselineThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasBaselineThroughput
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTestThroughput:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000uLL;
  self->_testThroughput = a3;
}

- (void)setHasTestThroughput:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasTestThroughput
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 5) & 1;
}

- (void)setInfraDutyCycle:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_infraDutyCycle = a3;
}

- (void)setHasInfraDutyCycle:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasInfraDutyCycle
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setLastScanReason:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_lastScanReason = a3;
}

- (void)setHasLastScanReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasLastScanReason
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setAccessPointOUI:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_accessPointOUI = a3;
}

- (void)setHasAccessPointOUI:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasAccessPointOUI
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimeSinceLastRecovery:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000uLL;
  self->_timeSinceLastRecovery = a3;
}

- (void)setHasTimeSinceLastRecovery:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasTimeSinceLastRecovery
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 6) & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDLinkQualityMeasurements;
  -[WiFiAnalyticsAWDLinkQualityMeasurements description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDLinkQualityMeasurements dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t has;
  void *v7;
  id v8;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    v4 = *((_QWORD *)&self->_has + 1);
  }
  has = (uint64_t)self->_has;
  if ((v4 & 0x4000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txOutputBelowExpectedTrue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("TxOutputBelowExpected_true"));

    has = (uint64_t)self->_has;
    v4 = *((_QWORD *)&self->_has + 1);
    if ((v4 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v4 & 0x10000000) == 0)
        goto LABEL_6;
      goto LABEL_105;
    }
  }
  else if ((v4 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txOutputBelowExpectedFalse);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("TxOutputBelowExpected_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v4 & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txOutputBelowInputTrue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("TxOutputBelowInput_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v4 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txOutputBelowInputFalse);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("TxOutputBelowInput_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v4 & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txLowFrameCountTrue);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("TxLowFrameCount_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x800000) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0)
      goto LABEL_10;
    goto LABEL_109;
  }
LABEL_108:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txLowFrameCountFalse);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("TxLowFrameCount_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 4) == 0)
      goto LABEL_11;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxLowFrameCountTrue);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("RxLowFrameCount_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 4) == 0)
  {
LABEL_11:
    if ((has & 0x20000000) == 0)
      goto LABEL_12;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxLowFrameCountFalse);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("RxLowFrameCount_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_12:
    if ((has & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highTxLatencyTrue);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("HighTxLatency_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_13:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_14;
    goto LABEL_113;
  }
LABEL_112:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highTxLatencyFalse);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("HighTxLatency_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x1000000000000) == 0)
      goto LABEL_15;
    goto LABEL_114;
  }
LABEL_113:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowTxPhyRateTrue);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("LowTxPhyRate_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x80000000) == 0)
      goto LABEL_16;
    goto LABEL_115;
  }
LABEL_114:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowTxPhyRateFalse);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("LowTxPhyRate_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000) == 0)
  {
LABEL_16:
    if ((has & 0x40000000) == 0)
      goto LABEL_17;
    goto LABEL_116;
  }
LABEL_115:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highTxPerTrue);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("HighTxPer_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_17:
    if ((has & 0x200000000) == 0)
      goto LABEL_18;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highTxPerFalse);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("HighTxPer_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_18:
    if ((has & 0x100000000) == 0)
      goto LABEL_19;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highTxRetriesTrue);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("HighTxRetries_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_19:
    if ((v4 & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highTxRetriesFalse);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("HighTxRetries_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v4 & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txQueueFullTrue);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("TxQueueFull_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x40000000) == 0)
  {
LABEL_21:
    if ((has & 0x800000000000) == 0)
      goto LABEL_22;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txQueueFullFalse);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("TxQueueFull_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_22:
    if ((has & 0x400000000000) == 0)
      goto LABEL_23;
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowTxAMPDUDensityTrue);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("LowTxAMPDUDensity_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_23:
    if ((has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_123;
  }
LABEL_122:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowTxAMPDUDensityFalse);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("LowTxAMPDUDensity_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_24:
    if ((has & 0x4000000) == 0)
      goto LABEL_25;
    goto LABEL_124;
  }
LABEL_123:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxRetriesTrue);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("HighRxRetries_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxRetriesFalse);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("HighRxRetries_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxPhyPERTrue);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("HighRxPhyPER_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_27:
    if ((has & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxPhyPERFalse);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("HighRxPhyPER_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_28:
    if ((has & 0x40000) == 0)
      goto LABEL_29;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxFCSErrsTrue);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("HighRxFCSErrs_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_29:
    if ((has & 0x200000) == 0)
      goto LABEL_30;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxFCSErrsFalse);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("HighRxFCSErrs_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_30:
    if ((has & 0x100000) == 0)
      goto LABEL_31;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxOverflowsTrue);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("HighRxOverflows_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_31:
    if ((has & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxOverflowsFalse);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("HighRxOverflows_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_32:
    if ((has & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_132;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxDupsTrue);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("HighRxDups_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_33:
    if ((has & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_133;
  }
LABEL_132:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxDupsFalse);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("HighRxDups_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_34:
    if ((has & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_134;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxReplaysTrue);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("HighRxReplays_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_35:
    if ((has & 0x8000) == 0)
      goto LABEL_36;
    goto LABEL_135;
  }
LABEL_134:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxReplaysFalse);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("HighRxReplays_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_36:
    if ((has & 0x4000) == 0)
      goto LABEL_37;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxDecryptErrsTrue);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("HighRxDecryptErrs_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_37:
    if ((has & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxDecryptErrsFalse);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("HighRxDecryptErrs_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_38:
    if ((has & 0x1000) == 0)
      goto LABEL_39;
    goto LABEL_138;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxDataPERTrue);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("HighRxDataPER_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_39:
    if ((has & 0x20000000000) == 0)
      goto LABEL_40;
    goto LABEL_139;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_highRxDataPERFalse);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("HighRxDataPER_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0)
      goto LABEL_41;
    goto LABEL_140;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowAvailWLANDurTrue);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("LowAvailWLANDur_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x200000000000) == 0)
      goto LABEL_42;
    goto LABEL_141;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowAvailWLANDurFalse);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("LowAvailWLANDur_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000000000) == 0)
      goto LABEL_43;
    goto LABEL_142;
  }
LABEL_141:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowAvailWLANTxDurTrue);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("LowAvailWLANTxDur_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_43:
    if ((has & 0x80000000000) == 0)
      goto LABEL_44;
    goto LABEL_143;
  }
LABEL_142:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowAvailWLANTxDurFalse);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("LowAvailWLANTxDur_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0)
      goto LABEL_45;
    goto LABEL_144;
  }
LABEL_143:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowAvailWLANRxDurTrue);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("LowAvailWLANRxDur_true"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_145;
  }
LABEL_144:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowAvailWLANRxDurFalse);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("LowAvailWLANRxDur_false"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_46:
    if ((has & 0x400000000000000) == 0)
      goto LABEL_47;
    goto LABEL_146;
  }
LABEL_145:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cCA);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("CCA"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v4 & 0x20000000) == 0)
      goto LABEL_48;
    goto LABEL_147;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_rSSI);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("RSSI"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v4 & 0x40) == 0)
      goto LABEL_49;
    goto LABEL_148;
  }
LABEL_147:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txPhyRate);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("TxPhyRate"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_49:
    if ((v4 & 0x10000) == 0)
      goto LABEL_50;
    goto LABEL_149;
  }
LABEL_148:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxPhyRate);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("RxPhyRate"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x10000) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_51;
    goto LABEL_150;
  }
LABEL_149:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txAMPDUDensity);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("TxAMPDUDensity"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x200) == 0)
      goto LABEL_52;
    goto LABEL_151;
  }
LABEL_150:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_measurementDurMS);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("MeasurementDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_52:
    if ((v4 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_152;
  }
LABEL_151:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_concurrentIntDurMS);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("ConcurrentIntDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x1000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000000000) == 0)
      goto LABEL_54;
    goto LABEL_153;
  }
LABEL_152:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tVPMActiveDurationMS);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("TVPMActiveDurationMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000000) == 0)
      goto LABEL_55;
    goto LABEL_154;
  }
LABEL_153:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_phyTxActivityDurMS);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("PhyTxActivityDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v4 & 0x200000000) == 0)
      goto LABEL_56;
    goto LABEL_155;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_phyRxActivityDurMS);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("PhyRxActivityDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v4 & 0x20000) == 0)
      goto LABEL_57;
    goto LABEL_156;
  }
LABEL_155:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txSubBytes);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("TxSubBytes"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x20000) == 0)
  {
LABEL_57:
    if ((v4 & 0x80000) == 0)
      goto LABEL_58;
    goto LABEL_157;
  }
LABEL_156:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txCompBytes);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("TxCompBytes"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x80000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_59;
    goto LABEL_158;
  }
LABEL_157:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txDelayBytes);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("TxDelayBytes"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v4 & 0x400000000) == 0)
      goto LABEL_60;
    goto LABEL_159;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_offChanDurMS);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("OffChanDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v4 & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_160;
  }
LABEL_159:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txSubPkts);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("TxSubPkts"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_62;
    goto LABEL_161;
  }
LABEL_160:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txCompPkts);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("TxCompPkts"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0)
      goto LABEL_63;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxQueueFullDurMS);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("MaxQueueFullDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0)
      goto LABEL_64;
    goto LABEL_163;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_avgTxLatencyMS);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("AvgTxLatencyMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_65;
    goto LABEL_164;
  }
LABEL_163:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bTAntennaDurMS);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("BTAntennaDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x800000000) == 0)
      goto LABEL_66;
    goto LABEL_165;
  }
LABEL_164:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_outputThroughput);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("OutputThroughput"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_66:
    if ((has & 0x800) == 0)
      goto LABEL_67;
    goto LABEL_166;
  }
LABEL_165:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_inputThroughput);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("InputThroughput"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_67:
    if ((has & 0x400) == 0)
      goto LABEL_68;
    goto LABEL_167;
  }
LABEL_166:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_expectedThroughput);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("ExpectedThroughput"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_68:
    if ((has & 4) == 0)
      goto LABEL_69;
    goto LABEL_168;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_delayedThroughput);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("DelayedThroughput"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0)
      goto LABEL_70;
    goto LABEL_169;
  }
LABEL_168:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_availWLANDurMS);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("AvailWLANDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 8) == 0)
      goto LABEL_71;
    goto LABEL_170;
  }
LABEL_169:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_availWLANTxDurMS);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("AvailWLANTxDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_71:
    if ((v4 & 0x100000000) == 0)
      goto LABEL_72;
    goto LABEL_171;
  }
LABEL_170:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_availWLANRxDurMS);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("AvailWLANRxDurMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v4 & 0x200000) == 0)
      goto LABEL_73;
    goto LABEL_172;
  }
LABEL_171:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txRetries);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("TxRetries"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x200000) == 0)
  {
LABEL_73:
    if ((v4 & 0x400000) == 0)
      goto LABEL_74;
    goto LABEL_173;
  }
LABEL_172:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txFails);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("TxFails"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x400000) == 0)
  {
LABEL_74:
    if ((v4 & 0x10) == 0)
      goto LABEL_75;
    goto LABEL_174;
  }
LABEL_173:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txFrames);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("TxFrames"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_75:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_76;
    goto LABEL_175;
  }
LABEL_174:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxOvflErrs);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("RxOvflErrs"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v4 & 0x20) == 0)
      goto LABEL_77;
    goto LABEL_176;
  }
LABEL_175:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxFCSErrs);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("RxFCSErrs"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_77:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_78;
    goto LABEL_177;
  }
LABEL_176:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxPLCPErrs);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("RxPLCPErrs"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_79;
    goto LABEL_178;
  }
LABEL_177:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxCRSErrs);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("RxCRSErrs"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v4 & 0x80) == 0)
      goto LABEL_80;
    goto LABEL_179;
  }
LABEL_178:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxDupErrs);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("RxDupErrs"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x80) == 0)
  {
LABEL_80:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_81;
    goto LABEL_180;
  }
LABEL_179:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxReplayErrs);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("RxReplayErrs"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v4 & 0x100) == 0)
      goto LABEL_82;
    goto LABEL_181;
  }
LABEL_180:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxDecryErrs);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("RxDecryErrs"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x100) == 0)
  {
LABEL_82:
    if ((v4 & 2) == 0)
      goto LABEL_83;
    goto LABEL_182;
  }
LABEL_181:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxRetries);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("RxRetries"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 2) == 0)
  {
LABEL_83:
    if ((v4 & 1) == 0)
      goto LABEL_84;
    goto LABEL_183;
  }
LABEL_182:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxGoodPlcps);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("RxGoodPlcps"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 1) == 0)
  {
LABEL_84:
    if ((v4 & 0x400) == 0)
      goto LABEL_85;
    goto LABEL_184;
  }
LABEL_183:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxFrames);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("RxFrames"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x400) == 0)
  {
LABEL_85:
    if ((v4 & 0x100000) == 0)
      goto LABEL_86;
    goto LABEL_185;
  }
LABEL_184:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sNR);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("SNR"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x100000) == 0)
  {
LABEL_86:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_87;
    goto LABEL_186;
  }
LABEL_185:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txExpectedAMPDUDensity);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("TxExpectedAMPDUDensity"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_88;
    goto LABEL_187;
  }
LABEL_186:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rC1CoexDurationMS);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("RC1CoexDurationMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000000) == 0)
      goto LABEL_89;
    goto LABEL_188;
  }
LABEL_187:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rC2CoexDurationMS);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("RC2CoexDurationMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v4 & 0x200) == 0)
      goto LABEL_90;
    goto LABEL_189;
  }
LABEL_188:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lTECoexDurationMS);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("LTECoexDurationMS"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x200) == 0)
  {
LABEL_90:
    if ((has & 1) == 0)
      goto LABEL_91;
    goto LABEL_190;
  }
LABEL_189:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxThroughput);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v96, CFSTR("RxThroughput"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_91:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_92;
    goto LABEL_191;
  }
LABEL_190:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_aPTxDataStall);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v97, CFSTR("APTxDataStall"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v4 & 0x800) == 0)
      goto LABEL_93;
    goto LABEL_192;
  }
LABEL_191:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxAmpduTxBaMismatch);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("RxAmpduTxBaMismatch"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x800) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_193;
  }
LABEL_192:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_symptomsFails);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("SymptomsFails"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_194;
  }
LABEL_193:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_is2GBand);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v100, CFSTR("Is2GBand"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x80) == 0)
      goto LABEL_96;
    goto LABEL_195;
  }
LABEL_194:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_isFGTraffic);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v101, CFSTR("IsFGTraffic"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_96:
    if ((v4 & 0x2000) == 0)
      goto LABEL_97;
    goto LABEL_196;
  }
LABEL_195:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_baselineThroughput);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v102, CFSTR("BaselineThroughput"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x2000) == 0)
  {
LABEL_97:
    if ((has & 0x400000000) == 0)
      goto LABEL_98;
    goto LABEL_197;
  }
LABEL_196:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_testThroughput);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v103, CFSTR("TestThroughput"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000000) == 0)
      goto LABEL_99;
    goto LABEL_198;
  }
LABEL_197:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_infraDutyCycle);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v104, CFSTR("InfraDutyCycle"));

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_99:
    if ((has & 2) == 0)
      goto LABEL_100;
LABEL_199:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_accessPointOUI);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v106, CFSTR("AccessPointOUI"));

    if ((*((_QWORD *)&self->_has + 1) & 0x4000) == 0)
      goto LABEL_102;
    goto LABEL_101;
  }
LABEL_198:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lastScanReason);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v105, CFSTR("LastScanReason"));

  v4 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)&self->_has & 2) != 0)
    goto LABEL_199;
LABEL_100:
  if ((v4 & 0x4000) != 0)
  {
LABEL_101:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeSinceLastRecovery);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("TimeSinceLastRecovery"));

  }
LABEL_102:
  v8 = v3;

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDLinkQualityMeasurementsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t has;
  id v7;

  v4 = a3;
  v5 = *((_QWORD *)&self->_has + 1);
  v7 = v4;
  if ((v5 & 0x8000) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
    v5 = *((_QWORD *)&self->_has + 1);
  }
  has = (uint64_t)self->_has;
  if ((v5 & 0x4000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
    has = (uint64_t)self->_has;
    v5 = *((_QWORD *)&self->_has + 1);
    if ((v5 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x10000000) == 0)
        goto LABEL_6;
      goto LABEL_105;
    }
  }
  else if ((v5 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((has & 0x20000000) == 0)
      goto LABEL_12;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_12:
    if ((has & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_13:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_14;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x1000000000000) == 0)
      goto LABEL_15;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x80000000) == 0)
      goto LABEL_16;
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000) == 0)
  {
LABEL_16:
    if ((has & 0x40000000) == 0)
      goto LABEL_17;
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_17:
    if ((has & 0x200000000) == 0)
      goto LABEL_18;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_18:
    if ((has & 0x100000000) == 0)
      goto LABEL_19;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_21:
    if ((has & 0x800000000000) == 0)
      goto LABEL_22;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_22:
    if ((has & 0x400000000000) == 0)
      goto LABEL_23;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_23:
    if ((has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_24:
    if ((has & 0x4000000) == 0)
      goto LABEL_25;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_27:
    if ((has & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_28:
    if ((has & 0x40000) == 0)
      goto LABEL_29;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_29:
    if ((has & 0x200000) == 0)
      goto LABEL_30;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_30:
    if ((has & 0x100000) == 0)
      goto LABEL_31;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_31:
    if ((has & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_32:
    if ((has & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_33:
    if ((has & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_34:
    if ((has & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_35:
    if ((has & 0x8000) == 0)
      goto LABEL_36;
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_36:
    if ((has & 0x4000) == 0)
      goto LABEL_37;
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_37:
    if ((has & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_38:
    if ((has & 0x1000) == 0)
      goto LABEL_39;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_39:
    if ((has & 0x20000000000) == 0)
      goto LABEL_40;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0)
      goto LABEL_41;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x200000000000) == 0)
      goto LABEL_42;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000000000) == 0)
      goto LABEL_43;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_43:
    if ((has & 0x80000000000) == 0)
      goto LABEL_44;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0)
      goto LABEL_45;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_46:
    if ((has & 0x400000000000000) == 0)
      goto LABEL_47;
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_48;
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v5 & 0x40) == 0)
      goto LABEL_49;
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40) == 0)
  {
LABEL_49:
    if ((v5 & 0x10000) == 0)
      goto LABEL_50;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_51;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x200) == 0)
      goto LABEL_52;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_52:
    if ((v5 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000000000) == 0)
      goto LABEL_54;
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000000) == 0)
      goto LABEL_55;
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_56;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v5 & 0x20000) == 0)
      goto LABEL_57;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000) == 0)
  {
LABEL_57:
    if ((v5 & 0x80000) == 0)
      goto LABEL_58;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_59;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_60;
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v5 & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_62;
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0)
      goto LABEL_63;
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0)
      goto LABEL_64;
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_65;
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x800000000) == 0)
      goto LABEL_66;
    goto LABEL_165;
  }
LABEL_164:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_66:
    if ((has & 0x800) == 0)
      goto LABEL_67;
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_67:
    if ((has & 0x400) == 0)
      goto LABEL_68;
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_68:
    if ((has & 4) == 0)
      goto LABEL_69;
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0)
      goto LABEL_70;
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 8) == 0)
      goto LABEL_71;
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_71:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_72;
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v5 & 0x200000) == 0)
      goto LABEL_73;
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000) == 0)
  {
LABEL_73:
    if ((v5 & 0x400000) == 0)
      goto LABEL_74;
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000) == 0)
  {
LABEL_74:
    if ((v5 & 0x10) == 0)
      goto LABEL_75;
    goto LABEL_174;
  }
LABEL_173:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_75:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_76;
    goto LABEL_175;
  }
LABEL_174:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v5 & 0x20) == 0)
      goto LABEL_77;
    goto LABEL_176;
  }
LABEL_175:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_77:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_78;
    goto LABEL_177;
  }
LABEL_176:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_79;
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v5 & 0x80) == 0)
      goto LABEL_80;
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_80:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_81;
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v5 & 0x100) == 0)
      goto LABEL_82;
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100) == 0)
  {
LABEL_82:
    if ((v5 & 2) == 0)
      goto LABEL_83;
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 2) == 0)
  {
LABEL_83:
    if ((v5 & 1) == 0)
      goto LABEL_84;
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 1) == 0)
  {
LABEL_84:
    if ((v5 & 0x400) == 0)
      goto LABEL_85;
    goto LABEL_184;
  }
LABEL_183:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_85:
    if ((v5 & 0x100000) == 0)
      goto LABEL_86;
    goto LABEL_185;
  }
LABEL_184:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000) == 0)
  {
LABEL_86:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_87;
    goto LABEL_186;
  }
LABEL_185:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_88;
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000000) == 0)
      goto LABEL_89;
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v5 & 0x200) == 0)
      goto LABEL_90;
    goto LABEL_189;
  }
LABEL_188:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_90:
    if ((has & 1) == 0)
      goto LABEL_91;
    goto LABEL_190;
  }
LABEL_189:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_91:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_92;
    goto LABEL_191;
  }
LABEL_190:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v5 & 0x800) == 0)
      goto LABEL_93;
    goto LABEL_192;
  }
LABEL_191:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_193;
  }
LABEL_192:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_194;
  }
LABEL_193:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x80) == 0)
      goto LABEL_96;
    goto LABEL_195;
  }
LABEL_194:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_96:
    if ((v5 & 0x2000) == 0)
      goto LABEL_97;
    goto LABEL_196;
  }
LABEL_195:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_97:
    if ((has & 0x400000000) == 0)
      goto LABEL_98;
    goto LABEL_197;
  }
LABEL_196:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000000) == 0)
      goto LABEL_99;
    goto LABEL_198;
  }
LABEL_197:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_99:
    if ((has & 2) == 0)
      goto LABEL_100;
LABEL_199:
    PBDataWriterWriteUint64Field();
    v4 = v7;
    if ((*((_QWORD *)&self->_has + 1) & 0x4000) == 0)
      goto LABEL_102;
    goto LABEL_101;
  }
LABEL_198:
  PBDataWriterWriteUint64Field();
  v4 = v7;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)&self->_has & 2) != 0)
    goto LABEL_199;
LABEL_100:
  if ((v5 & 0x4000) != 0)
  {
LABEL_101:
    PBDataWriterWriteUint64Field();
    v4 = v7;
  }
LABEL_102:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t has;

  v4 = a3;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000) != 0)
  {
    v4[80] = self->_timestamp;
    v4[101] |= 0x8000uLL;
    v5 = *((_QWORD *)&self->_has + 1);
  }
  has = (uint64_t)self->_has;
  if ((v5 & 0x4000000) != 0)
  {
    v4[91] = self->_txOutputBelowExpectedTrue;
    v4[101] |= 0x4000000uLL;
    has = (uint64_t)self->_has;
    v5 = *((_QWORD *)&self->_has + 1);
    if ((v5 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x10000000) == 0)
        goto LABEL_6;
      goto LABEL_105;
    }
  }
  else if ((v5 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  v4[90] = self->_txOutputBelowExpectedFalse;
  v4[101] |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_106;
  }
LABEL_105:
  v4[93] = self->_txOutputBelowInputTrue;
  v4[101] |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_107;
  }
LABEL_106:
  v4[92] = self->_txOutputBelowInputFalse;
  v4[101] |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_108;
  }
LABEL_107:
  v4[89] = self->_txLowFrameCountTrue;
  v4[101] |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_109;
  }
LABEL_108:
  v4[88] = self->_txLowFrameCountFalse;
  v4[101] |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_110;
  }
LABEL_109:
  v4[68] = self->_rxLowFrameCountTrue;
  v4[101] |= 8uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((has & 0x20000000) == 0)
      goto LABEL_12;
    goto LABEL_111;
  }
LABEL_110:
  v4[67] = self->_rxLowFrameCountFalse;
  v4[101] |= 4uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_12:
    if ((has & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_112;
  }
LABEL_111:
  v4[30] = self->_highTxLatencyTrue;
  v4[100] |= 0x20000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_13:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_14;
    goto LABEL_113;
  }
LABEL_112:
  v4[29] = self->_highTxLatencyFalse;
  v4[100] |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x1000000000000) == 0)
      goto LABEL_15;
    goto LABEL_114;
  }
LABEL_113:
  v4[50] = self->_lowTxPhyRateTrue;
  v4[100] |= 0x2000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x80000000) == 0)
      goto LABEL_16;
    goto LABEL_115;
  }
LABEL_114:
  v4[49] = self->_lowTxPhyRateFalse;
  v4[100] |= 0x1000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000) == 0)
  {
LABEL_16:
    if ((has & 0x40000000) == 0)
      goto LABEL_17;
    goto LABEL_116;
  }
LABEL_115:
  v4[32] = self->_highTxPerTrue;
  v4[100] |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_17:
    if ((has & 0x200000000) == 0)
      goto LABEL_18;
    goto LABEL_117;
  }
LABEL_116:
  v4[31] = self->_highTxPerFalse;
  v4[100] |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_18:
    if ((has & 0x100000000) == 0)
      goto LABEL_19;
    goto LABEL_118;
  }
LABEL_117:
  v4[34] = self->_highTxRetriesTrue;
  v4[100] |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_119;
  }
LABEL_118:
  v4[33] = self->_highTxRetriesFalse;
  v4[100] |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_120;
  }
LABEL_119:
  v4[96] = self->_txQueueFullTrue;
  v4[101] |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_21:
    if ((has & 0x800000000000) == 0)
      goto LABEL_22;
    goto LABEL_121;
  }
LABEL_120:
  v4[95] = self->_txQueueFullFalse;
  v4[101] |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_22:
    if ((has & 0x400000000000) == 0)
      goto LABEL_23;
    goto LABEL_122;
  }
LABEL_121:
  v4[48] = self->_lowTxAMPDUDensityTrue;
  v4[100] |= 0x800000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_23:
    if ((has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_123;
  }
LABEL_122:
  v4[47] = self->_lowTxAMPDUDensityFalse;
  v4[100] |= 0x400000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_24:
    if ((has & 0x4000000) == 0)
      goto LABEL_25;
    goto LABEL_124;
  }
LABEL_123:
  v4[28] = self->_highRxRetriesTrue;
  v4[100] |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_125;
  }
LABEL_124:
  v4[27] = self->_highRxRetriesFalse;
  v4[100] |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_126;
  }
LABEL_125:
  v4[24] = self->_highRxPhyPERTrue;
  v4[100] |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_27:
    if ((has & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_127;
  }
LABEL_126:
  v4[23] = self->_highRxPhyPERFalse;
  v4[100] |= 0x400000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_28:
    if ((has & 0x40000) == 0)
      goto LABEL_29;
    goto LABEL_128;
  }
LABEL_127:
  v4[20] = self->_highRxFCSErrsTrue;
  v4[100] |= 0x80000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_29:
    if ((has & 0x200000) == 0)
      goto LABEL_30;
    goto LABEL_129;
  }
LABEL_128:
  v4[19] = self->_highRxFCSErrsFalse;
  v4[100] |= 0x40000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_30:
    if ((has & 0x100000) == 0)
      goto LABEL_31;
    goto LABEL_130;
  }
LABEL_129:
  v4[22] = self->_highRxOverflowsTrue;
  v4[100] |= 0x200000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_31:
    if ((has & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_131;
  }
LABEL_130:
  v4[21] = self->_highRxOverflowsFalse;
  v4[100] |= 0x100000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_32:
    if ((has & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_132;
  }
LABEL_131:
  v4[18] = self->_highRxDupsTrue;
  v4[100] |= 0x20000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_33:
    if ((has & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_133;
  }
LABEL_132:
  v4[17] = self->_highRxDupsFalse;
  v4[100] |= 0x10000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_34:
    if ((has & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_134;
  }
LABEL_133:
  v4[26] = self->_highRxReplaysTrue;
  v4[100] |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_35:
    if ((has & 0x8000) == 0)
      goto LABEL_36;
    goto LABEL_135;
  }
LABEL_134:
  v4[25] = self->_highRxReplaysFalse;
  v4[100] |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_36:
    if ((has & 0x4000) == 0)
      goto LABEL_37;
    goto LABEL_136;
  }
LABEL_135:
  v4[16] = self->_highRxDecryptErrsTrue;
  v4[100] |= 0x8000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_37:
    if ((has & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_137;
  }
LABEL_136:
  v4[15] = self->_highRxDecryptErrsFalse;
  v4[100] |= 0x4000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_38:
    if ((has & 0x1000) == 0)
      goto LABEL_39;
    goto LABEL_138;
  }
LABEL_137:
  v4[14] = self->_highRxDataPERTrue;
  v4[100] |= 0x2000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_39:
    if ((has & 0x20000000000) == 0)
      goto LABEL_40;
    goto LABEL_139;
  }
LABEL_138:
  v4[13] = self->_highRxDataPERFalse;
  v4[100] |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0)
      goto LABEL_41;
    goto LABEL_140;
  }
LABEL_139:
  v4[42] = self->_lowAvailWLANDurTrue;
  v4[100] |= 0x20000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x200000000000) == 0)
      goto LABEL_42;
    goto LABEL_141;
  }
LABEL_140:
  v4[41] = self->_lowAvailWLANDurFalse;
  v4[100] |= 0x10000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000000000) == 0)
      goto LABEL_43;
    goto LABEL_142;
  }
LABEL_141:
  v4[46] = self->_lowAvailWLANTxDurTrue;
  v4[100] |= 0x200000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_43:
    if ((has & 0x80000000000) == 0)
      goto LABEL_44;
    goto LABEL_143;
  }
LABEL_142:
  v4[45] = self->_lowAvailWLANTxDurFalse;
  v4[100] |= 0x100000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0)
      goto LABEL_45;
    goto LABEL_144;
  }
LABEL_143:
  v4[44] = self->_lowAvailWLANRxDurTrue;
  v4[100] |= 0x80000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_145;
  }
LABEL_144:
  v4[43] = self->_lowAvailWLANRxDurFalse;
  v4[100] |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_46:
    if ((has & 0x400000000000000) == 0)
      goto LABEL_47;
    goto LABEL_146;
  }
LABEL_145:
  v4[9] = self->_cCA;
  v4[100] |= 0x100uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_48;
    goto LABEL_147;
  }
LABEL_146:
  v4[59] = self->_rSSI;
  v4[100] |= 0x400000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v5 & 0x40) == 0)
      goto LABEL_49;
    goto LABEL_148;
  }
LABEL_147:
  v4[94] = self->_txPhyRate;
  v4[101] |= 0x20000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40) == 0)
  {
LABEL_49:
    if ((v5 & 0x10000) == 0)
      goto LABEL_50;
    goto LABEL_149;
  }
LABEL_148:
  v4[71] = self->_rxPhyRate;
  v4[101] |= 0x40uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_51;
    goto LABEL_150;
  }
LABEL_149:
  v4[81] = self->_txAMPDUDensity;
  v4[101] |= 0x10000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x200) == 0)
      goto LABEL_52;
    goto LABEL_151;
  }
LABEL_150:
  v4[52] = self->_measurementDurMS;
  v4[100] |= 0x8000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_52:
    if ((v5 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_152;
  }
LABEL_151:
  v4[10] = self->_concurrentIntDurMS;
  v4[100] |= 0x200uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000000000) == 0)
      goto LABEL_54;
    goto LABEL_153;
  }
LABEL_152:
  v4[77] = self->_tVPMActiveDurationMS;
  v4[101] |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000000) == 0)
      goto LABEL_55;
    goto LABEL_154;
  }
LABEL_153:
  v4[56] = self->_phyTxActivityDurMS;
  v4[100] |= 0x80000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_56;
    goto LABEL_155;
  }
LABEL_154:
  v4[55] = self->_phyRxActivityDurMS;
  v4[100] |= 0x40000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v5 & 0x20000) == 0)
      goto LABEL_57;
    goto LABEL_156;
  }
LABEL_155:
  v4[98] = self->_txSubBytes;
  v4[101] |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000) == 0)
  {
LABEL_57:
    if ((v5 & 0x80000) == 0)
      goto LABEL_58;
    goto LABEL_157;
  }
LABEL_156:
  v4[82] = self->_txCompBytes;
  v4[101] |= 0x20000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_59;
    goto LABEL_158;
  }
LABEL_157:
  v4[84] = self->_txDelayBytes;
  v4[101] |= 0x80000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_60;
    goto LABEL_159;
  }
LABEL_158:
  v4[53] = self->_offChanDurMS;
  v4[100] |= 0x10000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v5 & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_160;
  }
LABEL_159:
  v4[99] = self->_txSubPkts;
  v4[101] |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_62;
    goto LABEL_161;
  }
LABEL_160:
  v4[83] = self->_txCompPkts;
  v4[101] |= 0x40000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0)
      goto LABEL_63;
    goto LABEL_162;
  }
LABEL_161:
  v4[51] = self->_maxQueueFullDurMS;
  v4[100] |= 0x4000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0)
      goto LABEL_64;
    goto LABEL_163;
  }
LABEL_162:
  v4[6] = self->_avgTxLatencyMS;
  v4[100] |= 0x20uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_65;
    goto LABEL_164;
  }
LABEL_163:
  v4[7] = self->_bTAntennaDurMS;
  v4[100] |= 0x40uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x800000000) == 0)
      goto LABEL_66;
    goto LABEL_165;
  }
LABEL_164:
  v4[54] = self->_outputThroughput;
  v4[100] |= 0x20000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_66:
    if ((has & 0x800) == 0)
      goto LABEL_67;
    goto LABEL_166;
  }
LABEL_165:
  v4[36] = self->_inputThroughput;
  v4[100] |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_67:
    if ((has & 0x400) == 0)
      goto LABEL_68;
    goto LABEL_167;
  }
LABEL_166:
  v4[12] = self->_expectedThroughput;
  v4[100] |= 0x800uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_68:
    if ((has & 4) == 0)
      goto LABEL_69;
    goto LABEL_168;
  }
LABEL_167:
  v4[11] = self->_delayedThroughput;
  v4[100] |= 0x400uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0)
      goto LABEL_70;
    goto LABEL_169;
  }
LABEL_168:
  v4[3] = self->_availWLANDurMS;
  v4[100] |= 4uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 8) == 0)
      goto LABEL_71;
    goto LABEL_170;
  }
LABEL_169:
  v4[5] = self->_availWLANTxDurMS;
  v4[100] |= 0x10uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_71:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_72;
    goto LABEL_171;
  }
LABEL_170:
  v4[4] = self->_availWLANRxDurMS;
  v4[100] |= 8uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v5 & 0x200000) == 0)
      goto LABEL_73;
    goto LABEL_172;
  }
LABEL_171:
  v4[97] = self->_txRetries;
  v4[101] |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000) == 0)
  {
LABEL_73:
    if ((v5 & 0x400000) == 0)
      goto LABEL_74;
    goto LABEL_173;
  }
LABEL_172:
  v4[86] = self->_txFails;
  v4[101] |= 0x200000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000) == 0)
  {
LABEL_74:
    if ((v5 & 0x10) == 0)
      goto LABEL_75;
    goto LABEL_174;
  }
LABEL_173:
  v4[87] = self->_txFrames;
  v4[101] |= 0x400000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_75:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_76;
    goto LABEL_175;
  }
LABEL_174:
  v4[69] = self->_rxOvflErrs;
  v4[101] |= 0x10uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v5 & 0x20) == 0)
      goto LABEL_77;
    goto LABEL_176;
  }
LABEL_175:
  v4[64] = self->_rxFCSErrs;
  v4[100] |= 0x8000000000000000;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_77:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_78;
    goto LABEL_177;
  }
LABEL_176:
  v4[70] = self->_rxPLCPErrs;
  v4[101] |= 0x20uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_79;
    goto LABEL_178;
  }
LABEL_177:
  v4[61] = self->_rxCRSErrs;
  v4[100] |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v5 & 0x80) == 0)
      goto LABEL_80;
    goto LABEL_179;
  }
LABEL_178:
  v4[63] = self->_rxDupErrs;
  v4[100] |= 0x4000000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_80:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_81;
    goto LABEL_180;
  }
LABEL_179:
  v4[72] = self->_rxReplayErrs;
  v4[101] |= 0x80uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v5 & 0x100) == 0)
      goto LABEL_82;
    goto LABEL_181;
  }
LABEL_180:
  v4[62] = self->_rxDecryErrs;
  v4[100] |= 0x2000000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100) == 0)
  {
LABEL_82:
    if ((v5 & 2) == 0)
      goto LABEL_83;
    goto LABEL_182;
  }
LABEL_181:
  v4[73] = self->_rxRetries;
  v4[101] |= 0x100uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 2) == 0)
  {
LABEL_83:
    if ((v5 & 1) == 0)
      goto LABEL_84;
    goto LABEL_183;
  }
LABEL_182:
  v4[66] = self->_rxGoodPlcps;
  v4[101] |= 2uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 1) == 0)
  {
LABEL_84:
    if ((v5 & 0x400) == 0)
      goto LABEL_85;
    goto LABEL_184;
  }
LABEL_183:
  v4[65] = self->_rxFrames;
  v4[101] |= 1uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_85:
    if ((v5 & 0x100000) == 0)
      goto LABEL_86;
    goto LABEL_185;
  }
LABEL_184:
  v4[75] = self->_sNR;
  v4[101] |= 0x400uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000) == 0)
  {
LABEL_86:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_87;
    goto LABEL_186;
  }
LABEL_185:
  v4[85] = self->_txExpectedAMPDUDensity;
  v4[101] |= 0x100000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_88;
    goto LABEL_187;
  }
LABEL_186:
  v4[57] = self->_rC1CoexDurationMS;
  v4[100] |= 0x100000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000000) == 0)
      goto LABEL_89;
    goto LABEL_188;
  }
LABEL_187:
  v4[58] = self->_rC2CoexDurationMS;
  v4[100] |= 0x200000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v5 & 0x200) == 0)
      goto LABEL_90;
    goto LABEL_189;
  }
LABEL_188:
  v4[39] = self->_lTECoexDurationMS;
  v4[100] |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_90:
    if ((has & 1) == 0)
      goto LABEL_91;
    goto LABEL_190;
  }
LABEL_189:
  v4[74] = self->_rxThroughput;
  v4[101] |= 0x200uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_91:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_92;
    goto LABEL_191;
  }
LABEL_190:
  v4[1] = self->_aPTxDataStall;
  v4[100] |= 1uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v5 & 0x800) == 0)
      goto LABEL_93;
    goto LABEL_192;
  }
LABEL_191:
  v4[60] = self->_rxAmpduTxBaMismatch;
  v4[100] |= 0x800000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_193;
  }
LABEL_192:
  v4[76] = self->_symptomsFails;
  v4[101] |= 0x800uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_194;
  }
LABEL_193:
  v4[37] = self->_is2GBand;
  v4[100] |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x80) == 0)
      goto LABEL_96;
    goto LABEL_195;
  }
LABEL_194:
  v4[38] = self->_isFGTraffic;
  v4[100] |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_96:
    if ((v5 & 0x2000) == 0)
      goto LABEL_97;
    goto LABEL_196;
  }
LABEL_195:
  v4[8] = self->_baselineThroughput;
  v4[100] |= 0x80uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_97:
    if ((has & 0x400000000) == 0)
      goto LABEL_98;
    goto LABEL_197;
  }
LABEL_196:
  v4[78] = self->_testThroughput;
  v4[101] |= 0x2000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000000) == 0)
      goto LABEL_99;
    goto LABEL_198;
  }
LABEL_197:
  v4[35] = self->_infraDutyCycle;
  v4[100] |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_99:
    if ((has & 2) == 0)
      goto LABEL_100;
LABEL_199:
    v4[2] = self->_accessPointOUI;
    v4[100] |= 2uLL;
    if ((*((_QWORD *)&self->_has + 1) & 0x4000) == 0)
      goto LABEL_102;
    goto LABEL_101;
  }
LABEL_198:
  v4[40] = self->_lastScanReason;
  v4[100] |= 0x8000000000uLL;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)&self->_has & 2) != 0)
    goto LABEL_199;
LABEL_100:
  if ((v5 & 0x4000) != 0)
  {
LABEL_101:
    v4[79] = self->_timeSinceLastRecovery;
    v4[101] |= 0x4000uLL;
  }
LABEL_102:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t has;
  _QWORD *v7;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000) != 0)
  {
    v4[80] = self->_timestamp;
    v4[101] |= 0x8000uLL;
    v5 = *((_QWORD *)&self->_has + 1);
  }
  has = (uint64_t)self->_has;
  if ((v5 & 0x4000000) != 0)
  {
    v4[91] = self->_txOutputBelowExpectedTrue;
    v4[101] |= 0x4000000uLL;
    has = (uint64_t)self->_has;
    v5 = *((_QWORD *)&self->_has + 1);
    if ((v5 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x10000000) == 0)
        goto LABEL_6;
      goto LABEL_105;
    }
  }
  else if ((v5 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  v4[90] = self->_txOutputBelowExpectedFalse;
  v4[101] |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_106;
  }
LABEL_105:
  v4[93] = self->_txOutputBelowInputTrue;
  v4[101] |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_107;
  }
LABEL_106:
  v4[92] = self->_txOutputBelowInputFalse;
  v4[101] |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_108;
  }
LABEL_107:
  v4[89] = self->_txLowFrameCountTrue;
  v4[101] |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_109;
  }
LABEL_108:
  v4[88] = self->_txLowFrameCountFalse;
  v4[101] |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_110;
  }
LABEL_109:
  v4[68] = self->_rxLowFrameCountTrue;
  v4[101] |= 8uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((has & 0x20000000) == 0)
      goto LABEL_12;
    goto LABEL_111;
  }
LABEL_110:
  v4[67] = self->_rxLowFrameCountFalse;
  v4[101] |= 4uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_12:
    if ((has & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_112;
  }
LABEL_111:
  v4[30] = self->_highTxLatencyTrue;
  v4[100] |= 0x20000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_13:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_14;
    goto LABEL_113;
  }
LABEL_112:
  v4[29] = self->_highTxLatencyFalse;
  v4[100] |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x1000000000000) == 0)
      goto LABEL_15;
    goto LABEL_114;
  }
LABEL_113:
  v4[50] = self->_lowTxPhyRateTrue;
  v4[100] |= 0x2000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x80000000) == 0)
      goto LABEL_16;
    goto LABEL_115;
  }
LABEL_114:
  v4[49] = self->_lowTxPhyRateFalse;
  v4[100] |= 0x1000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000) == 0)
  {
LABEL_16:
    if ((has & 0x40000000) == 0)
      goto LABEL_17;
    goto LABEL_116;
  }
LABEL_115:
  v4[32] = self->_highTxPerTrue;
  v4[100] |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_17:
    if ((has & 0x200000000) == 0)
      goto LABEL_18;
    goto LABEL_117;
  }
LABEL_116:
  v4[31] = self->_highTxPerFalse;
  v4[100] |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_18:
    if ((has & 0x100000000) == 0)
      goto LABEL_19;
    goto LABEL_118;
  }
LABEL_117:
  v4[34] = self->_highTxRetriesTrue;
  v4[100] |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_119;
  }
LABEL_118:
  v4[33] = self->_highTxRetriesFalse;
  v4[100] |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_120;
  }
LABEL_119:
  v4[96] = self->_txQueueFullTrue;
  v4[101] |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_21:
    if ((has & 0x800000000000) == 0)
      goto LABEL_22;
    goto LABEL_121;
  }
LABEL_120:
  v4[95] = self->_txQueueFullFalse;
  v4[101] |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_22:
    if ((has & 0x400000000000) == 0)
      goto LABEL_23;
    goto LABEL_122;
  }
LABEL_121:
  v4[48] = self->_lowTxAMPDUDensityTrue;
  v4[100] |= 0x800000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_23:
    if ((has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_123;
  }
LABEL_122:
  v4[47] = self->_lowTxAMPDUDensityFalse;
  v4[100] |= 0x400000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_24:
    if ((has & 0x4000000) == 0)
      goto LABEL_25;
    goto LABEL_124;
  }
LABEL_123:
  v4[28] = self->_highRxRetriesTrue;
  v4[100] |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_125;
  }
LABEL_124:
  v4[27] = self->_highRxRetriesFalse;
  v4[100] |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_126;
  }
LABEL_125:
  v4[24] = self->_highRxPhyPERTrue;
  v4[100] |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_27:
    if ((has & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_127;
  }
LABEL_126:
  v4[23] = self->_highRxPhyPERFalse;
  v4[100] |= 0x400000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_28:
    if ((has & 0x40000) == 0)
      goto LABEL_29;
    goto LABEL_128;
  }
LABEL_127:
  v4[20] = self->_highRxFCSErrsTrue;
  v4[100] |= 0x80000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_29:
    if ((has & 0x200000) == 0)
      goto LABEL_30;
    goto LABEL_129;
  }
LABEL_128:
  v4[19] = self->_highRxFCSErrsFalse;
  v4[100] |= 0x40000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_30:
    if ((has & 0x100000) == 0)
      goto LABEL_31;
    goto LABEL_130;
  }
LABEL_129:
  v4[22] = self->_highRxOverflowsTrue;
  v4[100] |= 0x200000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_31:
    if ((has & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_131;
  }
LABEL_130:
  v4[21] = self->_highRxOverflowsFalse;
  v4[100] |= 0x100000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_32:
    if ((has & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_132;
  }
LABEL_131:
  v4[18] = self->_highRxDupsTrue;
  v4[100] |= 0x20000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_33:
    if ((has & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_133;
  }
LABEL_132:
  v4[17] = self->_highRxDupsFalse;
  v4[100] |= 0x10000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_34:
    if ((has & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_134;
  }
LABEL_133:
  v4[26] = self->_highRxReplaysTrue;
  v4[100] |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_35:
    if ((has & 0x8000) == 0)
      goto LABEL_36;
    goto LABEL_135;
  }
LABEL_134:
  v4[25] = self->_highRxReplaysFalse;
  v4[100] |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_36:
    if ((has & 0x4000) == 0)
      goto LABEL_37;
    goto LABEL_136;
  }
LABEL_135:
  v4[16] = self->_highRxDecryptErrsTrue;
  v4[100] |= 0x8000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_37:
    if ((has & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_137;
  }
LABEL_136:
  v4[15] = self->_highRxDecryptErrsFalse;
  v4[100] |= 0x4000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_38:
    if ((has & 0x1000) == 0)
      goto LABEL_39;
    goto LABEL_138;
  }
LABEL_137:
  v4[14] = self->_highRxDataPERTrue;
  v4[100] |= 0x2000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_39:
    if ((has & 0x20000000000) == 0)
      goto LABEL_40;
    goto LABEL_139;
  }
LABEL_138:
  v4[13] = self->_highRxDataPERFalse;
  v4[100] |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0)
      goto LABEL_41;
    goto LABEL_140;
  }
LABEL_139:
  v4[42] = self->_lowAvailWLANDurTrue;
  v4[100] |= 0x20000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x200000000000) == 0)
      goto LABEL_42;
    goto LABEL_141;
  }
LABEL_140:
  v4[41] = self->_lowAvailWLANDurFalse;
  v4[100] |= 0x10000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000000000) == 0)
      goto LABEL_43;
    goto LABEL_142;
  }
LABEL_141:
  v4[46] = self->_lowAvailWLANTxDurTrue;
  v4[100] |= 0x200000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_43:
    if ((has & 0x80000000000) == 0)
      goto LABEL_44;
    goto LABEL_143;
  }
LABEL_142:
  v4[45] = self->_lowAvailWLANTxDurFalse;
  v4[100] |= 0x100000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0)
      goto LABEL_45;
    goto LABEL_144;
  }
LABEL_143:
  v4[44] = self->_lowAvailWLANRxDurTrue;
  v4[100] |= 0x80000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_145;
  }
LABEL_144:
  v4[43] = self->_lowAvailWLANRxDurFalse;
  v4[100] |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_46:
    if ((has & 0x400000000000000) == 0)
      goto LABEL_47;
    goto LABEL_146;
  }
LABEL_145:
  v4[9] = self->_cCA;
  v4[100] |= 0x100uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_48;
    goto LABEL_147;
  }
LABEL_146:
  v4[59] = self->_rSSI;
  v4[100] |= 0x400000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v5 & 0x40) == 0)
      goto LABEL_49;
    goto LABEL_148;
  }
LABEL_147:
  v4[94] = self->_txPhyRate;
  v4[101] |= 0x20000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40) == 0)
  {
LABEL_49:
    if ((v5 & 0x10000) == 0)
      goto LABEL_50;
    goto LABEL_149;
  }
LABEL_148:
  v4[71] = self->_rxPhyRate;
  v4[101] |= 0x40uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_51;
    goto LABEL_150;
  }
LABEL_149:
  v4[81] = self->_txAMPDUDensity;
  v4[101] |= 0x10000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x200) == 0)
      goto LABEL_52;
    goto LABEL_151;
  }
LABEL_150:
  v4[52] = self->_measurementDurMS;
  v4[100] |= 0x8000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_52:
    if ((v5 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_152;
  }
LABEL_151:
  v4[10] = self->_concurrentIntDurMS;
  v4[100] |= 0x200uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000000000) == 0)
      goto LABEL_54;
    goto LABEL_153;
  }
LABEL_152:
  v4[77] = self->_tVPMActiveDurationMS;
  v4[101] |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000000) == 0)
      goto LABEL_55;
    goto LABEL_154;
  }
LABEL_153:
  v4[56] = self->_phyTxActivityDurMS;
  v4[100] |= 0x80000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_56;
    goto LABEL_155;
  }
LABEL_154:
  v4[55] = self->_phyRxActivityDurMS;
  v4[100] |= 0x40000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v5 & 0x20000) == 0)
      goto LABEL_57;
    goto LABEL_156;
  }
LABEL_155:
  v4[98] = self->_txSubBytes;
  v4[101] |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000) == 0)
  {
LABEL_57:
    if ((v5 & 0x80000) == 0)
      goto LABEL_58;
    goto LABEL_157;
  }
LABEL_156:
  v4[82] = self->_txCompBytes;
  v4[101] |= 0x20000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_59;
    goto LABEL_158;
  }
LABEL_157:
  v4[84] = self->_txDelayBytes;
  v4[101] |= 0x80000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_60;
    goto LABEL_159;
  }
LABEL_158:
  v4[53] = self->_offChanDurMS;
  v4[100] |= 0x10000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v5 & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_160;
  }
LABEL_159:
  v4[99] = self->_txSubPkts;
  v4[101] |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_62;
    goto LABEL_161;
  }
LABEL_160:
  v4[83] = self->_txCompPkts;
  v4[101] |= 0x40000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0)
      goto LABEL_63;
    goto LABEL_162;
  }
LABEL_161:
  v4[51] = self->_maxQueueFullDurMS;
  v4[100] |= 0x4000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0)
      goto LABEL_64;
    goto LABEL_163;
  }
LABEL_162:
  v4[6] = self->_avgTxLatencyMS;
  v4[100] |= 0x20uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_65;
    goto LABEL_164;
  }
LABEL_163:
  v4[7] = self->_bTAntennaDurMS;
  v4[100] |= 0x40uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x800000000) == 0)
      goto LABEL_66;
    goto LABEL_165;
  }
LABEL_164:
  v4[54] = self->_outputThroughput;
  v4[100] |= 0x20000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_66:
    if ((has & 0x800) == 0)
      goto LABEL_67;
    goto LABEL_166;
  }
LABEL_165:
  v4[36] = self->_inputThroughput;
  v4[100] |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_67:
    if ((has & 0x400) == 0)
      goto LABEL_68;
    goto LABEL_167;
  }
LABEL_166:
  v4[12] = self->_expectedThroughput;
  v4[100] |= 0x800uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_68:
    if ((has & 4) == 0)
      goto LABEL_69;
    goto LABEL_168;
  }
LABEL_167:
  v4[11] = self->_delayedThroughput;
  v4[100] |= 0x400uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0)
      goto LABEL_70;
    goto LABEL_169;
  }
LABEL_168:
  v4[3] = self->_availWLANDurMS;
  v4[100] |= 4uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 8) == 0)
      goto LABEL_71;
    goto LABEL_170;
  }
LABEL_169:
  v4[5] = self->_availWLANTxDurMS;
  v4[100] |= 0x10uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_71:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_72;
    goto LABEL_171;
  }
LABEL_170:
  v4[4] = self->_availWLANRxDurMS;
  v4[100] |= 8uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v5 & 0x200000) == 0)
      goto LABEL_73;
    goto LABEL_172;
  }
LABEL_171:
  v4[97] = self->_txRetries;
  v4[101] |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000) == 0)
  {
LABEL_73:
    if ((v5 & 0x400000) == 0)
      goto LABEL_74;
    goto LABEL_173;
  }
LABEL_172:
  v4[86] = self->_txFails;
  v4[101] |= 0x200000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000) == 0)
  {
LABEL_74:
    if ((v5 & 0x10) == 0)
      goto LABEL_75;
    goto LABEL_174;
  }
LABEL_173:
  v4[87] = self->_txFrames;
  v4[101] |= 0x400000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_75:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_76;
    goto LABEL_175;
  }
LABEL_174:
  v4[69] = self->_rxOvflErrs;
  v4[101] |= 0x10uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v5 & 0x20) == 0)
      goto LABEL_77;
    goto LABEL_176;
  }
LABEL_175:
  v4[64] = self->_rxFCSErrs;
  v4[100] |= 0x8000000000000000;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_77:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_78;
    goto LABEL_177;
  }
LABEL_176:
  v4[70] = self->_rxPLCPErrs;
  v4[101] |= 0x20uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_79;
    goto LABEL_178;
  }
LABEL_177:
  v4[61] = self->_rxCRSErrs;
  v4[100] |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v5 & 0x80) == 0)
      goto LABEL_80;
    goto LABEL_179;
  }
LABEL_178:
  v4[63] = self->_rxDupErrs;
  v4[100] |= 0x4000000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_80:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_81;
    goto LABEL_180;
  }
LABEL_179:
  v4[72] = self->_rxReplayErrs;
  v4[101] |= 0x80uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v5 & 0x100) == 0)
      goto LABEL_82;
    goto LABEL_181;
  }
LABEL_180:
  v4[62] = self->_rxDecryErrs;
  v4[100] |= 0x2000000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100) == 0)
  {
LABEL_82:
    if ((v5 & 2) == 0)
      goto LABEL_83;
    goto LABEL_182;
  }
LABEL_181:
  v4[73] = self->_rxRetries;
  v4[101] |= 0x100uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 2) == 0)
  {
LABEL_83:
    if ((v5 & 1) == 0)
      goto LABEL_84;
    goto LABEL_183;
  }
LABEL_182:
  v4[66] = self->_rxGoodPlcps;
  v4[101] |= 2uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 1) == 0)
  {
LABEL_84:
    if ((v5 & 0x400) == 0)
      goto LABEL_85;
    goto LABEL_184;
  }
LABEL_183:
  v4[65] = self->_rxFrames;
  v4[101] |= 1uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_85:
    if ((v5 & 0x100000) == 0)
      goto LABEL_86;
    goto LABEL_185;
  }
LABEL_184:
  v4[75] = self->_sNR;
  v4[101] |= 0x400uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000) == 0)
  {
LABEL_86:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_87;
    goto LABEL_186;
  }
LABEL_185:
  v4[85] = self->_txExpectedAMPDUDensity;
  v4[101] |= 0x100000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_88;
    goto LABEL_187;
  }
LABEL_186:
  v4[57] = self->_rC1CoexDurationMS;
  v4[100] |= 0x100000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000000) == 0)
      goto LABEL_89;
    goto LABEL_188;
  }
LABEL_187:
  v4[58] = self->_rC2CoexDurationMS;
  v4[100] |= 0x200000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v5 & 0x200) == 0)
      goto LABEL_90;
    goto LABEL_189;
  }
LABEL_188:
  v4[39] = self->_lTECoexDurationMS;
  v4[100] |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_90:
    if ((has & 1) == 0)
      goto LABEL_91;
    goto LABEL_190;
  }
LABEL_189:
  v4[74] = self->_rxThroughput;
  v4[101] |= 0x200uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_91:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_92;
    goto LABEL_191;
  }
LABEL_190:
  v4[1] = self->_aPTxDataStall;
  v4[100] |= 1uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v5 & 0x800) == 0)
      goto LABEL_93;
    goto LABEL_192;
  }
LABEL_191:
  v4[60] = self->_rxAmpduTxBaMismatch;
  v4[100] |= 0x800000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_193;
  }
LABEL_192:
  v4[76] = self->_symptomsFails;
  v4[101] |= 0x800uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_194;
  }
LABEL_193:
  v4[37] = self->_is2GBand;
  v4[100] |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x80) == 0)
      goto LABEL_96;
    goto LABEL_195;
  }
LABEL_194:
  v4[38] = self->_isFGTraffic;
  v4[100] |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_96:
    if ((v5 & 0x2000) == 0)
      goto LABEL_97;
    goto LABEL_196;
  }
LABEL_195:
  v4[8] = self->_baselineThroughput;
  v4[100] |= 0x80uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_97:
    if ((has & 0x400000000) == 0)
      goto LABEL_98;
    goto LABEL_197;
  }
LABEL_196:
  v4[78] = self->_testThroughput;
  v4[101] |= 0x2000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000000) == 0)
      goto LABEL_99;
    goto LABEL_198;
  }
LABEL_197:
  v4[35] = self->_infraDutyCycle;
  v4[100] |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_99:
    if ((has & 2) == 0)
      goto LABEL_100;
LABEL_199:
    v4[2] = self->_accessPointOUI;
    v4[100] |= 2uLL;
    if ((*((_QWORD *)&self->_has + 1) & 0x4000) == 0)
      goto LABEL_102;
    goto LABEL_101;
  }
LABEL_198:
  v4[40] = self->_lastScanReason;
  v4[100] |= 0x8000000000uLL;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)&self->_has & 2) != 0)
    goto LABEL_199;
LABEL_100:
  if ((v5 & 0x4000) != 0)
  {
LABEL_101:
    v4[79] = self->_timeSinceLastRecovery;
    v4[101] |= 0x4000uLL;
  }
LABEL_102:
  v7 = v4;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t has;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_497;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  v8 = v4[100];
  v7 = v4[101];
  if ((v5 & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_timestamp != v4[80])
      goto LABEL_497;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_txOutputBelowExpectedTrue != v4[91])
      goto LABEL_497;
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_txOutputBelowExpectedFalse != v4[90])
      goto LABEL_497;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_txOutputBelowInputTrue != v4[93])
      goto LABEL_497;
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_txOutputBelowInputFalse != v4[92])
      goto LABEL_497;
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_txLowFrameCountTrue != v4[89])
      goto LABEL_497;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_txLowFrameCountFalse != v4[88])
      goto LABEL_497;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_rxLowFrameCountTrue != v4[68])
      goto LABEL_497;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_rxLowFrameCountFalse != v4[67])
      goto LABEL_497;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x20000000) != 0)
  {
    if ((v8 & 0x20000000) == 0 || self->_highTxLatencyTrue != v4[30])
      goto LABEL_497;
  }
  else if ((v8 & 0x20000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v8 & 0x10000000) == 0 || self->_highTxLatencyFalse != v4[29])
      goto LABEL_497;
  }
  else if ((v8 & 0x10000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v8 & 0x2000000000000) == 0 || self->_lowTxPhyRateTrue != v4[50])
      goto LABEL_497;
  }
  else if ((v8 & 0x2000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v8 & 0x1000000000000) == 0 || self->_lowTxPhyRateFalse != v4[49])
      goto LABEL_497;
  }
  else if ((v8 & 0x1000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v8 & 0x80000000) == 0 || self->_highTxPerTrue != v4[32])
      goto LABEL_497;
  }
  else if ((v8 & 0x80000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) == 0 || self->_highTxPerFalse != v4[31])
      goto LABEL_497;
  }
  else if ((v8 & 0x40000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v8 & 0x200000000) == 0 || self->_highTxRetriesTrue != v4[34])
      goto LABEL_497;
  }
  else if ((v8 & 0x200000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x100000000) != 0)
  {
    if ((v8 & 0x100000000) == 0 || self->_highTxRetriesFalse != v4[33])
      goto LABEL_497;
  }
  else if ((v8 & 0x100000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_txQueueFullTrue != v4[96])
      goto LABEL_497;
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_txQueueFullFalse != v4[95])
      goto LABEL_497;
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v8 & 0x800000000000) == 0 || self->_lowTxAMPDUDensityTrue != v4[48])
      goto LABEL_497;
  }
  else if ((v8 & 0x800000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x400000000000) != 0)
  {
    if ((v8 & 0x400000000000) == 0 || self->_lowTxAMPDUDensityFalse != v4[47])
      goto LABEL_497;
  }
  else if ((v8 & 0x400000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v8 & 0x8000000) == 0 || self->_highRxRetriesTrue != v4[28])
      goto LABEL_497;
  }
  else if ((v8 & 0x8000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0 || self->_highRxRetriesFalse != v4[27])
      goto LABEL_497;
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_highRxPhyPERTrue != v4[24])
      goto LABEL_497;
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_highRxPhyPERFalse != v4[23])
      goto LABEL_497;
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_highRxFCSErrsTrue != v4[20])
      goto LABEL_497;
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_highRxFCSErrsFalse != v4[19])
      goto LABEL_497;
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_highRxOverflowsTrue != v4[22])
      goto LABEL_497;
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_highRxOverflowsFalse != v4[21])
      goto LABEL_497;
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_highRxDupsTrue != v4[18])
      goto LABEL_497;
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_highRxDupsFalse != v4[17])
      goto LABEL_497;
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0 || self->_highRxReplaysTrue != v4[26])
      goto LABEL_497;
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_highRxReplaysFalse != v4[25])
      goto LABEL_497;
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_highRxDecryptErrsTrue != v4[16])
      goto LABEL_497;
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_highRxDecryptErrsFalse != v4[15])
      goto LABEL_497;
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_highRxDataPERTrue != v4[14])
      goto LABEL_497;
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_highRxDataPERFalse != v4[13])
      goto LABEL_497;
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v8 & 0x20000000000) == 0 || self->_lowAvailWLANDurTrue != v4[42])
      goto LABEL_497;
  }
  else if ((v8 & 0x20000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x10000000000) != 0)
  {
    if ((v8 & 0x10000000000) == 0 || self->_lowAvailWLANDurFalse != v4[41])
      goto LABEL_497;
  }
  else if ((v8 & 0x10000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x200000000000) != 0)
  {
    if ((v8 & 0x200000000000) == 0 || self->_lowAvailWLANTxDurTrue != v4[46])
      goto LABEL_497;
  }
  else if ((v8 & 0x200000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v8 & 0x100000000000) == 0 || self->_lowAvailWLANTxDurFalse != v4[45])
      goto LABEL_497;
  }
  else if ((v8 & 0x100000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v8 & 0x80000000000) == 0 || self->_lowAvailWLANRxDurTrue != v4[44])
      goto LABEL_497;
  }
  else if ((v8 & 0x80000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v8 & 0x40000000000) == 0 || self->_lowAvailWLANRxDurFalse != v4[43])
      goto LABEL_497;
  }
  else if ((v8 & 0x40000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_cCA != v4[9])
      goto LABEL_497;
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x400000000000000) != 0)
  {
    if ((v8 & 0x400000000000000) == 0 || self->_rSSI != v4[59])
      goto LABEL_497;
  }
  else if ((v8 & 0x400000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_txPhyRate != v4[94])
      goto LABEL_497;
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_rxPhyRate != v4[71])
      goto LABEL_497;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_txAMPDUDensity != v4[81])
      goto LABEL_497;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v8 & 0x8000000000000) == 0 || self->_measurementDurMS != v4[52])
      goto LABEL_497;
  }
  else if ((v8 & 0x8000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_concurrentIntDurMS != v4[10])
      goto LABEL_497;
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_tVPMActiveDurationMS != v4[77])
      goto LABEL_497;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x80000000000000) != 0)
  {
    if ((v8 & 0x80000000000000) == 0 || self->_phyTxActivityDurMS != v4[56])
      goto LABEL_497;
  }
  else if ((v8 & 0x80000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x40000000000000) != 0)
  {
    if ((v8 & 0x40000000000000) == 0 || self->_phyRxActivityDurMS != v4[55])
      goto LABEL_497;
  }
  else if ((v8 & 0x40000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_txSubBytes != v4[98])
      goto LABEL_497;
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_txCompBytes != v4[82])
      goto LABEL_497;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_txDelayBytes != v4[84])
      goto LABEL_497;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v8 & 0x10000000000000) == 0 || self->_offChanDurMS != v4[53])
      goto LABEL_497;
  }
  else if ((v8 & 0x10000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_txSubPkts != v4[99])
      goto LABEL_497;
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_txCompPkts != v4[83])
      goto LABEL_497;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v8 & 0x4000000000000) == 0 || self->_maxQueueFullDurMS != v4[51])
      goto LABEL_497;
  }
  else if ((v8 & 0x4000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_avgTxLatencyMS != v4[6])
      goto LABEL_497;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_bTAntennaDurMS != v4[7])
      goto LABEL_497;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v8 & 0x20000000000000) == 0 || self->_outputThroughput != v4[54])
      goto LABEL_497;
  }
  else if ((v8 & 0x20000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v8 & 0x800000000) == 0 || self->_inputThroughput != v4[36])
      goto LABEL_497;
  }
  else if ((v8 & 0x800000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_expectedThroughput != v4[12])
      goto LABEL_497;
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_delayedThroughput != v4[11])
      goto LABEL_497;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_availWLANDurMS != v4[3])
      goto LABEL_497;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_availWLANTxDurMS != v4[5])
      goto LABEL_497;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_availWLANRxDurMS != v4[4])
      goto LABEL_497;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_txRetries != v4[97])
      goto LABEL_497;
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_txFails != v4[86])
      goto LABEL_497;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_txFrames != v4[87])
      goto LABEL_497;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_rxOvflErrs != v4[69])
      goto LABEL_497;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_497;
  }
  if (has < 0)
  {
    if ((v8 & 0x8000000000000000) == 0 || self->_rxFCSErrs != v4[64])
      goto LABEL_497;
  }
  else if (v8 < 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_rxPLCPErrs != v4[70])
      goto LABEL_497;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v8 & 0x1000000000000000) == 0 || self->_rxCRSErrs != v4[61])
      goto LABEL_497;
  }
  else if ((v8 & 0x1000000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v8 & 0x4000000000000000) == 0 || self->_rxDupErrs != v4[63])
      goto LABEL_497;
  }
  else if ((v8 & 0x4000000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_rxReplayErrs != v4[72])
      goto LABEL_497;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v8 & 0x2000000000000000) == 0 || self->_rxDecryErrs != v4[62])
      goto LABEL_497;
  }
  else if ((v8 & 0x2000000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_rxRetries != v4[73])
      goto LABEL_497;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_rxGoodPlcps != v4[66])
      goto LABEL_497;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_rxFrames != v4[65])
      goto LABEL_497;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_sNR != v4[75])
      goto LABEL_497;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_txExpectedAMPDUDensity != v4[85])
      goto LABEL_497;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v8 & 0x100000000000000) == 0 || self->_rC1CoexDurationMS != v4[57])
      goto LABEL_497;
  }
  else if ((v8 & 0x100000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x200000000000000) != 0)
  {
    if ((v8 & 0x200000000000000) == 0 || self->_rC2CoexDurationMS != v4[58])
      goto LABEL_497;
  }
  else if ((v8 & 0x200000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v8 & 0x4000000000) == 0 || self->_lTECoexDurationMS != v4[39])
      goto LABEL_497;
  }
  else if ((v8 & 0x4000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_rxThroughput != v4[74])
      goto LABEL_497;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_aPTxDataStall != v4[1])
      goto LABEL_497;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v8 & 0x800000000000000) == 0 || self->_rxAmpduTxBaMismatch != v4[60])
      goto LABEL_497;
  }
  else if ((v8 & 0x800000000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_symptomsFails != v4[76])
      goto LABEL_497;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v8 & 0x1000000000) == 0 || self->_is2GBand != v4[37])
      goto LABEL_497;
  }
  else if ((v8 & 0x1000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v8 & 0x2000000000) == 0 || self->_isFGTraffic != v4[38])
      goto LABEL_497;
  }
  else if ((v8 & 0x2000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_baselineThroughput != v4[8])
      goto LABEL_497;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_497;
  }
  if ((v5 & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_testThroughput != v4[78])
      goto LABEL_497;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v8 & 0x400000000) == 0 || self->_infraDutyCycle != v4[35])
      goto LABEL_497;
  }
  else if ((v8 & 0x400000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v8 & 0x8000000000) == 0 || self->_lastScanReason != v4[40])
      goto LABEL_497;
  }
  else if ((v8 & 0x8000000000) != 0)
  {
    goto LABEL_497;
  }
  if ((has & 2) == 0)
  {
    if ((v8 & 2) == 0)
      goto LABEL_492;
LABEL_497:
    v9 = 0;
    goto LABEL_498;
  }
  if ((v8 & 2) == 0 || self->_accessPointOUI != v4[2])
    goto LABEL_497;
LABEL_492:
  if ((v5 & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_timeSinceLastRecovery != v4[79])
      goto LABEL_497;
    v9 = 1;
  }
  else
  {
    v9 = (v4[101] & 0x4000) == 0;
  }
LABEL_498:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t has;
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
  unint64_t v29;
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
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;

  v2 = *((_QWORD *)&self->_has + 1);
  if ((v2 & 0x8000) != 0)
  {
    v103 = 2654435761u * self->_timestamp;
    if ((v2 & 0x4000000) != 0)
    {
LABEL_3:
      v102 = 2654435761u * self->_txOutputBelowExpectedTrue;
      if ((v2 & 0x2000000) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v103 = 0;
    if ((v2 & 0x4000000) != 0)
      goto LABEL_3;
  }
  v102 = 0;
  if ((v2 & 0x2000000) != 0)
  {
LABEL_4:
    v101 = 2654435761u * self->_txOutputBelowExpectedFalse;
    if ((v2 & 0x10000000) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v101 = 0;
  if ((v2 & 0x10000000) != 0)
  {
LABEL_5:
    v100 = 2654435761u * self->_txOutputBelowInputTrue;
    if ((v2 & 0x8000000) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v100 = 0;
  if ((v2 & 0x8000000) != 0)
  {
LABEL_6:
    v99 = 2654435761u * self->_txOutputBelowInputFalse;
    if ((v2 & 0x1000000) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v99 = 0;
  if ((v2 & 0x1000000) != 0)
  {
LABEL_7:
    v98 = 2654435761u * self->_txLowFrameCountTrue;
    if ((v2 & 0x800000) != 0)
      goto LABEL_8;
LABEL_16:
    v97 = 0;
    if ((v2 & 8) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_15:
  v98 = 0;
  if ((v2 & 0x800000) == 0)
    goto LABEL_16;
LABEL_8:
  v97 = 2654435761u * self->_txLowFrameCountFalse;
  if ((v2 & 8) != 0)
  {
LABEL_9:
    v96 = 2654435761u * self->_rxLowFrameCountTrue;
    goto LABEL_18;
  }
LABEL_17:
  v96 = 0;
LABEL_18:
  has = (uint64_t)self->_has;
  if ((v2 & 4) != 0)
  {
    v95 = 2654435761u * self->_rxLowFrameCountFalse;
    if ((has & 0x20000000) != 0)
    {
LABEL_20:
      v94 = 2654435761u * self->_highTxLatencyTrue;
      if ((has & 0x10000000) != 0)
        goto LABEL_21;
      goto LABEL_112;
    }
  }
  else
  {
    v95 = 0;
    if ((has & 0x20000000) != 0)
      goto LABEL_20;
  }
  v94 = 0;
  if ((has & 0x10000000) != 0)
  {
LABEL_21:
    v93 = 2654435761u * self->_highTxLatencyFalse;
    if ((has & 0x2000000000000) != 0)
      goto LABEL_22;
    goto LABEL_113;
  }
LABEL_112:
  v93 = 0;
  if ((has & 0x2000000000000) != 0)
  {
LABEL_22:
    v92 = 2654435761u * self->_lowTxPhyRateTrue;
    if ((has & 0x1000000000000) != 0)
      goto LABEL_23;
    goto LABEL_114;
  }
LABEL_113:
  v92 = 0;
  if ((has & 0x1000000000000) != 0)
  {
LABEL_23:
    v91 = 2654435761u * self->_lowTxPhyRateFalse;
    if ((has & 0x80000000) != 0)
      goto LABEL_24;
    goto LABEL_115;
  }
LABEL_114:
  v91 = 0;
  if ((has & 0x80000000) != 0)
  {
LABEL_24:
    v90 = 2654435761u * self->_highTxPerTrue;
    if ((has & 0x40000000) != 0)
      goto LABEL_25;
    goto LABEL_116;
  }
LABEL_115:
  v90 = 0;
  if ((has & 0x40000000) != 0)
  {
LABEL_25:
    v89 = 2654435761u * self->_highTxPerFalse;
    if ((has & 0x200000000) != 0)
      goto LABEL_26;
    goto LABEL_117;
  }
LABEL_116:
  v89 = 0;
  if ((has & 0x200000000) != 0)
  {
LABEL_26:
    v88 = 2654435761u * self->_highTxRetriesTrue;
    if ((has & 0x100000000) != 0)
      goto LABEL_27;
    goto LABEL_118;
  }
LABEL_117:
  v88 = 0;
  if ((has & 0x100000000) != 0)
  {
LABEL_27:
    v87 = 2654435761u * self->_highTxRetriesFalse;
    if ((v2 & 0x80000000) != 0)
      goto LABEL_28;
    goto LABEL_119;
  }
LABEL_118:
  v87 = 0;
  if ((v2 & 0x80000000) != 0)
  {
LABEL_28:
    v86 = 2654435761u * self->_txQueueFullTrue;
    if ((v2 & 0x40000000) != 0)
      goto LABEL_29;
    goto LABEL_120;
  }
LABEL_119:
  v86 = 0;
  if ((v2 & 0x40000000) != 0)
  {
LABEL_29:
    v85 = 2654435761u * self->_txQueueFullFalse;
    if ((has & 0x800000000000) != 0)
      goto LABEL_30;
    goto LABEL_121;
  }
LABEL_120:
  v85 = 0;
  if ((has & 0x800000000000) != 0)
  {
LABEL_30:
    v84 = 2654435761u * self->_lowTxAMPDUDensityTrue;
    if ((has & 0x400000000000) != 0)
      goto LABEL_31;
    goto LABEL_122;
  }
LABEL_121:
  v84 = 0;
  if ((has & 0x400000000000) != 0)
  {
LABEL_31:
    v83 = 2654435761u * self->_lowTxAMPDUDensityFalse;
    if ((has & 0x8000000) != 0)
      goto LABEL_32;
    goto LABEL_123;
  }
LABEL_122:
  v83 = 0;
  if ((has & 0x8000000) != 0)
  {
LABEL_32:
    v82 = 2654435761u * self->_highRxRetriesTrue;
    if ((has & 0x4000000) != 0)
      goto LABEL_33;
    goto LABEL_124;
  }
LABEL_123:
  v82 = 0;
  if ((has & 0x4000000) != 0)
  {
LABEL_33:
    v81 = 2654435761u * self->_highRxRetriesFalse;
    if ((has & 0x800000) != 0)
      goto LABEL_34;
    goto LABEL_125;
  }
LABEL_124:
  v81 = 0;
  if ((has & 0x800000) != 0)
  {
LABEL_34:
    v80 = 2654435761u * self->_highRxPhyPERTrue;
    if ((has & 0x400000) != 0)
      goto LABEL_35;
    goto LABEL_126;
  }
LABEL_125:
  v80 = 0;
  if ((has & 0x400000) != 0)
  {
LABEL_35:
    v79 = 2654435761u * self->_highRxPhyPERFalse;
    if ((has & 0x80000) != 0)
      goto LABEL_36;
    goto LABEL_127;
  }
LABEL_126:
  v79 = 0;
  if ((has & 0x80000) != 0)
  {
LABEL_36:
    v78 = 2654435761u * self->_highRxFCSErrsTrue;
    if ((has & 0x40000) != 0)
      goto LABEL_37;
    goto LABEL_128;
  }
LABEL_127:
  v78 = 0;
  if ((has & 0x40000) != 0)
  {
LABEL_37:
    v77 = 2654435761u * self->_highRxFCSErrsFalse;
    if ((has & 0x200000) != 0)
      goto LABEL_38;
    goto LABEL_129;
  }
LABEL_128:
  v77 = 0;
  if ((has & 0x200000) != 0)
  {
LABEL_38:
    v76 = 2654435761u * self->_highRxOverflowsTrue;
    if ((has & 0x100000) != 0)
      goto LABEL_39;
    goto LABEL_130;
  }
LABEL_129:
  v76 = 0;
  if ((has & 0x100000) != 0)
  {
LABEL_39:
    v75 = 2654435761u * self->_highRxOverflowsFalse;
    if ((has & 0x20000) != 0)
      goto LABEL_40;
    goto LABEL_131;
  }
LABEL_130:
  v75 = 0;
  if ((has & 0x20000) != 0)
  {
LABEL_40:
    v74 = 2654435761u * self->_highRxDupsTrue;
    if ((has & 0x10000) != 0)
      goto LABEL_41;
    goto LABEL_132;
  }
LABEL_131:
  v74 = 0;
  if ((has & 0x10000) != 0)
  {
LABEL_41:
    v73 = 2654435761u * self->_highRxDupsFalse;
    if ((has & 0x2000000) != 0)
      goto LABEL_42;
    goto LABEL_133;
  }
LABEL_132:
  v73 = 0;
  if ((has & 0x2000000) != 0)
  {
LABEL_42:
    v72 = 2654435761u * self->_highRxReplaysTrue;
    if ((has & 0x1000000) != 0)
      goto LABEL_43;
    goto LABEL_134;
  }
LABEL_133:
  v72 = 0;
  if ((has & 0x1000000) != 0)
  {
LABEL_43:
    v71 = 2654435761u * self->_highRxReplaysFalse;
    if ((has & 0x8000) != 0)
      goto LABEL_44;
    goto LABEL_135;
  }
LABEL_134:
  v71 = 0;
  if ((has & 0x8000) != 0)
  {
LABEL_44:
    v70 = 2654435761u * self->_highRxDecryptErrsTrue;
    if ((has & 0x4000) != 0)
      goto LABEL_45;
    goto LABEL_136;
  }
LABEL_135:
  v70 = 0;
  if ((has & 0x4000) != 0)
  {
LABEL_45:
    v69 = 2654435761u * self->_highRxDecryptErrsFalse;
    if ((has & 0x2000) != 0)
      goto LABEL_46;
    goto LABEL_137;
  }
LABEL_136:
  v69 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_46:
    v68 = 2654435761u * self->_highRxDataPERTrue;
    if ((has & 0x1000) != 0)
      goto LABEL_47;
    goto LABEL_138;
  }
LABEL_137:
  v68 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_47:
    v67 = 2654435761u * self->_highRxDataPERFalse;
    if ((has & 0x20000000000) != 0)
      goto LABEL_48;
    goto LABEL_139;
  }
LABEL_138:
  v67 = 0;
  if ((has & 0x20000000000) != 0)
  {
LABEL_48:
    v66 = 2654435761u * self->_lowAvailWLANDurTrue;
    if ((has & 0x10000000000) != 0)
      goto LABEL_49;
    goto LABEL_140;
  }
LABEL_139:
  v66 = 0;
  if ((has & 0x10000000000) != 0)
  {
LABEL_49:
    v65 = 2654435761u * self->_lowAvailWLANDurFalse;
    if ((has & 0x200000000000) != 0)
      goto LABEL_50;
    goto LABEL_141;
  }
LABEL_140:
  v65 = 0;
  if ((has & 0x200000000000) != 0)
  {
LABEL_50:
    v64 = 2654435761u * self->_lowAvailWLANTxDurTrue;
    if ((has & 0x100000000000) != 0)
      goto LABEL_51;
    goto LABEL_142;
  }
LABEL_141:
  v64 = 0;
  if ((has & 0x100000000000) != 0)
  {
LABEL_51:
    v63 = 2654435761u * self->_lowAvailWLANTxDurFalse;
    if ((has & 0x80000000000) != 0)
      goto LABEL_52;
    goto LABEL_143;
  }
LABEL_142:
  v63 = 0;
  if ((has & 0x80000000000) != 0)
  {
LABEL_52:
    v62 = 2654435761u * self->_lowAvailWLANRxDurTrue;
    if ((has & 0x40000000000) != 0)
      goto LABEL_53;
    goto LABEL_144;
  }
LABEL_143:
  v62 = 0;
  if ((has & 0x40000000000) != 0)
  {
LABEL_53:
    v61 = 2654435761u * self->_lowAvailWLANRxDurFalse;
    if ((has & 0x100) != 0)
      goto LABEL_54;
    goto LABEL_145;
  }
LABEL_144:
  v61 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_54:
    v60 = 2654435761u * self->_cCA;
    if ((has & 0x400000000000000) != 0)
      goto LABEL_55;
    goto LABEL_146;
  }
LABEL_145:
  v60 = 0;
  if ((has & 0x400000000000000) != 0)
  {
LABEL_55:
    v59 = 2654435761 * self->_rSSI;
    if ((v2 & 0x20000000) != 0)
      goto LABEL_56;
    goto LABEL_147;
  }
LABEL_146:
  v59 = 0;
  if ((v2 & 0x20000000) != 0)
  {
LABEL_56:
    v58 = 2654435761u * self->_txPhyRate;
    if ((v2 & 0x40) != 0)
      goto LABEL_57;
    goto LABEL_148;
  }
LABEL_147:
  v58 = 0;
  if ((v2 & 0x40) != 0)
  {
LABEL_57:
    v57 = 2654435761u * self->_rxPhyRate;
    if ((v2 & 0x10000) != 0)
      goto LABEL_58;
    goto LABEL_149;
  }
LABEL_148:
  v57 = 0;
  if ((v2 & 0x10000) != 0)
  {
LABEL_58:
    v56 = 2654435761u * self->_txAMPDUDensity;
    if ((has & 0x8000000000000) != 0)
      goto LABEL_59;
    goto LABEL_150;
  }
LABEL_149:
  v56 = 0;
  if ((has & 0x8000000000000) != 0)
  {
LABEL_59:
    v55 = 2654435761u * self->_measurementDurMS;
    if ((has & 0x200) != 0)
      goto LABEL_60;
    goto LABEL_151;
  }
LABEL_150:
  v55 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_60:
    v54 = 2654435761u * self->_concurrentIntDurMS;
    if ((v2 & 0x1000) != 0)
      goto LABEL_61;
    goto LABEL_152;
  }
LABEL_151:
  v54 = 0;
  if ((v2 & 0x1000) != 0)
  {
LABEL_61:
    v53 = 2654435761u * self->_tVPMActiveDurationMS;
    if ((has & 0x80000000000000) != 0)
      goto LABEL_62;
    goto LABEL_153;
  }
LABEL_152:
  v53 = 0;
  if ((has & 0x80000000000000) != 0)
  {
LABEL_62:
    v52 = 2654435761u * self->_phyTxActivityDurMS;
    if ((has & 0x40000000000000) != 0)
      goto LABEL_63;
    goto LABEL_154;
  }
LABEL_153:
  v52 = 0;
  if ((has & 0x40000000000000) != 0)
  {
LABEL_63:
    v51 = 2654435761u * self->_phyRxActivityDurMS;
    if ((v2 & 0x200000000) != 0)
      goto LABEL_64;
    goto LABEL_155;
  }
LABEL_154:
  v51 = 0;
  if ((v2 & 0x200000000) != 0)
  {
LABEL_64:
    v50 = 2654435761u * self->_txSubBytes;
    if ((v2 & 0x20000) != 0)
      goto LABEL_65;
    goto LABEL_156;
  }
LABEL_155:
  v50 = 0;
  if ((v2 & 0x20000) != 0)
  {
LABEL_65:
    v49 = 2654435761u * self->_txCompBytes;
    if ((v2 & 0x80000) != 0)
      goto LABEL_66;
    goto LABEL_157;
  }
LABEL_156:
  v49 = 0;
  if ((v2 & 0x80000) != 0)
  {
LABEL_66:
    v48 = 2654435761u * self->_txDelayBytes;
    if ((has & 0x10000000000000) != 0)
      goto LABEL_67;
    goto LABEL_158;
  }
LABEL_157:
  v48 = 0;
  if ((has & 0x10000000000000) != 0)
  {
LABEL_67:
    v47 = 2654435761u * self->_offChanDurMS;
    if ((v2 & 0x400000000) != 0)
      goto LABEL_68;
    goto LABEL_159;
  }
LABEL_158:
  v47 = 0;
  if ((v2 & 0x400000000) != 0)
  {
LABEL_68:
    v46 = 2654435761u * self->_txSubPkts;
    if ((v2 & 0x40000) != 0)
      goto LABEL_69;
    goto LABEL_160;
  }
LABEL_159:
  v46 = 0;
  if ((v2 & 0x40000) != 0)
  {
LABEL_69:
    v45 = 2654435761u * self->_txCompPkts;
    if ((has & 0x4000000000000) != 0)
      goto LABEL_70;
    goto LABEL_161;
  }
LABEL_160:
  v45 = 0;
  if ((has & 0x4000000000000) != 0)
  {
LABEL_70:
    v44 = 2654435761u * self->_maxQueueFullDurMS;
    if ((has & 0x20) != 0)
      goto LABEL_71;
    goto LABEL_162;
  }
LABEL_161:
  v44 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_71:
    v43 = 2654435761u * self->_avgTxLatencyMS;
    if ((has & 0x40) != 0)
      goto LABEL_72;
    goto LABEL_163;
  }
LABEL_162:
  v43 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_72:
    v42 = 2654435761u * self->_bTAntennaDurMS;
    if ((has & 0x20000000000000) != 0)
      goto LABEL_73;
    goto LABEL_164;
  }
LABEL_163:
  v42 = 0;
  if ((has & 0x20000000000000) != 0)
  {
LABEL_73:
    v41 = 2654435761u * self->_outputThroughput;
    if ((has & 0x800000000) != 0)
      goto LABEL_74;
    goto LABEL_165;
  }
LABEL_164:
  v41 = 0;
  if ((has & 0x800000000) != 0)
  {
LABEL_74:
    v40 = 2654435761u * self->_inputThroughput;
    if ((has & 0x800) != 0)
      goto LABEL_75;
    goto LABEL_166;
  }
LABEL_165:
  v40 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_75:
    v39 = 2654435761u * self->_expectedThroughput;
    if ((has & 0x400) != 0)
      goto LABEL_76;
    goto LABEL_167;
  }
LABEL_166:
  v39 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_76:
    v38 = 2654435761u * self->_delayedThroughput;
    if ((has & 4) != 0)
      goto LABEL_77;
    goto LABEL_168;
  }
LABEL_167:
  v38 = 0;
  if ((has & 4) != 0)
  {
LABEL_77:
    v37 = 2654435761u * self->_availWLANDurMS;
    if ((has & 0x10) != 0)
      goto LABEL_78;
    goto LABEL_169;
  }
LABEL_168:
  v37 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_78:
    v36 = 2654435761u * self->_availWLANTxDurMS;
    if ((has & 8) != 0)
      goto LABEL_79;
    goto LABEL_170;
  }
LABEL_169:
  v36 = 0;
  if ((has & 8) != 0)
  {
LABEL_79:
    v35 = 2654435761u * self->_availWLANRxDurMS;
    if ((v2 & 0x100000000) != 0)
      goto LABEL_80;
    goto LABEL_171;
  }
LABEL_170:
  v35 = 0;
  if ((v2 & 0x100000000) != 0)
  {
LABEL_80:
    v34 = 2654435761u * self->_txRetries;
    if ((v2 & 0x200000) != 0)
      goto LABEL_81;
    goto LABEL_172;
  }
LABEL_171:
  v34 = 0;
  if ((v2 & 0x200000) != 0)
  {
LABEL_81:
    v33 = 2654435761u * self->_txFails;
    if ((v2 & 0x400000) != 0)
      goto LABEL_82;
    goto LABEL_173;
  }
LABEL_172:
  v33 = 0;
  if ((v2 & 0x400000) != 0)
  {
LABEL_82:
    v32 = 2654435761u * self->_txFrames;
    if ((v2 & 0x10) != 0)
      goto LABEL_83;
    goto LABEL_174;
  }
LABEL_173:
  v32 = 0;
  if ((v2 & 0x10) != 0)
  {
LABEL_83:
    v31 = 2654435761u * self->_rxOvflErrs;
    if (has < 0)
      goto LABEL_84;
    goto LABEL_175;
  }
LABEL_174:
  v31 = 0;
  if (has < 0)
  {
LABEL_84:
    v4 = 2654435761u * self->_rxFCSErrs;
    if ((v2 & 0x20) != 0)
      goto LABEL_85;
    goto LABEL_176;
  }
LABEL_175:
  v4 = 0;
  if ((v2 & 0x20) != 0)
  {
LABEL_85:
    v5 = 2654435761u * self->_rxPLCPErrs;
    if ((has & 0x1000000000000000) != 0)
      goto LABEL_86;
    goto LABEL_177;
  }
LABEL_176:
  v5 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_86:
    v6 = 2654435761u * self->_rxCRSErrs;
    if ((has & 0x4000000000000000) != 0)
      goto LABEL_87;
    goto LABEL_178;
  }
LABEL_177:
  v6 = 0;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_87:
    v7 = 2654435761u * self->_rxDupErrs;
    if ((v2 & 0x80) != 0)
      goto LABEL_88;
    goto LABEL_179;
  }
LABEL_178:
  v7 = 0;
  if ((v2 & 0x80) != 0)
  {
LABEL_88:
    v8 = 2654435761u * self->_rxReplayErrs;
    if ((has & 0x2000000000000000) != 0)
      goto LABEL_89;
    goto LABEL_180;
  }
LABEL_179:
  v8 = 0;
  if ((has & 0x2000000000000000) != 0)
  {
LABEL_89:
    v9 = 2654435761u * self->_rxDecryErrs;
    if ((v2 & 0x100) != 0)
      goto LABEL_90;
    goto LABEL_181;
  }
LABEL_180:
  v9 = 0;
  if ((v2 & 0x100) != 0)
  {
LABEL_90:
    v10 = 2654435761u * self->_rxRetries;
    if ((v2 & 2) != 0)
      goto LABEL_91;
    goto LABEL_182;
  }
LABEL_181:
  v10 = 0;
  if ((v2 & 2) != 0)
  {
LABEL_91:
    v11 = 2654435761u * self->_rxGoodPlcps;
    if ((v2 & 1) != 0)
      goto LABEL_92;
    goto LABEL_183;
  }
LABEL_182:
  v11 = 0;
  if ((v2 & 1) != 0)
  {
LABEL_92:
    v12 = 2654435761u * self->_rxFrames;
    if ((v2 & 0x400) != 0)
      goto LABEL_93;
    goto LABEL_184;
  }
LABEL_183:
  v12 = 0;
  if ((v2 & 0x400) != 0)
  {
LABEL_93:
    v13 = 2654435761u * self->_sNR;
    if ((v2 & 0x100000) != 0)
      goto LABEL_94;
    goto LABEL_185;
  }
LABEL_184:
  v13 = 0;
  if ((v2 & 0x100000) != 0)
  {
LABEL_94:
    v14 = 2654435761u * self->_txExpectedAMPDUDensity;
    if ((has & 0x100000000000000) != 0)
      goto LABEL_95;
    goto LABEL_186;
  }
LABEL_185:
  v14 = 0;
  if ((has & 0x100000000000000) != 0)
  {
LABEL_95:
    v15 = 2654435761u * self->_rC1CoexDurationMS;
    if ((has & 0x200000000000000) != 0)
      goto LABEL_96;
    goto LABEL_187;
  }
LABEL_186:
  v15 = 0;
  if ((has & 0x200000000000000) != 0)
  {
LABEL_96:
    v16 = 2654435761u * self->_rC2CoexDurationMS;
    if ((has & 0x4000000000) != 0)
      goto LABEL_97;
    goto LABEL_188;
  }
LABEL_187:
  v16 = 0;
  if ((has & 0x4000000000) != 0)
  {
LABEL_97:
    v17 = 2654435761u * self->_lTECoexDurationMS;
    if ((v2 & 0x200) != 0)
      goto LABEL_98;
    goto LABEL_189;
  }
LABEL_188:
  v17 = 0;
  if ((v2 & 0x200) != 0)
  {
LABEL_98:
    v18 = 2654435761u * self->_rxThroughput;
    if ((has & 1) != 0)
      goto LABEL_99;
    goto LABEL_190;
  }
LABEL_189:
  v18 = 0;
  if ((has & 1) != 0)
  {
LABEL_99:
    v19 = 2654435761u * self->_aPTxDataStall;
    if ((has & 0x800000000000000) != 0)
      goto LABEL_100;
    goto LABEL_191;
  }
LABEL_190:
  v19 = 0;
  if ((has & 0x800000000000000) != 0)
  {
LABEL_100:
    v20 = 2654435761u * self->_rxAmpduTxBaMismatch;
    if ((v2 & 0x800) != 0)
      goto LABEL_101;
    goto LABEL_192;
  }
LABEL_191:
  v20 = 0;
  if ((v2 & 0x800) != 0)
  {
LABEL_101:
    v21 = 2654435761u * self->_symptomsFails;
    if ((has & 0x1000000000) != 0)
      goto LABEL_102;
    goto LABEL_193;
  }
LABEL_192:
  v21 = 0;
  if ((has & 0x1000000000) != 0)
  {
LABEL_102:
    v22 = 2654435761u * self->_is2GBand;
    if ((has & 0x2000000000) != 0)
      goto LABEL_103;
    goto LABEL_194;
  }
LABEL_193:
  v22 = 0;
  if ((has & 0x2000000000) != 0)
  {
LABEL_103:
    v23 = 2654435761u * self->_isFGTraffic;
    if ((has & 0x80) != 0)
      goto LABEL_104;
    goto LABEL_195;
  }
LABEL_194:
  v23 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_104:
    v24 = 2654435761u * self->_baselineThroughput;
    if ((v2 & 0x2000) != 0)
      goto LABEL_105;
    goto LABEL_196;
  }
LABEL_195:
  v24 = 0;
  if ((v2 & 0x2000) != 0)
  {
LABEL_105:
    v25 = 2654435761u * self->_testThroughput;
    if ((has & 0x400000000) != 0)
      goto LABEL_106;
    goto LABEL_197;
  }
LABEL_196:
  v25 = 0;
  if ((has & 0x400000000) != 0)
  {
LABEL_106:
    v26 = 2654435761u * self->_infraDutyCycle;
    if ((has & 0x8000000000) != 0)
      goto LABEL_107;
    goto LABEL_198;
  }
LABEL_197:
  v26 = 0;
  if ((has & 0x8000000000) != 0)
  {
LABEL_107:
    v27 = 2654435761u * self->_lastScanReason;
    if ((has & 2) != 0)
      goto LABEL_108;
LABEL_199:
    v28 = 0;
    if ((v2 & 0x4000) != 0)
      goto LABEL_109;
LABEL_200:
    v29 = 0;
    return v102 ^ v103 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_198:
  v27 = 0;
  if ((has & 2) == 0)
    goto LABEL_199;
LABEL_108:
  v28 = 2654435761u * self->_accessPointOUI;
  if ((v2 & 0x4000) == 0)
    goto LABEL_200;
LABEL_109:
  v29 = 2654435761u * self->_timeSinceLastRecovery;
  return v102 ^ v103 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = v4[101];
  if ((v5 & 0x8000) != 0)
  {
    self->_timestamp = v4[80];
    *((_QWORD *)&self->_has + 1) |= 0x8000uLL;
    v5 = v4[101];
  }
  v6 = v4[100];
  if ((v5 & 0x4000000) != 0)
  {
    self->_txOutputBelowExpectedTrue = v4[91];
    *((_QWORD *)&self->_has + 1) |= 0x4000000uLL;
    v6 = v4[100];
    v5 = v4[101];
    if ((v5 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x10000000) == 0)
        goto LABEL_6;
      goto LABEL_105;
    }
  }
  else if ((v5 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  self->_txOutputBelowExpectedFalse = v4[90];
  *((_QWORD *)&self->_has + 1) |= 0x2000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_7;
    goto LABEL_106;
  }
LABEL_105:
  self->_txOutputBelowInputTrue = v4[93];
  *((_QWORD *)&self->_has + 1) |= 0x10000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_107;
  }
LABEL_106:
  self->_txOutputBelowInputFalse = v4[92];
  *((_QWORD *)&self->_has + 1) |= 0x8000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_108;
  }
LABEL_107:
  self->_txLowFrameCountTrue = v4[89];
  *((_QWORD *)&self->_has + 1) |= 0x1000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_109;
  }
LABEL_108:
  self->_txLowFrameCountFalse = v4[88];
  *((_QWORD *)&self->_has + 1) |= 0x800000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_110;
  }
LABEL_109:
  self->_rxLowFrameCountTrue = v4[68];
  *((_QWORD *)&self->_has + 1) |= 8uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v6 & 0x20000000) == 0)
      goto LABEL_12;
    goto LABEL_111;
  }
LABEL_110:
  self->_rxLowFrameCountFalse = v4[67];
  *((_QWORD *)&self->_has + 1) |= 4uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x20000000) == 0)
  {
LABEL_12:
    if ((v6 & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_112;
  }
LABEL_111:
  self->_highTxLatencyTrue = v4[30];
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x10000000) == 0)
  {
LABEL_13:
    if ((v6 & 0x2000000000000) == 0)
      goto LABEL_14;
    goto LABEL_113;
  }
LABEL_112:
  self->_highTxLatencyFalse = v4[29];
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((v6 & 0x1000000000000) == 0)
      goto LABEL_15;
    goto LABEL_114;
  }
LABEL_113:
  self->_lowTxPhyRateTrue = v4[50];
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((v6 & 0x80000000) == 0)
      goto LABEL_16;
    goto LABEL_115;
  }
LABEL_114:
  self->_lowTxPhyRateFalse = v4[49];
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x80000000) == 0)
  {
LABEL_16:
    if ((v6 & 0x40000000) == 0)
      goto LABEL_17;
    goto LABEL_116;
  }
LABEL_115:
  self->_highTxPerTrue = v4[32];
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x40000000) == 0)
  {
LABEL_17:
    if ((v6 & 0x200000000) == 0)
      goto LABEL_18;
    goto LABEL_117;
  }
LABEL_116:
  self->_highTxPerFalse = v4[31];
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x200000000) == 0)
  {
LABEL_18:
    if ((v6 & 0x100000000) == 0)
      goto LABEL_19;
    goto LABEL_118;
  }
LABEL_117:
  self->_highTxRetriesTrue = v4[34];
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x100000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_119;
  }
LABEL_118:
  self->_highTxRetriesFalse = v4[33];
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_120;
  }
LABEL_119:
  self->_txQueueFullTrue = v4[96];
  *((_QWORD *)&self->_has + 1) |= 0x80000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x40000000) == 0)
  {
LABEL_21:
    if ((v6 & 0x800000000000) == 0)
      goto LABEL_22;
    goto LABEL_121;
  }
LABEL_120:
  self->_txQueueFullFalse = v4[95];
  *((_QWORD *)&self->_has + 1) |= 0x40000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x800000000000) == 0)
  {
LABEL_22:
    if ((v6 & 0x400000000000) == 0)
      goto LABEL_23;
    goto LABEL_122;
  }
LABEL_121:
  self->_lowTxAMPDUDensityTrue = v4[48];
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x400000000000) == 0)
  {
LABEL_23:
    if ((v6 & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_123;
  }
LABEL_122:
  self->_lowTxAMPDUDensityFalse = v4[47];
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_25;
    goto LABEL_124;
  }
LABEL_123:
  self->_highRxRetriesTrue = v4[28];
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x4000000) == 0)
  {
LABEL_25:
    if ((v6 & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_125;
  }
LABEL_124:
  self->_highRxRetriesFalse = v4[27];
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x800000) == 0)
  {
LABEL_26:
    if ((v6 & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_126;
  }
LABEL_125:
  self->_highRxPhyPERTrue = v4[24];
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x400000) == 0)
  {
LABEL_27:
    if ((v6 & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_127;
  }
LABEL_126:
  self->_highRxPhyPERFalse = v4[23];
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x80000) == 0)
  {
LABEL_28:
    if ((v6 & 0x40000) == 0)
      goto LABEL_29;
    goto LABEL_128;
  }
LABEL_127:
  self->_highRxFCSErrsTrue = v4[20];
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x40000) == 0)
  {
LABEL_29:
    if ((v6 & 0x200000) == 0)
      goto LABEL_30;
    goto LABEL_129;
  }
LABEL_128:
  self->_highRxFCSErrsFalse = v4[19];
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x200000) == 0)
  {
LABEL_30:
    if ((v6 & 0x100000) == 0)
      goto LABEL_31;
    goto LABEL_130;
  }
LABEL_129:
  self->_highRxOverflowsTrue = v4[22];
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x100000) == 0)
  {
LABEL_31:
    if ((v6 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_131;
  }
LABEL_130:
  self->_highRxOverflowsFalse = v4[21];
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x20000) == 0)
  {
LABEL_32:
    if ((v6 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_132;
  }
LABEL_131:
  self->_highRxDupsTrue = v4[18];
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x10000) == 0)
  {
LABEL_33:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_34;
    goto LABEL_133;
  }
LABEL_132:
  self->_highRxDupsFalse = v4[17];
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x2000000) == 0)
  {
LABEL_34:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_134;
  }
LABEL_133:
  self->_highRxReplaysTrue = v4[26];
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x1000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x8000) == 0)
      goto LABEL_36;
    goto LABEL_135;
  }
LABEL_134:
  self->_highRxReplaysFalse = v4[25];
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x8000) == 0)
  {
LABEL_36:
    if ((v6 & 0x4000) == 0)
      goto LABEL_37;
    goto LABEL_136;
  }
LABEL_135:
  self->_highRxDecryptErrsTrue = v4[16];
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x4000) == 0)
  {
LABEL_37:
    if ((v6 & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_137;
  }
LABEL_136:
  self->_highRxDecryptErrsFalse = v4[15];
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x2000) == 0)
  {
LABEL_38:
    if ((v6 & 0x1000) == 0)
      goto LABEL_39;
    goto LABEL_138;
  }
LABEL_137:
  self->_highRxDataPERTrue = v4[14];
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x1000) == 0)
  {
LABEL_39:
    if ((v6 & 0x20000000000) == 0)
      goto LABEL_40;
    goto LABEL_139;
  }
LABEL_138:
  self->_highRxDataPERFalse = v4[13];
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x20000000000) == 0)
  {
LABEL_40:
    if ((v6 & 0x10000000000) == 0)
      goto LABEL_41;
    goto LABEL_140;
  }
LABEL_139:
  self->_lowAvailWLANDurTrue = v4[42];
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x10000000000) == 0)
  {
LABEL_41:
    if ((v6 & 0x200000000000) == 0)
      goto LABEL_42;
    goto LABEL_141;
  }
LABEL_140:
  self->_lowAvailWLANDurFalse = v4[41];
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x200000000000) == 0)
  {
LABEL_42:
    if ((v6 & 0x100000000000) == 0)
      goto LABEL_43;
    goto LABEL_142;
  }
LABEL_141:
  self->_lowAvailWLANTxDurTrue = v4[46];
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x100000000000) == 0)
  {
LABEL_43:
    if ((v6 & 0x80000000000) == 0)
      goto LABEL_44;
    goto LABEL_143;
  }
LABEL_142:
  self->_lowAvailWLANTxDurFalse = v4[45];
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x80000000000) == 0)
  {
LABEL_44:
    if ((v6 & 0x40000000000) == 0)
      goto LABEL_45;
    goto LABEL_144;
  }
LABEL_143:
  self->_lowAvailWLANRxDurTrue = v4[44];
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x40000000000) == 0)
  {
LABEL_45:
    if ((v6 & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_145;
  }
LABEL_144:
  self->_lowAvailWLANRxDurFalse = v4[43];
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x100) == 0)
  {
LABEL_46:
    if ((v6 & 0x400000000000000) == 0)
      goto LABEL_47;
    goto LABEL_146;
  }
LABEL_145:
  self->_cCA = v4[9];
  *(_QWORD *)&self->_has |= 0x100uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_48;
    goto LABEL_147;
  }
LABEL_146:
  self->_rSSI = v4[59];
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v5 & 0x40) == 0)
      goto LABEL_49;
    goto LABEL_148;
  }
LABEL_147:
  self->_txPhyRate = v4[94];
  *((_QWORD *)&self->_has + 1) |= 0x20000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x40) == 0)
  {
LABEL_49:
    if ((v5 & 0x10000) == 0)
      goto LABEL_50;
    goto LABEL_149;
  }
LABEL_148:
  self->_rxPhyRate = v4[71];
  *((_QWORD *)&self->_has + 1) |= 0x40uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x10000) == 0)
  {
LABEL_50:
    if ((v6 & 0x8000000000000) == 0)
      goto LABEL_51;
    goto LABEL_150;
  }
LABEL_149:
  self->_txAMPDUDensity = v4[81];
  *((_QWORD *)&self->_has + 1) |= 0x10000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((v6 & 0x200) == 0)
      goto LABEL_52;
    goto LABEL_151;
  }
LABEL_150:
  self->_measurementDurMS = v4[52];
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x200) == 0)
  {
LABEL_52:
    if ((v5 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_152;
  }
LABEL_151:
  self->_concurrentIntDurMS = v4[10];
  *(_QWORD *)&self->_has |= 0x200uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x1000) == 0)
  {
LABEL_53:
    if ((v6 & 0x80000000000000) == 0)
      goto LABEL_54;
    goto LABEL_153;
  }
LABEL_152:
  self->_tVPMActiveDurationMS = v4[77];
  *((_QWORD *)&self->_has + 1) |= 0x1000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((v6 & 0x40000000000000) == 0)
      goto LABEL_55;
    goto LABEL_154;
  }
LABEL_153:
  self->_phyTxActivityDurMS = v4[56];
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_56;
    goto LABEL_155;
  }
LABEL_154:
  self->_phyRxActivityDurMS = v4[55];
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v5 & 0x20000) == 0)
      goto LABEL_57;
    goto LABEL_156;
  }
LABEL_155:
  self->_txSubBytes = v4[98];
  *((_QWORD *)&self->_has + 1) |= 0x200000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x20000) == 0)
  {
LABEL_57:
    if ((v5 & 0x80000) == 0)
      goto LABEL_58;
    goto LABEL_157;
  }
LABEL_156:
  self->_txCompBytes = v4[82];
  *((_QWORD *)&self->_has + 1) |= 0x20000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x80000) == 0)
  {
LABEL_58:
    if ((v6 & 0x10000000000000) == 0)
      goto LABEL_59;
    goto LABEL_158;
  }
LABEL_157:
  self->_txDelayBytes = v4[84];
  *((_QWORD *)&self->_has + 1) |= 0x80000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_60;
    goto LABEL_159;
  }
LABEL_158:
  self->_offChanDurMS = v4[53];
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v5 & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_160;
  }
LABEL_159:
  self->_txSubPkts = v4[99];
  *((_QWORD *)&self->_has + 1) |= 0x400000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x40000) == 0)
  {
LABEL_61:
    if ((v6 & 0x4000000000000) == 0)
      goto LABEL_62;
    goto LABEL_161;
  }
LABEL_160:
  self->_txCompPkts = v4[83];
  *((_QWORD *)&self->_has + 1) |= 0x40000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((v6 & 0x20) == 0)
      goto LABEL_63;
    goto LABEL_162;
  }
LABEL_161:
  self->_maxQueueFullDurMS = v4[51];
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x20) == 0)
  {
LABEL_63:
    if ((v6 & 0x40) == 0)
      goto LABEL_64;
    goto LABEL_163;
  }
LABEL_162:
  self->_avgTxLatencyMS = v4[6];
  *(_QWORD *)&self->_has |= 0x20uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x40) == 0)
  {
LABEL_64:
    if ((v6 & 0x20000000000000) == 0)
      goto LABEL_65;
    goto LABEL_164;
  }
LABEL_163:
  self->_bTAntennaDurMS = v4[7];
  *(_QWORD *)&self->_has |= 0x40uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((v6 & 0x800000000) == 0)
      goto LABEL_66;
    goto LABEL_165;
  }
LABEL_164:
  self->_outputThroughput = v4[54];
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x800000000) == 0)
  {
LABEL_66:
    if ((v6 & 0x800) == 0)
      goto LABEL_67;
    goto LABEL_166;
  }
LABEL_165:
  self->_inputThroughput = v4[36];
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x800) == 0)
  {
LABEL_67:
    if ((v6 & 0x400) == 0)
      goto LABEL_68;
    goto LABEL_167;
  }
LABEL_166:
  self->_expectedThroughput = v4[12];
  *(_QWORD *)&self->_has |= 0x800uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x400) == 0)
  {
LABEL_68:
    if ((v6 & 4) == 0)
      goto LABEL_69;
    goto LABEL_168;
  }
LABEL_167:
  self->_delayedThroughput = v4[11];
  *(_QWORD *)&self->_has |= 0x400uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 4) == 0)
  {
LABEL_69:
    if ((v6 & 0x10) == 0)
      goto LABEL_70;
    goto LABEL_169;
  }
LABEL_168:
  self->_availWLANDurMS = v4[3];
  *(_QWORD *)&self->_has |= 4uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x10) == 0)
  {
LABEL_70:
    if ((v6 & 8) == 0)
      goto LABEL_71;
    goto LABEL_170;
  }
LABEL_169:
  self->_availWLANTxDurMS = v4[5];
  *(_QWORD *)&self->_has |= 0x10uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 8) == 0)
  {
LABEL_71:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_72;
    goto LABEL_171;
  }
LABEL_170:
  self->_availWLANRxDurMS = v4[4];
  *(_QWORD *)&self->_has |= 8uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v5 & 0x200000) == 0)
      goto LABEL_73;
    goto LABEL_172;
  }
LABEL_171:
  self->_txRetries = v4[97];
  *((_QWORD *)&self->_has + 1) |= 0x100000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x200000) == 0)
  {
LABEL_73:
    if ((v5 & 0x400000) == 0)
      goto LABEL_74;
    goto LABEL_173;
  }
LABEL_172:
  self->_txFails = v4[86];
  *((_QWORD *)&self->_has + 1) |= 0x200000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x400000) == 0)
  {
LABEL_74:
    if ((v5 & 0x10) == 0)
      goto LABEL_75;
    goto LABEL_174;
  }
LABEL_173:
  self->_txFrames = v4[87];
  *((_QWORD *)&self->_has + 1) |= 0x400000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x10) == 0)
  {
LABEL_75:
    if ((v6 & 0x8000000000000000) == 0)
      goto LABEL_76;
    goto LABEL_175;
  }
LABEL_174:
  self->_rxOvflErrs = v4[69];
  *((_QWORD *)&self->_has + 1) |= 0x10uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v5 & 0x20) == 0)
      goto LABEL_77;
    goto LABEL_176;
  }
LABEL_175:
  self->_rxFCSErrs = v4[64];
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x20) == 0)
  {
LABEL_77:
    if ((v6 & 0x1000000000000000) == 0)
      goto LABEL_78;
    goto LABEL_177;
  }
LABEL_176:
  self->_rxPLCPErrs = v4[70];
  *((_QWORD *)&self->_has + 1) |= 0x20uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((v6 & 0x4000000000000000) == 0)
      goto LABEL_79;
    goto LABEL_178;
  }
LABEL_177:
  self->_rxCRSErrs = v4[61];
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v5 & 0x80) == 0)
      goto LABEL_80;
    goto LABEL_179;
  }
LABEL_178:
  self->_rxDupErrs = v4[63];
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x80) == 0)
  {
LABEL_80:
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_81;
    goto LABEL_180;
  }
LABEL_179:
  self->_rxReplayErrs = v4[72];
  *((_QWORD *)&self->_has + 1) |= 0x80uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v5 & 0x100) == 0)
      goto LABEL_82;
    goto LABEL_181;
  }
LABEL_180:
  self->_rxDecryErrs = v4[62];
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x100) == 0)
  {
LABEL_82:
    if ((v5 & 2) == 0)
      goto LABEL_83;
    goto LABEL_182;
  }
LABEL_181:
  self->_rxRetries = v4[73];
  *((_QWORD *)&self->_has + 1) |= 0x100uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 2) == 0)
  {
LABEL_83:
    if ((v5 & 1) == 0)
      goto LABEL_84;
    goto LABEL_183;
  }
LABEL_182:
  self->_rxGoodPlcps = v4[66];
  *((_QWORD *)&self->_has + 1) |= 2uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 1) == 0)
  {
LABEL_84:
    if ((v5 & 0x400) == 0)
      goto LABEL_85;
    goto LABEL_184;
  }
LABEL_183:
  self->_rxFrames = v4[65];
  *((_QWORD *)&self->_has + 1) |= 1uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x400) == 0)
  {
LABEL_85:
    if ((v5 & 0x100000) == 0)
      goto LABEL_86;
    goto LABEL_185;
  }
LABEL_184:
  self->_sNR = v4[75];
  *((_QWORD *)&self->_has + 1) |= 0x400uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x100000) == 0)
  {
LABEL_86:
    if ((v6 & 0x100000000000000) == 0)
      goto LABEL_87;
    goto LABEL_186;
  }
LABEL_185:
  self->_txExpectedAMPDUDensity = v4[85];
  *((_QWORD *)&self->_has + 1) |= 0x100000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((v6 & 0x200000000000000) == 0)
      goto LABEL_88;
    goto LABEL_187;
  }
LABEL_186:
  self->_rC1CoexDurationMS = v4[57];
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((v6 & 0x4000000000) == 0)
      goto LABEL_89;
    goto LABEL_188;
  }
LABEL_187:
  self->_rC2CoexDurationMS = v4[58];
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v5 & 0x200) == 0)
      goto LABEL_90;
    goto LABEL_189;
  }
LABEL_188:
  self->_lTECoexDurationMS = v4[39];
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x200) == 0)
  {
LABEL_90:
    if ((v6 & 1) == 0)
      goto LABEL_91;
    goto LABEL_190;
  }
LABEL_189:
  self->_rxThroughput = v4[74];
  *((_QWORD *)&self->_has + 1) |= 0x200uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 1) == 0)
  {
LABEL_91:
    if ((v6 & 0x800000000000000) == 0)
      goto LABEL_92;
    goto LABEL_191;
  }
LABEL_190:
  self->_aPTxDataStall = v4[1];
  *(_QWORD *)&self->_has |= 1uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v5 & 0x800) == 0)
      goto LABEL_93;
    goto LABEL_192;
  }
LABEL_191:
  self->_rxAmpduTxBaMismatch = v4[60];
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x800) == 0)
  {
LABEL_93:
    if ((v6 & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_193;
  }
LABEL_192:
  self->_symptomsFails = v4[76];
  *((_QWORD *)&self->_has + 1) |= 0x800uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x1000000000) == 0)
  {
LABEL_94:
    if ((v6 & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_194;
  }
LABEL_193:
  self->_is2GBand = v4[37];
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x2000000000) == 0)
  {
LABEL_95:
    if ((v6 & 0x80) == 0)
      goto LABEL_96;
    goto LABEL_195;
  }
LABEL_194:
  self->_isFGTraffic = v4[38];
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x80) == 0)
  {
LABEL_96:
    if ((v5 & 0x2000) == 0)
      goto LABEL_97;
    goto LABEL_196;
  }
LABEL_195:
  self->_baselineThroughput = v4[8];
  *(_QWORD *)&self->_has |= 0x80uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v5 & 0x2000) == 0)
  {
LABEL_97:
    if ((v6 & 0x400000000) == 0)
      goto LABEL_98;
    goto LABEL_197;
  }
LABEL_196:
  self->_testThroughput = v4[78];
  *((_QWORD *)&self->_has + 1) |= 0x2000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x400000000) == 0)
  {
LABEL_98:
    if ((v6 & 0x8000000000) == 0)
      goto LABEL_99;
    goto LABEL_198;
  }
LABEL_197:
  self->_infraDutyCycle = v4[35];
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v6 = v4[100];
  v5 = v4[101];
  if ((v6 & 0x8000000000) == 0)
  {
LABEL_99:
    if ((v6 & 2) == 0)
      goto LABEL_100;
LABEL_199:
    self->_accessPointOUI = v4[2];
    *(_QWORD *)&self->_has |= 2uLL;
    if ((v4[101] & 0x4000) == 0)
      goto LABEL_102;
    goto LABEL_101;
  }
LABEL_198:
  self->_lastScanReason = v4[40];
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v5 = v4[101];
  if ((v4[100] & 2) != 0)
    goto LABEL_199;
LABEL_100:
  if ((v5 & 0x4000) != 0)
  {
LABEL_101:
    self->_timeSinceLastRecovery = v4[79];
    *((_QWORD *)&self->_has + 1) |= 0x4000uLL;
  }
LABEL_102:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)txOutputBelowExpectedTrue
{
  return self->_txOutputBelowExpectedTrue;
}

- (unint64_t)txOutputBelowExpectedFalse
{
  return self->_txOutputBelowExpectedFalse;
}

- (unint64_t)txOutputBelowInputTrue
{
  return self->_txOutputBelowInputTrue;
}

- (unint64_t)txOutputBelowInputFalse
{
  return self->_txOutputBelowInputFalse;
}

- (unint64_t)txLowFrameCountTrue
{
  return self->_txLowFrameCountTrue;
}

- (unint64_t)txLowFrameCountFalse
{
  return self->_txLowFrameCountFalse;
}

- (unint64_t)rxLowFrameCountTrue
{
  return self->_rxLowFrameCountTrue;
}

- (unint64_t)rxLowFrameCountFalse
{
  return self->_rxLowFrameCountFalse;
}

- (unint64_t)highTxLatencyTrue
{
  return self->_highTxLatencyTrue;
}

- (unint64_t)highTxLatencyFalse
{
  return self->_highTxLatencyFalse;
}

- (unint64_t)lowTxPhyRateTrue
{
  return self->_lowTxPhyRateTrue;
}

- (unint64_t)lowTxPhyRateFalse
{
  return self->_lowTxPhyRateFalse;
}

- (unint64_t)highTxPerTrue
{
  return self->_highTxPerTrue;
}

- (unint64_t)highTxPerFalse
{
  return self->_highTxPerFalse;
}

- (unint64_t)highTxRetriesTrue
{
  return self->_highTxRetriesTrue;
}

- (unint64_t)highTxRetriesFalse
{
  return self->_highTxRetriesFalse;
}

- (unint64_t)txQueueFullTrue
{
  return self->_txQueueFullTrue;
}

- (unint64_t)txQueueFullFalse
{
  return self->_txQueueFullFalse;
}

- (unint64_t)lowTxAMPDUDensityTrue
{
  return self->_lowTxAMPDUDensityTrue;
}

- (unint64_t)lowTxAMPDUDensityFalse
{
  return self->_lowTxAMPDUDensityFalse;
}

- (unint64_t)highRxRetriesTrue
{
  return self->_highRxRetriesTrue;
}

- (unint64_t)highRxRetriesFalse
{
  return self->_highRxRetriesFalse;
}

- (unint64_t)highRxPhyPERTrue
{
  return self->_highRxPhyPERTrue;
}

- (unint64_t)highRxPhyPERFalse
{
  return self->_highRxPhyPERFalse;
}

- (unint64_t)highRxFCSErrsTrue
{
  return self->_highRxFCSErrsTrue;
}

- (unint64_t)highRxFCSErrsFalse
{
  return self->_highRxFCSErrsFalse;
}

- (unint64_t)highRxOverflowsTrue
{
  return self->_highRxOverflowsTrue;
}

- (unint64_t)highRxOverflowsFalse
{
  return self->_highRxOverflowsFalse;
}

- (unint64_t)highRxDupsTrue
{
  return self->_highRxDupsTrue;
}

- (unint64_t)highRxDupsFalse
{
  return self->_highRxDupsFalse;
}

- (unint64_t)highRxReplaysTrue
{
  return self->_highRxReplaysTrue;
}

- (unint64_t)highRxReplaysFalse
{
  return self->_highRxReplaysFalse;
}

- (unint64_t)highRxDecryptErrsTrue
{
  return self->_highRxDecryptErrsTrue;
}

- (unint64_t)highRxDecryptErrsFalse
{
  return self->_highRxDecryptErrsFalse;
}

- (unint64_t)highRxDataPERTrue
{
  return self->_highRxDataPERTrue;
}

- (unint64_t)highRxDataPERFalse
{
  return self->_highRxDataPERFalse;
}

- (unint64_t)lowAvailWLANDurTrue
{
  return self->_lowAvailWLANDurTrue;
}

- (unint64_t)lowAvailWLANDurFalse
{
  return self->_lowAvailWLANDurFalse;
}

- (unint64_t)lowAvailWLANTxDurTrue
{
  return self->_lowAvailWLANTxDurTrue;
}

- (unint64_t)lowAvailWLANTxDurFalse
{
  return self->_lowAvailWLANTxDurFalse;
}

- (unint64_t)lowAvailWLANRxDurTrue
{
  return self->_lowAvailWLANRxDurTrue;
}

- (unint64_t)lowAvailWLANRxDurFalse
{
  return self->_lowAvailWLANRxDurFalse;
}

- (unint64_t)cCA
{
  return self->_cCA;
}

- (int64_t)rSSI
{
  return self->_rSSI;
}

- (unint64_t)txPhyRate
{
  return self->_txPhyRate;
}

- (unint64_t)rxPhyRate
{
  return self->_rxPhyRate;
}

- (unint64_t)txAMPDUDensity
{
  return self->_txAMPDUDensity;
}

- (unint64_t)measurementDurMS
{
  return self->_measurementDurMS;
}

- (unint64_t)concurrentIntDurMS
{
  return self->_concurrentIntDurMS;
}

- (unint64_t)tVPMActiveDurationMS
{
  return self->_tVPMActiveDurationMS;
}

- (unint64_t)phyTxActivityDurMS
{
  return self->_phyTxActivityDurMS;
}

- (unint64_t)phyRxActivityDurMS
{
  return self->_phyRxActivityDurMS;
}

- (unint64_t)txSubBytes
{
  return self->_txSubBytes;
}

- (unint64_t)txCompBytes
{
  return self->_txCompBytes;
}

- (unint64_t)txDelayBytes
{
  return self->_txDelayBytes;
}

- (unint64_t)offChanDurMS
{
  return self->_offChanDurMS;
}

- (unint64_t)txSubPkts
{
  return self->_txSubPkts;
}

- (unint64_t)txCompPkts
{
  return self->_txCompPkts;
}

- (unint64_t)maxQueueFullDurMS
{
  return self->_maxQueueFullDurMS;
}

- (unint64_t)avgTxLatencyMS
{
  return self->_avgTxLatencyMS;
}

- (unint64_t)bTAntennaDurMS
{
  return self->_bTAntennaDurMS;
}

- (unint64_t)outputThroughput
{
  return self->_outputThroughput;
}

- (unint64_t)inputThroughput
{
  return self->_inputThroughput;
}

- (unint64_t)expectedThroughput
{
  return self->_expectedThroughput;
}

- (unint64_t)delayedThroughput
{
  return self->_delayedThroughput;
}

- (unint64_t)availWLANDurMS
{
  return self->_availWLANDurMS;
}

- (unint64_t)availWLANTxDurMS
{
  return self->_availWLANTxDurMS;
}

- (unint64_t)availWLANRxDurMS
{
  return self->_availWLANRxDurMS;
}

- (unint64_t)txRetries
{
  return self->_txRetries;
}

- (unint64_t)txFails
{
  return self->_txFails;
}

- (unint64_t)txFrames
{
  return self->_txFrames;
}

- (unint64_t)rxOvflErrs
{
  return self->_rxOvflErrs;
}

- (unint64_t)rxFCSErrs
{
  return self->_rxFCSErrs;
}

- (unint64_t)rxPLCPErrs
{
  return self->_rxPLCPErrs;
}

- (unint64_t)rxCRSErrs
{
  return self->_rxCRSErrs;
}

- (unint64_t)rxDupErrs
{
  return self->_rxDupErrs;
}

- (unint64_t)rxReplayErrs
{
  return self->_rxReplayErrs;
}

- (unint64_t)rxDecryErrs
{
  return self->_rxDecryErrs;
}

- (unint64_t)rxRetries
{
  return self->_rxRetries;
}

- (unint64_t)rxGoodPlcps
{
  return self->_rxGoodPlcps;
}

- (unint64_t)rxFrames
{
  return self->_rxFrames;
}

- (unint64_t)sNR
{
  return self->_sNR;
}

- (unint64_t)txExpectedAMPDUDensity
{
  return self->_txExpectedAMPDUDensity;
}

- (unint64_t)rC1CoexDurationMS
{
  return self->_rC1CoexDurationMS;
}

- (unint64_t)rC2CoexDurationMS
{
  return self->_rC2CoexDurationMS;
}

- (unint64_t)lTECoexDurationMS
{
  return self->_lTECoexDurationMS;
}

- (unint64_t)rxThroughput
{
  return self->_rxThroughput;
}

- (unint64_t)aPTxDataStall
{
  return self->_aPTxDataStall;
}

- (unint64_t)rxAmpduTxBaMismatch
{
  return self->_rxAmpduTxBaMismatch;
}

- (unint64_t)symptomsFails
{
  return self->_symptomsFails;
}

- (unint64_t)is2GBand
{
  return self->_is2GBand;
}

- (unint64_t)isFGTraffic
{
  return self->_isFGTraffic;
}

- (unint64_t)baselineThroughput
{
  return self->_baselineThroughput;
}

- (unint64_t)testThroughput
{
  return self->_testThroughput;
}

- (unint64_t)infraDutyCycle
{
  return self->_infraDutyCycle;
}

- (unint64_t)lastScanReason
{
  return self->_lastScanReason;
}

- (unint64_t)accessPointOUI
{
  return self->_accessPointOUI;
}

- (unint64_t)timeSinceLastRecovery
{
  return self->_timeSinceLastRecovery;
}

@end
