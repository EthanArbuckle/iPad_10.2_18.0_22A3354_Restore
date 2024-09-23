@implementation AWDWiFiP2PAirplayMetrics

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiP2PAirplayMetrics setPeerRSSIs:](self, "setPeerRSSIs:", 0);
  -[AWDWiFiP2PAirplayMetrics setAvgCCASocialChannels:](self, "setAvgCCASocialChannels:", 0);
  -[AWDWiFiP2PAirplayMetrics setAvgCCASelfInfraChannels:](self, "setAvgCCASelfInfraChannels:", 0);
  -[AWDWiFiP2PAirplayMetrics setAvgCCAPeerInfraChannels:](self, "setAvgCCAPeerInfraChannels:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiP2PAirplayMetrics;
  -[AWDWiFiP2PAirplayMetrics dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTotalDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_totalDuration = a3;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTotalDuration
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setServerModeDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_serverModeDuration = a3;
}

- (void)setHasServerModeDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasServerModeDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setClientModeDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_clientModeDuration = a3;
}

- (void)setHasClientModeDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasClientModeDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSplitModeDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_splitModeDuration = a3;
}

- (void)setHasSplitModeDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSplitModeDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTxBytes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasRxBytes
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setStartingRSSI:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_startingRSSI = a3;
}

- (void)setHasStartingRSSI:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasStartingRSSI
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setAwdlVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_awdlVersion = a3;
}

- (void)setHasAwdlVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAwdlVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTotalPeerCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_totalPeerCount = a3;
}

- (void)setHasTotalPeerCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTotalPeerCount
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setRoutablePeerCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_routablePeerCount = a3;
}

- (void)setHasRoutablePeerCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRoutablePeerCount
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setInfraDisconnectedCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_infraDisconnectedCount = a3;
}

- (void)setHasInfraDisconnectedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasInfraDisconnectedCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSequenceNumberNotUpdatedCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_sequenceNumberNotUpdatedCount = a3;
}

- (void)setHasSequenceNumberNotUpdatedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSequenceNumberNotUpdatedCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMissingAWStartEventCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_missingAWStartEventCount = a3;
}

- (void)setHasMissingAWStartEventCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMissingAWStartEventCount
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setPsfEnabledCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_psfEnabledCount = a3;
}

- (void)setHasPsfEnabledCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPsfEnabledCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSelfInfraChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_selfInfraChannel = a3;
}

- (void)setHasSelfInfraChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSelfInfraChannel
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setPeerInfraChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_peerInfraChannel = a3;
}

- (void)setHasPeerInfraChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPeerInfraChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSenderPlatform:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_senderPlatform = a3;
}

- (void)setHasSenderPlatform:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSenderPlatform
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCsaToDfsChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_csaToDfsChannel = a3;
}

- (void)setHasCsaToDfsChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasCsaToDfsChannel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCsaDuringDfspMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_csaDuringDfspMode = a3;
}

- (void)setHasCsaDuringDfspMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasCsaDuringDfspMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setDfsProxyMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_dfsProxyMode = a3;
}

- (void)setHasDfsProxyMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasDfsProxyMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setSelfIsSDB:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_selfIsSDB = a3;
}

- (void)setHasSelfIsSDB:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasSelfIsSDB
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setPeerIsSDB:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_peerIsSDB = a3;
}

- (void)setHasPeerIsSDB:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasPeerIsSDB
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setInRetroMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_inRetroMode = a3;
}

- (void)setHasInRetroMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasInRetroMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)clearPeerRSSIs
{
  -[NSMutableArray removeAllObjects](self->_peerRSSIs, "removeAllObjects");
}

- (void)addPeerRSSI:(id)a3
{
  NSMutableArray *peerRSSIs;

  peerRSSIs = self->_peerRSSIs;
  if (!peerRSSIs)
  {
    peerRSSIs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_peerRSSIs = peerRSSIs;
  }
  -[NSMutableArray addObject:](peerRSSIs, "addObject:", a3);
}

- (unint64_t)peerRSSIsCount
{
  return -[NSMutableArray count](self->_peerRSSIs, "count");
}

- (id)peerRSSIAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_peerRSSIs, "objectAtIndex:", a3);
}

+ (Class)peerRSSIType
{
  return (Class)objc_opt_class();
}

- (void)clearAvgCCASocialChannels
{
  -[NSMutableArray removeAllObjects](self->_avgCCASocialChannels, "removeAllObjects");
}

- (void)addAvgCCASocialChannel:(id)a3
{
  NSMutableArray *avgCCASocialChannels;

  avgCCASocialChannels = self->_avgCCASocialChannels;
  if (!avgCCASocialChannels)
  {
    avgCCASocialChannels = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_avgCCASocialChannels = avgCCASocialChannels;
  }
  -[NSMutableArray addObject:](avgCCASocialChannels, "addObject:", a3);
}

- (unint64_t)avgCCASocialChannelsCount
{
  return -[NSMutableArray count](self->_avgCCASocialChannels, "count");
}

- (id)avgCCASocialChannelAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_avgCCASocialChannels, "objectAtIndex:", a3);
}

+ (Class)avgCCASocialChannelType
{
  return (Class)objc_opt_class();
}

- (void)clearAvgCCASelfInfraChannels
{
  -[NSMutableArray removeAllObjects](self->_avgCCASelfInfraChannels, "removeAllObjects");
}

- (void)addAvgCCASelfInfraChannel:(id)a3
{
  NSMutableArray *avgCCASelfInfraChannels;

  avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
  if (!avgCCASelfInfraChannels)
  {
    avgCCASelfInfraChannels = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_avgCCASelfInfraChannels = avgCCASelfInfraChannels;
  }
  -[NSMutableArray addObject:](avgCCASelfInfraChannels, "addObject:", a3);
}

