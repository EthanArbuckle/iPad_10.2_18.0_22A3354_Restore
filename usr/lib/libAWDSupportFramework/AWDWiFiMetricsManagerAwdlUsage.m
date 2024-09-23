@implementation AWDWiFiMetricsManagerAwdlUsage

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerAwdlUsage setStates:](self, "setStates:", 0);
  -[AWDWiFiMetricsManagerAwdlUsage setServices:](self, "setServices:", 0);
  -[AWDWiFiMetricsManagerAwdlUsage setHopCountHistograms:](self, "setHopCountHistograms:", 0);
  -[AWDWiFiMetricsManagerAwdlUsage setParentRssiHistograms:](self, "setParentRssiHistograms:", 0);
  -[AWDWiFiMetricsManagerAwdlUsage setD2dMigrationStats:](self, "setD2dMigrationStats:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAwdlUsage;
  -[AWDWiFiMetricsManagerAwdlUsage dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSelfInfraChannel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_selfInfraChannel = a3;
}

- (void)setHasSelfInfraChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasSelfInfraChannel
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setPeerInfraChannel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_peerInfraChannel = a3;
}

- (void)setHasPeerInfraChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasPeerInfraChannel
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setNumOfPeers:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_numOfPeers = a3;
}

- (void)setHasNumOfPeers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasNumOfPeers
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setNumOfCachedPeers:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_numOfCachedPeers = a3;
}

- (void)setHasNumOfCachedPeers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasNumOfCachedPeers
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setCachedPeersOn24G:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_cachedPeersOn24G = a3;
}

- (void)setHasCachedPeersOn24G:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasCachedPeersOn24G
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCachedPeersOn5G:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_cachedPeersOn5G = a3;
}

- (void)setHasCachedPeersOn5G:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasCachedPeersOn5G
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCachedPeersOnDFS:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_cachedPeersOnDFS = a3;
}

- (void)setHasCachedPeersOnDFS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasCachedPeersOnDFS
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCachedPeersNotAssociated:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_cachedPeersNotAssociated = a3;
}

- (void)setHasCachedPeersNotAssociated:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasCachedPeersNotAssociated
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setFlags:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasFlags
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setIfPacketFailures:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_ifPacketFailures = a3;
}

- (void)setHasIfPacketFailures:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIfPacketFailures
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setIfRxBytes:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_ifRxBytes = a3;
}

- (void)setHasIfRxBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIfRxBytes
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setIfTxBytes:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_ifTxBytes = a3;
}

- (void)setHasIfTxBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIfTxBytes
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setAppRxBytes:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_appRxBytes = a3;
}

- (void)setHasAppRxBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasAppRxBytes
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setAppTxBytes:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_appTxBytes = a3;
}

- (void)setHasAppTxBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasAppTxBytes
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setPeriodInMinutes:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_periodInMinutes = a3;
}

- (void)setHasPeriodInMinutes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasPeriodInMinutes
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)clearStates
{
  -[NSMutableArray removeAllObjects](self->_states, "removeAllObjects");
}

- (void)addStates:(id)a3
{
  NSMutableArray *states;

  states = self->_states;
  if (!states)
  {
    states = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_states = states;
  }
  -[NSMutableArray addObject:](states, "addObject:", a3);
}

- (unint64_t)statesCount
{
  return -[NSMutableArray count](self->_states, "count");
}

- (id)statesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_states, "objectAtIndex:", a3);
}

+ (Class)statesType
{
  return (Class)objc_opt_class();
}

- (void)setNoServiceIdleTime:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_noServiceIdleTime = a3;
}

- (void)setHasNoServiceIdleTime:(BOOL)a3
{
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasNoServiceIdleTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBrowseAddTotalCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_browseAddTotalCount = a3;
}

- (void)setHasBrowseAddTotalCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasBrowseAddTotalCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBrowseAddFilteredCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_browseAddFilteredCount = a3;
}

- (void)setHasBrowseAddFilteredCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasBrowseAddFilteredCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBrowseDeleteTotalCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_browseDeleteTotalCount = a3;
}

- (void)setHasBrowseDeleteTotalCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasBrowseDeleteTotalCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBrowseDeleteFilteredCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_browseDeleteFilteredCount = a3;
}

- (void)setHasBrowseDeleteFilteredCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasBrowseDeleteFilteredCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setAdvertiseAddTotalCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_advertiseAddTotalCount = a3;
}

- (void)setHasAdvertiseAddTotalCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasAdvertiseAddTotalCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAdvertiseAddFilteredCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_advertiseAddFilteredCount = a3;
}

- (void)setHasAdvertiseAddFilteredCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAdvertiseAddFilteredCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAdvertiseDeleteTotalCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_advertiseDeleteTotalCount = a3;
}

- (void)setHasAdvertiseDeleteTotalCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAdvertiseDeleteTotalCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setAdvertiseDeleteFilteredCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_advertiseDeleteFilteredCount = a3;
}

- (void)setHasAdvertiseDeleteFilteredCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasAdvertiseDeleteFilteredCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearServices
{
  -[NSMutableArray removeAllObjects](self->_services, "removeAllObjects");
}

- (void)addServices:(id)a3
{
  NSMutableArray *services;

  services = self->_services;
  if (!services)
  {
    services = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_services = services;
  }
  -[NSMutableArray addObject:](services, "addObject:", a3);
}

- (unint64_t)servicesCount
{
  return -[NSMutableArray count](self->_services, "count");
}

- (id)servicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_services, "objectAtIndex:", a3);
}

+ (Class)servicesType
{
  return (Class)objc_opt_class();
}

- (void)setCachedPeersSameInfra:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_cachedPeersSameInfra = a3;
}

- (void)setHasCachedPeersSameInfra:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasCachedPeersSameInfra
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCachedPeersDifferentInfra:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_cachedPeersDifferentInfra = a3;
}

- (void)setHasCachedPeersDifferentInfra:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasCachedPeersDifferentInfra
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setDfspCSAReceivedFromPeer:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_dfspCSAReceivedFromPeer = a3;
}

- (void)setHasDfspCSAReceivedFromPeer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasDfspCSAReceivedFromPeer
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setDfspCSAReceivedFromAP:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_dfspCSAReceivedFromAP = a3;
}

- (void)setHasDfspCSAReceivedFromAP:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasDfspCSAReceivedFromAP
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setDfspSuspect:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_dfspSuspect = a3;
}

- (void)setHasDfspSuspect:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasDfspSuspect
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setDfspResume:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_dfspResume = a3;
}

- (void)setHasDfspResume:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasDfspResume
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setDfspAirplayConnected:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_dfspAirplayConnected = a3;
}

- (void)setHasDfspAirplayConnected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasDfspAirplayConnected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setDfspAirplayFailed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_dfspAirplayFailed = a3;
}

- (void)setHasDfspAirplayFailed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasDfspAirplayFailed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)clearHopCountHistograms
{
  -[NSMutableArray removeAllObjects](self->_hopCountHistograms, "removeAllObjects");
}

- (void)addHopCountHistogram:(id)a3
{
  NSMutableArray *hopCountHistograms;

  hopCountHistograms = self->_hopCountHistograms;
  if (!hopCountHistograms)
  {
    hopCountHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_hopCountHistograms = hopCountHistograms;
  }
  -[NSMutableArray addObject:](hopCountHistograms, "addObject:", a3);
}

- (unint64_t)hopCountHistogramsCount
{
  return -[NSMutableArray count](self->_hopCountHistograms, "count");
}

- (id)hopCountHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_hopCountHistograms, "objectAtIndex:", a3);
}

+ (Class)hopCountHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearParentRssiHistograms
{
  -[NSMutableArray removeAllObjects](self->_parentRssiHistograms, "removeAllObjects");
}

- (void)addParentRssiHistogram:(id)a3
{
  NSMutableArray *parentRssiHistograms;

  parentRssiHistograms = self->_parentRssiHistograms;
  if (!parentRssiHistograms)
  {
    parentRssiHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_parentRssiHistograms = parentRssiHistograms;
  }
  -[NSMutableArray addObject:](parentRssiHistograms, "addObject:", a3);
}

- (unint64_t)parentRssiHistogramsCount
{
  return -[NSMutableArray count](self->_parentRssiHistograms, "count");
}

- (id)parentRssiHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_parentRssiHistograms, "objectAtIndex:", a3);
}

+ (Class)parentRssiHistogramType
{
  return (Class)objc_opt_class();
}

- (void)setSyncChangesCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_syncChangesCount = a3;
}

- (void)setHasSyncChangesCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasSyncChangesCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumAirplaySessions:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_numAirplaySessions = a3;
}

- (void)setHasNumAirplaySessions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasNumAirplaySessions
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setNumDynSdbAirplayAllowed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_numDynSdbAirplayAllowed = a3;
}

- (void)setHasNumDynSdbAirplayAllowed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasNumDynSdbAirplayAllowed
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setNumDynSdbEntrySuccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_numDynSdbEntrySuccess = a3;
}

- (void)setHasNumDynSdbEntrySuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasNumDynSdbEntrySuccess
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setNumDynSdbExitDueToRate:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_numDynSdbExitDueToRate = a3;
}

- (void)setHasNumDynSdbExitDueToRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasNumDynSdbExitDueToRate
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setNumDynSdbReEntrySuccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_numDynSdbReEntrySuccess = a3;
}

- (void)setHasNumDynSdbReEntrySuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasNumDynSdbReEntrySuccess
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (BOOL)hasD2dMigrationStats
{
  return self->_d2dMigrationStats != 0;
}

- (void)setSelfInfraChannelFlags:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_selfInfraChannelFlags = a3;
}

- (void)setHasSelfInfraChannelFlags:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasSelfInfraChannelFlags
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setPeerInfraChannelFlags:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_peerInfraChannelFlags = a3;
}

- (void)setHasPeerInfraChannelFlags:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasPeerInfraChannelFlags
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCachedPeersOnOther:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_cachedPeersOnOther = a3;
}

- (void)setHasCachedPeersOnOther:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasCachedPeersOnOther
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSelfCapOther:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_selfCapOther = a3;
}

- (void)setHasSelfCapOther:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasSelfCapOther
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setCachedPeersCapOther:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_cachedPeersCapOther = a3;
}

