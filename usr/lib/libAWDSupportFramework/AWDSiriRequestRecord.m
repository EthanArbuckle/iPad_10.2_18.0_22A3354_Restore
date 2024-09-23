@implementation AWDSiriRequestRecord

- (void)dealloc
{
  objc_super v3;

  -[AWDSiriRequestRecord setTransportHistorys:](self, "setTransportHistorys:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriRequestRecord;
  -[AWDSiriRequestRecord dealloc](&v3, sel_dealloc);
}

- (void)setStartTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasStartTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setEndTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_endTimestamp = a3;
}

- (void)setHasEndTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasEndTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)requestStatus
{
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    return self->_requestStatus;
  else
    return 1;
}

- (void)setRequestStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_requestStatus = a3;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasRequestStatus
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)requestStatusAsString:(int)a3
{
  if (a3 == 1)
    return CFSTR("success");
  if (a3 == 2)
    return CFSTR("failure");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsRequestStatus:(id)a3
{
  int v4;

  v4 = 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("success")) & 1) == 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("failure")))
      return 2;
    else
      return 1;
  }
  return v4;
}

- (int)errorDomain
{
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    return self->_errorDomain;
  else
    return 1;
}

- (void)setErrorDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_errorDomain = a3;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasErrorDomain
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)errorDomainAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E3D0[a3 - 1];
}

- (int)StringAsErrorDomain:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("assistantErrorDomain")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("connectionErrorDomain")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("posixErrorDomain")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("peerErrorDomain")))
    return 4;
  return 1;
}

- (void)setErrorCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasErrorCode
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (int)underlyingErrorDomain
{
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
    return self->_underlyingErrorDomain;
  else
    return 1;
}

- (void)setUnderlyingErrorDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_underlyingErrorDomain = a3;
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasUnderlyingErrorDomain
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)underlyingErrorDomainAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E3D0[a3 - 1];
}

- (int)StringAsUnderlyingErrorDomain:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("assistantErrorDomain")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("connectionErrorDomain")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("posixErrorDomain")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("peerErrorDomain")))
    return 4;
  return 1;
}

- (void)setUnderlyingErrorCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_underlyingErrorCode = a3;
}

- (void)setHasUnderlyingErrorCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUnderlyingErrorCode
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setTimeToFirstWord:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_timeToFirstWord = a3;
}

- (void)setHasTimeToFirstWord:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTimeToFirstWord
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (int)iRATRecommendation
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_iRATRecommendation;
  else
    return 1;
}

- (void)setIRATRecommendation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_iRATRecommendation = a3;
}

- (void)setHasIRATRecommendation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIRATRecommendation
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)iRATRecommendationAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E3F0[a3 - 1];
}

- (int)StringAsIRATRecommendation:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("None")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WiFi")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("BT")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Cellular")))
    return 4;
  return 1;
}

- (void)setIRATRecommendationDelay:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_iRATRecommendationDelay = a3;
}

- (void)setHasIRATRecommendationDelay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasIRATRecommendationDelay
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)clearTransportHistorys
{
  -[NSMutableArray removeAllObjects](self->_transportHistorys, "removeAllObjects");
}

- (void)addTransportHistory:(id)a3
{
  NSMutableArray *transportHistorys;

  transportHistorys = self->_transportHistorys;
  if (!transportHistorys)
  {
    transportHistorys = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_transportHistorys = transportHistorys;
  }
  -[NSMutableArray addObject:](transportHistorys, "addObject:", a3);
}

- (unint64_t)transportHistorysCount
{
  return -[NSMutableArray count](self->_transportHistorys, "count");
}

- (id)transportHistoryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_transportHistorys, "objectAtIndex:", a3);
}

+ (Class)transportHistoryType
{
  return (Class)objc_opt_class();
}

- (void)setWifiRSSI:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_wifiRSSI = a3;
}

- (void)setHasWifiRSSI:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasWifiRSSI
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setWifiSNR:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_wifiSNR = a3;
}

- (void)setHasWifiSNR:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasWifiSNR
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setWifiCCA:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_wifiCCA = a3;
}

- (void)setHasWifiCCA:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasWifiCCA
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBeaconPer:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_beaconPer = a3;
}

- (void)setHasBeaconPer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasBeaconPer
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNwtype:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_nwtype = a3;
}