- (unint64_t)avgCCASelfInfraChannelsCount
{
  return -[NSMutableArray count](self->_avgCCASelfInfraChannels, "count");
}

- (id)avgCCASelfInfraChannelAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_avgCCASelfInfraChannels, "objectAtIndex:", a3);
}

+ (Class)avgCCASelfInfraChannelType
{
  return (Class)objc_opt_class();
}

- (void)clearAvgCCAPeerInfraChannels
{
  -[NSMutableArray removeAllObjects](self->_avgCCAPeerInfraChannels, "removeAllObjects");
}

- (void)addAvgCCAPeerInfraChannel:(id)a3
{
  NSMutableArray *avgCCAPeerInfraChannels;

  avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
  if (!avgCCAPeerInfraChannels)
  {
    avgCCAPeerInfraChannels = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_avgCCAPeerInfraChannels = avgCCAPeerInfraChannels;
  }
  -[NSMutableArray addObject:](avgCCAPeerInfraChannels, "addObject:", a3);
}

- (unint64_t)avgCCAPeerInfraChannelsCount
{
  return -[NSMutableArray count](self->_avgCCAPeerInfraChannels, "count");
}

- (id)avgCCAPeerInfraChannelAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_avgCCAPeerInfraChannels, "objectAtIndex:", a3);
}

+ (Class)avgCCAPeerInfraChannelType
{
  return (Class)objc_opt_class();
}

- (void)setSelfInfraChannelFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_selfInfraChannelFlags = a3;
}

- (void)setHasSelfInfraChannelFlags:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSelfInfraChannelFlags
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPeerInfraChannelFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_peerInfraChannelFlags = a3;
}

- (void)setHasPeerInfraChannelFlags:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPeerInfraChannelFlags
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRoamOutOfOtherCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_roamOutOfOtherCount = a3;
}

- (void)setHasRoamOutOfOtherCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRoamOutOfOtherCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRoamOutOfOtherSuccess:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_roamOutOfOtherSuccess = a3;
}

- (void)setHasRoamOutOfOtherSuccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRoamOutOfOtherSuccess
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRoamOutOfOtherFailure:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_roamOutOfOtherFailure = a3;
}

- (void)setHasRoamOutOfOtherFailure:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRoamOutOfOtherFailure
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setForceRoamHasChannelsCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_forceRoamHasChannelsCnt = a3;
}

- (void)setHasForceRoamHasChannelsCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasForceRoamHasChannelsCnt
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setForceRoamHasNoChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_forceRoamHasNoChannel = a3;
}

- (void)setHasForceRoamHasNoChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasForceRoamHasNoChannel
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiP2PAirplayMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiP2PAirplayMetrics description](&v3, sel_description), -[AWDWiFiP2PAirplayMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $9AAF52838BB36F993592C58FF7F8D143 has;
  void *v5;
  NSMutableArray *peerRSSIs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *avgCCASocialChannels;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *avgCCASelfInfraChannels;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  NSMutableArray *avgCCAPeerInfraChannels;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  $9AAF52838BB36F993592C58FF7F8D143 v29;
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
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_4;
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalDuration), CFSTR("totalDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_serverModeDuration), CFSTR("serverModeDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_clientModeDuration), CFSTR("clientModeDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_splitModeDuration), CFSTR("splitModeDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txBytes), CFSTR("txBytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxBytes), CFSTR("rxBytes"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_startingRSSI), CFSTR("startingRSSI"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_awdlVersion), CFSTR("awdlVersion"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalPeerCount), CFSTR("totalPeerCount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_routablePeerCount), CFSTR("routablePeerCount"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_infraDisconnectedCount), CFSTR("infraDisconnectedCount"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sequenceNumberNotUpdatedCount), CFSTR("sequenceNumberNotUpdatedCount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_missingAWStartEventCount), CFSTR("missingAWStartEventCount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_psfEnabledCount), CFSTR("psfEnabledCount"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_selfInfraChannel), CFSTR("selfInfraChannel"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerInfraChannel), CFSTR("peerInfraChannel"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_20;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_senderPlatform), CFSTR("senderPlatform"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_21;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_csaToDfsChannel), CFSTR("csaToDfsChannel"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_22;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_csaDuringDfspMode), CFSTR("csaDuringDfspMode"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_23;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dfsProxyMode), CFSTR("dfsProxyMode"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_24;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_selfIsSDB), CFSTR("selfIsSDB"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_93:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_peerIsSDB), CFSTR("peerIsSDB"));
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
LABEL_25:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_inRetroMode), CFSTR("inRetroMode"));
LABEL_26:
  if (-[NSMutableArray count](self->_peerRSSIs, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_peerRSSIs, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    peerRSSIs = self->_peerRSSIs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerRSSIs, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(peerRSSIs);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerRSSIs, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("peerRSSI"));

  }
  if (-[NSMutableArray count](self->_avgCCASocialChannels, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_avgCCASocialChannels, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    avgCCASocialChannels = self->_avgCCASocialChannels;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASocialChannels, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(avgCCASocialChannels);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASocialChannels, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("avgCCASocialChannel"));

  }
  if (-[NSMutableArray count](self->_avgCCASelfInfraChannels, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_avgCCASelfInfraChannels, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASelfInfraChannels, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(avgCCASelfInfraChannels);
          objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASelfInfraChannels, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      }
      while (v20);
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("avgCCASelfInfraChannel"));

  }
  if (-[NSMutableArray count](self->_avgCCAPeerInfraChannels, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_avgCCAPeerInfraChannels, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCAPeerInfraChannels, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(avgCCAPeerInfraChannels);
          objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * m), "dictionaryRepresentation"));
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCAPeerInfraChannels, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
      }
      while (v26);
    }
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("avgCCAPeerInfraChannel"));

  }
  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x20000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_selfInfraChannelFlags), CFSTR("selfInfraChannelFlags"));
    v29 = self->_has;
    if ((*(_WORD *)&v29 & 0x400) == 0)
    {
LABEL_64:
      if ((*(_WORD *)&v29 & 0x1000) == 0)
        goto LABEL_65;
      goto LABEL_97;
    }
  }
  else if ((*(_WORD *)&v29 & 0x400) == 0)
  {
    goto LABEL_64;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerInfraChannelFlags), CFSTR("peerInfraChannelFlags"));
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
LABEL_65:
    if ((*(_WORD *)&v29 & 0x4000) == 0)
      goto LABEL_66;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_roamOutOfOtherCount), CFSTR("roamOutOfOtherCount"));
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x4000) == 0)
  {
LABEL_66:
    if ((*(_WORD *)&v29 & 0x2000) == 0)
      goto LABEL_67;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_roamOutOfOtherSuccess), CFSTR("roamOutOfOtherSuccess"));
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x2000) == 0)
  {
LABEL_67:
    if ((*(_BYTE *)&v29 & 0x20) == 0)
      goto LABEL_68;
LABEL_100:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_forceRoamHasChannelsCnt), CFSTR("forceRoamHasChannelsCnt"));
    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_69;
  }