- (void)setHasCachedPeersCapOther:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCachedPeersCapOther
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAwdlUsage;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerAwdlUsage description](&v3, sel_description), -[AWDWiFiMetricsManagerAwdlUsage dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $A7F8C9E9D45357ACF4091D1997306C1B has;
  void *v5;
  NSMutableArray *states;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $A7F8C9E9D45357ACF4091D1997306C1B v11;
  void *v12;
  NSMutableArray *services;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  $A7F8C9E9D45357ACF4091D1997306C1B v18;
  void *v19;
  NSMutableArray *hopCountHistograms;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *parentRssiHistograms;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  $A7F8C9E9D45357ACF4091D1997306C1B v31;
  AWDWifiAwdlD2dMigrationStats *d2dMigrationStats;
  $A7F8C9E9D45357ACF4091D1997306C1B v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x4000000000) == 0)
        goto LABEL_4;
      goto LABEL_91;
    }
  }
  else if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_selfInfraChannel), CFSTR("selfInfraChannel"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_5;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerInfraChannel), CFSTR("peerInfraChannel"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_6;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numOfPeers), CFSTR("numOfPeers"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numOfCachedPeers), CFSTR("numOfCachedPeers"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cachedPeersOn24G), CFSTR("cachedPeersOn24G"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_9;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cachedPeersOn5G), CFSTR("cachedPeersOn5G"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cachedPeersOnDFS), CFSTR("cachedPeersOnDFS"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_11;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cachedPeersNotAssociated), CFSTR("cachedPeersNotAssociated"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags), CFSTR("flags"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_13;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ifPacketFailures), CFSTR("ifPacketFailures"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ifRxBytes), CFSTR("ifRxBytes"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ifTxBytes), CFSTR("ifTxBytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_appRxBytes), CFSTR("appRxBytes"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_103:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_appTxBytes), CFSTR("appTxBytes"));
  if ((*(_QWORD *)&self->_has & 0x10000000000) != 0)
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_periodInMinutes), CFSTR("periodInMinutes"));
LABEL_18:
  if (-[NSMutableArray count](self->_states, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_states, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    states = self->_states;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](states, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v48 != v9)
            objc_enumerationMutation(states);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](states, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("states"));

  }
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_noServiceIdleTime), CFSTR("noServiceIdleTime"));
    v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x400) == 0)
    {
LABEL_29:
      if ((*(_WORD *)&v11 & 0x200) == 0)
        goto LABEL_30;
      goto LABEL_107;
    }
  }
  else if ((*(_WORD *)&v11 & 0x400) == 0)
  {
    goto LABEL_29;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_browseAddTotalCount), CFSTR("browseAddTotalCount"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v11 & 0x1000) == 0)
      goto LABEL_31;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_browseAddFilteredCount), CFSTR("browseAddFilteredCount"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v11 & 0x800) == 0)
      goto LABEL_32;
    goto LABEL_109;
  }
LABEL_108:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_browseDeleteTotalCount), CFSTR("browseDeleteTotalCount"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x800) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v11 & 0x10) == 0)
      goto LABEL_33;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_browseDeleteFilteredCount), CFSTR("browseDeleteFilteredCount"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x10) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v11 & 8) == 0)
      goto LABEL_34;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_advertiseAddTotalCount), CFSTR("advertiseAddTotalCount"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 8) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v11 & 0x40) == 0)
      goto LABEL_35;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_advertiseAddFilteredCount), CFSTR("advertiseAddFilteredCount"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x40) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v11 & 0x20) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_112:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_advertiseDeleteTotalCount), CFSTR("advertiseDeleteTotalCount"));
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
LABEL_36:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_advertiseDeleteFilteredCount), CFSTR("advertiseDeleteFilteredCount"));
LABEL_37:
  if (-[NSMutableArray count](self->_services, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_services, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    services = self->_services;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](services, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v44 != v16)
            objc_enumerationMutation(services);
          objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](services, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v15);
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("services"));

  }
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x100000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cachedPeersSameInfra), CFSTR("cachedPeersSameInfra"));
    v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x4000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v18 & 0x1000000) == 0)
        goto LABEL_49;
      goto LABEL_116;
    }
  }
  else if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
    goto LABEL_48;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cachedPeersDifferentInfra), CFSTR("cachedPeersDifferentInfra"));
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v18 & 0x800000) == 0)
      goto LABEL_50;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dfspCSAReceivedFromPeer), CFSTR("dfspCSAReceivedFromPeer"));
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x800000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v18 & 0x4000000) == 0)
      goto LABEL_51;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dfspCSAReceivedFromAP), CFSTR("dfspCSAReceivedFromAP"));
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x4000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v18 & 0x2000000) == 0)
      goto LABEL_52;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dfspSuspect), CFSTR("dfspSuspect"));
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x2000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v18 & 0x200000) == 0)
      goto LABEL_53;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dfspResume), CFSTR("dfspResume"));
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x200000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v18 & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_120:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dfspAirplayConnected), CFSTR("dfspAirplayConnected"));
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
LABEL_54:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dfspAirplayFailed), CFSTR("dfspAirplayFailed"));
LABEL_55:
  if (-[NSMutableArray count](self->_hopCountHistograms, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_hopCountHistograms, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    hopCountHistograms = self->_hopCountHistograms;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](hopCountHistograms, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(hopCountHistograms);
          objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](hopCountHistograms, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v22);
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("hopCountHistogram"));

  }
  if (-[NSMutableArray count](self->_parentRssiHistograms, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_parentRssiHistograms, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    parentRssiHistograms = self->_parentRssiHistograms;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](parentRssiHistograms, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(parentRssiHistograms);
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * m), "dictionaryRepresentation"));
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](parentRssiHistograms, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
      }
      while (v28);
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("parentRssiHistogram"));

  }
  v31 = self->_has;
  if ((*(_BYTE *)&v31 & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_syncChangesCount), CFSTR("syncChangesCount"));
    v31 = self->_has;
    if ((*(_DWORD *)&v31 & 0x80000000) == 0)
    {
LABEL_75:
      if ((*(_QWORD *)&v31 & 0x100000000) == 0)
        goto LABEL_76;
      goto LABEL_124;
    }
  }
  else if ((*(_DWORD *)&v31 & 0x80000000) == 0)
  {
    goto LABEL_75;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numAirplaySessions), CFSTR("numAirplaySessions"));
  v31 = self->_has;
  if ((*(_QWORD *)&v31 & 0x100000000) == 0)
  {
LABEL_76:
    if ((*(_QWORD *)&v31 & 0x200000000) == 0)
      goto LABEL_77;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numDynSdbAirplayAllowed), CFSTR("numDynSdbAirplayAllowed"));
  v31 = self->_has;
  if ((*(_QWORD *)&v31 & 0x200000000) == 0)
  {
LABEL_77:
    if ((*(_QWORD *)&v31 & 0x400000000) == 0)
      goto LABEL_78;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numDynSdbEntrySuccess), CFSTR("numDynSdbEntrySuccess"));
  v31 = self->_has;
  if ((*(_QWORD *)&v31 & 0x400000000) == 0)
  {
LABEL_78:
    if ((*(_QWORD *)&v31 & 0x800000000) == 0)
      goto LABEL_80;
    goto LABEL_79;
  }
LABEL_126:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numDynSdbExitDueToRate), CFSTR("numDynSdbExitDueToRate"));
  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
LABEL_79:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numDynSdbReEntrySuccess), CFSTR("numDynSdbReEntrySuccess"));
LABEL_80:
  d2dMigrationStats = self->_d2dMigrationStats;
  if (d2dMigrationStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWifiAwdlD2dMigrationStats dictionaryRepresentation](d2dMigrationStats, "dictionaryRepresentation"), CFSTR("d2dMigrationStats"));
  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x80000000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_selfInfraChannelFlags), CFSTR("selfInfraChannelFlags"));
    v33 = self->_has;
    if ((*(_QWORD *)&v33 & 0x8000000000) == 0)
    {
LABEL_84:
      if ((*(_DWORD *)&v33 & 0x80000) == 0)
        goto LABEL_85;
      goto LABEL_130;
    }
  }
  else if ((*(_QWORD *)&v33 & 0x8000000000) == 0)
  {
    goto LABEL_84;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerInfraChannelFlags), CFSTR("peerInfraChannelFlags"));
  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x80000) == 0)
  {
LABEL_85:
    if ((*(_QWORD *)&v33 & 0x20000000000) == 0)
      goto LABEL_86;
LABEL_131:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_selfCapOther), CFSTR("selfCapOther"));
    if ((*(_QWORD *)&self->_has & 0x2000) == 0)
      return v3;
    goto LABEL_87;
  }
LABEL_130:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cachedPeersOnOther), CFSTR("cachedPeersOnOther"));
  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x20000000000) != 0)
    goto LABEL_131;
LABEL_86:
  if ((*(_WORD *)&v33 & 0x2000) != 0)
LABEL_87:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cachedPeersCapOther), CFSTR("cachedPeersCapOther"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerAwdlUsageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $A7F8C9E9D45357ACF4091D1997306C1B has;
  NSMutableArray *states;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $A7F8C9E9D45357ACF4091D1997306C1B v10;
  NSMutableArray *services;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  $A7F8C9E9D45357ACF4091D1997306C1B v16;
  NSMutableArray *hopCountHistograms;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  NSMutableArray *parentRssiHistograms;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  $A7F8C9E9D45357ACF4091D1997306C1B v27;
  $A7F8C9E9D45357ACF4091D1997306C1B v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x4000000000) == 0)
        goto LABEL_4;
      goto LABEL_83;
    }
  }
  else if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_5;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_6;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_9;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_11;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_13;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x10000000000) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  states = self->_states;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](states, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(states);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](states, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v7);
  }
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x400) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v10 & 0x200) == 0)
        goto LABEL_28;
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&v10 & 0x400) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v10 & 0x1000) == 0)
      goto LABEL_29;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v10 & 0x800) == 0)
      goto LABEL_30;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v10 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v10 & 8) == 0)
      goto LABEL_32;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v10 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x40) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v10 & 0x20) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
LABEL_34:
    PBDataWriterWriteUint32Field();
LABEL_35:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  services = self->_services;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](services, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(services);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](services, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v13);
  }
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x4000) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v16 & 0x1000000) == 0)
        goto LABEL_45;
      goto LABEL_108;
    }
  }
  else if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
    goto LABEL_44;
  }
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x1000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v16 & 0x800000) == 0)
      goto LABEL_46;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v16 & 0x4000000) == 0)
      goto LABEL_47;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x4000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v16 & 0x2000000) == 0)
      goto LABEL_48;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x2000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v16 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v16 & 0x400000) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
LABEL_50:
    PBDataWriterWriteUint32Field();