- (void)setHasNwtype:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasNwtype
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLsmRecommendationBe:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lsmRecommendationBe = a3;
}

- (void)setHasLsmRecommendationBe:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLsmRecommendationBe
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setExpectedThroughputVIBE:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_expectedThroughputVIBE = a3;
}

- (void)setHasExpectedThroughputVIBE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasExpectedThroughputVIBE
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPacketLifetimeVIBE:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_packetLifetimeVIBE = a3;
}

- (void)setHasPacketLifetimeVIBE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPacketLifetimeVIBE
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setPacketLossRateVIBE:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_packetLossRateVIBE = a3;
}

- (void)setHasPacketLossRateVIBE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPacketLossRateVIBE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBtRssi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_btRssi = a3;
}

- (void)setHasBtRssi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBtRssi
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBtRetransmissionRateTx:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_btRetransmissionRateTx = a3;
}

- (void)setHasBtRetransmissionRateTx:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBtRetransmissionRateTx
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBtRetransmissionRateRx:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_btRetransmissionRateRx = a3;
}

- (void)setHasBtRetransmissionRateRx:(BOOL)a3
{
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBtRetransmissionRateRx
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBtTech:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_btTech = a3;
}

- (void)setHasBtTech:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBtTech
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIdsMessageDelay:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_idsMessageDelay = a3;
}

- (void)setHasIdsMessageDelay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIdsMessageDelay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIdsSocketDelay:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_idsSocketDelay = a3;
}

- (void)setHasIdsSocketDelay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIdsSocketDelay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIdsErrorCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_idsErrorCode = a3;
}

- (void)setHasIdsErrorCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIdsErrorCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSiriRequestRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSiriRequestRecord description](&v3, sel_description), -[AWDSiriRequestRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $2A32A32658D5DED0D08472A2A6A47882 has;
  void *v5;
  NSMutableArray *transportHistorys;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $2A32A32658D5DED0D08472A2A6A47882 v11;
  int requestStatus;
  const __CFString *v14;
  unsigned int v15;
  __CFString *v16;
  unsigned int v17;
  __CFString *v18;
  unsigned int v19;
  __CFString *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_startTimestamp), CFSTR("startTimestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endTimestamp), CFSTR("endTimestamp"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_63;
  }
LABEL_41:
  requestStatus = self->_requestStatus;
  if (requestStatus == 1)
  {
    v14 = CFSTR("success");
  }
  else if (requestStatus == 2)
  {
    v14 = CFSTR("failure");
  }
  else
  {
    v14 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestStatus);
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("requestStatus"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_67;
  }
LABEL_63:
  v15 = self->_errorDomain - 1;
  if (v15 >= 4)
    v16 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_errorDomain);
  else
    v16 = off_24C10E3D0[v15];
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("errorDomain"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_errorCode), CFSTR("errorCode"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_72;
  }
LABEL_68:
  v17 = self->_underlyingErrorDomain - 1;
  if (v17 >= 4)
    v18 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_underlyingErrorDomain);
  else
    v18 = off_24C10E3D0[v17];
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("underlyingErrorDomain"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_underlyingErrorCode), CFSTR("underlyingErrorCode"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeToFirstWord), CFSTR("timeToFirstWord"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_74:
  v19 = self->_iRATRecommendation - 1;
  if (v19 >= 4)
    v20 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_iRATRecommendation);
  else
    v20 = off_24C10E3F0[v19];
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("iRATRecommendation"));
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_iRATRecommendationDelay), CFSTR("iRATRecommendationDelay"));
LABEL_12:
  if (-[NSMutableArray count](self->_transportHistorys, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_transportHistorys, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    transportHistorys = self->_transportHistorys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportHistorys, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(transportHistorys);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportHistorys, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("transportHistory"));

  }
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_wifiRSSI), CFSTR("wifiRSSI"));
    v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x4000) == 0)
    {
LABEL_23:
      if ((*(_WORD *)&v11 & 0x1000) == 0)
        goto LABEL_24;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_wifiSNR), CFSTR("wifiSNR"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v11 & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_wifiCCA), CFSTR("wifiCCA"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v11 & 0x400000) == 0)
      goto LABEL_26;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_beaconPer), CFSTR("beaconPer"));
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x400000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v11 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nwtype), CFSTR("nwtype"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x80) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v11 & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lsmRecommendationBe), CFSTR("lsmRecommendationBe"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v11 & 0x100) == 0)
      goto LABEL_29;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_expectedThroughputVIBE), CFSTR("expectedThroughputVIBE"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v11 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_packetLifetimeVIBE), CFSTR("packetLifetimeVIBE"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v11 & 4) == 0)
      goto LABEL_31;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_packetLossRateVIBE), CFSTR("packetLossRateVIBE"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 4) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v11 & 2) == 0)
      goto LABEL_32;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_btRssi), CFSTR("btRssi"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 2) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v11 & 1) == 0)
      goto LABEL_33;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_btRetransmissionRateTx), CFSTR("btRetransmissionRateTx"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 1) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v11 & 8) == 0)
      goto LABEL_34;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_btRetransmissionRateRx), CFSTR("btRetransmissionRateRx"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 8) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v11 & 0x100000) == 0)
      goto LABEL_35;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_btTech), CFSTR("btTech"));
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x100000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v11 & 0x200000) == 0)
      goto LABEL_36;