LABEL_99:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_roamOutOfOtherFailure), CFSTR("roamOutOfOtherFailure"));
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x20) != 0)
    goto LABEL_100;
LABEL_68:
  if ((*(_BYTE *)&v29 & 0x40) != 0)
LABEL_69:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_forceRoamHasNoChannel), CFSTR("forceRoamHasNoChannel"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiP2PAirplayMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $9AAF52838BB36F993592C58FF7F8D143 has;
  NSMutableArray *peerRSSIs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *avgCCASocialChannels;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *avgCCASelfInfraChannels;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *avgCCAPeerInfraChannels;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  $9AAF52838BB36F993592C58FF7F8D143 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
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
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_4;
      goto LABEL_65;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_20;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_21;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_22;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_23;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_24;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_85:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
LABEL_25:
    PBDataWriterWriteBOOLField();
LABEL_26:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  peerRSSIs = self->_peerRSSIs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerRSSIs, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(peerRSSIs);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerRSSIs, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v7);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  avgCCASocialChannels = self->_avgCCASocialChannels;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASocialChannels, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(avgCCASocialChannels);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASocialChannels, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v12);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASelfInfraChannels, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(avgCCASelfInfraChannels);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASelfInfraChannels, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v17);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCAPeerInfraChannels, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(avgCCAPeerInfraChannels);
        PBDataWriterWriteSubmessage();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCAPeerInfraChannels, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v22);
  }
  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x20000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x400) == 0)
    {
LABEL_56:
      if ((*(_WORD *)&v25 & 0x1000) == 0)
        goto LABEL_57;
      goto LABEL_89;
    }
  }
  else if ((*(_WORD *)&v25 & 0x400) == 0)
  {
    goto LABEL_56;
  }
  PBDataWriterWriteUint32Field();
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x1000) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v25 & 0x4000) == 0)
      goto LABEL_58;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x4000) == 0)
  {
LABEL_58:
    if ((*(_WORD *)&v25 & 0x2000) == 0)
      goto LABEL_59;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x2000) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&v25 & 0x20) == 0)
      goto LABEL_60;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x20) == 0)
  {
LABEL_60:
    if ((*(_BYTE *)&v25 & 0x40) == 0)
      return;
    goto LABEL_61;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
    return;
LABEL_61:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $9AAF52838BB36F993592C58FF7F8D143 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  $9AAF52838BB36F993592C58FF7F8D143 v18;

  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_DWORD *)a3 + 40) |= 2u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_4;
      goto LABEL_53;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 36) = self->_totalDuration;
  *((_DWORD *)a3 + 40) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 33) = self->_serverModeDuration;
  *((_DWORD *)a3 + 40) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 15) = self->_clientModeDuration;
  *((_DWORD *)a3 + 40) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 34) = self->_splitModeDuration;
  *((_DWORD *)a3 + 40) |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)a3 + 3) = self->_txBytes;
  *((_DWORD *)a3 + 40) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)a3 + 1) = self->_rxBytes;
  *((_DWORD *)a3 + 40) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 35) = self->_startingRSSI;
  *((_DWORD *)a3 + 40) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 14) = self->_awdlVersion;
  *((_DWORD *)a3 + 40) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 37) = self->_totalPeerCount;
  *((_DWORD *)a3 + 40) |= 0x1000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 28) = self->_routablePeerCount;
  *((_DWORD *)a3 + 40) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 18) = self->_infraDisconnectedCount;
  *((_DWORD *)a3 + 40) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)a3 + 32) = self->_sequenceNumberNotUpdatedCount;
  *((_DWORD *)a3 + 40) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 19) = self->_missingAWStartEventCount;
  *((_DWORD *)a3 + 40) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 24) = self->_psfEnabledCount;
  *((_DWORD *)a3 + 40) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 29) = self->_selfInfraChannel;
  *((_DWORD *)a3 + 40) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 20) = self->_peerInfraChannel;
  *((_DWORD *)a3 + 40) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_20;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 31) = self->_senderPlatform;
  *((_DWORD *)a3 + 40) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_21;
    goto LABEL_70;
  }
LABEL_69:
  *((_BYTE *)a3 + 153) = self->_csaToDfsChannel;
  *((_DWORD *)a3 + 40) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_22;
    goto LABEL_71;
  }
LABEL_70:
  *((_BYTE *)a3 + 152) = self->_csaDuringDfspMode;
  *((_DWORD *)a3 + 40) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_23;
    goto LABEL_72;
  }
LABEL_71:
  *((_BYTE *)a3 + 154) = self->_dfsProxyMode;
  *((_DWORD *)a3 + 40) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_24;