LABEL_51:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  hopCountHistograms = self->_hopCountHistograms;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](hopCountHistograms, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(hopCountHistograms);
        PBDataWriterWriteSubmessage();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](hopCountHistograms, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v19);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  parentRssiHistograms = self->_parentRssiHistograms;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](parentRssiHistograms, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(parentRssiHistograms);
        PBDataWriterWriteSubmessage();
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](parentRssiHistograms, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v24);
  }
  v27 = self->_has;
  if ((*(_BYTE *)&v27 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v27 = self->_has;
    if ((*(_DWORD *)&v27 & 0x80000000) == 0)
    {
LABEL_67:
      if ((*(_QWORD *)&v27 & 0x100000000) == 0)
        goto LABEL_68;
      goto LABEL_116;
    }
  }
  else if ((*(_DWORD *)&v27 & 0x80000000) == 0)
  {
    goto LABEL_67;
  }
  PBDataWriterWriteUint32Field();
  v27 = self->_has;
  if ((*(_QWORD *)&v27 & 0x100000000) == 0)
  {
LABEL_68:
    if ((*(_QWORD *)&v27 & 0x200000000) == 0)
      goto LABEL_69;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint32Field();
  v27 = self->_has;
  if ((*(_QWORD *)&v27 & 0x200000000) == 0)
  {
LABEL_69:
    if ((*(_QWORD *)&v27 & 0x400000000) == 0)
      goto LABEL_70;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint32Field();
  v27 = self->_has;
  if ((*(_QWORD *)&v27 & 0x400000000) == 0)
  {
LABEL_70:
    if ((*(_QWORD *)&v27 & 0x800000000) == 0)
      goto LABEL_72;
    goto LABEL_71;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
LABEL_71:
    PBDataWriterWriteUint32Field();
LABEL_72:
  if (self->_d2dMigrationStats)
    PBDataWriterWriteSubmessage();
  v28 = self->_has;
  if ((*(_QWORD *)&v28 & 0x80000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v28 = self->_has;
    if ((*(_QWORD *)&v28 & 0x8000000000) == 0)
    {
LABEL_76:
      if ((*(_DWORD *)&v28 & 0x80000) == 0)
        goto LABEL_77;
      goto LABEL_122;
    }
  }
  else if ((*(_QWORD *)&v28 & 0x8000000000) == 0)
  {
    goto LABEL_76;
  }
  PBDataWriterWriteUint32Field();
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x80000) == 0)
  {
LABEL_77:
    if ((*(_QWORD *)&v28 & 0x20000000000) == 0)
      goto LABEL_78;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint32Field();
  v28 = self->_has;
  if ((*(_QWORD *)&v28 & 0x20000000000) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&v28 & 0x2000) == 0)
      return;
    goto LABEL_79;
  }
LABEL_123:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x2000) == 0)
    return;
LABEL_79:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $A7F8C9E9D45357ACF4091D1997306C1B has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  $A7F8C9E9D45357ACF4091D1997306C1B v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  $A7F8C9E9D45357ACF4091D1997306C1B v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  $A7F8C9E9D45357ACF4091D1997306C1B v20;
  $A7F8C9E9D45357ACF4091D1997306C1B v21;

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_QWORD *)a3 + 30) |= 4uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x4000000000) == 0)
        goto LABEL_4;
      goto LABEL_71;
    }
  }
  else if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 54) = self->_selfInfraChannel;
  *((_QWORD *)a3 + 30) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_5;
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)a3 + 50) = self->_peerInfraChannel;
  *((_QWORD *)a3 + 30) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_6;
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)a3 + 47) = self->_numOfPeers;
  *((_QWORD *)a3 + 30) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 46) = self->_numOfCachedPeers;
  *((_QWORD *)a3 + 30) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 21) = self->_cachedPeersOn24G;
  *((_QWORD *)a3 + 30) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_9;
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 22) = self->_cachedPeersOn5G;
  *((_QWORD *)a3 + 30) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)a3 + 23) = self->_cachedPeersOnDFS;
  *((_QWORD *)a3 + 30) |= 0x40000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_11;
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 20) = self->_cachedPeersNotAssociated;
  *((_QWORD *)a3 + 30) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)a3 + 34) = self->_flags;
  *((_QWORD *)a3 + 30) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_13;
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)a3 + 38) = self->_ifPacketFailures;
  *((_QWORD *)a3 + 30) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)a3 + 39) = self->_ifRxBytes;
  *((_QWORD *)a3 + 30) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)a3 + 40) = self->_ifTxBytes;
  *((_QWORD *)a3 + 30) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
LABEL_83:
    *((_DWORD *)a3 + 13) = self->_appTxBytes;
    *((_QWORD *)a3 + 30) |= 0x100uLL;
    if ((*(_QWORD *)&self->_has & 0x10000000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_82:
  *((_DWORD *)a3 + 12) = self->_appRxBytes;
  *((_QWORD *)a3 + 30) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_83;
LABEL_16:
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 52) = self->_periodInMinutes;
    *((_QWORD *)a3 + 30) |= 0x10000000000uLL;
  }
LABEL_18:
  if (-[AWDWiFiMetricsManagerAwdlUsage statesCount](self, "statesCount"))
  {
    objc_msgSend(a3, "clearStates");
    v6 = -[AWDWiFiMetricsManagerAwdlUsage statesCount](self, "statesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addStates:", -[AWDWiFiMetricsManagerAwdlUsage statesAtIndex:](self, "statesAtIndex:", i));
    }
  }
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_noServiceIdleTime;
    *((_QWORD *)a3 + 30) |= 1uLL;
    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x400) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&v9 & 0x200) == 0)
        goto LABEL_25;
      goto LABEL_87;
    }
  }
  else if ((*(_WORD *)&v9 & 0x400) == 0)
  {
    goto LABEL_24;
  }
  *((_DWORD *)a3 + 15) = self->_browseAddTotalCount;
  *((_QWORD *)a3 + 30) |= 0x400uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v9 & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)a3 + 14) = self->_browseAddFilteredCount;
  *((_QWORD *)a3 + 30) |= 0x200uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v9 & 0x800) == 0)
      goto LABEL_27;
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)a3 + 17) = self->_browseDeleteTotalCount;
  *((_QWORD *)a3 + 30) |= 0x1000uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v9 & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)a3 + 16) = self->_browseDeleteFilteredCount;
  *((_QWORD *)a3 + 30) |= 0x800uLL;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v9 & 8) == 0)
      goto LABEL_29;
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)a3 + 9) = self->_advertiseAddTotalCount;
  *((_QWORD *)a3 + 30) |= 0x10uLL;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 8) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v9 & 0x40) == 0)
      goto LABEL_30;
LABEL_92:
    *((_DWORD *)a3 + 11) = self->_advertiseDeleteTotalCount;
    *((_QWORD *)a3 + 30) |= 0x40uLL;
    if ((*(_QWORD *)&self->_has & 0x20) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_91:
  *((_DWORD *)a3 + 8) = self->_advertiseAddFilteredCount;
  *((_QWORD *)a3 + 30) |= 8uLL;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x40) != 0)
    goto LABEL_92;
LABEL_30:
  if ((*(_BYTE *)&v9 & 0x20) != 0)
  {
LABEL_31:
    *((_DWORD *)a3 + 10) = self->_advertiseDeleteFilteredCount;
    *((_QWORD *)a3 + 30) |= 0x20uLL;
  }
LABEL_32:
  if (-[AWDWiFiMetricsManagerAwdlUsage servicesCount](self, "servicesCount"))
  {
    objc_msgSend(a3, "clearServices");
    v10 = -[AWDWiFiMetricsManagerAwdlUsage servicesCount](self, "servicesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addServices:", -[AWDWiFiMetricsManagerAwdlUsage servicesAtIndex:](self, "servicesAtIndex:", j));
    }
  }
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
    *((_DWORD *)a3 + 25) = self->_cachedPeersSameInfra;
    *((_QWORD *)a3 + 30) |= 0x100000uLL;
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x4000) == 0)
    {
LABEL_38:
      if ((*(_DWORD *)&v13 & 0x1000000) == 0)
        goto LABEL_39;
      goto LABEL_96;
    }
  }
  else if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
    goto LABEL_38;
  }
  *((_DWORD *)a3 + 19) = self->_cachedPeersDifferentInfra;
  *((_QWORD *)a3 + 30) |= 0x4000uLL;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v13 & 0x800000) == 0)
      goto LABEL_40;
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 31) = self->_dfspCSAReceivedFromPeer;
  *((_QWORD *)a3 + 30) |= 0x1000000uLL;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v13 & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 30) = self->_dfspCSAReceivedFromAP;
  *((_QWORD *)a3 + 30) |= 0x800000uLL;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v13 & 0x2000000) == 0)
      goto LABEL_42;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)a3 + 33) = self->_dfspSuspect;
  *((_QWORD *)a3 + 30) |= 0x4000000uLL;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v13 & 0x200000) == 0)
      goto LABEL_43;