LABEL_58:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_idsSocketDelay), CFSTR("idsSocketDelay"));
    if ((*(_DWORD *)&self->_has & 0x80000) == 0)
      return v3;
    goto LABEL_37;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_idsMessageDelay), CFSTR("idsMessageDelay"));
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
    goto LABEL_58;
LABEL_36:
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
LABEL_37:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_idsErrorCode), CFSTR("idsErrorCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSiriRequestRecordReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $2A32A32658D5DED0D08472A2A6A47882 has;
  NSMutableArray *transportHistorys;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $2A32A32658D5DED0D08472A2A6A47882 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_11:
    PBDataWriterWriteUint64Field();
LABEL_12:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  transportHistorys = self->_transportHistorys;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportHistorys, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(transportHistorys);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportHistorys, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x4000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v10 & 0x1000) == 0)
        goto LABEL_22;
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v10 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v10 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v10 & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v10 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x80) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v10 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x20) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v10 & 0x100) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v10 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v10 & 4) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 4) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v10 & 2) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 2) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v10 & 1) == 0)
      goto LABEL_31;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 1) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v10 & 8) == 0)
      goto LABEL_32;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
      goto LABEL_33;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v10 & 0x200000) == 0)
      goto LABEL_34;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v10 & 0x80000) == 0)
      return;
    goto LABEL_35;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
    return;
LABEL_35:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $2A32A32658D5DED0D08472A2A6A47882 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  $2A32A32658D5DED0D08472A2A6A47882 v9;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_QWORD *)a3 + 11) = self->_startTimestamp;
    *((_DWORD *)a3 + 46) |= 0x400u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 5) = self->_endTimestamp;
  *((_DWORD *)a3 + 46) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 40) = self->_requestStatus;
  *((_DWORD *)a3 + 46) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 34) = self->_errorDomain;
  *((_DWORD *)a3 + 46) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 33) = self->_errorCode;
  *((_DWORD *)a3 + 46) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 45) = self->_underlyingErrorDomain;
  *((_DWORD *)a3 + 46) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 44) = self->_underlyingErrorCode;
  *((_DWORD *)a3 + 46) |= 0x1000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_10;
LABEL_42:
    *((_DWORD *)a3 + 35) = self->_iRATRecommendation;
    *((_DWORD *)a3 + 46) |= 0x40000u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_41:
  *((_QWORD *)a3 + 12) = self->_timeToFirstWord;
  *((_DWORD *)a3 + 46) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
    goto LABEL_42;
LABEL_10:
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_11:
    *((_QWORD *)a3 + 7) = self->_iRATRecommendationDelay;
    *((_DWORD *)a3 + 46) |= 0x40u;
  }