LABEL_73:
    *((_BYTE *)a3 + 156) = self->_peerIsSDB;
    *((_DWORD *)a3 + 40) |= 0x20000000u;
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_72:
  *((_BYTE *)a3 + 157) = self->_selfIsSDB;
  *((_DWORD *)a3 + 40) |= 0x40000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
    goto LABEL_73;
LABEL_24:
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_25:
    *((_BYTE *)a3 + 155) = self->_inRetroMode;
    *((_DWORD *)a3 + 40) |= 0x10000000u;
  }
LABEL_26:
  if (-[AWDWiFiP2PAirplayMetrics peerRSSIsCount](self, "peerRSSIsCount"))
  {
    objc_msgSend(a3, "clearPeerRSSIs");
    v6 = -[AWDWiFiP2PAirplayMetrics peerRSSIsCount](self, "peerRSSIsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addPeerRSSI:", -[AWDWiFiP2PAirplayMetrics peerRSSIAtIndex:](self, "peerRSSIAtIndex:", i));
    }
  }
  if (-[AWDWiFiP2PAirplayMetrics avgCCASocialChannelsCount](self, "avgCCASocialChannelsCount"))
  {
    objc_msgSend(a3, "clearAvgCCASocialChannels");
    v9 = -[AWDWiFiP2PAirplayMetrics avgCCASocialChannelsCount](self, "avgCCASocialChannelsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addAvgCCASocialChannel:", -[AWDWiFiP2PAirplayMetrics avgCCASocialChannelAtIndex:](self, "avgCCASocialChannelAtIndex:", j));
    }
  }
  if (-[AWDWiFiP2PAirplayMetrics avgCCASelfInfraChannelsCount](self, "avgCCASelfInfraChannelsCount"))
  {
    objc_msgSend(a3, "clearAvgCCASelfInfraChannels");
    v12 = -[AWDWiFiP2PAirplayMetrics avgCCASelfInfraChannelsCount](self, "avgCCASelfInfraChannelsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addAvgCCASelfInfraChannel:", -[AWDWiFiP2PAirplayMetrics avgCCASelfInfraChannelAtIndex:](self, "avgCCASelfInfraChannelAtIndex:", k));
    }
  }
  if (-[AWDWiFiP2PAirplayMetrics avgCCAPeerInfraChannelsCount](self, "avgCCAPeerInfraChannelsCount"))
  {
    objc_msgSend(a3, "clearAvgCCAPeerInfraChannels");
    v15 = -[AWDWiFiP2PAirplayMetrics avgCCAPeerInfraChannelsCount](self, "avgCCAPeerInfraChannelsCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(a3, "addAvgCCAPeerInfraChannel:", -[AWDWiFiP2PAirplayMetrics avgCCAPeerInfraChannelAtIndex:](self, "avgCCAPeerInfraChannelAtIndex:", m));
    }
  }
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000) != 0)
  {
    *((_DWORD *)a3 + 30) = self->_selfInfraChannelFlags;
    *((_DWORD *)a3 + 40) |= 0x20000u;
    v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x400) == 0)
    {
LABEL_44:
      if ((*(_WORD *)&v18 & 0x1000) == 0)
        goto LABEL_45;
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v18 & 0x400) == 0)
  {
    goto LABEL_44;
  }
  *((_DWORD *)a3 + 21) = self->_peerInfraChannelFlags;
  *((_DWORD *)a3 + 40) |= 0x400u;
  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x1000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v18 & 0x4000) == 0)
      goto LABEL_46;
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 25) = self->_roamOutOfOtherCount;
  *((_DWORD *)a3 + 40) |= 0x1000u;
  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v18 & 0x2000) == 0)
      goto LABEL_47;
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)a3 + 27) = self->_roamOutOfOtherSuccess;
  *((_DWORD *)a3 + 40) |= 0x4000u;
  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x2000) == 0)
  {
LABEL_47:
    if ((*(_BYTE *)&v18 & 0x20) == 0)
      goto LABEL_48;
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)a3 + 26) = self->_roamOutOfOtherFailure;
  *((_DWORD *)a3 + 40) |= 0x2000u;
  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 0x20) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&v18 & 0x40) == 0)
      return;
    goto LABEL_49;
  }
LABEL_80:
  *((_DWORD *)a3 + 16) = self->_forceRoamHasChannelsCnt;
  *((_DWORD *)a3 + 40) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
    return;
LABEL_49:
  *((_DWORD *)a3 + 17) = self->_forceRoamHasNoChannel;
  *((_DWORD *)a3 + 40) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _DWORD *v6;
  $9AAF52838BB36F993592C58FF7F8D143 has;
  NSMutableArray *peerRSSIs;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *avgCCASocialChannels;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *avgCCASelfInfraChannels;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *avgCCAPeerInfraChannels;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  $9AAF52838BB36F993592C58FF7F8D143 v32;
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
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_DWORD *)v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_DWORD *)(v5 + 160) |= 2u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_4;
      goto LABEL_65;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 144) = self->_totalDuration;
  *(_DWORD *)(v5 + 160) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v5 + 132) = self->_serverModeDuration;
  *(_DWORD *)(v5 + 160) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v5 + 60) = self->_clientModeDuration;
  *(_DWORD *)(v5 + 160) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v5 + 136) = self->_splitModeDuration;
  *(_DWORD *)(v5 + 160) |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_69;
  }
LABEL_68:
  *(_QWORD *)(v5 + 24) = self->_txBytes;
  *(_DWORD *)(v5 + 160) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_70;
  }
