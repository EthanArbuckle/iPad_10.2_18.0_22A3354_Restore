@implementation WiFiAnalyticsAWDWiFiConnectionQuality

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (void)clearAdditionalUniqueIDs
{
  -[NSMutableArray removeAllObjects](self->_additionalUniqueIDs, "removeAllObjects");
}

- (void)addAdditionalUniqueIDs:(id)a3
{
  id v4;
  NSMutableArray *additionalUniqueIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  additionalUniqueIDs = self->_additionalUniqueIDs;
  v8 = v4;
  if (!additionalUniqueIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_additionalUniqueIDs;
    self->_additionalUniqueIDs = v6;

    v4 = v8;
    additionalUniqueIDs = self->_additionalUniqueIDs;
  }
  -[NSMutableArray addObject:](additionalUniqueIDs, "addObject:", v4);

}

- (unint64_t)additionalUniqueIDsCount
{
  return -[NSMutableArray count](self->_additionalUniqueIDs, "count");
}

- (id)additionalUniqueIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_additionalUniqueIDs, "objectAtIndex:", a3);
}

+ (Class)additionalUniqueIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearOtherUniqueIDs
{
  -[NSMutableArray removeAllObjects](self->_otherUniqueIDs, "removeAllObjects");
}

- (void)addOtherUniqueIDs:(id)a3
{
  id v4;
  NSMutableArray *otherUniqueIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  otherUniqueIDs = self->_otherUniqueIDs;
  v8 = v4;
  if (!otherUniqueIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_otherUniqueIDs;
    self->_otherUniqueIDs = v6;

    v4 = v8;
    otherUniqueIDs = self->_otherUniqueIDs;
  }
  -[NSMutableArray addObject:](otherUniqueIDs, "addObject:", v4);

}

- (unint64_t)otherUniqueIDsCount
{
  return -[NSMutableArray count](self->_otherUniqueIDs, "count");
}

- (id)otherUniqueIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_otherUniqueIDs, "objectAtIndex:", a3);
}

+ (Class)otherUniqueIDsType
{
  return (Class)objc_opt_class();
}

- (void)setLat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_lat = a3;
}

- (void)setHasLat:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasLat
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setLon:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_lon = a3;
}

- (void)setHasLon:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasLon
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setOverAllStay:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_overAllStay = a3;
}

- (void)setHasOverAllStay:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasOverAllStay
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFaultyStay:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_faultyStay = a3;
}

- (void)setHasFaultyStay:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasFaultyStay
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setLowLQMStay:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_lowLQMStay = a3;
}

- (void)setHasLowLQMStay:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasLowLQMStay
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLowqStay:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_lowqStay = a3;
}

- (void)setHasLowqStay:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasLowqStay
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setLqmTranCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_lqmTranCount = a3;
}

- (void)setHasLqmTranCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasLqmTranCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSuccessfulConnections:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_successfulConnections = a3;
}

- (void)setHasSuccessfulConnections:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSuccessfulConnections
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setFailedConnections:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_failedConnections = a3;
}

- (void)setHasFailedConnections:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasFailedConnections
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPacketsIn:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_packetsIn = a3;
}

- (void)setHasPacketsIn:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasPacketsIn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPacketsOut:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_packetsOut = a3;
}

- (void)setHasPacketsOut:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasPacketsOut
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBytesInTotal:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_bytesInTotal = a3;
}

- (void)setHasBytesInTotal:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasBytesInTotal
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBytesOutTotal:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_bytesOutTotal = a3;
}

- (void)setHasBytesOutTotal:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBytesOutTotal
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBytesInActive:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_bytesInActive = a3;
}

- (void)setHasBytesInActive:(BOOL)a3
{
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasBytesInActive
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBytesOutActive:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_bytesOutActive = a3;
}

- (void)setHasBytesOutActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBytesOutActive
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setReTxBytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_reTxBytes = a3;
}

- (void)setHasReTxBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasReTxBytes
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setDataStalls:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_dataStalls = a3;
}

- (void)setHasDataStalls:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasDataStalls
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setReceivedDupes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_receivedDupes = a3;
}

- (void)setHasReceivedDupes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasReceivedDupes
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setRxOutOfOrderBytes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_rxOutOfOrderBytes = a3;
}

- (void)setHasRxOutOfOrderBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasRxOutOfOrderBytes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRoundTripTimeMin:(float)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_roundTripTimeMin = a3;
}

- (void)setHasRoundTripTimeMin:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeMin
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setRoundTripTimeAvg:(float)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_roundTripTimeAvg = a3;
}

- (void)setHasRoundTripTimeAvg:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeAvg
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setRoundTripTimeVar:(float)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_roundTripTimeVar = a3;
}

- (void)setHasRoundTripTimeVar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeVar
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setRoundTripTimeMinActive:(float)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_roundTripTimeMinActive = a3;
}

- (void)setHasRoundTripTimeMinActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeMinActive
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setRoundTripTimeAvgActive:(float)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_roundTripTimeAvgActive = a3;
}

- (void)setHasRoundTripTimeAvgActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeAvgActive
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setRoundTripTimeVarActive:(float)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_roundTripTimeVarActive = a3;
}

- (void)setHasRoundTripTimeVarActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeVarActive
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setCaptiveFlag:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_captiveFlag = a3;
}

- (void)setHasCaptiveFlag:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasCaptiveFlag
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setColocatedState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_colocatedState = a3;
}

- (void)setHasColocatedState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasColocatedState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHotspot20:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_hotspot20 = a3;
}

- (void)setHasHotspot20:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasHotspot20
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setDisassocReason:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_disassocReason = a3;
}

- (void)setHasDisassocReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasDisassocReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setAssocReason:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_assocReason = a3;
}

- (void)setHasAssocReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasAssocReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setBand:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasBand
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setChannel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasChannel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setChannelWidth:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasChannelWidth
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setRssi:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasRssi
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setSnr:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasSnr
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCca:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_cca = a3;
}

- (void)setHasCca:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasCca
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setPhyMode:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_phyMode = a3;
}

- (void)setHasPhyMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasTimeOfDay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAssociatedTime:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_associatedTime = a3;
}