LABEL_12:
  if (-[AWDSiriRequestRecord transportHistorysCount](self, "transportHistorysCount"))
  {
    objc_msgSend(a3, "clearTransportHistorys");
    v6 = -[AWDSiriRequestRecord transportHistorysCount](self, "transportHistorysCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addTransportHistory:", -[AWDSiriRequestRecord transportHistoryAtIndex:](self, "transportHistoryAtIndex:", i));
    }
  }
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) != 0)
  {
    *((_QWORD *)a3 + 14) = self->_wifiRSSI;
    *((_DWORD *)a3 + 46) |= 0x2000u;
    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x4000) == 0)
    {
LABEL_18:
      if ((*(_WORD *)&v9 & 0x1000) == 0)
        goto LABEL_19;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
    goto LABEL_18;
  }
  *((_QWORD *)a3 + 15) = self->_wifiSNR;
  *((_DWORD *)a3 + 46) |= 0x4000u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v9 & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)a3 + 13) = self->_wifiCCA;
  *((_DWORD *)a3 + 46) |= 0x1000u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 32) = self->_beaconPer;
  *((_DWORD *)a3 + 46) |= 0x8000u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v9 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 39) = self->_nwtype;
  *((_DWORD *)a3 + 46) |= 0x400000u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v9 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)a3 + 8) = self->_lsmRecommendationBe;
  *((_DWORD *)a3 + 46) |= 0x80u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x20) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v9 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)a3 + 6) = self->_expectedThroughputVIBE;
  *((_DWORD *)a3 + 46) |= 0x20u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v9 & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)a3 + 9) = self->_packetLifetimeVIBE;
  *((_DWORD *)a3 + 46) |= 0x100u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v9 & 4) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)a3 + 10) = self->_packetLossRateVIBE;
  *((_DWORD *)a3 + 46) |= 0x200u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 4) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v9 & 2) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)a3 + 3) = self->_btRssi;
  *((_DWORD *)a3 + 46) |= 4u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 2) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v9 & 1) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)a3 + 2) = self->_btRetransmissionRateTx;
  *((_DWORD *)a3 + 46) |= 2u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 1) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v9 & 8) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)a3 + 1) = self->_btRetransmissionRateRx;
  *((_DWORD *)a3 + 46) |= 1u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 8) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)a3 + 4) = self->_btTech;
  *((_DWORD *)a3 + 46) |= 8u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v9 & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 37) = self->_idsMessageDelay;
  *((_DWORD *)a3 + 46) |= 0x100000u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v9 & 0x80000) == 0)
      return;
    goto LABEL_32;
  }
LABEL_58:
  *((_DWORD *)a3 + 38) = self->_idsSocketDelay;
  *((_DWORD *)a3 + 46) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
    return;
LABEL_32:
  *((_DWORD *)a3 + 36) = self->_idsErrorCode;
  *((_DWORD *)a3 + 46) |= 0x80000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $2A32A32658D5DED0D08472A2A6A47882 has;
  NSMutableArray *transportHistorys;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  $2A32A32658D5DED0D08472A2A6A47882 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *(_QWORD *)(v5 + 88) = self->_startTimestamp;
    *(_DWORD *)(v5 + 184) |= 0x400u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 40) = self->_endTimestamp;
  *(_DWORD *)(v5 + 184) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 160) = self->_requestStatus;
  *(_DWORD *)(v5 + 184) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 136) = self->_errorDomain;
  *(_DWORD *)(v5 + 184) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 132) = self->_errorCode;
  *(_DWORD *)(v5 + 184) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 180) = self->_underlyingErrorDomain;
  *(_DWORD *)(v5 + 184) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 176) = self->_underlyingErrorCode;
  *(_DWORD *)(v5 + 184) |= 0x1000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  *(_QWORD *)(v5 + 96) = self->_timeToFirstWord;
  *(_DWORD *)(v5 + 184) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_45:
  *(_DWORD *)(v5 + 140) = self->_iRATRecommendation;
  *(_DWORD *)(v5 + 184) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    *(_QWORD *)(v5 + 56) = self->_iRATRecommendationDelay;
    *(_DWORD *)(v5 + 184) |= 0x40u;
  }