LABEL_100:
    *((_DWORD *)a3 + 28) = self->_dfspAirplayConnected;
    *((_QWORD *)a3 + 30) |= 0x200000uLL;
    if ((*(_QWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_99:
  *((_DWORD *)a3 + 32) = self->_dfspResume;
  *((_QWORD *)a3 + 30) |= 0x2000000uLL;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) != 0)
    goto LABEL_100;
LABEL_43:
  if ((*(_DWORD *)&v13 & 0x400000) != 0)
  {
LABEL_44:
    *((_DWORD *)a3 + 29) = self->_dfspAirplayFailed;
    *((_QWORD *)a3 + 30) |= 0x400000uLL;
  }
LABEL_45:
  if (-[AWDWiFiMetricsManagerAwdlUsage hopCountHistogramsCount](self, "hopCountHistogramsCount"))
  {
    objc_msgSend(a3, "clearHopCountHistograms");
    v14 = -[AWDWiFiMetricsManagerAwdlUsage hopCountHistogramsCount](self, "hopCountHistogramsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
        objc_msgSend(a3, "addHopCountHistogram:", -[AWDWiFiMetricsManagerAwdlUsage hopCountHistogramAtIndex:](self, "hopCountHistogramAtIndex:", k));
    }
  }
  if (-[AWDWiFiMetricsManagerAwdlUsage parentRssiHistogramsCount](self, "parentRssiHistogramsCount"))
  {
    objc_msgSend(a3, "clearParentRssiHistograms");
    v17 = -[AWDWiFiMetricsManagerAwdlUsage parentRssiHistogramsCount](self, "parentRssiHistogramsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
        objc_msgSend(a3, "addParentRssiHistogram:", -[AWDWiFiMetricsManagerAwdlUsage parentRssiHistogramAtIndex:](self, "parentRssiHistogramAtIndex:", m));
    }
  }
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_syncChangesCount;
    *((_QWORD *)a3 + 30) |= 2uLL;
    v20 = self->_has;
    if ((*(_DWORD *)&v20 & 0x80000000) == 0)
    {
LABEL_55:
      if ((*(_QWORD *)&v20 & 0x100000000) == 0)
        goto LABEL_56;
      goto LABEL_104;
    }
  }
  else if ((*(_DWORD *)&v20 & 0x80000000) == 0)
  {
    goto LABEL_55;
  }
  *((_DWORD *)a3 + 41) = self->_numAirplaySessions;
  *((_QWORD *)a3 + 30) |= 0x80000000uLL;
  v20 = self->_has;
  if ((*(_QWORD *)&v20 & 0x100000000) == 0)
  {
LABEL_56:
    if ((*(_QWORD *)&v20 & 0x200000000) == 0)
      goto LABEL_57;
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)a3 + 42) = self->_numDynSdbAirplayAllowed;
  *((_QWORD *)a3 + 30) |= 0x100000000uLL;
  v20 = self->_has;
  if ((*(_QWORD *)&v20 & 0x200000000) == 0)
  {
LABEL_57:
    if ((*(_QWORD *)&v20 & 0x400000000) == 0)
      goto LABEL_58;
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)a3 + 43) = self->_numDynSdbEntrySuccess;
  *((_QWORD *)a3 + 30) |= 0x200000000uLL;
  v20 = self->_has;
  if ((*(_QWORD *)&v20 & 0x400000000) == 0)
  {
LABEL_58:
    if ((*(_QWORD *)&v20 & 0x800000000) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_106:
  *((_DWORD *)a3 + 44) = self->_numDynSdbExitDueToRate;
  *((_QWORD *)a3 + 30) |= 0x400000000uLL;
  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
  {
LABEL_59:
    *((_DWORD *)a3 + 45) = self->_numDynSdbReEntrySuccess;
    *((_QWORD *)a3 + 30) |= 0x800000000uLL;
  }
LABEL_60:
  if (self->_d2dMigrationStats)
    objc_msgSend(a3, "setD2dMigrationStats:");
  v21 = self->_has;
  if ((*(_QWORD *)&v21 & 0x80000000000) != 0)
  {
    *((_DWORD *)a3 + 55) = self->_selfInfraChannelFlags;
    *((_QWORD *)a3 + 30) |= 0x80000000000uLL;
    v21 = self->_has;
    if ((*(_QWORD *)&v21 & 0x8000000000) == 0)
    {
LABEL_64:
      if ((*(_DWORD *)&v21 & 0x80000) == 0)
        goto LABEL_65;
      goto LABEL_110;
    }
  }
  else if ((*(_QWORD *)&v21 & 0x8000000000) == 0)
  {
    goto LABEL_64;
  }
  *((_DWORD *)a3 + 51) = self->_peerInfraChannelFlags;
  *((_QWORD *)a3 + 30) |= 0x8000000000uLL;
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) == 0)
  {
LABEL_65:
    if ((*(_QWORD *)&v21 & 0x20000000000) == 0)
      goto LABEL_66;
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)a3 + 24) = self->_cachedPeersOnOther;
  *((_QWORD *)a3 + 30) |= 0x80000uLL;
  v21 = self->_has;
  if ((*(_QWORD *)&v21 & 0x20000000000) == 0)
  {
LABEL_66:
    if ((*(_WORD *)&v21 & 0x2000) == 0)
      return;
    goto LABEL_67;
  }
LABEL_111:
  *((_DWORD *)a3 + 53) = self->_selfCapOther;
  *((_QWORD *)a3 + 30) |= 0x20000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000) == 0)
    return;
LABEL_67:
  *((_DWORD *)a3 + 18) = self->_cachedPeersCapOther;
  *((_QWORD *)a3 + 30) |= 0x2000uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $A7F8C9E9D45357ACF4091D1997306C1B has;
  NSMutableArray *states;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  $A7F8C9E9D45357ACF4091D1997306C1B v14;
  NSMutableArray *services;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  $A7F8C9E9D45357ACF4091D1997306C1B v21;
  NSMutableArray *hopCountHistograms;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSMutableArray *parentRssiHistograms;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  $A7F8C9E9D45357ACF4091D1997306C1B v34;
  $A7F8C9E9D45357ACF4091D1997306C1B v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_QWORD *)(v5 + 240) |= 4uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x4000000000) == 0)
        goto LABEL_4;
      goto LABEL_81;
    }
  }
  else if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 216) = self->_selfInfraChannel;
  *(_QWORD *)(v5 + 240) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_5;
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v5 + 200) = self->_peerInfraChannel;
  *(_QWORD *)(v5 + 240) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_6;
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 188) = self->_numOfPeers;
  *(_QWORD *)(v5 + 240) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v5 + 184) = self->_numOfCachedPeers;
  *(_QWORD *)(v5 + 240) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v5 + 84) = self->_cachedPeersOn24G;
  *(_QWORD *)(v5 + 240) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_9;
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v5 + 88) = self->_cachedPeersOn5G;
  *(_QWORD *)(v5 + 240) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v5 + 92) = self->_cachedPeersOnDFS;
  *(_QWORD *)(v5 + 240) |= 0x40000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_11;
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v5 + 80) = self->_cachedPeersNotAssociated;
  *(_QWORD *)(v5 + 240) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v5 + 136) = self->_flags;
  *(_QWORD *)(v5 + 240) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_13;
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v5 + 152) = self->_ifPacketFailures;
  *(_QWORD *)(v5 + 240) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v5 + 156) = self->_ifRxBytes;
  *(_QWORD *)(v5 + 240) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v5 + 160) = self->_ifTxBytes;
  *(_QWORD *)(v5 + 240) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v5 + 48) = self->_appRxBytes;
  *(_QWORD *)(v5 + 240) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_93:
  *(_DWORD *)(v5 + 52) = self->_appTxBytes;
  *(_QWORD *)(v5 + 240) |= 0x100uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000000) != 0)
  {
LABEL_17:
    *(_DWORD *)(v5 + 208) = self->_periodInMinutes;
    *(_QWORD *)(v5 + 240) |= 0x10000000000uLL;
  }
LABEL_18:
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  states = self->_states;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](states, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(states);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addStates:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](states, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v10);
  }
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_noServiceIdleTime;
    *(_QWORD *)(v6 + 240) |= 1uLL;
    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x400) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v14 & 0x200) == 0)
        goto LABEL_28;
      goto LABEL_97;
    }
  }
  else if ((*(_WORD *)&v14 & 0x400) == 0)
  {
    goto LABEL_27;
  }
  *(_DWORD *)(v6 + 60) = self->_browseAddTotalCount;
  *(_QWORD *)(v6 + 240) |= 0x400uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v14 & 0x1000) == 0)
      goto LABEL_29;
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v6 + 56) = self->_browseAddFilteredCount;
  *(_QWORD *)(v6 + 240) |= 0x200uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v14 & 0x800) == 0)
      goto LABEL_30;
    goto LABEL_99;
  }
LABEL_98:
  *(_DWORD *)(v6 + 68) = self->_browseDeleteTotalCount;
  *(_QWORD *)(v6 + 240) |= 0x1000uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v14 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_100;
  }
LABEL_99:
  *(_DWORD *)(v6 + 64) = self->_browseDeleteFilteredCount;
  *(_QWORD *)(v6 + 240) |= 0x800uLL;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v14 & 8) == 0)
      goto LABEL_32;
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v6 + 36) = self->_advertiseAddTotalCount;
  *(_QWORD *)(v6 + 240) |= 0x10uLL;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 8) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v14 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v6 + 32) = self->_advertiseAddFilteredCount;
  *(_QWORD *)(v6 + 240) |= 8uLL;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v14 & 0x20) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_102:
  *(_DWORD *)(v6 + 44) = self->_advertiseDeleteTotalCount;
  *(_QWORD *)(v6 + 240) |= 0x40uLL;
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
  {
LABEL_34:
    *(_DWORD *)(v6 + 40) = self->_advertiseDeleteFilteredCount;
    *(_QWORD *)(v6 + 240) |= 0x20uLL;
  }
LABEL_35:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  services = self->_services;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](services, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(services);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addServices:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](services, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v17);
  }
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x100000) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_cachedPeersSameInfra;
    *(_QWORD *)(v6 + 240) |= 0x100000uLL;
    v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x4000) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v21 & 0x1000000) == 0)
        goto LABEL_45;
      goto LABEL_106;
    }
  }
  else if ((*(_WORD *)&v21 & 0x4000) == 0)
  {
    goto LABEL_44;
  }
  *(_DWORD *)(v6 + 76) = self->_cachedPeersDifferentInfra;
  *(_QWORD *)(v6 + 240) |= 0x4000uLL;
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x1000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v21 & 0x800000) == 0)
      goto LABEL_46;
    goto LABEL_107;
  }
LABEL_106:
  *(_DWORD *)(v6 + 124) = self->_dfspCSAReceivedFromPeer;
  *(_QWORD *)(v6 + 240) |= 0x1000000uLL;
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v21 & 0x4000000) == 0)
      goto LABEL_47;
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(v6 + 120) = self->_dfspCSAReceivedFromAP;
  *(_QWORD *)(v6 + 240) |= 0x800000uLL;
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x4000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v21 & 0x2000000) == 0)
      goto LABEL_48;
    goto LABEL_109;
  }
LABEL_108:
  *(_DWORD *)(v6 + 132) = self->_dfspSuspect;
  *(_QWORD *)(v6 + 240) |= 0x4000000uLL;
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x2000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v21 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_110;
  }
LABEL_109:
  *(_DWORD *)(v6 + 128) = self->_dfspResume;
  *(_QWORD *)(v6 + 240) |= 0x2000000uLL;
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v21 & 0x400000) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
LABEL_110:
  *(_DWORD *)(v6 + 112) = self->_dfspAirplayConnected;
  *(_QWORD *)(v6 + 240) |= 0x200000uLL;
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_50:
    *(_DWORD *)(v6 + 116) = self->_dfspAirplayFailed;
    *(_QWORD *)(v6 + 240) |= 0x400000uLL;
  }