- (void)setHasAssociatedTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasAssociatedTime
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiConnectionQuality;
  -[WiFiAnalyticsAWDWiFiConnectionQuality description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiConnectionQuality dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *uniqueID;
  NSMutableArray *additionalUniqueIDs;
  NSMutableArray *otherUniqueIDs;
  $6D1F4AE12A053AA933BF826E67DD671F has;
  void *v10;
  id v11;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

  }
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v3, "setObject:forKey:", uniqueID, CFSTR("uniqueID"));
  additionalUniqueIDs = self->_additionalUniqueIDs;
  if (additionalUniqueIDs)
    objc_msgSend(v3, "setObject:forKey:", additionalUniqueIDs, CFSTR("additionalUniqueIDs"));
  otherUniqueIDs = self->_otherUniqueIDs;
  if (otherUniqueIDs)
    objc_msgSend(v3, "setObject:forKey:", otherUniqueIDs, CFSTR("otherUniqueIDs"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lat);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("lat"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_12;
      goto LABEL_53;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lon);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("lon"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_overAllStay);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("overAllStay"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_faultyStay);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("faultyStay"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowLQMStay);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("lowLQMStay"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lowqStay);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("lowqStay"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lqmTranCount);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("lqmTranCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_successfulConnections);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("successfulConnections"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_failedConnections);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("failedConnections"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsIn);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("packetsIn"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_21;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsOut);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("packetsOut"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_22;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesInTotal);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("bytesInTotal"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_23;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesOutTotal);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("bytesOutTotal"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_24;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesInActive);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("bytesInActive"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesOutActive);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("bytesOutActive"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_reTxBytes);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("reTxBytes"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_27;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dataStalls);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("dataStalls"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_28;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_receivedDupes);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("receivedDupes"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxOutOfOrderBytes);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("rxOutOfOrderBytes"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_71;
  }
LABEL_70:
  *(float *)&v4 = self->_roundTripTimeMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("roundTripTimeMin"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_31;
    goto LABEL_72;
  }
LABEL_71:
  *(float *)&v4 = self->_roundTripTimeAvg;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("roundTripTimeAvg"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_32;
    goto LABEL_73;
  }
LABEL_72:
  *(float *)&v4 = self->_roundTripTimeVar;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("roundTripTimeVar"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_33;
    goto LABEL_74;
  }
LABEL_73:
  *(float *)&v4 = self->_roundTripTimeMinActive;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("roundTripTimeMinActive"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_34;
    goto LABEL_75;
  }
LABEL_74:
  *(float *)&v4 = self->_roundTripTimeAvgActive;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("roundTripTimeAvgActive"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_35;
    goto LABEL_76;
  }
LABEL_75:
  *(float *)&v4 = self->_roundTripTimeVarActive;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("roundTripTimeVarActive"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_36;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityType);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("securityType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_captiveFlag);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("captiveFlag"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_colocatedState);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("colocatedState"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hotspot20);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("hotspot20"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_40;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_disassocReason);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("disassocReason"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_41;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_assocReason);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("assocReason"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_42;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_band);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("band"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_43;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channel);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("channel"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_44;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelWidth);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("channelWidth"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_45;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rssi);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("rssi"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_46;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_snr);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("snr"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_47;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cca);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("cca"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_48;
LABEL_89:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeOfDay);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("timeOfDay"));

    if ((*(_QWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_phyMode);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("phyMode"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
    goto LABEL_89;
LABEL_48:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_49:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_associatedTime);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("associatedTime"));

  }
LABEL_50:
  v11 = v3;

  return v11;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiConnectionQualityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  $6D1F4AE12A053AA933BF826E67DD671F has;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_additionalUniqueIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_otherUniqueIDs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_22;
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_32;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_33;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_34;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_35;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_40;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_41;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_42;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_43;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_44;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_45;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_46;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_47;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_48;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_49;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_50;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_52;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_53;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_53:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_54;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_54:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_55;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_56;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_57;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_58;
LABEL_99:
    PBDataWriterWriteUint64Field();
    if ((*(_QWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
    goto LABEL_99;
LABEL_58:
  if ((*(_DWORD *)&has & 0x400000) != 0)
LABEL_59:
    PBDataWriterWriteUint32Field();
LABEL_60:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  $6D1F4AE12A053AA933BF826E67DD671F has;
  char *v14;

  v4 = a3;
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    v4[21] = self->_timestamp;
    *(_QWORD *)((char *)v4 + 284) |= 0x100000uLL;
  }
  v14 = (char *)v4;
  if (self->_uniqueID)
    objc_msgSend(v4, "setUniqueID:");
  if (-[WiFiAnalyticsAWDWiFiConnectionQuality additionalUniqueIDsCount](self, "additionalUniqueIDsCount"))
  {
    objc_msgSend(v14, "clearAdditionalUniqueIDs");
    v5 = -[WiFiAnalyticsAWDWiFiConnectionQuality additionalUniqueIDsCount](self, "additionalUniqueIDsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[WiFiAnalyticsAWDWiFiConnectionQuality additionalUniqueIDsAtIndex:](self, "additionalUniqueIDsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAdditionalUniqueIDs:", v8);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiConnectionQuality otherUniqueIDsCount](self, "otherUniqueIDsCount"))
  {
    objc_msgSend(v14, "clearOtherUniqueIDs");
    v9 = -[WiFiAnalyticsAWDWiFiConnectionQuality otherUniqueIDsCount](self, "otherUniqueIDsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[WiFiAnalyticsAWDWiFiConnectionQuality otherUniqueIDsAtIndex:](self, "otherUniqueIDsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addOtherUniqueIDs:", v12);

      }
    }
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *((_QWORD *)v14 + 8) = *(_QWORD *)&self->_lat;
    *(_QWORD *)(v14 + 284) |= 0x80uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_16;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_15;
  }
  *((_QWORD *)v14 + 9) = *(_QWORD *)&self->_lon;
  *(_QWORD *)(v14 + 284) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)v14 + 13) = self->_overAllStay;
  *(_QWORD *)(v14 + 284) |= 0x1000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)v14 + 7) = self->_faultyStay;
  *(_QWORD *)(v14 + 284) |= 0x40uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)v14 + 10) = self->_lowLQMStay;
  *(_QWORD *)(v14 + 284) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)v14 + 11) = self->_lowqStay;
  *(_QWORD *)(v14 + 284) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)v14 + 12) = self->_lqmTranCount;
  *(_QWORD *)(v14 + 284) |= 0x800uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)v14 + 19) = self->_successfulConnections;
  *(_QWORD *)(v14 + 284) |= 0x40000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)v14 + 6) = self->_failedConnections;
  *(_QWORD *)(v14 + 284) |= 0x20uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)v14 + 14) = self->_packetsIn;
  *(_QWORD *)(v14 + 284) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)v14 + 15) = self->_packetsOut;
  *(_QWORD *)(v14 + 284) |= 0x4000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_26;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)v14 + 2) = self->_bytesInTotal;
  *(_QWORD *)(v14 + 284) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_27;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)v14 + 4) = self->_bytesOutTotal;
  *(_QWORD *)(v14 + 284) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_28;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)v14 + 1) = self->_bytesInActive;
  *(_QWORD *)(v14 + 284) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_29;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)v14 + 3) = self->_bytesOutActive;
  *(_QWORD *)(v14 + 284) |= 4uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_30;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)v14 + 16) = self->_reTxBytes;
  *(_QWORD *)(v14 + 284) |= 0x8000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_31;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)v14 + 5) = self->_dataStalls;
  *(_QWORD *)(v14 + 284) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)v14 + 17) = self->_receivedDupes;
  *(_QWORD *)(v14 + 284) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_33;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)v14 + 18) = self->_rxOutOfOrderBytes;
  *(_QWORD *)(v14 + 284) |= 0x20000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_34;
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)v14 + 61) = LODWORD(self->_roundTripTimeMin);
  *(_QWORD *)(v14 + 284) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_35;
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)v14 + 59) = LODWORD(self->_roundTripTimeAvg);
  *(_QWORD *)(v14 + 284) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_36;
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)v14 + 63) = LODWORD(self->_roundTripTimeVar);
  *(_QWORD *)(v14 + 284) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)v14 + 62) = LODWORD(self->_roundTripTimeMinActive);
  *(_QWORD *)(v14 + 284) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)v14 + 60) = LODWORD(self->_roundTripTimeAvgActive);
  *(_QWORD *)(v14 + 284) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)v14 + 64) = LODWORD(self->_roundTripTimeVarActive);
  *(_QWORD *)(v14 + 284) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_40;
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)v14 + 66) = self->_securityType;
  *(_QWORD *)(v14 + 284) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_41;
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v14 + 49) = self->_captiveFlag;
  *(_QWORD *)(v14 + 284) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_42;
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v14 + 53) = self->_colocatedState;
  *(_QWORD *)(v14 + 284) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_43;
    goto LABEL_84;
  }