LABEL_12:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  transportHistorys = self->_transportHistorys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportHistorys, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(transportHistorys);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTransportHistory:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportHistorys, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    *(_QWORD *)(v6 + 112) = self->_wifiRSSI;
    *(_DWORD *)(v6 + 184) |= 0x2000u;
    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x4000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v14 & 0x1000) == 0)
        goto LABEL_22;
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  *(_QWORD *)(v6 + 120) = self->_wifiSNR;
  *(_DWORD *)(v6 + 184) |= 0x4000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v14 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  *(_QWORD *)(v6 + 104) = self->_wifiCCA;
  *(_DWORD *)(v6 + 184) |= 0x1000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v14 & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v6 + 128) = self->_beaconPer;
  *(_DWORD *)(v6 + 184) |= 0x8000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v14 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 156) = self->_nwtype;
  *(_DWORD *)(v6 + 184) |= 0x400000u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x80) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v14 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  *(_QWORD *)(v6 + 64) = self->_lsmRecommendationBe;
  *(_DWORD *)(v6 + 184) |= 0x80u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x20) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v14 & 0x100) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  *(_QWORD *)(v6 + 48) = self->_expectedThroughputVIBE;
  *(_DWORD *)(v6 + 184) |= 0x20u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v14 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  *(_QWORD *)(v6 + 72) = self->_packetLifetimeVIBE;
  *(_DWORD *)(v6 + 184) |= 0x100u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v14 & 4) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  *(_QWORD *)(v6 + 80) = self->_packetLossRateVIBE;
  *(_DWORD *)(v6 + 184) |= 0x200u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 4) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v14 & 2) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  *(_QWORD *)(v6 + 24) = self->_btRssi;
  *(_DWORD *)(v6 + 184) |= 4u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 2) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v14 & 1) == 0)
      goto LABEL_31;
    goto LABEL_58;
  }
LABEL_57:
  *(_QWORD *)(v6 + 16) = self->_btRetransmissionRateTx;
  *(_DWORD *)(v6 + 184) |= 2u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 1) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v14 & 8) == 0)
      goto LABEL_32;
    goto LABEL_59;
  }
LABEL_58:
  *(_QWORD *)(v6 + 8) = self->_btRetransmissionRateRx;
  *(_DWORD *)(v6 + 184) |= 1u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v14 & 0x100000) == 0)
      goto LABEL_33;
    goto LABEL_60;
  }
LABEL_59:
  *(_QWORD *)(v6 + 32) = self->_btTech;
  *(_DWORD *)(v6 + 184) |= 8u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v14 & 0x200000) == 0)
      goto LABEL_34;
LABEL_61:
    *(_DWORD *)(v6 + 152) = self->_idsSocketDelay;
    *(_DWORD *)(v6 + 184) |= 0x200000u;
    if ((*(_DWORD *)&self->_has & 0x80000) == 0)
      return (id)v6;
    goto LABEL_35;
  }
LABEL_60:
  *(_DWORD *)(v6 + 148) = self->_idsMessageDelay;
  *(_DWORD *)(v6 + 184) |= 0x100000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
    goto LABEL_61;