LABEL_51:
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  hopCountHistograms = self->_hopCountHistograms;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](hopCountHistograms, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(hopCountHistograms);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addHopCountHistogram:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](hopCountHistograms, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v24);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  parentRssiHistograms = self->_parentRssiHistograms;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](parentRssiHistograms, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v38;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(parentRssiHistograms);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addParentRssiHistogram:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](parentRssiHistograms, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v30);
  }
  v34 = self->_has;
  if ((*(_BYTE *)&v34 & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_syncChangesCount;
    *(_QWORD *)(v6 + 240) |= 2uLL;
    v34 = self->_has;
    if ((*(_DWORD *)&v34 & 0x80000000) == 0)
    {
LABEL_67:
      if ((*(_QWORD *)&v34 & 0x100000000) == 0)
        goto LABEL_68;
      goto LABEL_114;
    }
  }
  else if ((*(_DWORD *)&v34 & 0x80000000) == 0)
  {
    goto LABEL_67;
  }
  *(_DWORD *)(v6 + 164) = self->_numAirplaySessions;
  *(_QWORD *)(v6 + 240) |= 0x80000000uLL;
  v34 = self->_has;
  if ((*(_QWORD *)&v34 & 0x100000000) == 0)
  {
LABEL_68:
    if ((*(_QWORD *)&v34 & 0x200000000) == 0)
      goto LABEL_69;
    goto LABEL_115;
  }
LABEL_114:
  *(_DWORD *)(v6 + 168) = self->_numDynSdbAirplayAllowed;
  *(_QWORD *)(v6 + 240) |= 0x100000000uLL;
  v34 = self->_has;
  if ((*(_QWORD *)&v34 & 0x200000000) == 0)
  {
LABEL_69:
    if ((*(_QWORD *)&v34 & 0x400000000) == 0)
      goto LABEL_70;
    goto LABEL_116;
  }
LABEL_115:
  *(_DWORD *)(v6 + 172) = self->_numDynSdbEntrySuccess;
  *(_QWORD *)(v6 + 240) |= 0x200000000uLL;
  v34 = self->_has;
  if ((*(_QWORD *)&v34 & 0x400000000) == 0)
  {
LABEL_70:
    if ((*(_QWORD *)&v34 & 0x800000000) == 0)
      goto LABEL_72;
    goto LABEL_71;
  }
LABEL_116:
  *(_DWORD *)(v6 + 176) = self->_numDynSdbExitDueToRate;
  *(_QWORD *)(v6 + 240) |= 0x400000000uLL;
  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
  {
LABEL_71:
    *(_DWORD *)(v6 + 180) = self->_numDynSdbReEntrySuccess;
    *(_QWORD *)(v6 + 240) |= 0x800000000uLL;
  }
LABEL_72:

  *(_QWORD *)(v6 + 104) = -[AWDWifiAwdlD2dMigrationStats copyWithZone:](self->_d2dMigrationStats, "copyWithZone:", a3);
  v35 = self->_has;
  if ((*(_QWORD *)&v35 & 0x80000000000) != 0)
  {
    *(_DWORD *)(v6 + 220) = self->_selfInfraChannelFlags;
    *(_QWORD *)(v6 + 240) |= 0x80000000000uLL;
    v35 = self->_has;
    if ((*(_QWORD *)&v35 & 0x8000000000) == 0)
    {
LABEL_74:
      if ((*(_DWORD *)&v35 & 0x80000) == 0)
        goto LABEL_75;
      goto LABEL_120;
    }
  }
  else if ((*(_QWORD *)&v35 & 0x8000000000) == 0)
  {
    goto LABEL_74;
  }
  *(_DWORD *)(v6 + 204) = self->_peerInfraChannelFlags;
  *(_QWORD *)(v6 + 240) |= 0x8000000000uLL;
  v35 = self->_has;
  if ((*(_DWORD *)&v35 & 0x80000) == 0)
  {
LABEL_75:
    if ((*(_QWORD *)&v35 & 0x20000000000) == 0)
      goto LABEL_76;
LABEL_121:
    *(_DWORD *)(v6 + 212) = self->_selfCapOther;
    *(_QWORD *)(v6 + 240) |= 0x20000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x2000) == 0)
      return (id)v6;
    goto LABEL_77;
  }
LABEL_120:
  *(_DWORD *)(v6 + 96) = self->_cachedPeersOnOther;
  *(_QWORD *)(v6 + 240) |= 0x80000uLL;
  v35 = self->_has;
  if ((*(_QWORD *)&v35 & 0x20000000000) != 0)
    goto LABEL_121;