LABEL_83:
  v14[280] = self->_hotspot20;
  *(_QWORD *)(v14 + 284) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_44;
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v14 + 54) = self->_disassocReason;
  *(_QWORD *)(v14 + 284) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_45;
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)v14 + 46) = self->_assocReason;
  *(_QWORD *)(v14 + 284) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_46;
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v14 + 48) = self->_band;
  *(_QWORD *)(v14 + 284) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_47;
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v14 + 51) = self->_channel;
  *(_QWORD *)(v14 + 284) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_48;
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v14 + 52) = self->_channelWidth;
  *(_QWORD *)(v14 + 284) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_49;
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v14 + 65) = self->_rssi;
  *(_QWORD *)(v14 + 284) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_50;
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v14 + 67) = self->_snr;
  *(_QWORD *)(v14 + 284) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_51;
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v14 + 50) = self->_cca;
  *(_QWORD *)(v14 + 284) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_52;
LABEL_93:
    *((_QWORD *)v14 + 20) = self->_timeOfDay;
    *(_QWORD *)(v14 + 284) |= 0x80000uLL;
    if ((*(_QWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_92:
  *((_DWORD *)v14 + 58) = self->_phyMode;
  *(_QWORD *)(v14 + 284) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
    goto LABEL_93;
LABEL_52:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_53:
    *((_DWORD *)v14 + 47) = self->_associatedTime;
    *(_QWORD *)(v14 + 284) |= 0x400000uLL;
  }
LABEL_54:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  $6D1F4AE12A053AA933BF826E67DD671F has;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 168) = self->_timestamp;
    *(_QWORD *)(v5 + 284) |= 0x100000uLL;
  }
  v7 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v7;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = self->_additionalUniqueIDs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAdditionalUniqueIDs:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v11);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = self->_otherUniqueIDs;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v6, "addOtherUniqueIDs:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v17);
  }

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *(double *)(v6 + 64) = self->_lat;
    *(_QWORD *)(v6 + 284) |= 0x80uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_20;
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_19;
  }
  *(double *)(v6 + 72) = self->_lon;
  *(_QWORD *)(v6 + 284) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_62;
  }
LABEL_61:
  *(_QWORD *)(v6 + 104) = self->_overAllStay;
  *(_QWORD *)(v6 + 284) |= 0x1000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_63;
  }
LABEL_62:
  *(_QWORD *)(v6 + 56) = self->_faultyStay;
  *(_QWORD *)(v6 + 284) |= 0x40uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_64;
  }
LABEL_63:
  *(_QWORD *)(v6 + 80) = self->_lowLQMStay;
  *(_QWORD *)(v6 + 284) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_65;
  }
LABEL_64:
  *(_QWORD *)(v6 + 88) = self->_lowqStay;
  *(_QWORD *)(v6 + 284) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  *(_QWORD *)(v6 + 96) = self->_lqmTranCount;
  *(_QWORD *)(v6 + 284) |= 0x800uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_67;
  }
LABEL_66:
  *(_QWORD *)(v6 + 152) = self->_successfulConnections;
  *(_QWORD *)(v6 + 284) |= 0x40000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_68;
  }
LABEL_67:
  *(_QWORD *)(v6 + 48) = self->_failedConnections;
  *(_QWORD *)(v6 + 284) |= 0x20uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_69;
  }
LABEL_68:
  *(_QWORD *)(v6 + 112) = self->_packetsIn;
  *(_QWORD *)(v6 + 284) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_29;
    goto LABEL_70;
  }
LABEL_69:
  *(_QWORD *)(v6 + 120) = self->_packetsOut;
  *(_QWORD *)(v6 + 284) |= 0x4000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_30;
    goto LABEL_71;
  }
LABEL_70:
  *(_QWORD *)(v6 + 16) = self->_bytesInTotal;
  *(_QWORD *)(v6 + 284) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_31;
    goto LABEL_72;
  }
LABEL_71:
  *(_QWORD *)(v6 + 32) = self->_bytesOutTotal;
  *(_QWORD *)(v6 + 284) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_32;
    goto LABEL_73;
  }