LABEL_69:
  *(_QWORD *)(v5 + 8) = self->_rxBytes;
  *(_DWORD *)(v5 + 160) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v5 + 140) = self->_startingRSSI;
  *(_DWORD *)(v5 + 160) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v5 + 56) = self->_awdlVersion;
  *(_DWORD *)(v5 + 160) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 148) = self->_totalPeerCount;
  *(_DWORD *)(v5 + 160) |= 0x1000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 112) = self->_routablePeerCount;
  *(_DWORD *)(v5 + 160) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 72) = self->_infraDisconnectedCount;
  *(_DWORD *)(v5 + 160) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v5 + 128) = self->_sequenceNumberNotUpdatedCount;
  *(_DWORD *)(v5 + 160) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 76) = self->_missingAWStartEventCount;
  *(_DWORD *)(v5 + 160) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 96) = self->_psfEnabledCount;
  *(_DWORD *)(v5 + 160) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v5 + 116) = self->_selfInfraChannel;
  *(_DWORD *)(v5 + 160) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 80) = self->_peerInfraChannel;
  *(_DWORD *)(v5 + 160) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_20;
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v5 + 124) = self->_senderPlatform;
  *(_DWORD *)(v5 + 160) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_21;
    goto LABEL_82;
  }
LABEL_81:
  *(_BYTE *)(v5 + 153) = self->_csaToDfsChannel;
  *(_DWORD *)(v5 + 160) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_22;
    goto LABEL_83;
  }
LABEL_82:
  *(_BYTE *)(v5 + 152) = self->_csaDuringDfspMode;
  *(_DWORD *)(v5 + 160) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_23;
    goto LABEL_84;
  }
LABEL_83:
  *(_BYTE *)(v5 + 154) = self->_dfsProxyMode;
  *(_DWORD *)(v5 + 160) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_24;
    goto LABEL_85;
  }
LABEL_84:
  *(_BYTE *)(v5 + 157) = self->_selfIsSDB;
  *(_DWORD *)(v5 + 160) |= 0x40000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_85:
  *(_BYTE *)(v5 + 156) = self->_peerIsSDB;
  *(_DWORD *)(v5 + 160) |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_25:
    *(_BYTE *)(v5 + 155) = self->_inRetroMode;
    *(_DWORD *)(v5 + 160) |= 0x10000000u;
  }
LABEL_26:
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  peerRSSIs = self->_peerRSSIs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerRSSIs, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(peerRSSIs);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addPeerRSSI:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerRSSIs, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v10);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  avgCCASocialChannels = self->_avgCCASocialChannels;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASocialChannels, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(avgCCASocialChannels);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addAvgCCASocialChannel:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASocialChannels, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v16);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASelfInfraChannels, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(avgCCASelfInfraChannels);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend(v6, "addAvgCCASelfInfraChannel:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCASelfInfraChannels, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v22);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCAPeerInfraChannels, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(avgCCAPeerInfraChannels);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend(v6, "addAvgCCAPeerInfraChannel:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](avgCCAPeerInfraChannels, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    }
    while (v28);
  }
  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x20000) != 0)
  {
    v6[30] = self->_selfInfraChannelFlags;
    v6[40] |= 0x20000u;
    v32 = self->_has;
    if ((*(_WORD *)&v32 & 0x400) == 0)
    {
LABEL_56:
      if ((*(_WORD *)&v32 & 0x1000) == 0)
        goto LABEL_57;
      goto LABEL_89;
    }
  }
  else if ((*(_WORD *)&v32 & 0x400) == 0)
  {
    goto LABEL_56;
  }
  v6[21] = self->_peerInfraChannelFlags;
  v6[40] |= 0x400u;
  v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x1000) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v32 & 0x4000) == 0)
      goto LABEL_58;
    goto LABEL_90;
  }
LABEL_89:
  v6[25] = self->_roamOutOfOtherCount;
  v6[40] |= 0x1000u;
  v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x4000) == 0)
  {
LABEL_58:
    if ((*(_WORD *)&v32 & 0x2000) == 0)
      goto LABEL_59;
    goto LABEL_91;
  }
LABEL_90:
  v6[27] = self->_roamOutOfOtherSuccess;
  v6[40] |= 0x4000u;
  v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x2000) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&v32 & 0x20) == 0)
      goto LABEL_60;
LABEL_92:
    v6[16] = self->_forceRoamHasChannelsCnt;
    v6[40] |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      return v6;
    goto LABEL_61;
  }
LABEL_91:
  v6[26] = self->_roamOutOfOtherFailure;
  v6[40] |= 0x2000u;
  v32 = self->_has;
  if ((*(_BYTE *)&v32 & 0x20) != 0)
    goto LABEL_92;