LABEL_34:
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
LABEL_35:
    *(_DWORD *)(v6 + 144) = self->_idsErrorCode;
    *(_DWORD *)(v6 + 184) |= 0x80000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $2A32A32658D5DED0D08472A2A6A47882 has;
  int v7;
  NSMutableArray *transportHistorys;
  int v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 46);
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_startTimestamp != *((_QWORD *)a3 + 11))
        goto LABEL_134;
    }
    else if ((v7 & 0x400) != 0)
    {
LABEL_134:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_endTimestamp != *((_QWORD *)a3 + 5))
        goto LABEL_134;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_requestStatus != *((_DWORD *)a3 + 40))
        goto LABEL_134;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_errorDomain != *((_DWORD *)a3 + 34))
        goto LABEL_134;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_errorCode != *((_DWORD *)a3 + 33))
        goto LABEL_134;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_underlyingErrorDomain != *((_DWORD *)a3 + 45))
        goto LABEL_134;
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_underlyingErrorCode != *((_DWORD *)a3 + 44))
        goto LABEL_134;
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_timeToFirstWord != *((_QWORD *)a3 + 12))
        goto LABEL_134;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_iRATRecommendation != *((_DWORD *)a3 + 35))
        goto LABEL_134;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_iRATRecommendationDelay != *((_QWORD *)a3 + 7))
        goto LABEL_134;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_134;
    }
    transportHistorys = self->_transportHistorys;
    if ((unint64_t)transportHistorys | *((_QWORD *)a3 + 21))
    {
      v5 = -[NSMutableArray isEqual:](transportHistorys, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v9 = *((_DWORD *)a3 + 46);
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v9 & 0x2000) == 0 || self->_wifiRSSI != *((_QWORD *)a3 + 14))
        goto LABEL_134;
    }
    else if ((v9 & 0x2000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v9 & 0x4000) == 0 || self->_wifiSNR != *((_QWORD *)a3 + 15))
        goto LABEL_134;
    }
    else if ((v9 & 0x4000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v9 & 0x1000) == 0 || self->_wifiCCA != *((_QWORD *)a3 + 13))
        goto LABEL_134;
    }
    else if ((v9 & 0x1000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v9 & 0x8000) == 0 || self->_beaconPer != *((_DWORD *)a3 + 32))
        goto LABEL_134;
    }
    else if ((v9 & 0x8000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v9 & 0x400000) == 0 || self->_nwtype != *((_DWORD *)a3 + 39))
        goto LABEL_134;
    }
    else if ((v9 & 0x400000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_lsmRecommendationBe != *((_QWORD *)a3 + 8))
        goto LABEL_134;
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_expectedThroughputVIBE != *((_QWORD *)a3 + 6))
        goto LABEL_134;
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v9 & 0x100) == 0 || self->_packetLifetimeVIBE != *((_QWORD *)a3 + 9))
        goto LABEL_134;
    }
    else if ((v9 & 0x100) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v9 & 0x200) == 0 || self->_packetLossRateVIBE != *((_QWORD *)a3 + 10))
        goto LABEL_134;
    }
    else if ((v9 & 0x200) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_btRssi != *((_QWORD *)a3 + 3))
        goto LABEL_134;
    }
    else if ((v9 & 4) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_btRetransmissionRateTx != *((_QWORD *)a3 + 2))
        goto LABEL_134;
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v9 & 1) == 0 || self->_btRetransmissionRateRx != *((_QWORD *)a3 + 1))
        goto LABEL_134;
    }
    else if ((v9 & 1) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_btTech != *((_QWORD *)a3 + 4))
        goto LABEL_134;
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v9 & 0x100000) == 0 || self->_idsMessageDelay != *((_DWORD *)a3 + 37))
        goto LABEL_134;
    }
    else if ((v9 & 0x100000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v9 & 0x200000) == 0 || self->_idsSocketDelay != *((_DWORD *)a3 + 38))
        goto LABEL_134;
    }
    else if ((v9 & 0x200000) != 0)
    {
      goto LABEL_134;
    }
    LOBYTE(v5) = (v9 & 0x80000) == 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v9 & 0x80000) == 0 || self->_idsErrorCode != *((_DWORD *)a3 + 36))
        goto LABEL_134;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $2A32A32658D5DED0D08472A2A6A47882 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  $2A32A32658D5DED0D08472A2A6A47882 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v32 = 2654435761u * self->_startTimestamp;
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
LABEL_3:
      v31 = 2654435761u * self->_endTimestamp;
      if ((*(_DWORD *)&has & 0x800000) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_3;
  }
  v31 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_4:
    v30 = 2654435761 * self->_requestStatus;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_errorDomain;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_errorCode;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_underlyingErrorDomain;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_8:
    v7 = 2654435761 * self->_underlyingErrorCode;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_9:
    v8 = 2654435761u * self->_timeToFirstWord;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_10;
LABEL_20:
    v9 = 0;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0)
    goto LABEL_20;
LABEL_10:
  v9 = 2654435761 * self->_iRATRecommendation;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_11:
    v10 = 2654435761u * self->_iRATRecommendationDelay;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
LABEL_22:
  v11 = -[NSMutableArray hash](self->_transportHistorys, "hash");
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    v13 = 2654435761 * self->_wifiRSSI;
    if ((*(_WORD *)&v12 & 0x4000) != 0)
    {
LABEL_24:
      v14 = 2654435761 * self->_wifiSNR;
      if ((*(_WORD *)&v12 & 0x1000) != 0)
        goto LABEL_25;
      goto LABEL_41;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&v12 & 0x4000) != 0)
      goto LABEL_24;
  }
  v14 = 0;
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
LABEL_25:
    v15 = 2654435761 * self->_wifiCCA;
    if ((*(_WORD *)&v12 & 0x8000) != 0)
      goto LABEL_26;
    goto LABEL_42;
  }
LABEL_41:
  v15 = 0;
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
LABEL_26:
    v16 = 2654435761 * self->_beaconPer;
    if ((*(_DWORD *)&v12 & 0x400000) != 0)
      goto LABEL_27;
    goto LABEL_43;
  }
LABEL_42:
  v16 = 0;
  if ((*(_DWORD *)&v12 & 0x400000) != 0)
  {
LABEL_27:
    v17 = 2654435761 * self->_nwtype;
    if ((*(_BYTE *)&v12 & 0x80) != 0)
      goto LABEL_28;
    goto LABEL_44;
  }