LABEL_72:
  *(_QWORD *)(v6 + 8) = self->_bytesInActive;
  *(_QWORD *)(v6 + 284) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_33;
    goto LABEL_74;
  }
LABEL_73:
  *(_QWORD *)(v6 + 24) = self->_bytesOutActive;
  *(_QWORD *)(v6 + 284) |= 4uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_75;
  }
LABEL_74:
  *(_QWORD *)(v6 + 128) = self->_reTxBytes;
  *(_QWORD *)(v6 + 284) |= 0x8000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_35;
    goto LABEL_76;
  }
LABEL_75:
  *(_QWORD *)(v6 + 40) = self->_dataStalls;
  *(_QWORD *)(v6 + 284) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_36;
    goto LABEL_77;
  }
LABEL_76:
  *(_QWORD *)(v6 + 136) = self->_receivedDupes;
  *(_QWORD *)(v6 + 284) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  *(_QWORD *)(v6 + 144) = self->_rxOutOfOrderBytes;
  *(_QWORD *)(v6 + 284) |= 0x20000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  *(float *)(v6 + 244) = self->_roundTripTimeMin;
  *(_QWORD *)(v6 + 284) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
LABEL_79:
  *(float *)(v6 + 236) = self->_roundTripTimeAvg;
  *(_QWORD *)(v6 + 284) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_39:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_40;
    goto LABEL_81;
  }
LABEL_80:
  *(float *)(v6 + 252) = self->_roundTripTimeVar;
  *(_QWORD *)(v6 + 284) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_41;
    goto LABEL_82;
  }
LABEL_81:
  *(float *)(v6 + 248) = self->_roundTripTimeMinActive;
  *(_QWORD *)(v6 + 284) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_42;
    goto LABEL_83;
  }
LABEL_82:
  *(float *)(v6 + 240) = self->_roundTripTimeAvgActive;
  *(_QWORD *)(v6 + 284) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_43;
    goto LABEL_84;
  }
LABEL_83:
  *(float *)(v6 + 256) = self->_roundTripTimeVarActive;
  *(_QWORD *)(v6 + 284) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_44;
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v6 + 264) = self->_securityType;
  *(_QWORD *)(v6 + 284) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_45;
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v6 + 196) = self->_captiveFlag;
  *(_QWORD *)(v6 + 284) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_46;
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v6 + 212) = self->_colocatedState;
  *(_QWORD *)(v6 + 284) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_47;
    goto LABEL_88;
  }
LABEL_87:
  *(_BYTE *)(v6 + 280) = self->_hotspot20;
  *(_QWORD *)(v6 + 284) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_48;
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v6 + 216) = self->_disassocReason;
  *(_QWORD *)(v6 + 284) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_49;
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v6 + 184) = self->_assocReason;
  *(_QWORD *)(v6 + 284) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_50;
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v6 + 192) = self->_band;
  *(_QWORD *)(v6 + 284) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_51;
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v6 + 204) = self->_channel;
  *(_QWORD *)(v6 + 284) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_51:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_52;
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v6 + 208) = self->_channelWidth;
  *(_QWORD *)(v6 + 284) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_52:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_53;
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v6 + 260) = self->_rssi;
  *(_QWORD *)(v6 + 284) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_54;
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v6 + 268) = self->_snr;
  *(_QWORD *)(v6 + 284) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_55;
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v6 + 200) = self->_cca;
  *(_QWORD *)(v6 + 284) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_56;