LABEL_60:
  if ((*(_BYTE *)&v32 & 0x40) != 0)
  {
LABEL_61:
    v6[17] = self->_forceRoamHasNoChannel;
    v6[40] |= 0x40u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $9AAF52838BB36F993592C58FF7F8D143 has;
  int v7;
  NSMutableArray *peerRSSIs;
  NSMutableArray *avgCCASocialChannels;
  NSMutableArray *avgCCASelfInfraChannels;
  NSMutableArray *avgCCAPeerInfraChannels;
  $9AAF52838BB36F993592C58FF7F8D143 v12;
  int v13;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *((_DWORD *)a3 + 40);
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
      goto LABEL_136;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_totalDuration != *((_DWORD *)a3 + 36))
      goto LABEL_136;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_serverModeDuration != *((_DWORD *)a3 + 33))
      goto LABEL_136;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_clientModeDuration != *((_DWORD *)a3 + 15))
      goto LABEL_136;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_splitModeDuration != *((_DWORD *)a3 + 34))
      goto LABEL_136;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_txBytes != *((_QWORD *)a3 + 3))
      goto LABEL_136;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_rxBytes != *((_QWORD *)a3 + 1))
      goto LABEL_136;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_startingRSSI != *((_DWORD *)a3 + 35))
      goto LABEL_136;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_awdlVersion != *((_DWORD *)a3 + 14))
      goto LABEL_136;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_totalPeerCount != *((_DWORD *)a3 + 37))
      goto LABEL_136;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_routablePeerCount != *((_DWORD *)a3 + 28))
      goto LABEL_136;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_infraDisconnectedCount != *((_DWORD *)a3 + 18))
      goto LABEL_136;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_sequenceNumberNotUpdatedCount != *((_DWORD *)a3 + 32))
      goto LABEL_136;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_missingAWStartEventCount != *((_DWORD *)a3 + 19))
      goto LABEL_136;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_psfEnabledCount != *((_DWORD *)a3 + 24))
      goto LABEL_136;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_selfInfraChannel != *((_DWORD *)a3 + 29))
      goto LABEL_136;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_peerInfraChannel != *((_DWORD *)a3 + 20))
      goto LABEL_136;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_senderPlatform != *((_DWORD *)a3 + 31))
      goto LABEL_136;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0)
      goto LABEL_136;
    if (self->_csaToDfsChannel)
    {
      if (!*((_BYTE *)a3 + 153))
        goto LABEL_136;
    }
    else if (*((_BYTE *)a3 + 153))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0)
      goto LABEL_136;
    if (self->_csaDuringDfspMode)
    {
      if (!*((_BYTE *)a3 + 152))
        goto LABEL_136;
    }
    else if (*((_BYTE *)a3 + 152))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0)
      goto LABEL_136;
    if (self->_dfsProxyMode)
    {
      if (!*((_BYTE *)a3 + 154))
        goto LABEL_136;
    }
    else if (*((_BYTE *)a3 + 154))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0)
      goto LABEL_136;
    if (self->_selfIsSDB)
    {
      if (!*((_BYTE *)a3 + 157))
        goto LABEL_136;
    }
    else if (*((_BYTE *)a3 + 157))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0)
      goto LABEL_136;
    if (self->_peerIsSDB)
    {
      if (!*((_BYTE *)a3 + 156))
        goto LABEL_136;
    }
    else if (*((_BYTE *)a3 + 156))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0)
      goto LABEL_136;
    if (self->_inRetroMode)
    {
      if (!*((_BYTE *)a3 + 155))
        goto LABEL_136;
    }
    else if (*((_BYTE *)a3 + 155))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_136;
  }
  peerRSSIs = self->_peerRSSIs;
  if ((unint64_t)peerRSSIs | *((_QWORD *)a3 + 11))
  {
    v5 = -[NSMutableArray isEqual:](peerRSSIs, "isEqual:");
    if (!v5)
      return v5;
  }
  avgCCASocialChannels = self->_avgCCASocialChannels;
  if ((unint64_t)avgCCASocialChannels | *((_QWORD *)a3 + 6))
  {
    v5 = -[NSMutableArray isEqual:](avgCCASocialChannels, "isEqual:");
    if (!v5)
      return v5;
  }
  avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
  if ((unint64_t)avgCCASelfInfraChannels | *((_QWORD *)a3 + 5))
  {
    v5 = -[NSMutableArray isEqual:](avgCCASelfInfraChannels, "isEqual:");
    if (!v5)
      return v5;
  }
  avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
  if ((unint64_t)avgCCAPeerInfraChannels | *((_QWORD *)a3 + 4))
  {
    v5 = -[NSMutableArray isEqual:](avgCCAPeerInfraChannels, "isEqual:");
    if (!v5)
      return v5;
  }
  v12 = self->_has;
  v13 = *((_DWORD *)a3 + 40);
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
    if ((v13 & 0x20000) == 0 || self->_selfInfraChannelFlags != *((_DWORD *)a3 + 30))
      goto LABEL_136;
  }
  else if ((v13 & 0x20000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_peerInfraChannelFlags != *((_DWORD *)a3 + 21))
      goto LABEL_136;
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    if ((v13 & 0x1000) == 0 || self->_roamOutOfOtherCount != *((_DWORD *)a3 + 25))
      goto LABEL_136;
  }
  else if ((v13 & 0x1000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    if ((v13 & 0x4000) == 0 || self->_roamOutOfOtherSuccess != *((_DWORD *)a3 + 27))
      goto LABEL_136;
  }
  else if ((v13 & 0x4000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    if ((v13 & 0x2000) == 0 || self->_roamOutOfOtherFailure != *((_DWORD *)a3 + 26))
      goto LABEL_136;
  }
  else if ((v13 & 0x2000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_forceRoamHasChannelsCnt != *((_DWORD *)a3 + 16))
      goto LABEL_136;
    goto LABEL_180;
  }
  if ((v13 & 0x20) != 0)
  {
LABEL_136:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_180:
  LOBYTE(v5) = (*((_DWORD *)a3 + 40) & 0x40) == 0;
  if ((*(_BYTE *)&v12 & 0x40) == 0)
    return v5;
  if ((v13 & 0x40) == 0 || self->_forceRoamHasNoChannel != *((_DWORD *)a3 + 17))
    goto LABEL_136;
  LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  $9AAF52838BB36F993592C58FF7F8D143 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $9AAF52838BB36F993592C58FF7F8D143 v13;
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
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    v40 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
LABEL_3:
      v39 = 2654435761 * self->_totalDuration;
      if ((*(_DWORD *)&has & 0x100000) != 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else
  {
    v40 = 0;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_3;
  }
  v39 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_4:
    v38 = 2654435761 * self->_serverModeDuration;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  v38 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_5:
    v37 = 2654435761 * self->_clientModeDuration;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  v37 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_6:
    v36 = 2654435761 * self->_splitModeDuration;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  v36 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_7:
    v35 = 2654435761u * self->_txBytes;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  v35 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_8:
    v34 = 2654435761u * self->_rxBytes;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_9:
    v33 = 2654435761 * self->_startingRSSI;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  v33 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_10:
    v32 = 2654435761 * self->_awdlVersion;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_11:
    v31 = 2654435761 * self->_totalPeerCount;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  v31 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_12:
    v30 = 2654435761 * self->_routablePeerCount;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  v30 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_13:
    v29 = 2654435761 * self->_infraDisconnectedCount;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  v29 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_14:
    v28 = 2654435761 * self->_sequenceNumberNotUpdatedCount;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  v28 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_15:
    v27 = 2654435761 * self->_missingAWStartEventCount;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  v27 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_16:
    v26 = 2654435761 * self->_psfEnabledCount;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_17:
    v25 = 2654435761 * self->_selfInfraChannel;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  v25 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_18:
    v24 = 2654435761 * self->_peerInfraChannel;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_19:
    v23 = 2654435761 * self->_senderPlatform;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_20:
    v22 = 2654435761 * self->_csaToDfsChannel;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_21:
    v4 = 2654435761 * self->_csaDuringDfspMode;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_22:
    v5 = 2654435761 * self->_dfsProxyMode;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_23:
    v6 = 2654435761 * self->_selfIsSDB;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_24;
LABEL_48:
    v7 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_47:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
    goto LABEL_48;
LABEL_24:
  v7 = 2654435761 * self->_peerIsSDB;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_25:
    v8 = 2654435761 * self->_inRetroMode;
    goto LABEL_50;
  }
LABEL_49:
  v8 = 0;
LABEL_50:
  v9 = -[NSMutableArray hash](self->_peerRSSIs, "hash");
  v10 = -[NSMutableArray hash](self->_avgCCASocialChannels, "hash");
  v11 = -[NSMutableArray hash](self->_avgCCASelfInfraChannels, "hash");
  v12 = -[NSMutableArray hash](self->_avgCCAPeerInfraChannels, "hash");
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
    v14 = 2654435761 * self->_selfInfraChannelFlags;
    if ((*(_WORD *)&v13 & 0x400) != 0)
    {
LABEL_52:
      v15 = 2654435761 * self->_peerInfraChannelFlags;
      if ((*(_WORD *)&v13 & 0x1000) != 0)
        goto LABEL_53;
      goto LABEL_60;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_WORD *)&v13 & 0x400) != 0)
      goto LABEL_52;
  }
  v15 = 0;
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
LABEL_53:
    v16 = 2654435761 * self->_roamOutOfOtherCount;
    if ((*(_WORD *)&v13 & 0x4000) != 0)
      goto LABEL_54;
    goto LABEL_61;
  }