LABEL_76:
  if ((*(_WORD *)&v35 & 0x2000) != 0)
  {
LABEL_77:
    *(_DWORD *)(v6 + 72) = self->_cachedPeersCapOther;
    *(_QWORD *)(v6 + 240) |= 0x2000uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $A7F8C9E9D45357ACF4091D1997306C1B has;
  uint64_t v7;
  NSMutableArray *states;
  uint64_t v9;
  NSMutableArray *services;
  uint64_t v11;
  NSMutableArray *hopCountHistograms;
  NSMutableArray *parentRssiHistograms;
  $A7F8C9E9D45357ACF4091D1997306C1B v14;
  uint64_t v15;
  AWDWifiAwdlD2dMigrationStats *d2dMigrationStats;
  uint64_t v17;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_QWORD *)a3 + 30);
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_234;
    }
    else if ((v7 & 4) != 0)
    {
LABEL_234:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
    {
      if ((v7 & 0x40000000000) == 0 || self->_selfInfraChannel != *((_DWORD *)a3 + 54))
        goto LABEL_234;
    }
    else if ((v7 & 0x40000000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
    {
      if ((v7 & 0x4000000000) == 0 || self->_peerInfraChannel != *((_DWORD *)a3 + 50))
        goto LABEL_234;
    }
    else if ((v7 & 0x4000000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
    {
      if ((v7 & 0x2000000000) == 0 || self->_numOfPeers != *((_DWORD *)a3 + 47))
        goto LABEL_234;
    }
    else if ((v7 & 0x2000000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
    {
      if ((v7 & 0x1000000000) == 0 || self->_numOfCachedPeers != *((_DWORD *)a3 + 46))
        goto LABEL_234;
    }
    else if ((v7 & 0x1000000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_cachedPeersOn24G != *((_DWORD *)a3 + 21))
        goto LABEL_234;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_cachedPeersOn5G != *((_DWORD *)a3 + 22))
        goto LABEL_234;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_cachedPeersOnDFS != *((_DWORD *)a3 + 23))
        goto LABEL_234;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_cachedPeersNotAssociated != *((_DWORD *)a3 + 20))
        goto LABEL_234;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_flags != *((_DWORD *)a3 + 34))
        goto LABEL_234;
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_ifPacketFailures != *((_DWORD *)a3 + 38))
        goto LABEL_234;
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_ifRxBytes != *((_DWORD *)a3 + 39))
        goto LABEL_234;
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_ifTxBytes != *((_DWORD *)a3 + 40))
        goto LABEL_234;
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_appRxBytes != *((_DWORD *)a3 + 12))
        goto LABEL_234;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_appTxBytes != *((_DWORD *)a3 + 13))
        goto LABEL_234;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
    {
      if ((v7 & 0x10000000000) == 0 || self->_periodInMinutes != *((_DWORD *)a3 + 52))
        goto LABEL_234;
    }
    else if ((v7 & 0x10000000000) != 0)
    {
      goto LABEL_234;
    }
    states = self->_states;
    if ((unint64_t)states | *((_QWORD *)a3 + 29))
    {
      v5 = -[NSMutableArray isEqual:](states, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v9 = *((_QWORD *)a3 + 30);
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v9 & 1) == 0 || self->_noServiceIdleTime != *((_QWORD *)a3 + 1))
        goto LABEL_234;
    }
    else if ((v9 & 1) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v9 & 0x400) == 0 || self->_browseAddTotalCount != *((_DWORD *)a3 + 15))
        goto LABEL_234;
    }
    else if ((v9 & 0x400) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v9 & 0x200) == 0 || self->_browseAddFilteredCount != *((_DWORD *)a3 + 14))
        goto LABEL_234;
    }
    else if ((v9 & 0x200) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v9 & 0x1000) == 0 || self->_browseDeleteTotalCount != *((_DWORD *)a3 + 17))
        goto LABEL_234;
    }
    else if ((v9 & 0x1000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v9 & 0x800) == 0 || self->_browseDeleteFilteredCount != *((_DWORD *)a3 + 16))
        goto LABEL_234;
    }
    else if ((v9 & 0x800) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_advertiseAddTotalCount != *((_DWORD *)a3 + 9))
        goto LABEL_234;
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_advertiseAddFilteredCount != *((_DWORD *)a3 + 8))
        goto LABEL_234;
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_advertiseDeleteTotalCount != *((_DWORD *)a3 + 11))
        goto LABEL_234;
    }
    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_advertiseDeleteFilteredCount != *((_DWORD *)a3 + 10))
        goto LABEL_234;
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_234;
    }
    services = self->_services;
    if ((unint64_t)services | *((_QWORD *)a3 + 28))
    {
      v5 = -[NSMutableArray isEqual:](services, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v11 = *((_QWORD *)a3 + 30);
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v11 & 0x100000) == 0 || self->_cachedPeersSameInfra != *((_DWORD *)a3 + 25))
        goto LABEL_234;
    }
    else if ((v11 & 0x100000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v11 & 0x4000) == 0 || self->_cachedPeersDifferentInfra != *((_DWORD *)a3 + 19))
        goto LABEL_234;
    }
    else if ((v11 & 0x4000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v11 & 0x1000000) == 0 || self->_dfspCSAReceivedFromPeer != *((_DWORD *)a3 + 31))
        goto LABEL_234;
    }
    else if ((v11 & 0x1000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v11 & 0x800000) == 0 || self->_dfspCSAReceivedFromAP != *((_DWORD *)a3 + 30))
        goto LABEL_234;
    }
    else if ((v11 & 0x800000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v11 & 0x4000000) == 0 || self->_dfspSuspect != *((_DWORD *)a3 + 33))
        goto LABEL_234;
    }
    else if ((v11 & 0x4000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v11 & 0x2000000) == 0 || self->_dfspResume != *((_DWORD *)a3 + 32))
        goto LABEL_234;
    }
    else if ((v11 & 0x2000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v11 & 0x200000) == 0 || self->_dfspAirplayConnected != *((_DWORD *)a3 + 28))
        goto LABEL_234;
    }
    else if ((v11 & 0x200000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v11 & 0x400000) == 0 || self->_dfspAirplayFailed != *((_DWORD *)a3 + 29))
        goto LABEL_234;
    }
    else if ((v11 & 0x400000) != 0)
    {
      goto LABEL_234;
    }
    hopCountHistograms = self->_hopCountHistograms;
    if (!((unint64_t)hopCountHistograms | *((_QWORD *)a3 + 18))
      || (v5 = -[NSMutableArray isEqual:](hopCountHistograms, "isEqual:")) != 0)
    {
      parentRssiHistograms = self->_parentRssiHistograms;
      if (!((unint64_t)parentRssiHistograms | *((_QWORD *)a3 + 24))
        || (v5 = -[NSMutableArray isEqual:](parentRssiHistograms, "isEqual:")) != 0)
      {
        v14 = self->_has;
        v15 = *((_QWORD *)a3 + 30);
        if ((*(_BYTE *)&v14 & 2) != 0)
        {
          if ((v15 & 2) == 0 || self->_syncChangesCount != *((_QWORD *)a3 + 2))
            goto LABEL_234;
        }
        else if ((v15 & 2) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_DWORD *)&v14 & 0x80000000) != 0)
        {
          if ((v15 & 0x80000000) == 0 || self->_numAirplaySessions != *((_DWORD *)a3 + 41))
            goto LABEL_234;
        }
        else if ((v15 & 0x80000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_QWORD *)&v14 & 0x100000000) != 0)
        {
          if ((v15 & 0x100000000) == 0 || self->_numDynSdbAirplayAllowed != *((_DWORD *)a3 + 42))
            goto LABEL_234;
        }
        else if ((v15 & 0x100000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_QWORD *)&v14 & 0x200000000) != 0)
        {
          if ((v15 & 0x200000000) == 0 || self->_numDynSdbEntrySuccess != *((_DWORD *)a3 + 43))
            goto LABEL_234;
        }
        else if ((v15 & 0x200000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_QWORD *)&v14 & 0x400000000) != 0)
        {
          if ((v15 & 0x400000000) == 0 || self->_numDynSdbExitDueToRate != *((_DWORD *)a3 + 44))
            goto LABEL_234;
        }
        else if ((v15 & 0x400000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_QWORD *)&v14 & 0x800000000) != 0)
        {
          if ((v15 & 0x800000000) == 0 || self->_numDynSdbReEntrySuccess != *((_DWORD *)a3 + 45))
            goto LABEL_234;
        }
        else if ((v15 & 0x800000000) != 0)
        {
          goto LABEL_234;
        }
        d2dMigrationStats = self->_d2dMigrationStats;
        if ((unint64_t)d2dMigrationStats | *((_QWORD *)a3 + 13))
        {
          v5 = -[AWDWifiAwdlD2dMigrationStats isEqual:](d2dMigrationStats, "isEqual:");
          if (!v5)
            return v5;
          v14 = self->_has;
        }
        v17 = *((_QWORD *)a3 + 30);
        if ((*(_QWORD *)&v14 & 0x80000000000) != 0)
        {
          if ((v17 & 0x80000000000) == 0 || self->_selfInfraChannelFlags != *((_DWORD *)a3 + 55))
            goto LABEL_234;
        }
        else if ((v17 & 0x80000000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_QWORD *)&v14 & 0x8000000000) != 0)
        {
          if ((v17 & 0x8000000000) == 0 || self->_peerInfraChannelFlags != *((_DWORD *)a3 + 51))
            goto LABEL_234;
        }
        else if ((v17 & 0x8000000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_DWORD *)&v14 & 0x80000) != 0)
        {
          if ((v17 & 0x80000) == 0 || self->_cachedPeersOnOther != *((_DWORD *)a3 + 24))
            goto LABEL_234;
        }
        else if ((v17 & 0x80000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_QWORD *)&v14 & 0x20000000000) != 0)
        {
          if ((v17 & 0x20000000000) == 0 || self->_selfCapOther != *((_DWORD *)a3 + 53))
            goto LABEL_234;
        }
        else if ((v17 & 0x20000000000) != 0)
        {
          goto LABEL_234;
        }
        LOBYTE(v5) = (*((_QWORD *)a3 + 30) & 0x2000) == 0;
        if ((*(_WORD *)&v14 & 0x2000) != 0)
        {
          if ((v17 & 0x2000) == 0 || self->_cachedPeersCapOther != *((_DWORD *)a3 + 18))
            goto LABEL_234;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $A7F8C9E9D45357ACF4091D1997306C1B has;
  $A7F8C9E9D45357ACF4091D1997306C1B v4;
  $A7F8C9E9D45357ACF4091D1997306C1B v5;
  uint64_t v6;
  $A7F8C9E9D45357ACF4091D1997306C1B v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  $A7F8C9E9D45357ACF4091D1997306C1B v15;
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
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  if ((*(_BYTE *)&has & 4) != 0)
  {
    v57 = 2654435761u * self->_timestamp;
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
    {
LABEL_3:
      v56 = 2654435761 * self->_selfInfraChannel;
      if ((*(_QWORD *)&has & 0x4000000000) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else
  {
    v57 = 0;
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
      goto LABEL_3;
  }
  v56 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_4:
    v55 = 2654435761 * self->_peerInfraChannel;
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v55 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
LABEL_5:
    v54 = 2654435761 * self->_numOfPeers;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v54 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_6:
    v53 = 2654435761 * self->_numOfCachedPeers;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v53 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_7:
    v52 = 2654435761 * self->_cachedPeersOn24G;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v52 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_8:
    v51 = 2654435761 * self->_cachedPeersOn5G;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v51 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_9:
    v50 = 2654435761 * self->_cachedPeersOnDFS;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v50 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_10:
    v49 = 2654435761 * self->_cachedPeersNotAssociated;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  v49 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_11:
    v48 = 2654435761 * self->_flags;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  v48 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_12:
    v47 = 2654435761 * self->_ifPacketFailures;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  v47 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_13:
    v46 = 2654435761 * self->_ifRxBytes;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  v46 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_14:
    v45 = 2654435761 * self->_ifTxBytes;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  v45 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_15:
    v44 = 2654435761 * self->_appRxBytes;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_16;
LABEL_32:
    v43 = 0;
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_31:
  v44 = 0;
  if ((*(_WORD *)&has & 0x100) == 0)
    goto LABEL_32;
LABEL_16:
  v43 = 2654435761 * self->_appTxBytes;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
LABEL_17:
    v42 = 2654435761 * self->_periodInMinutes;
    goto LABEL_34;
  }
LABEL_33:
  v42 = 0;
LABEL_34:
  v41 = -[NSMutableArray hash](self->_states, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
    v40 = 2654435761u * self->_noServiceIdleTime;
    if ((*(_WORD *)&v4 & 0x400) != 0)
    {
LABEL_36:
      v39 = 2654435761 * self->_browseAddTotalCount;
      if ((*(_WORD *)&v4 & 0x200) != 0)
        goto LABEL_37;
      goto LABEL_46;
    }
  }
  else
  {
    v40 = 0;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_36;
  }
  v39 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_37:
    v38 = 2654435761 * self->_browseAddFilteredCount;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_38;
    goto LABEL_47;
  }
LABEL_46:
  v38 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_38:
    v37 = 2654435761 * self->_browseDeleteTotalCount;
    if ((*(_WORD *)&v4 & 0x800) != 0)
      goto LABEL_39;
    goto LABEL_48;
  }
LABEL_47:
  v37 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_39:
    v36 = 2654435761 * self->_browseDeleteFilteredCount;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_40;
    goto LABEL_49;
  }
LABEL_48:
  v36 = 0;
  if ((*(_BYTE *)&v4 & 0x10) != 0)
  {
LABEL_40:
    v35 = 2654435761 * self->_advertiseAddTotalCount;
    if ((*(_BYTE *)&v4 & 8) != 0)
      goto LABEL_41;
    goto LABEL_50;
  }
LABEL_49:
  v35 = 0;
  if ((*(_BYTE *)&v4 & 8) != 0)
  {
LABEL_41:
    v34 = 2654435761 * self->_advertiseAddFilteredCount;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_42;
LABEL_51:
    v33 = 0;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
      goto LABEL_43;
    goto LABEL_52;
  }
LABEL_50:
  v34 = 0;
  if ((*(_BYTE *)&v4 & 0x40) == 0)
    goto LABEL_51;
LABEL_42:
  v33 = 2654435761 * self->_advertiseDeleteTotalCount;
  if ((*(_BYTE *)&v4 & 0x20) != 0)
  {
LABEL_43:
    v32 = 2654435761 * self->_advertiseDeleteFilteredCount;
    goto LABEL_53;
  }
LABEL_52:
  v32 = 0;
LABEL_53:
  v31 = -[NSMutableArray hash](self->_services, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    v30 = 2654435761 * self->_cachedPeersSameInfra;
    if ((*(_WORD *)&v5 & 0x4000) != 0)
    {
LABEL_55:
      v29 = 2654435761 * self->_cachedPeersDifferentInfra;
      if ((*(_DWORD *)&v5 & 0x1000000) != 0)
        goto LABEL_56;
      goto LABEL_64;
    }
  }
  else
  {
    v30 = 0;
    if ((*(_WORD *)&v5 & 0x4000) != 0)
      goto LABEL_55;
  }
  v29 = 0;
  if ((*(_DWORD *)&v5 & 0x1000000) != 0)
  {
LABEL_56:
    v28 = 2654435761 * self->_dfspCSAReceivedFromPeer;
    if ((*(_DWORD *)&v5 & 0x800000) != 0)
      goto LABEL_57;
    goto LABEL_65;
  }
LABEL_64:
  v28 = 0;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
LABEL_57:
    v27 = 2654435761 * self->_dfspCSAReceivedFromAP;
    if ((*(_DWORD *)&v5 & 0x4000000) != 0)
      goto LABEL_58;
    goto LABEL_66;
  }
LABEL_65:
  v27 = 0;
  if ((*(_DWORD *)&v5 & 0x4000000) != 0)
  {
LABEL_58:
    v26 = 2654435761 * self->_dfspSuspect;
    if ((*(_DWORD *)&v5 & 0x2000000) != 0)
      goto LABEL_59;
    goto LABEL_67;
  }
LABEL_66:
  v26 = 0;
  if ((*(_DWORD *)&v5 & 0x2000000) != 0)
  {
LABEL_59:
    v25 = 2654435761 * self->_dfspResume;
    if ((*(_DWORD *)&v5 & 0x200000) != 0)
      goto LABEL_60;
LABEL_68:
    v24 = 0;
    if ((*(_DWORD *)&v5 & 0x400000) != 0)
      goto LABEL_61;
    goto LABEL_69;
  }
LABEL_67:
  v25 = 0;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
    goto LABEL_68;