LABEL_97:
    *(_QWORD *)(v6 + 160) = self->_timeOfDay;
    *(_QWORD *)(v6 + 284) |= 0x80000uLL;
    if ((*(_QWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_96:
  *(_DWORD *)(v6 + 232) = self->_phyMode;
  *(_QWORD *)(v6 + 284) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
    goto LABEL_97;
LABEL_56:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_57:
    *(_DWORD *)(v6 + 188) = self->_associatedTime;
    *(_QWORD *)(v6 + 284) |= 0x400000uLL;
  }
LABEL_58:
  v22 = (id)v6;

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  NSString *uniqueID;
  NSMutableArray *additionalUniqueIDs;
  NSMutableArray *otherUniqueIDs;
  $6D1F4AE12A053AA933BF826E67DD671F has;
  uint64_t v10;
  BOOL v11;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_216;
  v5 = *(_QWORD *)(v4 + 284);
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    if ((v5 & 0x100000) == 0 || self->_timestamp != *((_QWORD *)v4 + 21))
      goto LABEL_216;
  }
  else if ((v5 & 0x100000) != 0)
  {
    goto LABEL_216;
  }
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((_QWORD *)v4 + 34) && !-[NSString isEqual:](uniqueID, "isEqual:"))
    goto LABEL_216;
  additionalUniqueIDs = self->_additionalUniqueIDs;
  if ((unint64_t)additionalUniqueIDs | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](additionalUniqueIDs, "isEqual:"))
      goto LABEL_216;
  }
  otherUniqueIDs = self->_otherUniqueIDs;
  if ((unint64_t)otherUniqueIDs | *((_QWORD *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](otherUniqueIDs, "isEqual:"))
      goto LABEL_216;
  }
  has = self->_has;
  v10 = *(_QWORD *)(v4 + 284);
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_lat != *((double *)v4 + 8))
      goto LABEL_216;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_lon != *((double *)v4 + 9))
      goto LABEL_216;
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_overAllStay != *((_QWORD *)v4 + 13))
      goto LABEL_216;
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_faultyStay != *((_QWORD *)v4 + 7))
      goto LABEL_216;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_lowLQMStay != *((_QWORD *)v4 + 10))
      goto LABEL_216;
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_lowqStay != *((_QWORD *)v4 + 11))
      goto LABEL_216;
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_lqmTranCount != *((_QWORD *)v4 + 12))
      goto LABEL_216;
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0 || self->_successfulConnections != *((_QWORD *)v4 + 19))
      goto LABEL_216;
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_failedConnections != *((_QWORD *)v4 + 6))
      goto LABEL_216;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_packetsIn != *((_QWORD *)v4 + 14))
      goto LABEL_216;
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_packetsOut != *((_QWORD *)v4 + 15))
      goto LABEL_216;
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_bytesInTotal != *((_QWORD *)v4 + 2))
      goto LABEL_216;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_bytesOutTotal != *((_QWORD *)v4 + 4))
      goto LABEL_216;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_bytesInActive != *((_QWORD *)v4 + 1))
      goto LABEL_216;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_bytesOutActive != *((_QWORD *)v4 + 3))
      goto LABEL_216;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_reTxBytes != *((_QWORD *)v4 + 16))
      goto LABEL_216;
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_dataStalls != *((_QWORD *)v4 + 5))
      goto LABEL_216;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_receivedDupes != *((_QWORD *)v4 + 17))
      goto LABEL_216;
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v10 & 0x20000) == 0 || self->_rxOutOfOrderBytes != *((_QWORD *)v4 + 18))
      goto LABEL_216;
  }
  else if ((v10 & 0x20000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_roundTripTimeMin != *((float *)v4 + 61))
      goto LABEL_216;
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v10 & 0x80000000) == 0 || self->_roundTripTimeAvg != *((float *)v4 + 59))
      goto LABEL_216;
  }
  else if ((v10 & 0x80000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v10 & 0x800000000) == 0 || self->_roundTripTimeVar != *((float *)v4 + 63))
      goto LABEL_216;
  }
  else if ((v10 & 0x800000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v10 & 0x400000000) == 0 || self->_roundTripTimeMinActive != *((float *)v4 + 62))
      goto LABEL_216;
  }
  else if ((v10 & 0x400000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v10 & 0x100000000) == 0 || self->_roundTripTimeAvgActive != *((float *)v4 + 60))
      goto LABEL_216;
  }
  else if ((v10 & 0x100000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0 || self->_roundTripTimeVarActive != *((float *)v4 + 64))
      goto LABEL_216;
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v10 & 0x4000000000) == 0 || self->_securityType != *((_DWORD *)v4 + 66))
      goto LABEL_216;
  }
  else if ((v10 & 0x4000000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_captiveFlag != *((_DWORD *)v4 + 49))
      goto LABEL_216;
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v10 & 0x10000000) == 0 || self->_colocatedState != *((_DWORD *)v4 + 53))
      goto LABEL_216;
  }
  else if ((v10 & 0x10000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    if ((v10 & 0x10000000000) != 0)
    {
      if (self->_hotspot20)
      {
        if (!v4[280])
          goto LABEL_216;
        goto LABEL_161;
      }
      if (!v4[280])
        goto LABEL_161;
    }
LABEL_216:
    v11 = 0;
    goto LABEL_217;
  }
  if ((v10 & 0x10000000000) != 0)
    goto LABEL_216;
LABEL_161:
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v10 & 0x20000000) == 0 || self->_disassocReason != *((_DWORD *)v4 + 54))
      goto LABEL_216;
  }
  else if ((v10 & 0x20000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_assocReason != *((_DWORD *)v4 + 46))
      goto LABEL_216;
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_band != *((_DWORD *)v4 + 48))
      goto LABEL_216;
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v10 & 0x4000000) == 0 || self->_channel != *((_DWORD *)v4 + 51))
      goto LABEL_216;
  }
  else if ((v10 & 0x4000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v10 & 0x8000000) == 0 || self->_channelWidth != *((_DWORD *)v4 + 52))
      goto LABEL_216;
  }
  else if ((v10 & 0x8000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    if ((v10 & 0x2000000000) == 0 || self->_rssi != *((_DWORD *)v4 + 65))
      goto LABEL_216;
  }
  else if ((v10 & 0x2000000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v10 & 0x8000000000) == 0 || self->_snr != *((_DWORD *)v4 + 67))
      goto LABEL_216;
  }
  else if ((v10 & 0x8000000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v10 & 0x2000000) == 0 || self->_cca != *((_DWORD *)v4 + 50))
      goto LABEL_216;
  }
  else if ((v10 & 0x2000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v10 & 0x40000000) == 0 || self->_phyMode != *((_DWORD *)v4 + 58))
      goto LABEL_216;
  }
  else if ((v10 & 0x40000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_timeOfDay != *((_QWORD *)v4 + 20))
      goto LABEL_216;
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_associatedTime != *((_DWORD *)v4 + 47))
      goto LABEL_216;
    v11 = 1;
  }
  else
  {
    v11 = (v10 & 0x400000) == 0;
  }
LABEL_217:

  return v11;
}

- (unint64_t)hash
{
  $6D1F4AE12A053AA933BF826E67DD671F has;
  unint64_t v4;
  double lat;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double lon;
  double v11;
  long double v12;
  double v13;
  float roundTripTimeMin;
  float v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;
  float roundTripTimeAvg;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  float roundTripTimeVar;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  float roundTripTimeMinActive;
  float v31;
  float v32;
  float v33;
  unint64_t v34;
  float roundTripTimeAvgActive;
  float v36;
  float v37;
  float v38;
  unint64_t v39;
  float roundTripTimeVarActive;
  float v41;
  float v42;
  float v43;
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
  uint64_t v58;
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
  uint64_t v77;
  uint64_t v78;
  NSUInteger v79;
  unint64_t v80;

  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    v80 = 2654435761u * self->_timestamp;
  else
    v80 = 0;
  v79 = -[NSString hash](self->_uniqueID, "hash");
  v78 = -[NSMutableArray hash](self->_additionalUniqueIDs, "hash");
  v77 = -[NSMutableArray hash](self->_otherUniqueIDs, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    lat = self->_lat;
    v6 = -lat;
    if (lat >= 0.0)
      v6 = self->_lat;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    lon = self->_lon;
    v11 = -lon;
    if (lon >= 0.0)
      v11 = self->_lon;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v76 = 2654435761u * self->_overAllStay;
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
LABEL_22:
      v75 = 2654435761u * self->_faultyStay;
      if ((*(_WORD *)&has & 0x200) != 0)
        goto LABEL_23;
      goto LABEL_44;
    }
  }
  else
  {
    v76 = 0;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_22;
  }
  v75 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_23:
    v74 = 2654435761u * self->_lowLQMStay;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_24;
    goto LABEL_45;
  }
LABEL_44:
  v74 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_24:
    v73 = 2654435761u * self->_lowqStay;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_25;
    goto LABEL_46;
  }
LABEL_45:
  v73 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_25:
    v72 = 2654435761u * self->_lqmTranCount;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_26;
    goto LABEL_47;
  }
LABEL_46:
  v72 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_26:
    v71 = 2654435761u * self->_successfulConnections;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_27;
    goto LABEL_48;
  }