LABEL_43:
  v17 = 0;
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
LABEL_28:
    v18 = 2654435761 * self->_lsmRecommendationBe;
    if ((*(_BYTE *)&v12 & 0x20) != 0)
      goto LABEL_29;
    goto LABEL_45;
  }
LABEL_44:
  v18 = 0;
  if ((*(_BYTE *)&v12 & 0x20) != 0)
  {
LABEL_29:
    v19 = 2654435761 * self->_expectedThroughputVIBE;
    if ((*(_WORD *)&v12 & 0x100) != 0)
      goto LABEL_30;
    goto LABEL_46;
  }
LABEL_45:
  v19 = 0;
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
LABEL_30:
    v20 = 2654435761 * self->_packetLifetimeVIBE;
    if ((*(_WORD *)&v12 & 0x200) != 0)
      goto LABEL_31;
    goto LABEL_47;
  }
LABEL_46:
  v20 = 0;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
LABEL_31:
    v21 = 2654435761 * self->_packetLossRateVIBE;
    if ((*(_BYTE *)&v12 & 4) != 0)
      goto LABEL_32;
    goto LABEL_48;
  }
LABEL_47:
  v21 = 0;
  if ((*(_BYTE *)&v12 & 4) != 0)
  {
LABEL_32:
    v22 = 2654435761u * self->_btRssi;
    if ((*(_BYTE *)&v12 & 2) != 0)
      goto LABEL_33;
    goto LABEL_49;
  }
LABEL_48:
  v22 = 0;
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
LABEL_33:
    v23 = 2654435761 * self->_btRetransmissionRateTx;
    if ((*(_BYTE *)&v12 & 1) != 0)
      goto LABEL_34;
    goto LABEL_50;
  }
LABEL_49:
  v23 = 0;
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
LABEL_34:
    v24 = 2654435761 * self->_btRetransmissionRateRx;
    if ((*(_BYTE *)&v12 & 8) != 0)
      goto LABEL_35;
    goto LABEL_51;
  }
LABEL_50:
  v24 = 0;
  if ((*(_BYTE *)&v12 & 8) != 0)
  {
LABEL_35:
    v25 = 2654435761 * self->_btTech;
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
      goto LABEL_36;
    goto LABEL_52;
  }
LABEL_51:
  v25 = 0;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
LABEL_36:
    v26 = 2654435761 * self->_idsMessageDelay;
    if ((*(_DWORD *)&v12 & 0x200000) != 0)
      goto LABEL_37;
LABEL_53:
    v27 = 0;
    if ((*(_DWORD *)&v12 & 0x80000) != 0)
      goto LABEL_38;
LABEL_54:
    v28 = 0;
    return v31 ^ v32 ^ v30 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_52:
  v26 = 0;
  if ((*(_DWORD *)&v12 & 0x200000) == 0)
    goto LABEL_53;
LABEL_37:
  v27 = 2654435761 * self->_idsSocketDelay;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
    goto LABEL_54;