LABEL_60:
  v24 = 2654435761 * self->_dfspAirplayConnected;
  if ((*(_DWORD *)&v5 & 0x400000) != 0)
  {
LABEL_61:
    v23 = 2654435761 * self->_dfspAirplayFailed;
    goto LABEL_70;
  }
LABEL_69:
  v23 = 0;
LABEL_70:
  v22 = -[NSMutableArray hash](self->_hopCountHistograms, "hash");
  v6 = -[NSMutableArray hash](self->_parentRssiHistograms, "hash");
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) != 0)
  {
    v8 = 2654435761u * self->_syncChangesCount;
    if ((*(_DWORD *)&v7 & 0x80000000) != 0)
    {
LABEL_72:
      v9 = 2654435761 * self->_numAirplaySessions;
      if ((*(_QWORD *)&v7 & 0x100000000) != 0)
        goto LABEL_73;
      goto LABEL_79;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_DWORD *)&v7 & 0x80000000) != 0)
      goto LABEL_72;
  }
  v9 = 0;
  if ((*(_QWORD *)&v7 & 0x100000000) != 0)
  {
LABEL_73:
    v10 = 2654435761 * self->_numDynSdbAirplayAllowed;
    if ((*(_QWORD *)&v7 & 0x200000000) != 0)
      goto LABEL_74;
    goto LABEL_80;
  }
LABEL_79:
  v10 = 0;
  if ((*(_QWORD *)&v7 & 0x200000000) != 0)
  {
LABEL_74:
    v11 = 2654435761 * self->_numDynSdbEntrySuccess;
    if ((*(_QWORD *)&v7 & 0x400000000) != 0)
      goto LABEL_75;
LABEL_81:
    v12 = 0;
    if ((*(_QWORD *)&v7 & 0x800000000) != 0)
      goto LABEL_76;
    goto LABEL_82;
  }
LABEL_80:
  v11 = 0;
  if ((*(_QWORD *)&v7 & 0x400000000) == 0)
    goto LABEL_81;
LABEL_75:
  v12 = 2654435761 * self->_numDynSdbExitDueToRate;
  if ((*(_QWORD *)&v7 & 0x800000000) != 0)
  {
LABEL_76:
    v13 = 2654435761 * self->_numDynSdbReEntrySuccess;
    goto LABEL_83;
  }
LABEL_82:
  v13 = 0;
LABEL_83:
  v14 = -[AWDWifiAwdlD2dMigrationStats hash](self->_d2dMigrationStats, "hash");
  v15 = self->_has;
  if ((*(_QWORD *)&v15 & 0x80000000000) != 0)
  {
    v16 = 2654435761 * self->_selfInfraChannelFlags;
    if ((*(_QWORD *)&v15 & 0x8000000000) != 0)
    {
LABEL_85:
      v17 = 2654435761 * self->_peerInfraChannelFlags;
      if ((*(_DWORD *)&v15 & 0x80000) != 0)
        goto LABEL_86;
      goto LABEL_91;
    }
  }
  else
  {
    v16 = 0;
    if ((*(_QWORD *)&v15 & 0x8000000000) != 0)
      goto LABEL_85;
  }
  v17 = 0;
  if ((*(_DWORD *)&v15 & 0x80000) != 0)
  {
LABEL_86:
    v18 = 2654435761 * self->_cachedPeersOnOther;
    if ((*(_QWORD *)&v15 & 0x20000000000) != 0)
      goto LABEL_87;
LABEL_92:
    v19 = 0;
    if ((*(_WORD *)&v15 & 0x2000) != 0)
      goto LABEL_88;
LABEL_93:
    v20 = 0;
    return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v41 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
  }
LABEL_91:
  v18 = 0;
  if ((*(_QWORD *)&v15 & 0x20000000000) == 0)
    goto LABEL_92;
LABEL_87:
  v19 = 2654435761 * self->_selfCapOther;
  if ((*(_WORD *)&v15 & 0x2000) == 0)
    goto LABEL_93;
LABEL_88:
  v20 = 2654435761 * self->_cachedPeersCapOther;
  return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v41 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  uint64_t v28;
  AWDWifiAwdlD2dMigrationStats *d2dMigrationStats;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_QWORD *)&self->_has |= 4uLL;
    v5 = *((_QWORD *)a3 + 30);
    if ((v5 & 0x40000000000) == 0)
    {
LABEL_3:
      if ((v5 & 0x4000000000) == 0)
        goto LABEL_4;
      goto LABEL_77;
    }
  }
  else if ((v5 & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_selfInfraChannel = *((_DWORD *)a3 + 54);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x2000000000) == 0)
      goto LABEL_5;
    goto LABEL_78;
  }
LABEL_77:
  self->_peerInfraChannel = *((_DWORD *)a3 + 50);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_6;
    goto LABEL_79;
  }
LABEL_78:
  self->_numOfPeers = *((_DWORD *)a3 + 47);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_80;
  }
LABEL_79:
  self->_numOfCachedPeers = *((_DWORD *)a3 + 46);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x10000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_81;
  }
LABEL_80:
  self->_cachedPeersOn24G = *((_DWORD *)a3 + 21);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x20000) == 0)
  {
LABEL_8:
    if ((v5 & 0x40000) == 0)
      goto LABEL_9;
    goto LABEL_82;
  }
LABEL_81:
  self->_cachedPeersOn5G = *((_DWORD *)a3 + 22);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x40000) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_83;
  }
LABEL_82:
  self->_cachedPeersOnDFS = *((_DWORD *)a3 + 23);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_11;
    goto LABEL_84;
  }
LABEL_83:
  self->_cachedPeersNotAssociated = *((_DWORD *)a3 + 20);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_85;
  }
LABEL_84:
  self->_flags = *((_DWORD *)a3 + 34);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_13;
    goto LABEL_86;
  }
LABEL_85:
  self->_ifPacketFailures = *((_DWORD *)a3 + 38);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_87;
  }
LABEL_86:
  self->_ifRxBytes = *((_DWORD *)a3 + 39);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_88;
  }
LABEL_87:
  self->_ifTxBytes = *((_DWORD *)a3 + 40);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_89;
  }