LABEL_47:
  v71 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_27:
    v70 = 2654435761u * self->_failedConnections;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_28;
    goto LABEL_49;
  }
LABEL_48:
  v70 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_28:
    v69 = 2654435761u * self->_packetsIn;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_29;
    goto LABEL_50;
  }
LABEL_49:
  v69 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_29:
    v68 = 2654435761u * self->_packetsOut;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_30;
    goto LABEL_51;
  }
LABEL_50:
  v68 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_30:
    v67 = 2654435761u * self->_bytesInTotal;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_31;
    goto LABEL_52;
  }
LABEL_51:
  v67 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_31:
    v66 = 2654435761u * self->_bytesOutTotal;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_32;
    goto LABEL_53;
  }
LABEL_52:
  v66 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_32:
    v65 = 2654435761u * self->_bytesInActive;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_33;
    goto LABEL_54;
  }
LABEL_53:
  v65 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_33:
    v64 = 2654435761u * self->_bytesOutActive;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_34;
    goto LABEL_55;
  }
LABEL_54:
  v64 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_34:
    v63 = 2654435761u * self->_reTxBytes;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_35;
    goto LABEL_56;
  }
LABEL_55:
  v63 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_35:
    v62 = 2654435761u * self->_dataStalls;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_36;
    goto LABEL_57;
  }
LABEL_56:
  v62 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_36:
    v61 = 2654435761u * self->_receivedDupes;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_37;
LABEL_58:
    v60 = 0;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_38;
LABEL_59:
    v18 = 0;
    goto LABEL_62;
  }
LABEL_57:
  v61 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_58;
LABEL_37:
  v60 = 2654435761u * self->_rxOutOfOrderBytes;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
    goto LABEL_59;
LABEL_38:
  roundTripTimeMin = self->_roundTripTimeMin;
  v15 = -roundTripTimeMin;
  if (roundTripTimeMin >= 0.0)
    v15 = self->_roundTripTimeMin;
  v16 = floorf(v15 + 0.5);
  v17 = (float)(v15 - v16) * 1.8447e19;
  v18 = 2654435761u * (unint64_t)fmodf(v16, 1.8447e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabsf(v17);
  }
LABEL_62:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    roundTripTimeAvg = self->_roundTripTimeAvg;
    v21 = -roundTripTimeAvg;
    if (roundTripTimeAvg >= 0.0)
      v21 = self->_roundTripTimeAvg;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    roundTripTimeVar = self->_roundTripTimeVar;
    v26 = -roundTripTimeVar;
    if (roundTripTimeVar >= 0.0)
      v26 = self->_roundTripTimeVar;
    v27 = floorf(v26 + 0.5);
    v28 = (float)(v26 - v27) * 1.8447e19;
    v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    roundTripTimeMinActive = self->_roundTripTimeMinActive;
    v31 = -roundTripTimeMinActive;
    if (roundTripTimeMinActive >= 0.0)
      v31 = self->_roundTripTimeMinActive;
    v32 = floorf(v31 + 0.5);
    v33 = (float)(v31 - v32) * 1.8447e19;
    v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    roundTripTimeAvgActive = self->_roundTripTimeAvgActive;
    v36 = -roundTripTimeAvgActive;
    if (roundTripTimeAvgActive >= 0.0)
      v36 = self->_roundTripTimeAvgActive;
    v37 = floorf(v36 + 0.5);
    v38 = (float)(v36 - v37) * 1.8447e19;
    v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    roundTripTimeVarActive = self->_roundTripTimeVarActive;
    v41 = -roundTripTimeVarActive;
    if (roundTripTimeVarActive >= 0.0)
      v41 = self->_roundTripTimeVarActive;
    v42 = floorf(v41 + 0.5);
    v43 = (float)(v41 - v42) * 1.8447e19;
    v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    v44 = 2654435761 * self->_securityType;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
LABEL_104:
      v45 = 2654435761 * self->_captiveFlag;
      if ((*(_DWORD *)&has & 0x10000000) != 0)
        goto LABEL_105;
      goto LABEL_120;
    }
  }
  else
  {
    v44 = 0;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_104;
  }
  v45 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_105:
    v46 = 2654435761 * self->_colocatedState;
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
      goto LABEL_106;
    goto LABEL_121;
  }
LABEL_120:
  v46 = 0;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
LABEL_106:
    v47 = 2654435761 * self->_hotspot20;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_107;
    goto LABEL_122;
  }
LABEL_121:
  v47 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_107:
    v48 = 2654435761 * self->_disassocReason;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_108;
    goto LABEL_123;
  }
LABEL_122:
  v48 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_108:
    v49 = 2654435761 * self->_assocReason;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_109;
    goto LABEL_124;
  }
LABEL_123:
  v49 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_109:
    v50 = 2654435761 * self->_band;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_110;
    goto LABEL_125;
  }
LABEL_124:
  v50 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_110:
    v51 = 2654435761 * self->_channel;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_111;
    goto LABEL_126;
  }
LABEL_125:
  v51 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_111:
    v52 = 2654435761 * self->_channelWidth;
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
      goto LABEL_112;
    goto LABEL_127;
  }
LABEL_126:
  v52 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
LABEL_112:
    v53 = 2654435761 * self->_rssi;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_113;
    goto LABEL_128;
  }
LABEL_127:
  v53 = 0;
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
LABEL_113:
    v54 = 2654435761 * self->_snr;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_114;
    goto LABEL_129;
  }
LABEL_128:
  v54 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_114:
    v55 = 2654435761 * self->_cca;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_115;
    goto LABEL_130;
  }
LABEL_129:
  v55 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_115:
    v56 = 2654435761 * self->_phyMode;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_116;
LABEL_131:
    v57 = 0;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_117;
LABEL_132:
    v58 = 0;
    return v79 ^ v80 ^ v78 ^ v77 ^ v4 ^ v9 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v18 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57 ^ v58;
  }
LABEL_130:
  v56 = 0;
  if ((*(_DWORD *)&has & 0x80000) == 0)
    goto LABEL_131;
LABEL_116:
  v57 = 2654435761u * self->_timeOfDay;
  if ((*(_DWORD *)&has & 0x400000) == 0)
    goto LABEL_132;