LABEL_60:
  v16 = 0;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
LABEL_54:
    v17 = 2654435761 * self->_roamOutOfOtherSuccess;
    if ((*(_WORD *)&v13 & 0x2000) != 0)
      goto LABEL_55;
    goto LABEL_62;
  }
LABEL_61:
  v17 = 0;
  if ((*(_WORD *)&v13 & 0x2000) != 0)
  {
LABEL_55:
    v18 = 2654435761 * self->_roamOutOfOtherFailure;
    if ((*(_BYTE *)&v13 & 0x20) != 0)
      goto LABEL_56;
LABEL_63:
    v19 = 0;
    if ((*(_BYTE *)&v13 & 0x40) != 0)
      goto LABEL_57;
LABEL_64:
    v20 = 0;
    return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
  }
LABEL_62:
  v18 = 0;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
    goto LABEL_63;
LABEL_56:
  v19 = 2654435761 * self->_forceRoamHasChannelsCnt;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
    goto LABEL_64;
LABEL_57:
  v20 = 2654435761 * self->_forceRoamHasNoChannel;
  return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  int v26;
  __int128 v27;
  __int128 v28;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_DWORD *)&self->_has |= 2u;
    v5 = *((_DWORD *)a3 + 40);
    if ((v5 & 0x800000) == 0)
    {
LABEL_3:
      if ((v5 & 0x100000) == 0)
        goto LABEL_4;
      goto LABEL_65;
    }
  }
  else if ((v5 & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  self->_totalDuration = *((_DWORD *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x100000) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_66;
  }
LABEL_65:
  self->_serverModeDuration = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_67;
  }
LABEL_66:
  self->_clientModeDuration = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x200000) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_68;
  }
LABEL_67:
  self->_splitModeDuration = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_69;
  }
LABEL_68:
  self->_txBytes = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_70;
  }
LABEL_69:
  self->_rxBytes = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x400000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_71;
  }
LABEL_70:
  self->_startingRSSI = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_72;
  }
LABEL_71:
  self->_awdlVersion = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_73;
  }
LABEL_72:
  self->_totalPeerCount = *((_DWORD *)a3 + 37);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x8000) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_74;
  }
LABEL_73:
  self->_routablePeerCount = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_75;
  }
LABEL_74:
  self->_infraDisconnectedCount = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x80000) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_76;
  }
LABEL_75:
  self->_sequenceNumberNotUpdatedCount = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_77;
  }
LABEL_76:
  self->_missingAWStartEventCount = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x800) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_78;
  }
LABEL_77:
  self->_psfEnabledCount = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((v5 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_79;
  }
LABEL_78:
  self->_selfInfraChannel = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x200) == 0)
  {
LABEL_18:
    if ((v5 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_80;
  }
LABEL_79:
  self->_peerInfraChannel = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x40000) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_20;
    goto LABEL_81;
  }
LABEL_80:
  self->_senderPlatform = *((_DWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_21;
    goto LABEL_82;
  }
LABEL_81:
  self->_csaToDfsChannel = *((_BYTE *)a3 + 153);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_22;
    goto LABEL_83;
  }
LABEL_82:
  self->_csaDuringDfspMode = *((_BYTE *)a3 + 152);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_23;
    goto LABEL_84;
  }
LABEL_83:
  self->_dfsProxyMode = *((_BYTE *)a3 + 154);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_24;
    goto LABEL_85;
  }