LABEL_38:
  v28 = 2654435761 * self->_idsErrorCode;
  return v31 ^ v32 ^ v30 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x400) != 0)
  {
    self->_startTimestamp = *((_QWORD *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
    v5 = *((_DWORD *)a3 + 46);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_endTimestamp = *((_QWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x800000) == 0)
  {
LABEL_4:
    if ((v5 & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  self->_requestStatus = *((_DWORD *)a3 + 40);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x20000) == 0)
  {
LABEL_5:
    if ((v5 & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  self->_errorDomain = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x10000) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  self->_errorCode = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  self->_underlyingErrorDomain = *((_DWORD *)a3 + 45);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  self->_underlyingErrorCode = *((_DWORD *)a3 + 44);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  self->_timeToFirstWord = *((_QWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x40000) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_45:
  self->_iRATRecommendation = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)a3 + 46) & 0x40) != 0)
  {
LABEL_11:
    self->_iRATRecommendationDelay = *((_QWORD *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_12:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 21);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[AWDSiriRequestRecord addTransportHistory:](self, "addTransportHistory:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x2000) != 0)
  {
    self->_wifiRSSI = *((_QWORD *)a3 + 14);
    *(_DWORD *)&self->_has |= 0x2000u;
    v11 = *((_DWORD *)a3 + 46);
    if ((v11 & 0x4000) == 0)
    {
LABEL_21:
      if ((v11 & 0x1000) == 0)
        goto LABEL_22;
      goto LABEL_49;
    }
  }
  else if ((v11 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  self->_wifiSNR = *((_QWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x1000) == 0)
  {
LABEL_22:
    if ((v11 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  self->_wifiCCA = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x8000) == 0)
  {
LABEL_23:
    if ((v11 & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  self->_beaconPer = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x8000u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x400000) == 0)
  {
LABEL_24:
    if ((v11 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  self->_nwtype = *((_DWORD *)a3 + 39);
  *(_DWORD *)&self->_has |= 0x400000u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x80) == 0)
  {
LABEL_25:
    if ((v11 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  self->_lsmRecommendationBe = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x20) == 0)
  {
LABEL_26:
    if ((v11 & 0x100) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  self->_expectedThroughputVIBE = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x100) == 0)
  {
LABEL_27:
    if ((v11 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  self->_packetLifetimeVIBE = *((_QWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x200) == 0)
  {
LABEL_28:
    if ((v11 & 4) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  self->_packetLossRateVIBE = *((_QWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 4) == 0)
  {
LABEL_29:
    if ((v11 & 2) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  self->_btRssi = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 2) == 0)
  {
LABEL_30:
    if ((v11 & 1) == 0)
      goto LABEL_31;
    goto LABEL_58;
  }
LABEL_57:
  self->_btRetransmissionRateTx = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 1) == 0)
  {
LABEL_31:
    if ((v11 & 8) == 0)
      goto LABEL_32;
    goto LABEL_59;
  }
LABEL_58:
  self->_btRetransmissionRateRx = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 8) == 0)
  {
LABEL_32:
    if ((v11 & 0x100000) == 0)
      goto LABEL_33;
    goto LABEL_60;
  }
LABEL_59:
  self->_btTech = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x100000) == 0)
  {
LABEL_33:
    if ((v11 & 0x200000) == 0)
      goto LABEL_34;
    goto LABEL_61;
  }
LABEL_60:
  self->_idsMessageDelay = *((_DWORD *)a3 + 37);
  *(_DWORD *)&self->_has |= 0x100000u;
  v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x200000) == 0)
  {
LABEL_34:
    if ((v11 & 0x80000) == 0)
      return;
    goto LABEL_35;
  }
LABEL_61:
  self->_idsSocketDelay = *((_DWORD *)a3 + 38);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)a3 + 46) & 0x80000) == 0)
    return;
LABEL_35:
  self->_idsErrorCode = *((_DWORD *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x80000u;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (unint64_t)timeToFirstWord
{
  return self->_timeToFirstWord;
}

- (unint64_t)iRATRecommendationDelay
{
  return self->_iRATRecommendationDelay;
}

- (NSMutableArray)transportHistorys
{
  return self->_transportHistorys;
}

- (void)setTransportHistorys:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (int64_t)wifiRSSI
{
  return self->_wifiRSSI;
}

- (int64_t)wifiSNR
{
  return self->_wifiSNR;
}

- (int64_t)wifiCCA
{
  return self->_wifiCCA;
}

- (unsigned)beaconPer
{
  return self->_beaconPer;
}

- (unsigned)nwtype
{
  return self->_nwtype;
}

- (int64_t)lsmRecommendationBe
{
  return self->_lsmRecommendationBe;
}

- (int64_t)expectedThroughputVIBE
{
  return self->_expectedThroughputVIBE;
}

- (int64_t)packetLifetimeVIBE
{
  return self->_packetLifetimeVIBE;
}

- (int64_t)packetLossRateVIBE
{
  return self->_packetLossRateVIBE;
}

- (unint64_t)btRssi
{
  return self->_btRssi;
}

- (int64_t)btRetransmissionRateTx
{
  return self->_btRetransmissionRateTx;
}

- (int64_t)btRetransmissionRateRx
{
  return self->_btRetransmissionRateRx;
}

- (int64_t)btTech
{
  return self->_btTech;
}

- (unsigned)idsMessageDelay
{
  return self->_idsMessageDelay;
}

- (unsigned)idsSocketDelay
{
  return self->_idsSocketDelay;
}

- (unsigned)idsErrorCode
{
  return self->_idsErrorCode;
}

@end