LABEL_117:
  v58 = 2654435761 * self->_associatedTime;
  return v79 ^ v80 ^ v78 ^ v77 ^ v4 ^ v9 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v18 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57 ^ v58;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = v4;
  if ((v4[286] & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 21);
    *(_QWORD *)&self->_has |= 0x100000uLL;
  }
  if (*((_QWORD *)v4 + 34))
    -[WiFiAnalyticsAWDWiFiConnectionQuality setUniqueID:](self, "setUniqueID:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *((id *)v5 + 22);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[WiFiAnalyticsAWDWiFiConnectionQuality addAdditionalUniqueIDs:](self, "addAdditionalUniqueIDs:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *((id *)v5 + 28);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[WiFiAnalyticsAWDWiFiConnectionQuality addOtherUniqueIDs:](self, "addOtherUniqueIDs:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x80) != 0)
  {
    self->_lat = *((double *)v5 + 8);
    *(_QWORD *)&self->_has |= 0x80uLL;
    v16 = *(_QWORD *)(v5 + 284);
    if ((v16 & 0x100) == 0)
    {
LABEL_21:
      if ((v16 & 0x1000) == 0)
        goto LABEL_22;
      goto LABEL_63;
    }
  }
  else if ((v16 & 0x100) == 0)
  {
    goto LABEL_21;
  }
  self->_lon = *((double *)v5 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x1000) == 0)
  {
LABEL_22:
    if ((v16 & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_64;
  }
LABEL_63:
  self->_overAllStay = *((_QWORD *)v5 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x40) == 0)
  {
LABEL_23:
    if ((v16 & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_65;
  }
LABEL_64:
  self->_faultyStay = *((_QWORD *)v5 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x200) == 0)
  {
LABEL_24:
    if ((v16 & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  self->_lowLQMStay = *((_QWORD *)v5 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x400) == 0)
  {
LABEL_25:
    if ((v16 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_67;
  }
LABEL_66:
  self->_lowqStay = *((_QWORD *)v5 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x800) == 0)
  {
LABEL_26:
    if ((v16 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_68;
  }
LABEL_67:
  self->_lqmTranCount = *((_QWORD *)v5 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x40000) == 0)
  {
LABEL_27:
    if ((v16 & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_69;
  }
LABEL_68:
  self->_successfulConnections = *((_QWORD *)v5 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x20) == 0)
  {
LABEL_28:
    if ((v16 & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_70;
  }
LABEL_69:
  self->_failedConnections = *((_QWORD *)v5 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x2000) == 0)
  {
LABEL_29:
    if ((v16 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_71;
  }
LABEL_70:
  self->_packetsIn = *((_QWORD *)v5 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x4000) == 0)
  {
LABEL_30:
    if ((v16 & 2) == 0)
      goto LABEL_31;
    goto LABEL_72;
  }
LABEL_71:
  self->_packetsOut = *((_QWORD *)v5 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 2) == 0)
  {
LABEL_31:
    if ((v16 & 8) == 0)
      goto LABEL_32;
    goto LABEL_73;
  }
LABEL_72:
  self->_bytesInTotal = *((_QWORD *)v5 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 8) == 0)
  {
LABEL_32:
    if ((v16 & 1) == 0)
      goto LABEL_33;
    goto LABEL_74;
  }
LABEL_73:
  self->_bytesOutTotal = *((_QWORD *)v5 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 1) == 0)
  {
LABEL_33:
    if ((v16 & 4) == 0)
      goto LABEL_34;
    goto LABEL_75;
  }
LABEL_74:
  self->_bytesInActive = *((_QWORD *)v5 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 4) == 0)
  {
LABEL_34:
    if ((v16 & 0x8000) == 0)
      goto LABEL_35;
    goto LABEL_76;
  }
LABEL_75:
  self->_bytesOutActive = *((_QWORD *)v5 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x8000) == 0)
  {
LABEL_35:
    if ((v16 & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_77;
  }
LABEL_76:
  self->_reTxBytes = *((_QWORD *)v5 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x10) == 0)
  {
LABEL_36:
    if ((v16 & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  self->_dataStalls = *((_QWORD *)v5 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x10000) == 0)
  {
LABEL_37:
    if ((v16 & 0x20000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  self->_receivedDupes = *((_QWORD *)v5 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x20000) == 0)
  {
LABEL_38:
    if ((v16 & 0x200000000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
LABEL_79:
  self->_rxOutOfOrderBytes = *((_QWORD *)v5 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x200000000) == 0)
  {
LABEL_39:
    if ((v16 & 0x80000000) == 0)
      goto LABEL_40;
    goto LABEL_81;
  }
LABEL_80:
  self->_roundTripTimeMin = *((float *)v5 + 61);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x80000000) == 0)
  {
LABEL_40:
    if ((v16 & 0x800000000) == 0)
      goto LABEL_41;
    goto LABEL_82;
  }
LABEL_81:
  self->_roundTripTimeAvg = *((float *)v5 + 59);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x800000000) == 0)
  {
LABEL_41:
    if ((v16 & 0x400000000) == 0)
      goto LABEL_42;
    goto LABEL_83;
  }
LABEL_82:
  self->_roundTripTimeVar = *((float *)v5 + 63);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x400000000) == 0)
  {
LABEL_42:
    if ((v16 & 0x100000000) == 0)
      goto LABEL_43;
    goto LABEL_84;
  }
LABEL_83:
  self->_roundTripTimeMinActive = *((float *)v5 + 62);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x100000000) == 0)
  {
LABEL_43:
    if ((v16 & 0x1000000000) == 0)
      goto LABEL_44;
    goto LABEL_85;
  }
LABEL_84:
  self->_roundTripTimeAvgActive = *((float *)v5 + 60);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x1000000000) == 0)
  {
LABEL_44:
    if ((v16 & 0x4000000000) == 0)
      goto LABEL_45;
    goto LABEL_86;
  }
LABEL_85:
  self->_roundTripTimeVarActive = *((float *)v5 + 64);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x4000000000) == 0)
  {
LABEL_45:
    if ((v16 & 0x1000000) == 0)
      goto LABEL_46;
    goto LABEL_87;
  }
LABEL_86:
  self->_securityType = *((_DWORD *)v5 + 66);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x1000000) == 0)
  {
LABEL_46:
    if ((v16 & 0x10000000) == 0)
      goto LABEL_47;
    goto LABEL_88;
  }