LABEL_88:
  self->_appRxBytes = *((_DWORD *)a3 + 12);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *((_QWORD *)a3 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_89:
  self->_appTxBytes = *((_DWORD *)a3 + 13);
  *(_QWORD *)&self->_has |= 0x100uLL;
  if ((*((_QWORD *)a3 + 30) & 0x10000000000) != 0)
  {
LABEL_17:
    self->_periodInMinutes = *((_DWORD *)a3 + 52);
    *(_QWORD *)&self->_has |= 0x10000000000uLL;
  }
LABEL_18:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 29);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        -[AWDWiFiMetricsManagerAwdlUsage addStates:](self, "addStates:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v8);
  }
  v11 = *((_QWORD *)a3 + 30);
  if ((v11 & 1) != 0)
  {
    self->_noServiceIdleTime = *((_QWORD *)a3 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
    v11 = *((_QWORD *)a3 + 30);
    if ((v11 & 0x400) == 0)
    {
LABEL_27:
      if ((v11 & 0x200) == 0)
        goto LABEL_28;
      goto LABEL_93;
    }
  }
  else if ((v11 & 0x400) == 0)
  {
    goto LABEL_27;
  }
  self->_browseAddTotalCount = *((_DWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v11 = *((_QWORD *)a3 + 30);
  if ((v11 & 0x200) == 0)
  {
LABEL_28:
    if ((v11 & 0x1000) == 0)
      goto LABEL_29;
    goto LABEL_94;
  }
LABEL_93:
  self->_browseAddFilteredCount = *((_DWORD *)a3 + 14);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v11 = *((_QWORD *)a3 + 30);
  if ((v11 & 0x1000) == 0)
  {
LABEL_29:
    if ((v11 & 0x800) == 0)
      goto LABEL_30;
    goto LABEL_95;
  }
LABEL_94:
  self->_browseDeleteTotalCount = *((_DWORD *)a3 + 17);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v11 = *((_QWORD *)a3 + 30);
  if ((v11 & 0x800) == 0)
  {
LABEL_30:
    if ((v11 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_96;
  }
LABEL_95:
  self->_browseDeleteFilteredCount = *((_DWORD *)a3 + 16);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v11 = *((_QWORD *)a3 + 30);
  if ((v11 & 0x10) == 0)
  {
LABEL_31:
    if ((v11 & 8) == 0)
      goto LABEL_32;
    goto LABEL_97;
  }
LABEL_96:
  self->_advertiseAddTotalCount = *((_DWORD *)a3 + 9);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v11 = *((_QWORD *)a3 + 30);
  if ((v11 & 8) == 0)
  {
LABEL_32:
    if ((v11 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_98;
  }
LABEL_97:
  self->_advertiseAddFilteredCount = *((_DWORD *)a3 + 8);
  *(_QWORD *)&self->_has |= 8uLL;
  v11 = *((_QWORD *)a3 + 30);
  if ((v11 & 0x40) == 0)
  {
LABEL_33:
    if ((v11 & 0x20) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_98:
  self->_advertiseDeleteTotalCount = *((_DWORD *)a3 + 11);
  *(_QWORD *)&self->_has |= 0x40uLL;
  if ((*((_QWORD *)a3 + 30) & 0x20) != 0)
  {
LABEL_34:
    self->_advertiseDeleteFilteredCount = *((_DWORD *)a3 + 10);
    *(_QWORD *)&self->_has |= 0x20uLL;
  }
LABEL_35:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 28);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        -[AWDWiFiMetricsManagerAwdlUsage addServices:](self, "addServices:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v14);
  }
  v17 = *((_QWORD *)a3 + 30);
  if ((v17 & 0x100000) != 0)
  {
    self->_cachedPeersSameInfra = *((_DWORD *)a3 + 25);
    *(_QWORD *)&self->_has |= 0x100000uLL;
    v17 = *((_QWORD *)a3 + 30);
    if ((v17 & 0x4000) == 0)
    {
LABEL_44:
      if ((v17 & 0x1000000) == 0)
        goto LABEL_45;
      goto LABEL_102;
    }
  }
  else if ((v17 & 0x4000) == 0)
  {
    goto LABEL_44;
  }
  self->_cachedPeersDifferentInfra = *((_DWORD *)a3 + 19);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v17 = *((_QWORD *)a3 + 30);
  if ((v17 & 0x1000000) == 0)
  {
LABEL_45:
    if ((v17 & 0x800000) == 0)
      goto LABEL_46;
    goto LABEL_103;
  }
LABEL_102:
  self->_dfspCSAReceivedFromPeer = *((_DWORD *)a3 + 31);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v17 = *((_QWORD *)a3 + 30);
  if ((v17 & 0x800000) == 0)
  {
LABEL_46:
    if ((v17 & 0x4000000) == 0)
      goto LABEL_47;
    goto LABEL_104;
  }
LABEL_103:
  self->_dfspCSAReceivedFromAP = *((_DWORD *)a3 + 30);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v17 = *((_QWORD *)a3 + 30);
  if ((v17 & 0x4000000) == 0)
  {
LABEL_47:
    if ((v17 & 0x2000000) == 0)
      goto LABEL_48;
    goto LABEL_105;
  }
LABEL_104:
  self->_dfspSuspect = *((_DWORD *)a3 + 33);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v17 = *((_QWORD *)a3 + 30);
  if ((v17 & 0x2000000) == 0)
  {
LABEL_48:
    if ((v17 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_106;
  }
LABEL_105:
  self->_dfspResume = *((_DWORD *)a3 + 32);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v17 = *((_QWORD *)a3 + 30);
  if ((v17 & 0x200000) == 0)
  {
LABEL_49:
    if ((v17 & 0x400000) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
LABEL_106:
  self->_dfspAirplayConnected = *((_DWORD *)a3 + 28);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  if ((*((_QWORD *)a3 + 30) & 0x400000) != 0)
  {
LABEL_50:
    self->_dfspAirplayFailed = *((_DWORD *)a3 + 29);
    *(_QWORD *)&self->_has |= 0x400000uLL;
  }
LABEL_51:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = (void *)*((_QWORD *)a3 + 18);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        -[AWDWiFiMetricsManagerAwdlUsage addHopCountHistogram:](self, "addHopCountHistogram:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v20);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = (void *)*((_QWORD *)a3 + 24);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v33;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v23);
        -[AWDWiFiMetricsManagerAwdlUsage addParentRssiHistogram:](self, "addParentRssiHistogram:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * m));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    }
    while (v25);
  }
  v28 = *((_QWORD *)a3 + 30);
  if ((v28 & 2) != 0)
  {
    self->_syncChangesCount = *((_QWORD *)a3 + 2);
    *(_QWORD *)&self->_has |= 2uLL;
    v28 = *((_QWORD *)a3 + 30);
    if ((v28 & 0x80000000) == 0)
    {
LABEL_67:
      if ((v28 & 0x100000000) == 0)
        goto LABEL_68;
      goto LABEL_110;
    }
  }
  else if ((v28 & 0x80000000) == 0)
  {
    goto LABEL_67;
  }
  self->_numAirplaySessions = *((_DWORD *)a3 + 41);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v28 = *((_QWORD *)a3 + 30);
  if ((v28 & 0x100000000) == 0)
  {
LABEL_68:
    if ((v28 & 0x200000000) == 0)
      goto LABEL_69;
    goto LABEL_111;
  }
LABEL_110:
  self->_numDynSdbAirplayAllowed = *((_DWORD *)a3 + 42);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v28 = *((_QWORD *)a3 + 30);
  if ((v28 & 0x200000000) == 0)
  {
LABEL_69:
    if ((v28 & 0x400000000) == 0)
      goto LABEL_70;
    goto LABEL_112;
  }
LABEL_111:
  self->_numDynSdbEntrySuccess = *((_DWORD *)a3 + 43);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v28 = *((_QWORD *)a3 + 30);
  if ((v28 & 0x400000000) == 0)
  {
LABEL_70:
    if ((v28 & 0x800000000) == 0)
      goto LABEL_72;
    goto LABEL_71;
  }
LABEL_112:
  self->_numDynSdbExitDueToRate = *((_DWORD *)a3 + 44);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  if ((*((_QWORD *)a3 + 30) & 0x800000000) != 0)
  {
LABEL_71:
    self->_numDynSdbReEntrySuccess = *((_DWORD *)a3 + 45);
    *(_QWORD *)&self->_has |= 0x800000000uLL;
  }
LABEL_72:
  d2dMigrationStats = self->_d2dMigrationStats;
  v30 = *((_QWORD *)a3 + 13);
  if (d2dMigrationStats)
  {
    if (v30)
      -[AWDWifiAwdlD2dMigrationStats mergeFrom:](d2dMigrationStats, "mergeFrom:");
  }
  else if (v30)
  {
    -[AWDWiFiMetricsManagerAwdlUsage setD2dMigrationStats:](self, "setD2dMigrationStats:");
  }
  v31 = *((_QWORD *)a3 + 30);
  if ((v31 & 0x80000000000) != 0)
  {
    self->_selfInfraChannelFlags = *((_DWORD *)a3 + 55);
    *(_QWORD *)&self->_has |= 0x80000000000uLL;
    v31 = *((_QWORD *)a3 + 30);
    if ((v31 & 0x8000000000) == 0)
    {
LABEL_118:
      if ((v31 & 0x80000) == 0)
        goto LABEL_119;
      goto LABEL_125;
    }
  }
  else if ((v31 & 0x8000000000) == 0)
  {
    goto LABEL_118;
  }
  self->_peerInfraChannelFlags = *((_DWORD *)a3 + 51);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v31 = *((_QWORD *)a3 + 30);
  if ((v31 & 0x80000) == 0)
  {
LABEL_119:
    if ((v31 & 0x20000000000) == 0)
      goto LABEL_120;
    goto LABEL_126;
  }
LABEL_125:
  self->_cachedPeersOnOther = *((_DWORD *)a3 + 24);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v31 = *((_QWORD *)a3 + 30);
  if ((v31 & 0x20000000000) == 0)
  {
LABEL_120:
    if ((v31 & 0x2000) == 0)
      return;
    goto LABEL_121;
  }
LABEL_126:
  self->_selfCapOther = *((_DWORD *)a3 + 53);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  if ((*((_QWORD *)a3 + 30) & 0x2000) == 0)
    return;
LABEL_121:
  self->_cachedPeersCapOther = *((_DWORD *)a3 + 18);
  *(_QWORD *)&self->_has |= 0x2000uLL;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)selfInfraChannel
{
  return self->_selfInfraChannel;
}

- (unsigned)peerInfraChannel
{
  return self->_peerInfraChannel;
}

- (unsigned)numOfPeers
{
  return self->_numOfPeers;
}

- (unsigned)numOfCachedPeers
{
  return self->_numOfCachedPeers;
}

- (unsigned)cachedPeersOn24G
{
  return self->_cachedPeersOn24G;
}

- (unsigned)cachedPeersOn5G
{
  return self->_cachedPeersOn5G;
}

- (unsigned)cachedPeersOnDFS
{
  return self->_cachedPeersOnDFS;
}

- (unsigned)cachedPeersNotAssociated
{
  return self->_cachedPeersNotAssociated;
}

- (unsigned)flags
{
  return self->_flags;
}

- (unsigned)ifPacketFailures
{
  return self->_ifPacketFailures;
}

- (unsigned)ifRxBytes
{
  return self->_ifRxBytes;
}

- (unsigned)ifTxBytes
{
  return self->_ifTxBytes;
}

- (unsigned)appRxBytes
{
  return self->_appRxBytes;
}

- (unsigned)appTxBytes
{
  return self->_appTxBytes;
}

- (unsigned)periodInMinutes
{
  return self->_periodInMinutes;
}

- (NSMutableArray)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (unint64_t)noServiceIdleTime
{
  return self->_noServiceIdleTime;
}

- (unsigned)browseAddTotalCount
{
  return self->_browseAddTotalCount;
}

- (unsigned)browseAddFilteredCount
{
  return self->_browseAddFilteredCount;
}

- (unsigned)browseDeleteTotalCount
{
  return self->_browseDeleteTotalCount;
}

- (unsigned)browseDeleteFilteredCount
{
  return self->_browseDeleteFilteredCount;
}

- (unsigned)advertiseAddTotalCount
{
  return self->_advertiseAddTotalCount;
}

- (unsigned)advertiseAddFilteredCount
{
  return self->_advertiseAddFilteredCount;
}

- (unsigned)advertiseDeleteTotalCount
{
  return self->_advertiseDeleteTotalCount;
}

- (unsigned)advertiseDeleteFilteredCount
{
  return self->_advertiseDeleteFilteredCount;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (unsigned)cachedPeersSameInfra
{
  return self->_cachedPeersSameInfra;
}

- (unsigned)cachedPeersDifferentInfra
{
  return self->_cachedPeersDifferentInfra;
}

- (unsigned)dfspCSAReceivedFromPeer
{
  return self->_dfspCSAReceivedFromPeer;
}

- (unsigned)dfspCSAReceivedFromAP
{
  return self->_dfspCSAReceivedFromAP;
}

- (unsigned)dfspSuspect
{
  return self->_dfspSuspect;
}

- (unsigned)dfspResume
{
  return self->_dfspResume;
}

- (unsigned)dfspAirplayConnected
{
  return self->_dfspAirplayConnected;
}

- (unsigned)dfspAirplayFailed
{
  return self->_dfspAirplayFailed;
}

- (NSMutableArray)hopCountHistograms
{
  return self->_hopCountHistograms;
}

- (void)setHopCountHistograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSMutableArray)parentRssiHistograms
{
  return self->_parentRssiHistograms;
}

- (void)setParentRssiHistograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (unint64_t)syncChangesCount
{
  return self->_syncChangesCount;
}

- (unsigned)numAirplaySessions
{
  return self->_numAirplaySessions;
}

- (unsigned)numDynSdbAirplayAllowed
{
  return self->_numDynSdbAirplayAllowed;
}

- (unsigned)numDynSdbEntrySuccess
{
  return self->_numDynSdbEntrySuccess;
}

- (unsigned)numDynSdbExitDueToRate
{
  return self->_numDynSdbExitDueToRate;
}

- (unsigned)numDynSdbReEntrySuccess
{
  return self->_numDynSdbReEntrySuccess;
}

- (AWDWifiAwdlD2dMigrationStats)d2dMigrationStats
{
  return self->_d2dMigrationStats;
}

- (void)setD2dMigrationStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (unsigned)selfInfraChannelFlags
{
  return self->_selfInfraChannelFlags;
}

- (unsigned)peerInfraChannelFlags
{
  return self->_peerInfraChannelFlags;
}

- (unsigned)cachedPeersOnOther
{
  return self->_cachedPeersOnOther;
}

- (unsigned)selfCapOther
{
  return self->_selfCapOther;
}

- (unsigned)cachedPeersCapOther
{
  return self->_cachedPeersCapOther;
}

@end