LABEL_84:
  self->_selfIsSDB = *((_BYTE *)a3 + 157);
  *(_DWORD *)&self->_has |= 0x40000000u;
  v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_85:
  self->_peerIsSDB = *((_BYTE *)a3 + 156);
  *(_DWORD *)&self->_has |= 0x20000000u;
  if ((*((_DWORD *)a3 + 40) & 0x10000000) != 0)
  {
LABEL_25:
    self->_inRetroMode = *((_BYTE *)a3 + 155);
    *(_DWORD *)&self->_has |= 0x10000000u;
  }
LABEL_26:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 11);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        -[AWDWiFiP2PAirplayMetrics addPeerRSSI:](self, "addPeerRSSI:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v8);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 6);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        -[AWDWiFiP2PAirplayMetrics addAvgCCASocialChannel:](self, "addAvgCCASocialChannel:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v13);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = (void *)*((_QWORD *)a3 + 5);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        -[AWDWiFiP2PAirplayMetrics addAvgCCASelfInfraChannel:](self, "addAvgCCASelfInfraChannel:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v18);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = (void *)*((_QWORD *)a3 + 4);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        -[AWDWiFiP2PAirplayMetrics addAvgCCAPeerInfraChannel:](self, "addAvgCCAPeerInfraChannel:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v23);
  }
  v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x20000) != 0)
  {
    self->_selfInfraChannelFlags = *((_DWORD *)a3 + 30);
    *(_DWORD *)&self->_has |= 0x20000u;
    v26 = *((_DWORD *)a3 + 40);
    if ((v26 & 0x400) == 0)
    {
LABEL_56:
      if ((v26 & 0x1000) == 0)
        goto LABEL_57;
      goto LABEL_89;
    }
  }
  else if ((v26 & 0x400) == 0)
  {
    goto LABEL_56;
  }
  self->_peerInfraChannelFlags = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x400u;
  v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x1000) == 0)
  {
LABEL_57:
    if ((v26 & 0x4000) == 0)
      goto LABEL_58;
    goto LABEL_90;
  }
LABEL_89:
  self->_roamOutOfOtherCount = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x1000u;
  v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x4000) == 0)
  {
LABEL_58:
    if ((v26 & 0x2000) == 0)
      goto LABEL_59;
    goto LABEL_91;
  }
LABEL_90:
  self->_roamOutOfOtherSuccess = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x4000u;
  v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x2000) == 0)
  {
LABEL_59:
    if ((v26 & 0x20) == 0)
      goto LABEL_60;
    goto LABEL_92;
  }
LABEL_91:
  self->_roamOutOfOtherFailure = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x2000u;
  v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x20) == 0)
  {
LABEL_60:
    if ((v26 & 0x40) == 0)
      return;
    goto LABEL_61;
  }
LABEL_92:
  self->_forceRoamHasChannelsCnt = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)a3 + 40) & 0x40) == 0)
    return;
LABEL_61:
  self->_forceRoamHasNoChannel = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x40u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)totalDuration
{
  return self->_totalDuration;
}

- (unsigned)serverModeDuration
{
  return self->_serverModeDuration;
}

- (unsigned)clientModeDuration
{
  return self->_clientModeDuration;
}

- (unsigned)splitModeDuration
{
  return self->_splitModeDuration;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (int)startingRSSI
{
  return self->_startingRSSI;
}

- (unsigned)awdlVersion
{
  return self->_awdlVersion;
}

- (unsigned)totalPeerCount
{
  return self->_totalPeerCount;
}

- (unsigned)routablePeerCount
{
  return self->_routablePeerCount;
}

- (unsigned)infraDisconnectedCount
{
  return self->_infraDisconnectedCount;
}

- (unsigned)sequenceNumberNotUpdatedCount
{
  return self->_sequenceNumberNotUpdatedCount;
}

- (unsigned)missingAWStartEventCount
{
  return self->_missingAWStartEventCount;
}

- (unsigned)psfEnabledCount
{
  return self->_psfEnabledCount;
}

- (unsigned)selfInfraChannel
{
  return self->_selfInfraChannel;
}

- (unsigned)peerInfraChannel
{
  return self->_peerInfraChannel;
}

- (unsigned)senderPlatform
{
  return self->_senderPlatform;
}

- (BOOL)csaToDfsChannel
{
  return self->_csaToDfsChannel;
}

- (BOOL)csaDuringDfspMode
{
  return self->_csaDuringDfspMode;
}

- (BOOL)dfsProxyMode
{
  return self->_dfsProxyMode;
}

- (BOOL)selfIsSDB
{
  return self->_selfIsSDB;
}

- (BOOL)peerIsSDB
{
  return self->_peerIsSDB;
}

- (BOOL)inRetroMode
{
  return self->_inRetroMode;
}

- (NSMutableArray)peerRSSIs
{
  return self->_peerRSSIs;
}

- (void)setPeerRSSIs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)avgCCASocialChannels
{
  return self->_avgCCASocialChannels;
}

- (void)setAvgCCASocialChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)avgCCASelfInfraChannels
{
  return self->_avgCCASelfInfraChannels;
}

- (void)setAvgCCASelfInfraChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)avgCCAPeerInfraChannels
{
  return self->_avgCCAPeerInfraChannels;
}

- (void)setAvgCCAPeerInfraChannels:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)selfInfraChannelFlags
{
  return self->_selfInfraChannelFlags;
}

- (unsigned)peerInfraChannelFlags
{
  return self->_peerInfraChannelFlags;
}

- (unsigned)roamOutOfOtherCount
{
  return self->_roamOutOfOtherCount;
}

- (unsigned)roamOutOfOtherSuccess
{
  return self->_roamOutOfOtherSuccess;
}

- (unsigned)roamOutOfOtherFailure
{
  return self->_roamOutOfOtherFailure;
}

- (unsigned)forceRoamHasChannelsCnt
{
  return self->_forceRoamHasChannelsCnt;
}

- (unsigned)forceRoamHasNoChannel
{
  return self->_forceRoamHasNoChannel;
}

@end