LABEL_87:
  self->_captiveFlag = *((_DWORD *)v5 + 49);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x10000000) == 0)
  {
LABEL_47:
    if ((v16 & 0x10000000000) == 0)
      goto LABEL_48;
    goto LABEL_89;
  }
LABEL_88:
  self->_colocatedState = *((_DWORD *)v5 + 53);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x10000000000) == 0)
  {
LABEL_48:
    if ((v16 & 0x20000000) == 0)
      goto LABEL_49;
    goto LABEL_90;
  }
LABEL_89:
  self->_hotspot20 = v5[280];
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x20000000) == 0)
  {
LABEL_49:
    if ((v16 & 0x200000) == 0)
      goto LABEL_50;
    goto LABEL_91;
  }
LABEL_90:
  self->_disassocReason = *((_DWORD *)v5 + 54);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x200000) == 0)
  {
LABEL_50:
    if ((v16 & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_92;
  }
LABEL_91:
  self->_assocReason = *((_DWORD *)v5 + 46);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x800000) == 0)
  {
LABEL_51:
    if ((v16 & 0x4000000) == 0)
      goto LABEL_52;
    goto LABEL_93;
  }
LABEL_92:
  self->_band = *((_DWORD *)v5 + 48);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x4000000) == 0)
  {
LABEL_52:
    if ((v16 & 0x8000000) == 0)
      goto LABEL_53;
    goto LABEL_94;
  }
LABEL_93:
  self->_channel = *((_DWORD *)v5 + 51);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x8000000) == 0)
  {
LABEL_53:
    if ((v16 & 0x2000000000) == 0)
      goto LABEL_54;
    goto LABEL_95;
  }
LABEL_94:
  self->_channelWidth = *((_DWORD *)v5 + 52);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x2000000000) == 0)
  {
LABEL_54:
    if ((v16 & 0x8000000000) == 0)
      goto LABEL_55;
    goto LABEL_96;
  }
LABEL_95:
  self->_rssi = *((_DWORD *)v5 + 65);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x8000000000) == 0)
  {
LABEL_55:
    if ((v16 & 0x2000000) == 0)
      goto LABEL_56;
    goto LABEL_97;
  }
LABEL_96:
  self->_snr = *((_DWORD *)v5 + 67);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x2000000) == 0)
  {
LABEL_56:
    if ((v16 & 0x40000000) == 0)
      goto LABEL_57;
    goto LABEL_98;
  }
LABEL_97:
  self->_cca = *((_DWORD *)v5 + 50);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x40000000) == 0)
  {
LABEL_57:
    if ((v16 & 0x80000) == 0)
      goto LABEL_58;
LABEL_99:
    self->_timeOfDay = *((_QWORD *)v5 + 20);
    *(_QWORD *)&self->_has |= 0x80000uLL;
    if ((*(_QWORD *)(v5 + 284) & 0x400000) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_98:
  self->_phyMode = *((_DWORD *)v5 + 58);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v16 = *(_QWORD *)(v5 + 284);
  if ((v16 & 0x80000) != 0)
    goto LABEL_99;
LABEL_58:
  if ((v16 & 0x400000) != 0)
  {
LABEL_59:
    self->_associatedTime = *((_DWORD *)v5 + 47);
    *(_QWORD *)&self->_has |= 0x400000uLL;
  }
LABEL_60:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (NSMutableArray)additionalUniqueIDs
{
  return self->_additionalUniqueIDs;
}

- (void)setAdditionalUniqueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_additionalUniqueIDs, a3);
}

- (NSMutableArray)otherUniqueIDs
{
  return self->_otherUniqueIDs;
}

- (void)setOtherUniqueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_otherUniqueIDs, a3);
}

- (double)lat
{
  return self->_lat;
}

- (double)lon
{
  return self->_lon;
}

- (unint64_t)overAllStay
{
  return self->_overAllStay;
}

- (unint64_t)faultyStay
{
  return self->_faultyStay;
}

- (unint64_t)lowLQMStay
{
  return self->_lowLQMStay;
}

- (unint64_t)lowqStay
{
  return self->_lowqStay;
}

- (unint64_t)lqmTranCount
{
  return self->_lqmTranCount;
}

- (unint64_t)successfulConnections
{
  return self->_successfulConnections;
}

- (unint64_t)failedConnections
{
  return self->_failedConnections;
}

- (unint64_t)packetsIn
{
  return self->_packetsIn;
}

- (unint64_t)packetsOut
{
  return self->_packetsOut;
}

- (unint64_t)bytesInTotal
{
  return self->_bytesInTotal;
}

- (unint64_t)bytesOutTotal
{
  return self->_bytesOutTotal;
}

- (unint64_t)bytesInActive
{
  return self->_bytesInActive;
}

- (unint64_t)bytesOutActive
{
  return self->_bytesOutActive;
}

- (unint64_t)reTxBytes
{
  return self->_reTxBytes;
}

- (unint64_t)dataStalls
{
  return self->_dataStalls;
}

- (unint64_t)receivedDupes
{
  return self->_receivedDupes;
}

- (unint64_t)rxOutOfOrderBytes
{
  return self->_rxOutOfOrderBytes;
}

- (float)roundTripTimeMin
{
  return self->_roundTripTimeMin;
}

- (float)roundTripTimeAvg
{
  return self->_roundTripTimeAvg;
}

- (float)roundTripTimeVar
{
  return self->_roundTripTimeVar;
}

- (float)roundTripTimeMinActive
{
  return self->_roundTripTimeMinActive;
}

- (float)roundTripTimeAvgActive
{
  return self->_roundTripTimeAvgActive;
}

- (float)roundTripTimeVarActive
{
  return self->_roundTripTimeVarActive;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)captiveFlag
{
  return self->_captiveFlag;
}

- (unsigned)colocatedState
{
  return self->_colocatedState;
}

- (BOOL)hotspot20
{
  return self->_hotspot20;
}

- (unsigned)disassocReason
{
  return self->_disassocReason;
}

- (unsigned)assocReason
{
  return self->_assocReason;
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)channelWidth
{
  return self->_channelWidth;
}

- (int)rssi
{
  return self->_rssi;
}

- (int)snr
{
  return self->_snr;
}

- (int)cca
{
  return self->_cca;
}

- (unsigned)phyMode
{
  return self->_phyMode;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (unsigned)associatedTime
{
  return self->_associatedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_otherUniqueIDs, 0);
  objc_storeStrong((id *)&self->_additionalUniqueIDs, 0);
}

@end
