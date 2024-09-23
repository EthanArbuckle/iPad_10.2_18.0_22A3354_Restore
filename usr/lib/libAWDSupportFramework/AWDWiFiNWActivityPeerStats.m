@implementation AWDWiFiNWActivityPeerStats

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiNWActivityPeerStats setHashID:](self, "setHashID:", 0);
  -[AWDWiFiNWActivityPeerStats setRssis:](self, "setRssis:", 0);
  -[AWDWiFiNWActivityPeerStats setCcas:](self, "setCcas:", 0);
  -[AWDWiFiNWActivityPeerStats setSnrs:](self, "setSnrs:", 0);
  -[AWDWiFiNWActivityPeerStats setPackets:](self, "setPackets:", 0);
  -[AWDWiFiNWActivityPeerStats setBytes:](self, "setBytes:", 0);
  -[AWDWiFiNWActivityPeerStats setTxLatencyBKs:](self, "setTxLatencyBKs:", 0);
  -[AWDWiFiNWActivityPeerStats setTxLatencyBEs:](self, "setTxLatencyBEs:", 0);
  -[AWDWiFiNWActivityPeerStats setTxLatencyVOs:](self, "setTxLatencyVOs:", 0);
  -[AWDWiFiNWActivityPeerStats setTxLatencyVIs:](self, "setTxLatencyVIs:", 0);
  -[AWDWiFiNWActivityPeerStats setCompletions:](self, "setCompletions:", 0);
  -[AWDWiFiNWActivityPeerStats setAcCompletions:](self, "setAcCompletions:", 0);
  -[AWDWiFiNWActivityPeerStats setRxLatencyTID0s:](self, "setRxLatencyTID0s:", 0);
  -[AWDWiFiNWActivityPeerStats setRxLatencyTID1s:](self, "setRxLatencyTID1s:", 0);
  -[AWDWiFiNWActivityPeerStats setRxLatencyTID2s:](self, "setRxLatencyTID2s:", 0);
  -[AWDWiFiNWActivityPeerStats setRxLatencyTID3s:](self, "setRxLatencyTID3s:", 0);
  -[AWDWiFiNWActivityPeerStats setRxLatencyTID4s:](self, "setRxLatencyTID4s:", 0);
  -[AWDWiFiNWActivityPeerStats setRxLatencyTID5s:](self, "setRxLatencyTID5s:", 0);
  -[AWDWiFiNWActivityPeerStats setRxLatencyTID6s:](self, "setRxLatencyTID6s:", 0);
  -[AWDWiFiNWActivityPeerStats setRxLatencyTID7s:](self, "setRxLatencyTID7s:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityPeerStats;
  -[AWDWiFiNWActivityPeerStats dealloc](&v3, sel_dealloc);
}

- (int)role
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_role;
  else
    return 0;
}

- (void)setRole:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_role = a3;
}

- (void)setHasRole:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRole
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)roleAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E658 + a3);
}

- (int)StringAsRole:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INFRA")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("LEGACYAWDL")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LLWAWDL")))
    return 2;
  return 0;
}

- (BOOL)hasHashID
{
  return self->_hashID != 0;
}

- (void)clearRssis
{
  -[NSMutableArray removeAllObjects](self->_rssis, "removeAllObjects");
}

- (void)addRssi:(id)a3
{
  NSMutableArray *rssis;

  rssis = self->_rssis;
  if (!rssis)
  {
    rssis = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rssis = rssis;
  }
  -[NSMutableArray addObject:](rssis, "addObject:", a3);
}

- (unint64_t)rssisCount
{
  return -[NSMutableArray count](self->_rssis, "count");
}

- (id)rssiAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rssis, "objectAtIndex:", a3);
}

+ (Class)rssiType
{
  return (Class)objc_opt_class();
}

- (void)clearCcas
{
  -[NSMutableArray removeAllObjects](self->_ccas, "removeAllObjects");
}

- (void)addCca:(id)a3
{
  NSMutableArray *ccas;

  ccas = self->_ccas;
  if (!ccas)
  {
    ccas = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_ccas = ccas;
  }
  -[NSMutableArray addObject:](ccas, "addObject:", a3);
}

- (unint64_t)ccasCount
{
  return -[NSMutableArray count](self->_ccas, "count");
}

- (id)ccaAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ccas, "objectAtIndex:", a3);
}

+ (Class)ccaType
{
  return (Class)objc_opt_class();
}

- (void)clearSnrs
{
  -[NSMutableArray removeAllObjects](self->_snrs, "removeAllObjects");
}

- (void)addSnr:(id)a3
{
  NSMutableArray *snrs;

  snrs = self->_snrs;
  if (!snrs)
  {
    snrs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_snrs = snrs;
  }
  -[NSMutableArray addObject:](snrs, "addObject:", a3);
}

- (unint64_t)snrsCount
{
  return -[NSMutableArray count](self->_snrs, "count");
}

- (id)snrAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_snrs, "objectAtIndex:", a3);
}

+ (Class)snrType
{
  return (Class)objc_opt_class();
}

- (void)clearPackets
{
  -[NSMutableArray removeAllObjects](self->_packets, "removeAllObjects");
}

- (void)addPackets:(id)a3
{
  NSMutableArray *packets;

  packets = self->_packets;
  if (!packets)
  {
    packets = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_packets = packets;
  }
  -[NSMutableArray addObject:](packets, "addObject:", a3);
}

- (unint64_t)packetsCount
{
  return -[NSMutableArray count](self->_packets, "count");
}

- (id)packetsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_packets, "objectAtIndex:", a3);
}

+ (Class)packetsType
{
  return (Class)objc_opt_class();
}

- (void)clearBytes
{
  -[NSMutableArray removeAllObjects](self->_bytes, "removeAllObjects");
}

- (void)addBytes:(id)a3
{
  NSMutableArray *bytes;

  bytes = self->_bytes;
  if (!bytes)
  {
    bytes = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_bytes = bytes;
  }
  -[NSMutableArray addObject:](bytes, "addObject:", a3);
}

- (unint64_t)bytesCount
{
  return -[NSMutableArray count](self->_bytes, "count");
}

- (id)bytesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bytes, "objectAtIndex:", a3);
}

+ (Class)bytesType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyBKs
{
  -[NSMutableArray removeAllObjects](self->_txLatencyBKs, "removeAllObjects");
}

- (void)addTxLatencyBK:(id)a3
{
  NSMutableArray *txLatencyBKs;

  txLatencyBKs = self->_txLatencyBKs;
  if (!txLatencyBKs)
  {
    txLatencyBKs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txLatencyBKs = txLatencyBKs;
  }
  -[NSMutableArray addObject:](txLatencyBKs, "addObject:", a3);
}

- (unint64_t)txLatencyBKsCount
{
  return -[NSMutableArray count](self->_txLatencyBKs, "count");
}

- (id)txLatencyBKAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txLatencyBKs, "objectAtIndex:", a3);
}

+ (Class)txLatencyBKType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyBEs
{
  -[NSMutableArray removeAllObjects](self->_txLatencyBEs, "removeAllObjects");
}

- (void)addTxLatencyBE:(id)a3
{
  NSMutableArray *txLatencyBEs;

  txLatencyBEs = self->_txLatencyBEs;
  if (!txLatencyBEs)
  {
    txLatencyBEs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txLatencyBEs = txLatencyBEs;
  }
  -[NSMutableArray addObject:](txLatencyBEs, "addObject:", a3);
}

- (unint64_t)txLatencyBEsCount
{
  return -[NSMutableArray count](self->_txLatencyBEs, "count");
}

- (id)txLatencyBEAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txLatencyBEs, "objectAtIndex:", a3);
}

+ (Class)txLatencyBEType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyVOs
{
  -[NSMutableArray removeAllObjects](self->_txLatencyVOs, "removeAllObjects");
}

- (void)addTxLatencyVO:(id)a3
{
  NSMutableArray *txLatencyVOs;

  txLatencyVOs = self->_txLatencyVOs;
  if (!txLatencyVOs)
  {
    txLatencyVOs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txLatencyVOs = txLatencyVOs;
  }
  -[NSMutableArray addObject:](txLatencyVOs, "addObject:", a3);
}

- (unint64_t)txLatencyVOsCount
{
  return -[NSMutableArray count](self->_txLatencyVOs, "count");
}

- (id)txLatencyVOAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txLatencyVOs, "objectAtIndex:", a3);
}

+ (Class)txLatencyVOType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyVIs
{
  -[NSMutableArray removeAllObjects](self->_txLatencyVIs, "removeAllObjects");
}

- (void)addTxLatencyVI:(id)a3
{
  NSMutableArray *txLatencyVIs;

  txLatencyVIs = self->_txLatencyVIs;
  if (!txLatencyVIs)
  {
    txLatencyVIs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txLatencyVIs = txLatencyVIs;
  }
  -[NSMutableArray addObject:](txLatencyVIs, "addObject:", a3);
}

- (unint64_t)txLatencyVIsCount
{
  return -[NSMutableArray count](self->_txLatencyVIs, "count");
}

- (id)txLatencyVIAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txLatencyVIs, "objectAtIndex:", a3);
}

+ (Class)txLatencyVIType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCompletions
{
  return self->_completions != 0;
}

- (void)clearAcCompletions
{
  -[NSMutableArray removeAllObjects](self->_acCompletions, "removeAllObjects");
}

- (void)addAcCompletions:(id)a3
{
  NSMutableArray *acCompletions;

  acCompletions = self->_acCompletions;
  if (!acCompletions)
  {
    acCompletions = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_acCompletions = acCompletions;
  }
  -[NSMutableArray addObject:](acCompletions, "addObject:", a3);
}

- (unint64_t)acCompletionsCount
{
  return -[NSMutableArray count](self->_acCompletions, "count");
}

- (id)acCompletionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_acCompletions, "objectAtIndex:", a3);
}

+ (Class)acCompletionsType
{
  return (Class)objc_opt_class();
}

- (void)setRssiValue:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rssiValue = a3;
}

- (void)setHasRssiValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRssiValue
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSnrValue:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_snrValue = a3;
}

- (void)setHasSnrValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSnrValue
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCcaValue:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ccaValue = a3;
}

- (void)setHasCcaValue:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCcaValue
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNfValue:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_nfValue = a3;
}

- (void)setHasNfValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNfValue
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setOfdmDesense:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_ofdmDesense = a3;
}

- (void)setHasOfdmDesense:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOfdmDesense
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIbssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ibssCCA = a3;
}

- (void)setHasIbssCCA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasIbssCCA
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setObssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_obssCCA = a3;
}

- (void)setHasObssCCA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasObssCCA
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setInterferenceCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_interferenceCCA = a3;
}

- (void)setHasInterferenceCCA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInterferenceCCA
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setQbssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_qbssCCA = a3;
}

- (void)setHasQbssCCA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQbssCCA
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setQbssSTACount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_qbssSTACount = a3;
}

- (void)setHasQbssSTACount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasQbssSTACount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearRxLatencyTID0s
{
  -[NSMutableArray removeAllObjects](self->_rxLatencyTID0s, "removeAllObjects");
}

- (void)addRxLatencyTID0:(id)a3
{
  NSMutableArray *rxLatencyTID0s;

  rxLatencyTID0s = self->_rxLatencyTID0s;
  if (!rxLatencyTID0s)
  {
    rxLatencyTID0s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxLatencyTID0s = rxLatencyTID0s;
  }
  -[NSMutableArray addObject:](rxLatencyTID0s, "addObject:", a3);
}

- (unint64_t)rxLatencyTID0sCount
{
  return -[NSMutableArray count](self->_rxLatencyTID0s, "count");
}

- (id)rxLatencyTID0AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxLatencyTID0s, "objectAtIndex:", a3);
}

+ (Class)rxLatencyTID0Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID1s
{
  -[NSMutableArray removeAllObjects](self->_rxLatencyTID1s, "removeAllObjects");
}

- (void)addRxLatencyTID1:(id)a3
{
  NSMutableArray *rxLatencyTID1s;

  rxLatencyTID1s = self->_rxLatencyTID1s;
  if (!rxLatencyTID1s)
  {
    rxLatencyTID1s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxLatencyTID1s = rxLatencyTID1s;
  }
  -[NSMutableArray addObject:](rxLatencyTID1s, "addObject:", a3);
}

- (unint64_t)rxLatencyTID1sCount
{
  return -[NSMutableArray count](self->_rxLatencyTID1s, "count");
}

- (id)rxLatencyTID1AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxLatencyTID1s, "objectAtIndex:", a3);
}

+ (Class)rxLatencyTID1Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID2s
{
  -[NSMutableArray removeAllObjects](self->_rxLatencyTID2s, "removeAllObjects");
}

- (void)addRxLatencyTID2:(id)a3
{
  NSMutableArray *rxLatencyTID2s;

  rxLatencyTID2s = self->_rxLatencyTID2s;
  if (!rxLatencyTID2s)
  {
    rxLatencyTID2s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxLatencyTID2s = rxLatencyTID2s;
  }
  -[NSMutableArray addObject:](rxLatencyTID2s, "addObject:", a3);
}

- (unint64_t)rxLatencyTID2sCount
{
  return -[NSMutableArray count](self->_rxLatencyTID2s, "count");
}

- (id)rxLatencyTID2AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxLatencyTID2s, "objectAtIndex:", a3);
}

+ (Class)rxLatencyTID2Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID3s
{
  -[NSMutableArray removeAllObjects](self->_rxLatencyTID3s, "removeAllObjects");
}

- (void)addRxLatencyTID3:(id)a3
{
  NSMutableArray *rxLatencyTID3s;

  rxLatencyTID3s = self->_rxLatencyTID3s;
  if (!rxLatencyTID3s)
  {
    rxLatencyTID3s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxLatencyTID3s = rxLatencyTID3s;
  }
  -[NSMutableArray addObject:](rxLatencyTID3s, "addObject:", a3);
}

- (unint64_t)rxLatencyTID3sCount
{
  return -[NSMutableArray count](self->_rxLatencyTID3s, "count");
}

- (id)rxLatencyTID3AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxLatencyTID3s, "objectAtIndex:", a3);
}

+ (Class)rxLatencyTID3Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID4s
{
  -[NSMutableArray removeAllObjects](self->_rxLatencyTID4s, "removeAllObjects");
}

- (void)addRxLatencyTID4:(id)a3
{
  NSMutableArray *rxLatencyTID4s;

  rxLatencyTID4s = self->_rxLatencyTID4s;
  if (!rxLatencyTID4s)
  {
    rxLatencyTID4s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxLatencyTID4s = rxLatencyTID4s;
  }
  -[NSMutableArray addObject:](rxLatencyTID4s, "addObject:", a3);
}

- (unint64_t)rxLatencyTID4sCount
{
  return -[NSMutableArray count](self->_rxLatencyTID4s, "count");
}

- (id)rxLatencyTID4AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxLatencyTID4s, "objectAtIndex:", a3);
}

+ (Class)rxLatencyTID4Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID5s
{
  -[NSMutableArray removeAllObjects](self->_rxLatencyTID5s, "removeAllObjects");
}

- (void)addRxLatencyTID5:(id)a3
{
  NSMutableArray *rxLatencyTID5s;

  rxLatencyTID5s = self->_rxLatencyTID5s;
  if (!rxLatencyTID5s)
  {
    rxLatencyTID5s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxLatencyTID5s = rxLatencyTID5s;
  }
  -[NSMutableArray addObject:](rxLatencyTID5s, "addObject:", a3);
}

- (unint64_t)rxLatencyTID5sCount
{
  return -[NSMutableArray count](self->_rxLatencyTID5s, "count");
}

- (id)rxLatencyTID5AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxLatencyTID5s, "objectAtIndex:", a3);
}

+ (Class)rxLatencyTID5Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID6s
{
  -[NSMutableArray removeAllObjects](self->_rxLatencyTID6s, "removeAllObjects");
}

- (void)addRxLatencyTID6:(id)a3
{
  NSMutableArray *rxLatencyTID6s;

  rxLatencyTID6s = self->_rxLatencyTID6s;
  if (!rxLatencyTID6s)
  {
    rxLatencyTID6s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxLatencyTID6s = rxLatencyTID6s;
  }
  -[NSMutableArray addObject:](rxLatencyTID6s, "addObject:", a3);
}

- (unint64_t)rxLatencyTID6sCount
{
  return -[NSMutableArray count](self->_rxLatencyTID6s, "count");
}

- (id)rxLatencyTID6AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxLatencyTID6s, "objectAtIndex:", a3);
}

+ (Class)rxLatencyTID6Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID7s
{
  -[NSMutableArray removeAllObjects](self->_rxLatencyTID7s, "removeAllObjects");
}

- (void)addRxLatencyTID7:(id)a3
{
  NSMutableArray *rxLatencyTID7s;

  rxLatencyTID7s = self->_rxLatencyTID7s;
  if (!rxLatencyTID7s)
  {
    rxLatencyTID7s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxLatencyTID7s = rxLatencyTID7s;
  }
  -[NSMutableArray addObject:](rxLatencyTID7s, "addObject:", a3);
}

- (unint64_t)rxLatencyTID7sCount
{
  return -[NSMutableArray count](self->_rxLatencyTID7s, "count");
}

- (id)rxLatencyTID7AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxLatencyTID7s, "objectAtIndex:", a3);
}

+ (Class)rxLatencyTID7Type
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityPeerStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityPeerStats description](&v3, sel_description), -[AWDWiFiNWActivityPeerStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t role;
  uint64_t v5;
  NSString *hashID;
  void *v7;
  NSMutableArray *rssis;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *ccas;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *snrs;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *packets;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  NSMutableArray *bytes;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  NSMutableArray *txLatencyBKs;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ii;
  void *v43;
  NSMutableArray *txLatencyBEs;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t jj;
  void *v49;
  NSMutableArray *txLatencyVOs;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t kk;
  void *v55;
  NSMutableArray *txLatencyVIs;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t mm;
  AWDWiFiNWActivityTxCompletions *completions;
  void *v62;
  NSMutableArray *acCompletions;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t nn;
  __int16 has;
  void *v69;
  NSMutableArray *rxLatencyTID0s;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i1;
  void *v75;
  NSMutableArray *rxLatencyTID1s;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i2;
  void *v81;
  NSMutableArray *rxLatencyTID2s;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i3;
  void *v87;
  NSMutableArray *rxLatencyTID3s;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i4;
  void *v93;
  NSMutableArray *rxLatencyTID4s;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i5;
  void *v99;
  NSMutableArray *rxLatencyTID5s;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i6;
  void *v105;
  NSMutableArray *rxLatencyTID6s;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t i7;
  void *v111;
  NSMutableArray *rxLatencyTID7s;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i8;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  uint64_t v208;

  v208 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    role = self->_role;
    if (role >= 3)
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_role);
    else
      v5 = (uint64_t)*(&off_24C10E658 + role);
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("role"));
  }
  hashID = self->_hashID;
  if (hashID)
    objc_msgSend(v3, "setObject:forKey:", hashID, CFSTR("hashID"));
  if (-[NSMutableArray count](self->_rssis, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rssis, "count"));
    v186 = 0u;
    v187 = 0u;
    v188 = 0u;
    v189 = 0u;
    rssis = self->_rssis;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rssis, "countByEnumeratingWithState:objects:count:", &v186, v207, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v187;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v187 != v11)
            objc_enumerationMutation(rssis);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v186 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rssis, "countByEnumeratingWithState:objects:count:", &v186, v207, 16);
      }
      while (v10);
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rssi"));

  }
  if (-[NSMutableArray count](self->_ccas, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_ccas, "count"));
    v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    v185 = 0u;
    ccas = self->_ccas;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ccas, "countByEnumeratingWithState:objects:count:", &v182, v206, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v183;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v183 != v17)
            objc_enumerationMutation(ccas);
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v182 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ccas, "countByEnumeratingWithState:objects:count:", &v182, v206, 16);
      }
      while (v16);
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cca"));

  }
  if (-[NSMutableArray count](self->_snrs, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_snrs, "count"));
    v178 = 0u;
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    snrs = self->_snrs;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snrs, "countByEnumeratingWithState:objects:count:", &v178, v205, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v179;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v179 != v23)
            objc_enumerationMutation(snrs);
          objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v178 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snrs, "countByEnumeratingWithState:objects:count:", &v178, v205, 16);
      }
      while (v22);
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("snr"));

  }
  if (-[NSMutableArray count](self->_packets, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    packets = self->_packets;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v174, v204, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v175;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v175 != v29)
            objc_enumerationMutation(packets);
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v174 + 1) + 8 * m), "dictionaryRepresentation"));
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v174, v204, 16);
      }
      while (v28);
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("packets"));

  }
  if (-[NSMutableArray count](self->_bytes, "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    bytes = self->_bytes;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v170, v203, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v171;
      do
      {
        for (n = 0; n != v34; ++n)
        {
          if (*(_QWORD *)v171 != v35)
            objc_enumerationMutation(bytes);
          objc_msgSend(v31, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v170 + 1) + 8 * n), "dictionaryRepresentation"));
        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v170, v203, 16);
      }
      while (v34);
    }
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("bytes"));

  }
  if (-[NSMutableArray count](self->_txLatencyBKs, "count"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBKs, "count"));
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    txLatencyBKs = self->_txLatencyBKs;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBKs, "countByEnumeratingWithState:objects:count:", &v166, v202, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v167;
      do
      {
        for (ii = 0; ii != v40; ++ii)
        {
          if (*(_QWORD *)v167 != v41)
            objc_enumerationMutation(txLatencyBKs);
          objc_msgSend(v37, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v166 + 1) + 8 * ii), "dictionaryRepresentation"));
        }
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBKs, "countByEnumeratingWithState:objects:count:", &v166, v202, 16);
      }
      while (v40);
    }
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("txLatencyBK"));

  }
  if (-[NSMutableArray count](self->_txLatencyBEs, "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBEs, "count"));
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    txLatencyBEs = self->_txLatencyBEs;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBEs, "countByEnumeratingWithState:objects:count:", &v162, v201, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v163;
      do
      {
        for (jj = 0; jj != v46; ++jj)
        {
          if (*(_QWORD *)v163 != v47)
            objc_enumerationMutation(txLatencyBEs);
          objc_msgSend(v43, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v162 + 1) + 8 * jj), "dictionaryRepresentation"));
        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBEs, "countByEnumeratingWithState:objects:count:", &v162, v201, 16);
      }
      while (v46);
    }
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("txLatencyBE"));

  }
  if (-[NSMutableArray count](self->_txLatencyVOs, "count"))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVOs, "count"));
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    txLatencyVOs = self->_txLatencyVOs;
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVOs, "countByEnumeratingWithState:objects:count:", &v158, v200, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v159;
      do
      {
        for (kk = 0; kk != v52; ++kk)
        {
          if (*(_QWORD *)v159 != v53)
            objc_enumerationMutation(txLatencyVOs);
          objc_msgSend(v49, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v158 + 1) + 8 * kk), "dictionaryRepresentation"));
        }
        v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVOs, "countByEnumeratingWithState:objects:count:", &v158, v200, 16);
      }
      while (v52);
    }
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("txLatencyVO"));

  }
  if (-[NSMutableArray count](self->_txLatencyVIs, "count"))
  {
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVIs, "count"));
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    txLatencyVIs = self->_txLatencyVIs;
    v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVIs, "countByEnumeratingWithState:objects:count:", &v154, v199, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v155;
      do
      {
        for (mm = 0; mm != v58; ++mm)
        {
          if (*(_QWORD *)v155 != v59)
            objc_enumerationMutation(txLatencyVIs);
          objc_msgSend(v55, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * mm), "dictionaryRepresentation"));
        }
        v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVIs, "countByEnumeratingWithState:objects:count:", &v154, v199, 16);
      }
      while (v58);
    }
    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("txLatencyVI"));

  }
  completions = self->_completions;
  if (completions)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityTxCompletions dictionaryRepresentation](completions, "dictionaryRepresentation"), CFSTR("completions"));
  if (-[NSMutableArray count](self->_acCompletions, "count"))
  {
    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_acCompletions, "count"));
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    acCompletions = self->_acCompletions;
    v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](acCompletions, "countByEnumeratingWithState:objects:count:", &v150, v198, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v151;
      do
      {
        for (nn = 0; nn != v65; ++nn)
        {
          if (*(_QWORD *)v151 != v66)
            objc_enumerationMutation(acCompletions);
          objc_msgSend(v62, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * nn), "dictionaryRepresentation"));
        }
        v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](acCompletions, "countByEnumeratingWithState:objects:count:", &v150, v198, 16);
      }
      while (v65);
    }
    objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("acCompletions"));

  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rssiValue), CFSTR("rssiValue"));
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_102:
      if ((has & 1) == 0)
        goto LABEL_103;
      goto LABEL_186;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_102;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_snrValue), CFSTR("snrValue"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_103:
    if ((has & 8) == 0)
      goto LABEL_104;
    goto LABEL_187;
  }
LABEL_186:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaValue), CFSTR("ccaValue"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_104:
    if ((has & 0x20) == 0)
      goto LABEL_105;
    goto LABEL_188;
  }
LABEL_187:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_nfValue), CFSTR("nfValue"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_105:
    if ((has & 2) == 0)
      goto LABEL_106;
    goto LABEL_189;
  }
LABEL_188:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ofdmDesense), CFSTR("ofdmDesense"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_106:
    if ((has & 0x10) == 0)
      goto LABEL_107;
    goto LABEL_190;
  }
LABEL_189:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ibssCCA), CFSTR("ibssCCA"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_107:
    if ((has & 4) == 0)
      goto LABEL_108;
    goto LABEL_191;
  }
LABEL_190:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_obssCCA), CFSTR("obssCCA"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_108:
    if ((has & 0x40) == 0)
      goto LABEL_109;
    goto LABEL_192;
  }
LABEL_191:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_interferenceCCA), CFSTR("interferenceCCA"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_109:
    if ((has & 0x80) == 0)
      goto LABEL_111;
    goto LABEL_110;
  }
LABEL_192:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_qbssCCA), CFSTR("qbssCCA"));
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_110:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_qbssSTACount), CFSTR("qbssSTACount"));
LABEL_111:
  if (-[NSMutableArray count](self->_rxLatencyTID0s, "count"))
  {
    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxLatencyTID0s, "count"));
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    rxLatencyTID0s = self->_rxLatencyTID0s;
    v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID0s, "countByEnumeratingWithState:objects:count:", &v146, v197, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v147;
      do
      {
        for (i1 = 0; i1 != v72; ++i1)
        {
          if (*(_QWORD *)v147 != v73)
            objc_enumerationMutation(rxLatencyTID0s);
          objc_msgSend(v69, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * i1), "dictionaryRepresentation"));
        }
        v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID0s, "countByEnumeratingWithState:objects:count:", &v146, v197, 16);
      }
      while (v72);
    }
    objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("rxLatencyTID0"));

  }
  if (-[NSMutableArray count](self->_rxLatencyTID1s, "count"))
  {
    v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxLatencyTID1s, "count"));
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    rxLatencyTID1s = self->_rxLatencyTID1s;
    v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID1s, "countByEnumeratingWithState:objects:count:", &v142, v196, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v143;
      do
      {
        for (i2 = 0; i2 != v78; ++i2)
        {
          if (*(_QWORD *)v143 != v79)
            objc_enumerationMutation(rxLatencyTID1s);
          objc_msgSend(v75, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v142 + 1) + 8 * i2), "dictionaryRepresentation"));
        }
        v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID1s, "countByEnumeratingWithState:objects:count:", &v142, v196, 16);
      }
      while (v78);
    }
    objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("rxLatencyTID1"));

  }
  if (-[NSMutableArray count](self->_rxLatencyTID2s, "count"))
  {
    v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxLatencyTID2s, "count"));
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    rxLatencyTID2s = self->_rxLatencyTID2s;
    v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID2s, "countByEnumeratingWithState:objects:count:", &v138, v195, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v139;
      do
      {
        for (i3 = 0; i3 != v84; ++i3)
        {
          if (*(_QWORD *)v139 != v85)
            objc_enumerationMutation(rxLatencyTID2s);
          objc_msgSend(v81, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v138 + 1) + 8 * i3), "dictionaryRepresentation"));
        }
        v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID2s, "countByEnumeratingWithState:objects:count:", &v138, v195, 16);
      }
      while (v84);
    }
    objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("rxLatencyTID2"));

  }
  if (-[NSMutableArray count](self->_rxLatencyTID3s, "count"))
  {
    v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxLatencyTID3s, "count"));
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    rxLatencyTID3s = self->_rxLatencyTID3s;
    v89 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID3s, "countByEnumeratingWithState:objects:count:", &v134, v194, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v135;
      do
      {
        for (i4 = 0; i4 != v90; ++i4)
        {
          if (*(_QWORD *)v135 != v91)
            objc_enumerationMutation(rxLatencyTID3s);
          objc_msgSend(v87, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * i4), "dictionaryRepresentation"));
        }
        v90 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID3s, "countByEnumeratingWithState:objects:count:", &v134, v194, 16);
      }
      while (v90);
    }
    objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("rxLatencyTID3"));

  }
  if (-[NSMutableArray count](self->_rxLatencyTID4s, "count"))
  {
    v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxLatencyTID4s, "count"));
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    rxLatencyTID4s = self->_rxLatencyTID4s;
    v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID4s, "countByEnumeratingWithState:objects:count:", &v130, v193, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v131;
      do
      {
        for (i5 = 0; i5 != v96; ++i5)
        {
          if (*(_QWORD *)v131 != v97)
            objc_enumerationMutation(rxLatencyTID4s);
          objc_msgSend(v93, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * i5), "dictionaryRepresentation"));
        }
        v96 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID4s, "countByEnumeratingWithState:objects:count:", &v130, v193, 16);
      }
      while (v96);
    }
    objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("rxLatencyTID4"));

  }
  if (-[NSMutableArray count](self->_rxLatencyTID5s, "count"))
  {
    v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxLatencyTID5s, "count"));
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    rxLatencyTID5s = self->_rxLatencyTID5s;
    v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID5s, "countByEnumeratingWithState:objects:count:", &v126, v192, 16);
    if (v101)
    {
      v102 = v101;
      v103 = *(_QWORD *)v127;
      do
      {
        for (i6 = 0; i6 != v102; ++i6)
        {
          if (*(_QWORD *)v127 != v103)
            objc_enumerationMutation(rxLatencyTID5s);
          objc_msgSend(v99, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * i6), "dictionaryRepresentation"));
        }
        v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID5s, "countByEnumeratingWithState:objects:count:", &v126, v192, 16);
      }
      while (v102);
    }
    objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("rxLatencyTID5"));

  }
  if (-[NSMutableArray count](self->_rxLatencyTID6s, "count"))
  {
    v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxLatencyTID6s, "count"));
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    rxLatencyTID6s = self->_rxLatencyTID6s;
    v107 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID6s, "countByEnumeratingWithState:objects:count:", &v122, v191, 16);
    if (v107)
    {
      v108 = v107;
      v109 = *(_QWORD *)v123;
      do
      {
        for (i7 = 0; i7 != v108; ++i7)
        {
          if (*(_QWORD *)v123 != v109)
            objc_enumerationMutation(rxLatencyTID6s);
          objc_msgSend(v105, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * i7), "dictionaryRepresentation"));
        }
        v108 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID6s, "countByEnumeratingWithState:objects:count:", &v122, v191, 16);
      }
      while (v108);
    }
    objc_msgSend(v3, "setObject:forKey:", v105, CFSTR("rxLatencyTID6"));

  }
  if (-[NSMutableArray count](self->_rxLatencyTID7s, "count"))
  {
    v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxLatencyTID7s, "count"));
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    rxLatencyTID7s = self->_rxLatencyTID7s;
    v113 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID7s, "countByEnumeratingWithState:objects:count:", &v118, v190, 16);
    if (v113)
    {
      v114 = v113;
      v115 = *(_QWORD *)v119;
      do
      {
        for (i8 = 0; i8 != v114; ++i8)
        {
          if (*(_QWORD *)v119 != v115)
            objc_enumerationMutation(rxLatencyTID7s);
          objc_msgSend(v111, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * i8), "dictionaryRepresentation"));
        }
        v114 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID7s, "countByEnumeratingWithState:objects:count:", &v118, v190, 16);
      }
      while (v114);
    }
    objc_msgSend(v3, "setObject:forKey:", v111, CFSTR("rxLatencyTID7"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityPeerStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *rssis;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *ccas;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *snrs;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  NSMutableArray *packets;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  NSMutableArray *bytes;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t n;
  NSMutableArray *txLatencyBKs;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ii;
  NSMutableArray *txLatencyBEs;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t jj;
  NSMutableArray *txLatencyVOs;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t kk;
  NSMutableArray *txLatencyVIs;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t mm;
  NSMutableArray *acCompletions;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t nn;
  __int16 has;
  NSMutableArray *rxLatencyTID0s;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i1;
  NSMutableArray *rxLatencyTID1s;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i2;
  NSMutableArray *rxLatencyTID2s;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i3;
  NSMutableArray *rxLatencyTID3s;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i4;
  NSMutableArray *rxLatencyTID4s;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i5;
  NSMutableArray *rxLatencyTID5s;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i6;
  NSMutableArray *rxLatencyTID6s;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i7;
  NSMutableArray *rxLatencyTID7s;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i8;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  uint64_t v185;

  v185 = *MEMORY[0x24BDAC8D0];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_hashID)
    PBDataWriterWriteStringField();
  v166 = 0u;
  v165 = 0u;
  v164 = 0u;
  v163 = 0u;
  rssis = self->_rssis;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rssis, "countByEnumeratingWithState:objects:count:", &v163, v184, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v164;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v164 != v7)
          objc_enumerationMutation(rssis);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rssis, "countByEnumeratingWithState:objects:count:", &v163, v184, 16);
    }
    while (v6);
  }
  v162 = 0u;
  v161 = 0u;
  v160 = 0u;
  v159 = 0u;
  ccas = self->_ccas;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ccas, "countByEnumeratingWithState:objects:count:", &v159, v183, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v160;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v160 != v12)
          objc_enumerationMutation(ccas);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ccas, "countByEnumeratingWithState:objects:count:", &v159, v183, 16);
    }
    while (v11);
  }
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  snrs = self->_snrs;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snrs, "countByEnumeratingWithState:objects:count:", &v155, v182, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v156;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v156 != v17)
          objc_enumerationMutation(snrs);
        PBDataWriterWriteSubmessage();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snrs, "countByEnumeratingWithState:objects:count:", &v155, v182, 16);
    }
    while (v16);
  }
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  packets = self->_packets;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v151, v181, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v152;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v152 != v22)
          objc_enumerationMutation(packets);
        PBDataWriterWriteSubmessage();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v151, v181, 16);
    }
    while (v21);
  }
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  bytes = self->_bytes;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v147, v180, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v148;
    do
    {
      for (n = 0; n != v26; ++n)
      {
        if (*(_QWORD *)v148 != v27)
          objc_enumerationMutation(bytes);
        PBDataWriterWriteSubmessage();
      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v147, v180, 16);
    }
    while (v26);
  }
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  txLatencyBKs = self->_txLatencyBKs;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBKs, "countByEnumeratingWithState:objects:count:", &v143, v179, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v144;
    do
    {
      for (ii = 0; ii != v31; ++ii)
      {
        if (*(_QWORD *)v144 != v32)
          objc_enumerationMutation(txLatencyBKs);
        PBDataWriterWriteSubmessage();
      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBKs, "countByEnumeratingWithState:objects:count:", &v143, v179, 16);
    }
    while (v31);
  }
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  txLatencyBEs = self->_txLatencyBEs;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBEs, "countByEnumeratingWithState:objects:count:", &v139, v178, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v140;
    do
    {
      for (jj = 0; jj != v36; ++jj)
      {
        if (*(_QWORD *)v140 != v37)
          objc_enumerationMutation(txLatencyBEs);
        PBDataWriterWriteSubmessage();
      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBEs, "countByEnumeratingWithState:objects:count:", &v139, v178, 16);
    }
    while (v36);
  }
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  txLatencyVOs = self->_txLatencyVOs;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVOs, "countByEnumeratingWithState:objects:count:", &v135, v177, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v136;
    do
    {
      for (kk = 0; kk != v41; ++kk)
      {
        if (*(_QWORD *)v136 != v42)
          objc_enumerationMutation(txLatencyVOs);
        PBDataWriterWriteSubmessage();
      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVOs, "countByEnumeratingWithState:objects:count:", &v135, v177, 16);
    }
    while (v41);
  }
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  txLatencyVIs = self->_txLatencyVIs;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVIs, "countByEnumeratingWithState:objects:count:", &v131, v176, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v132;
    do
    {
      for (mm = 0; mm != v46; ++mm)
      {
        if (*(_QWORD *)v132 != v47)
          objc_enumerationMutation(txLatencyVIs);
        PBDataWriterWriteSubmessage();
      }
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVIs, "countByEnumeratingWithState:objects:count:", &v131, v176, 16);
    }
    while (v46);
  }
  if (self->_completions)
    PBDataWriterWriteSubmessage();
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  acCompletions = self->_acCompletions;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](acCompletions, "countByEnumeratingWithState:objects:count:", &v127, v175, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v128;
    do
    {
      for (nn = 0; nn != v51; ++nn)
      {
        if (*(_QWORD *)v128 != v52)
          objc_enumerationMutation(acCompletions);
        PBDataWriterWriteSubmessage();
      }
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](acCompletions, "countByEnumeratingWithState:objects:count:", &v127, v175, 16);
    }
    while (v51);
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_79:
      if ((has & 1) == 0)
        goto LABEL_80;
      goto LABEL_147;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_79;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_80:
    if ((has & 8) == 0)
      goto LABEL_81;
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_81:
    if ((has & 0x20) == 0)
      goto LABEL_82;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_82:
    if ((has & 2) == 0)
      goto LABEL_83;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_83:
    if ((has & 0x10) == 0)
      goto LABEL_84;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_84:
    if ((has & 4) == 0)
      goto LABEL_85;
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_85:
    if ((has & 0x40) == 0)
      goto LABEL_86;
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_86:
    if ((has & 0x80) == 0)
      goto LABEL_88;
    goto LABEL_87;
  }
LABEL_153:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_87:
    PBDataWriterWriteUint32Field();
LABEL_88:
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  rxLatencyTID0s = self->_rxLatencyTID0s;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID0s, "countByEnumeratingWithState:objects:count:", &v123, v174, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v124;
    do
    {
      for (i1 = 0; i1 != v57; ++i1)
      {
        if (*(_QWORD *)v124 != v58)
          objc_enumerationMutation(rxLatencyTID0s);
        PBDataWriterWriteSubmessage();
      }
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID0s, "countByEnumeratingWithState:objects:count:", &v123, v174, 16);
    }
    while (v57);
  }
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  rxLatencyTID1s = self->_rxLatencyTID1s;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID1s, "countByEnumeratingWithState:objects:count:", &v119, v173, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v120;
    do
    {
      for (i2 = 0; i2 != v62; ++i2)
      {
        if (*(_QWORD *)v120 != v63)
          objc_enumerationMutation(rxLatencyTID1s);
        PBDataWriterWriteSubmessage();
      }
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID1s, "countByEnumeratingWithState:objects:count:", &v119, v173, 16);
    }
    while (v62);
  }
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  rxLatencyTID2s = self->_rxLatencyTID2s;
  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID2s, "countByEnumeratingWithState:objects:count:", &v115, v172, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v116;
    do
    {
      for (i3 = 0; i3 != v67; ++i3)
      {
        if (*(_QWORD *)v116 != v68)
          objc_enumerationMutation(rxLatencyTID2s);
        PBDataWriterWriteSubmessage();
      }
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID2s, "countByEnumeratingWithState:objects:count:", &v115, v172, 16);
    }
    while (v67);
  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  rxLatencyTID3s = self->_rxLatencyTID3s;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID3s, "countByEnumeratingWithState:objects:count:", &v111, v171, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v112;
    do
    {
      for (i4 = 0; i4 != v72; ++i4)
      {
        if (*(_QWORD *)v112 != v73)
          objc_enumerationMutation(rxLatencyTID3s);
        PBDataWriterWriteSubmessage();
      }
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID3s, "countByEnumeratingWithState:objects:count:", &v111, v171, 16);
    }
    while (v72);
  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  rxLatencyTID4s = self->_rxLatencyTID4s;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID4s, "countByEnumeratingWithState:objects:count:", &v107, v170, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v108;
    do
    {
      for (i5 = 0; i5 != v77; ++i5)
      {
        if (*(_QWORD *)v108 != v78)
          objc_enumerationMutation(rxLatencyTID4s);
        PBDataWriterWriteSubmessage();
      }
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID4s, "countByEnumeratingWithState:objects:count:", &v107, v170, 16);
    }
    while (v77);
  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  rxLatencyTID5s = self->_rxLatencyTID5s;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID5s, "countByEnumeratingWithState:objects:count:", &v103, v169, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v104;
    do
    {
      for (i6 = 0; i6 != v82; ++i6)
      {
        if (*(_QWORD *)v104 != v83)
          objc_enumerationMutation(rxLatencyTID5s);
        PBDataWriterWriteSubmessage();
      }
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID5s, "countByEnumeratingWithState:objects:count:", &v103, v169, 16);
    }
    while (v82);
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  rxLatencyTID6s = self->_rxLatencyTID6s;
  v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID6s, "countByEnumeratingWithState:objects:count:", &v99, v168, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v100;
    do
    {
      for (i7 = 0; i7 != v87; ++i7)
      {
        if (*(_QWORD *)v100 != v88)
          objc_enumerationMutation(rxLatencyTID6s);
        PBDataWriterWriteSubmessage();
      }
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID6s, "countByEnumeratingWithState:objects:count:", &v99, v168, 16);
    }
    while (v87);
  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  rxLatencyTID7s = self->_rxLatencyTID7s;
  v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID7s, "countByEnumeratingWithState:objects:count:", &v95, v167, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v96;
    do
    {
      for (i8 = 0; i8 != v92; ++i8)
      {
        if (*(_QWORD *)v96 != v93)
          objc_enumerationMutation(rxLatencyTID7s);
        PBDataWriterWriteSubmessage();
      }
      v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID7s, "countByEnumeratingWithState:objects:count:", &v95, v167, 16);
    }
    while (v92);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  unint64_t v17;
  unint64_t v18;
  uint64_t n;
  unint64_t v20;
  unint64_t v21;
  uint64_t ii;
  unint64_t v23;
  unint64_t v24;
  uint64_t jj;
  unint64_t v26;
  unint64_t v27;
  uint64_t kk;
  unint64_t v29;
  unint64_t v30;
  uint64_t mm;
  unint64_t v32;
  unint64_t v33;
  uint64_t nn;
  __int16 has;
  unint64_t v36;
  unint64_t v37;
  uint64_t i1;
  unint64_t v39;
  unint64_t v40;
  uint64_t i2;
  unint64_t v42;
  unint64_t v43;
  uint64_t i3;
  unint64_t v45;
  unint64_t v46;
  uint64_t i4;
  unint64_t v48;
  unint64_t v49;
  uint64_t i5;
  unint64_t v51;
  unint64_t v52;
  uint64_t i6;
  unint64_t v54;
  unint64_t v55;
  uint64_t i7;
  unint64_t v57;
  unint64_t v58;
  uint64_t i8;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 24) = self->_role;
    *((_WORD *)a3 + 112) |= 0x100u;
  }
  if (self->_hashID)
    objc_msgSend(a3, "setHashID:");
  if (-[AWDWiFiNWActivityPeerStats rssisCount](self, "rssisCount"))
  {
    objc_msgSend(a3, "clearRssis");
    v5 = -[AWDWiFiNWActivityPeerStats rssisCount](self, "rssisCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addRssi:", -[AWDWiFiNWActivityPeerStats rssiAtIndex:](self, "rssiAtIndex:", i));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats ccasCount](self, "ccasCount"))
  {
    objc_msgSend(a3, "clearCcas");
    v8 = -[AWDWiFiNWActivityPeerStats ccasCount](self, "ccasCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addCca:", -[AWDWiFiNWActivityPeerStats ccaAtIndex:](self, "ccaAtIndex:", j));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats snrsCount](self, "snrsCount"))
  {
    objc_msgSend(a3, "clearSnrs");
    v11 = -[AWDWiFiNWActivityPeerStats snrsCount](self, "snrsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addSnr:", -[AWDWiFiNWActivityPeerStats snrAtIndex:](self, "snrAtIndex:", k));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats packetsCount](self, "packetsCount"))
  {
    objc_msgSend(a3, "clearPackets");
    v14 = -[AWDWiFiNWActivityPeerStats packetsCount](self, "packetsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addPackets:", -[AWDWiFiNWActivityPeerStats packetsAtIndex:](self, "packetsAtIndex:", m));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats bytesCount](self, "bytesCount"))
  {
    objc_msgSend(a3, "clearBytes");
    v17 = -[AWDWiFiNWActivityPeerStats bytesCount](self, "bytesCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(a3, "addBytes:", -[AWDWiFiNWActivityPeerStats bytesAtIndex:](self, "bytesAtIndex:", n));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats txLatencyBKsCount](self, "txLatencyBKsCount"))
  {
    objc_msgSend(a3, "clearTxLatencyBKs");
    v20 = -[AWDWiFiNWActivityPeerStats txLatencyBKsCount](self, "txLatencyBKsCount");
    if (v20)
    {
      v21 = v20;
      for (ii = 0; ii != v21; ++ii)
        objc_msgSend(a3, "addTxLatencyBK:", -[AWDWiFiNWActivityPeerStats txLatencyBKAtIndex:](self, "txLatencyBKAtIndex:", ii));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats txLatencyBEsCount](self, "txLatencyBEsCount"))
  {
    objc_msgSend(a3, "clearTxLatencyBEs");
    v23 = -[AWDWiFiNWActivityPeerStats txLatencyBEsCount](self, "txLatencyBEsCount");
    if (v23)
    {
      v24 = v23;
      for (jj = 0; jj != v24; ++jj)
        objc_msgSend(a3, "addTxLatencyBE:", -[AWDWiFiNWActivityPeerStats txLatencyBEAtIndex:](self, "txLatencyBEAtIndex:", jj));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats txLatencyVOsCount](self, "txLatencyVOsCount"))
  {
    objc_msgSend(a3, "clearTxLatencyVOs");
    v26 = -[AWDWiFiNWActivityPeerStats txLatencyVOsCount](self, "txLatencyVOsCount");
    if (v26)
    {
      v27 = v26;
      for (kk = 0; kk != v27; ++kk)
        objc_msgSend(a3, "addTxLatencyVO:", -[AWDWiFiNWActivityPeerStats txLatencyVOAtIndex:](self, "txLatencyVOAtIndex:", kk));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats txLatencyVIsCount](self, "txLatencyVIsCount"))
  {
    objc_msgSend(a3, "clearTxLatencyVIs");
    v29 = -[AWDWiFiNWActivityPeerStats txLatencyVIsCount](self, "txLatencyVIsCount");
    if (v29)
    {
      v30 = v29;
      for (mm = 0; mm != v30; ++mm)
        objc_msgSend(a3, "addTxLatencyVI:", -[AWDWiFiNWActivityPeerStats txLatencyVIAtIndex:](self, "txLatencyVIAtIndex:", mm));
    }
  }
  if (self->_completions)
    objc_msgSend(a3, "setCompletions:");
  if (-[AWDWiFiNWActivityPeerStats acCompletionsCount](self, "acCompletionsCount"))
  {
    objc_msgSend(a3, "clearAcCompletions");
    v32 = -[AWDWiFiNWActivityPeerStats acCompletionsCount](self, "acCompletionsCount");
    if (v32)
    {
      v33 = v32;
      for (nn = 0; nn != v33; ++nn)
        objc_msgSend(a3, "addAcCompletions:", -[AWDWiFiNWActivityPeerStats acCompletionsAtIndex:](self, "acCompletionsAtIndex:", nn));
    }
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)a3 + 25) = self->_rssiValue;
    *((_WORD *)a3 + 112) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_49:
      if ((has & 1) == 0)
        goto LABEL_50;
      goto LABEL_93;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_49;
  }
  *((_DWORD *)a3 + 44) = self->_snrValue;
  *((_WORD *)a3 + 112) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_50:
    if ((has & 8) == 0)
      goto LABEL_51;
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)a3 + 6) = self->_ccaValue;
  *((_WORD *)a3 + 112) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_51:
    if ((has & 0x20) == 0)
      goto LABEL_52;
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)a3 + 16) = self->_nfValue;
  *((_WORD *)a3 + 112) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_52:
    if ((has & 2) == 0)
      goto LABEL_53;
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)a3 + 18) = self->_ofdmDesense;
  *((_WORD *)a3 + 112) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_53:
    if ((has & 0x10) == 0)
      goto LABEL_54;
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 14) = self->_ibssCCA;
  *((_WORD *)a3 + 112) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_54:
    if ((has & 4) == 0)
      goto LABEL_55;
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 17) = self->_obssCCA;
  *((_WORD *)a3 + 112) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_55:
    if ((has & 0x40) == 0)
      goto LABEL_56;
LABEL_99:
    *((_DWORD *)a3 + 22) = self->_qbssCCA;
    *((_WORD *)a3 + 112) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_98:
  *((_DWORD *)a3 + 15) = self->_interferenceCCA;
  *((_WORD *)a3 + 112) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_99;
LABEL_56:
  if ((has & 0x80) != 0)
  {
LABEL_57:
    *((_DWORD *)a3 + 23) = self->_qbssSTACount;
    *((_WORD *)a3 + 112) |= 0x80u;
  }
LABEL_58:
  if (-[AWDWiFiNWActivityPeerStats rxLatencyTID0sCount](self, "rxLatencyTID0sCount"))
  {
    objc_msgSend(a3, "clearRxLatencyTID0s");
    v36 = -[AWDWiFiNWActivityPeerStats rxLatencyTID0sCount](self, "rxLatencyTID0sCount");
    if (v36)
    {
      v37 = v36;
      for (i1 = 0; i1 != v37; ++i1)
        objc_msgSend(a3, "addRxLatencyTID0:", -[AWDWiFiNWActivityPeerStats rxLatencyTID0AtIndex:](self, "rxLatencyTID0AtIndex:", i1));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats rxLatencyTID1sCount](self, "rxLatencyTID1sCount"))
  {
    objc_msgSend(a3, "clearRxLatencyTID1s");
    v39 = -[AWDWiFiNWActivityPeerStats rxLatencyTID1sCount](self, "rxLatencyTID1sCount");
    if (v39)
    {
      v40 = v39;
      for (i2 = 0; i2 != v40; ++i2)
        objc_msgSend(a3, "addRxLatencyTID1:", -[AWDWiFiNWActivityPeerStats rxLatencyTID1AtIndex:](self, "rxLatencyTID1AtIndex:", i2));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats rxLatencyTID2sCount](self, "rxLatencyTID2sCount"))
  {
    objc_msgSend(a3, "clearRxLatencyTID2s");
    v42 = -[AWDWiFiNWActivityPeerStats rxLatencyTID2sCount](self, "rxLatencyTID2sCount");
    if (v42)
    {
      v43 = v42;
      for (i3 = 0; i3 != v43; ++i3)
        objc_msgSend(a3, "addRxLatencyTID2:", -[AWDWiFiNWActivityPeerStats rxLatencyTID2AtIndex:](self, "rxLatencyTID2AtIndex:", i3));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats rxLatencyTID3sCount](self, "rxLatencyTID3sCount"))
  {
    objc_msgSend(a3, "clearRxLatencyTID3s");
    v45 = -[AWDWiFiNWActivityPeerStats rxLatencyTID3sCount](self, "rxLatencyTID3sCount");
    if (v45)
    {
      v46 = v45;
      for (i4 = 0; i4 != v46; ++i4)
        objc_msgSend(a3, "addRxLatencyTID3:", -[AWDWiFiNWActivityPeerStats rxLatencyTID3AtIndex:](self, "rxLatencyTID3AtIndex:", i4));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats rxLatencyTID4sCount](self, "rxLatencyTID4sCount"))
  {
    objc_msgSend(a3, "clearRxLatencyTID4s");
    v48 = -[AWDWiFiNWActivityPeerStats rxLatencyTID4sCount](self, "rxLatencyTID4sCount");
    if (v48)
    {
      v49 = v48;
      for (i5 = 0; i5 != v49; ++i5)
        objc_msgSend(a3, "addRxLatencyTID4:", -[AWDWiFiNWActivityPeerStats rxLatencyTID4AtIndex:](self, "rxLatencyTID4AtIndex:", i5));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats rxLatencyTID5sCount](self, "rxLatencyTID5sCount"))
  {
    objc_msgSend(a3, "clearRxLatencyTID5s");
    v51 = -[AWDWiFiNWActivityPeerStats rxLatencyTID5sCount](self, "rxLatencyTID5sCount");
    if (v51)
    {
      v52 = v51;
      for (i6 = 0; i6 != v52; ++i6)
        objc_msgSend(a3, "addRxLatencyTID5:", -[AWDWiFiNWActivityPeerStats rxLatencyTID5AtIndex:](self, "rxLatencyTID5AtIndex:", i6));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats rxLatencyTID6sCount](self, "rxLatencyTID6sCount"))
  {
    objc_msgSend(a3, "clearRxLatencyTID6s");
    v54 = -[AWDWiFiNWActivityPeerStats rxLatencyTID6sCount](self, "rxLatencyTID6sCount");
    if (v54)
    {
      v55 = v54;
      for (i7 = 0; i7 != v55; ++i7)
        objc_msgSend(a3, "addRxLatencyTID6:", -[AWDWiFiNWActivityPeerStats rxLatencyTID6AtIndex:](self, "rxLatencyTID6AtIndex:", i7));
    }
  }
  if (-[AWDWiFiNWActivityPeerStats rxLatencyTID7sCount](self, "rxLatencyTID7sCount"))
  {
    objc_msgSend(a3, "clearRxLatencyTID7s");
    v57 = -[AWDWiFiNWActivityPeerStats rxLatencyTID7sCount](self, "rxLatencyTID7sCount");
    if (v57)
    {
      v58 = v57;
      for (i8 = 0; i8 != v58; ++i8)
        objc_msgSend(a3, "addRxLatencyTID7:", -[AWDWiFiNWActivityPeerStats rxLatencyTID7AtIndex:](self, "rxLatencyTID7AtIndex:", i8));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *rssis;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *ccas;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *snrs;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  NSMutableArray *packets;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  NSMutableArray *bytes;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  void *v36;
  NSMutableArray *txLatencyBKs;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t ii;
  void *v42;
  NSMutableArray *txLatencyBEs;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t jj;
  void *v48;
  NSMutableArray *txLatencyVOs;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t kk;
  void *v54;
  NSMutableArray *txLatencyVIs;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t mm;
  void *v60;
  NSMutableArray *acCompletions;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t nn;
  void *v66;
  __int16 has;
  NSMutableArray *rxLatencyTID0s;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i1;
  void *v73;
  NSMutableArray *rxLatencyTID1s;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i2;
  void *v79;
  NSMutableArray *rxLatencyTID2s;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i3;
  void *v85;
  NSMutableArray *rxLatencyTID3s;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i4;
  void *v91;
  NSMutableArray *rxLatencyTID4s;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i5;
  void *v97;
  NSMutableArray *rxLatencyTID5s;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i6;
  void *v103;
  NSMutableArray *rxLatencyTID6s;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i7;
  void *v109;
  NSMutableArray *rxLatencyTID7s;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t i8;
  void *v115;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  uint64_t v207;

  v207 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_role;
    *(_WORD *)(v5 + 224) |= 0x100u;
  }

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_hashID, "copyWithZone:", a3);
  v185 = 0u;
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  rssis = self->_rssis;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rssis, "countByEnumeratingWithState:objects:count:", &v185, v206, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v186;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v186 != v10)
          objc_enumerationMutation(rssis);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v185 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRssi:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rssis, "countByEnumeratingWithState:objects:count:", &v185, v206, 16);
    }
    while (v9);
  }
  v184 = 0u;
  v183 = 0u;
  v182 = 0u;
  v181 = 0u;
  ccas = self->_ccas;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ccas, "countByEnumeratingWithState:objects:count:", &v181, v205, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v182;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v182 != v16)
          objc_enumerationMutation(ccas);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v181 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addCca:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](ccas, "countByEnumeratingWithState:objects:count:", &v181, v205, 16);
    }
    while (v15);
  }
  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  snrs = self->_snrs;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snrs, "countByEnumeratingWithState:objects:count:", &v177, v204, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v178;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v178 != v22)
          objc_enumerationMutation(snrs);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSnr:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snrs, "countByEnumeratingWithState:objects:count:", &v177, v204, 16);
    }
    while (v21);
  }
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  packets = self->_packets;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v173, v203, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v174;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v174 != v28)
          objc_enumerationMutation(packets);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPackets:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v173, v203, 16);
    }
    while (v27);
  }
  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  bytes = self->_bytes;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v169, v202, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v170;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v170 != v34)
          objc_enumerationMutation(bytes);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addBytes:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v169, v202, 16);
    }
    while (v33);
  }
  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  txLatencyBKs = self->_txLatencyBKs;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBKs, "countByEnumeratingWithState:objects:count:", &v165, v201, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v166;
    do
    {
      for (ii = 0; ii != v39; ++ii)
      {
        if (*(_QWORD *)v166 != v40)
          objc_enumerationMutation(txLatencyBKs);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxLatencyBK:", v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBKs, "countByEnumeratingWithState:objects:count:", &v165, v201, 16);
    }
    while (v39);
  }
  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  txLatencyBEs = self->_txLatencyBEs;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBEs, "countByEnumeratingWithState:objects:count:", &v161, v200, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v162;
    do
    {
      for (jj = 0; jj != v45; ++jj)
      {
        if (*(_QWORD *)v162 != v46)
          objc_enumerationMutation(txLatencyBEs);
        v48 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxLatencyBE:", v48);

      }
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyBEs, "countByEnumeratingWithState:objects:count:", &v161, v200, 16);
    }
    while (v45);
  }
  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  txLatencyVOs = self->_txLatencyVOs;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVOs, "countByEnumeratingWithState:objects:count:", &v157, v199, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v158;
    do
    {
      for (kk = 0; kk != v51; ++kk)
      {
        if (*(_QWORD *)v158 != v52)
          objc_enumerationMutation(txLatencyVOs);
        v54 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxLatencyVO:", v54);

      }
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVOs, "countByEnumeratingWithState:objects:count:", &v157, v199, 16);
    }
    while (v51);
  }
  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  txLatencyVIs = self->_txLatencyVIs;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVIs, "countByEnumeratingWithState:objects:count:", &v153, v198, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v154;
    do
    {
      for (mm = 0; mm != v57; ++mm)
      {
        if (*(_QWORD *)v154 != v58)
          objc_enumerationMutation(txLatencyVIs);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxLatencyVI:", v60);

      }
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txLatencyVIs, "countByEnumeratingWithState:objects:count:", &v153, v198, 16);
    }
    while (v57);
  }

  *(_QWORD *)(v6 + 40) = -[AWDWiFiNWActivityTxCompletions copyWithZone:](self->_completions, "copyWithZone:", a3);
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  acCompletions = self->_acCompletions;
  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](acCompletions, "countByEnumeratingWithState:objects:count:", &v149, v197, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v150;
    do
    {
      for (nn = 0; nn != v63; ++nn)
      {
        if (*(_QWORD *)v150 != v64)
          objc_enumerationMutation(acCompletions);
        v66 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * nn), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAcCompletions:", v66);

      }
      v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](acCompletions, "countByEnumeratingWithState:objects:count:", &v149, v197, 16);
    }
    while (v63);
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_rssiValue;
    *(_WORD *)(v6 + 224) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_75:
      if ((has & 1) == 0)
        goto LABEL_76;
      goto LABEL_143;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_75;
  }
  *(_DWORD *)(v6 + 176) = self->_snrValue;
  *(_WORD *)(v6 + 224) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_76:
    if ((has & 8) == 0)
      goto LABEL_77;
    goto LABEL_144;
  }
LABEL_143:
  *(_DWORD *)(v6 + 24) = self->_ccaValue;
  *(_WORD *)(v6 + 224) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_77:
    if ((has & 0x20) == 0)
      goto LABEL_78;
    goto LABEL_145;
  }
LABEL_144:
  *(_DWORD *)(v6 + 64) = self->_nfValue;
  *(_WORD *)(v6 + 224) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_78:
    if ((has & 2) == 0)
      goto LABEL_79;
    goto LABEL_146;
  }
LABEL_145:
  *(_DWORD *)(v6 + 72) = self->_ofdmDesense;
  *(_WORD *)(v6 + 224) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_79:
    if ((has & 0x10) == 0)
      goto LABEL_80;
    goto LABEL_147;
  }
LABEL_146:
  *(_DWORD *)(v6 + 56) = self->_ibssCCA;
  *(_WORD *)(v6 + 224) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_80:
    if ((has & 4) == 0)
      goto LABEL_81;
    goto LABEL_148;
  }
LABEL_147:
  *(_DWORD *)(v6 + 68) = self->_obssCCA;
  *(_WORD *)(v6 + 224) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_81:
    if ((has & 0x40) == 0)
      goto LABEL_82;
    goto LABEL_149;
  }
LABEL_148:
  *(_DWORD *)(v6 + 60) = self->_interferenceCCA;
  *(_WORD *)(v6 + 224) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_82:
    if ((has & 0x80) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
LABEL_149:
  *(_DWORD *)(v6 + 88) = self->_qbssCCA;
  *(_WORD *)(v6 + 224) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_83:
    *(_DWORD *)(v6 + 92) = self->_qbssSTACount;
    *(_WORD *)(v6 + 224) |= 0x80u;
  }
LABEL_84:
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  rxLatencyTID0s = self->_rxLatencyTID0s;
  v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID0s, "countByEnumeratingWithState:objects:count:", &v145, v196, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v146;
    do
    {
      for (i1 = 0; i1 != v70; ++i1)
      {
        if (*(_QWORD *)v146 != v71)
          objc_enumerationMutation(rxLatencyTID0s);
        v73 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * i1), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxLatencyTID0:", v73);

      }
      v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID0s, "countByEnumeratingWithState:objects:count:", &v145, v196, 16);
    }
    while (v70);
  }
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  rxLatencyTID1s = self->_rxLatencyTID1s;
  v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID1s, "countByEnumeratingWithState:objects:count:", &v141, v195, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v142;
    do
    {
      for (i2 = 0; i2 != v76; ++i2)
      {
        if (*(_QWORD *)v142 != v77)
          objc_enumerationMutation(rxLatencyTID1s);
        v79 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * i2), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxLatencyTID1:", v79);

      }
      v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID1s, "countByEnumeratingWithState:objects:count:", &v141, v195, 16);
    }
    while (v76);
  }
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  rxLatencyTID2s = self->_rxLatencyTID2s;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID2s, "countByEnumeratingWithState:objects:count:", &v137, v194, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v138;
    do
    {
      for (i3 = 0; i3 != v82; ++i3)
      {
        if (*(_QWORD *)v138 != v83)
          objc_enumerationMutation(rxLatencyTID2s);
        v85 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * i3), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxLatencyTID2:", v85);

      }
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID2s, "countByEnumeratingWithState:objects:count:", &v137, v194, 16);
    }
    while (v82);
  }
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  rxLatencyTID3s = self->_rxLatencyTID3s;
  v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID3s, "countByEnumeratingWithState:objects:count:", &v133, v193, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v134;
    do
    {
      for (i4 = 0; i4 != v88; ++i4)
      {
        if (*(_QWORD *)v134 != v89)
          objc_enumerationMutation(rxLatencyTID3s);
        v91 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * i4), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxLatencyTID3:", v91);

      }
      v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID3s, "countByEnumeratingWithState:objects:count:", &v133, v193, 16);
    }
    while (v88);
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  rxLatencyTID4s = self->_rxLatencyTID4s;
  v93 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID4s, "countByEnumeratingWithState:objects:count:", &v129, v192, 16);
  if (v93)
  {
    v94 = v93;
    v95 = *(_QWORD *)v130;
    do
    {
      for (i5 = 0; i5 != v94; ++i5)
      {
        if (*(_QWORD *)v130 != v95)
          objc_enumerationMutation(rxLatencyTID4s);
        v97 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * i5), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxLatencyTID4:", v97);

      }
      v94 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID4s, "countByEnumeratingWithState:objects:count:", &v129, v192, 16);
    }
    while (v94);
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  rxLatencyTID5s = self->_rxLatencyTID5s;
  v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID5s, "countByEnumeratingWithState:objects:count:", &v125, v191, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v126;
    do
    {
      for (i6 = 0; i6 != v100; ++i6)
      {
        if (*(_QWORD *)v126 != v101)
          objc_enumerationMutation(rxLatencyTID5s);
        v103 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * i6), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxLatencyTID5:", v103);

      }
      v100 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID5s, "countByEnumeratingWithState:objects:count:", &v125, v191, 16);
    }
    while (v100);
  }
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  rxLatencyTID6s = self->_rxLatencyTID6s;
  v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID6s, "countByEnumeratingWithState:objects:count:", &v121, v190, 16);
  if (v105)
  {
    v106 = v105;
    v107 = *(_QWORD *)v122;
    do
    {
      for (i7 = 0; i7 != v106; ++i7)
      {
        if (*(_QWORD *)v122 != v107)
          objc_enumerationMutation(rxLatencyTID6s);
        v109 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * i7), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxLatencyTID6:", v109);

      }
      v106 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID6s, "countByEnumeratingWithState:objects:count:", &v121, v190, 16);
    }
    while (v106);
  }
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  rxLatencyTID7s = self->_rxLatencyTID7s;
  v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID7s, "countByEnumeratingWithState:objects:count:", &v117, v189, 16);
  if (v111)
  {
    v112 = v111;
    v113 = *(_QWORD *)v118;
    do
    {
      for (i8 = 0; i8 != v112; ++i8)
      {
        if (*(_QWORD *)v118 != v113)
          objc_enumerationMutation(rxLatencyTID7s);
        v115 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * i8), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxLatencyTID7:", v115);

      }
      v112 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxLatencyTID7s, "countByEnumeratingWithState:objects:count:", &v117, v189, 16);
    }
    while (v112);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *hashID;
  NSMutableArray *rssis;
  NSMutableArray *ccas;
  NSMutableArray *snrs;
  NSMutableArray *packets;
  NSMutableArray *bytes;
  NSMutableArray *txLatencyBKs;
  NSMutableArray *txLatencyBEs;
  NSMutableArray *txLatencyVOs;
  NSMutableArray *txLatencyVIs;
  AWDWiFiNWActivityTxCompletions *completions;
  NSMutableArray *acCompletions;
  __int16 has;
  __int16 v19;
  NSMutableArray *rxLatencyTID0s;
  NSMutableArray *rxLatencyTID1s;
  NSMutableArray *rxLatencyTID2s;
  NSMutableArray *rxLatencyTID3s;
  NSMutableArray *rxLatencyTID4s;
  NSMutableArray *rxLatencyTID5s;
  NSMutableArray *rxLatencyTID6s;
  NSMutableArray *rxLatencyTID7s;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 112) & 0x100) == 0 || self->_role != *((_DWORD *)a3 + 24))
        goto LABEL_97;
    }
    else if ((*((_WORD *)a3 + 112) & 0x100) != 0)
    {
LABEL_97:
      LOBYTE(v5) = 0;
      return v5;
    }
    hashID = self->_hashID;
    if (!((unint64_t)hashID | *((_QWORD *)a3 + 6)) || (v5 = -[NSString isEqual:](hashID, "isEqual:")) != 0)
    {
      rssis = self->_rssis;
      if (!((unint64_t)rssis | *((_QWORD *)a3 + 13))
        || (v5 = -[NSMutableArray isEqual:](rssis, "isEqual:")) != 0)
      {
        ccas = self->_ccas;
        if (!((unint64_t)ccas | *((_QWORD *)a3 + 4)) || (v5 = -[NSMutableArray isEqual:](ccas, "isEqual:")) != 0)
        {
          snrs = self->_snrs;
          if (!((unint64_t)snrs | *((_QWORD *)a3 + 23))
            || (v5 = -[NSMutableArray isEqual:](snrs, "isEqual:")) != 0)
          {
            packets = self->_packets;
            if (!((unint64_t)packets | *((_QWORD *)a3 + 10))
              || (v5 = -[NSMutableArray isEqual:](packets, "isEqual:")) != 0)
            {
              bytes = self->_bytes;
              if (!((unint64_t)bytes | *((_QWORD *)a3 + 2))
                || (v5 = -[NSMutableArray isEqual:](bytes, "isEqual:")) != 0)
              {
                txLatencyBKs = self->_txLatencyBKs;
                if (!((unint64_t)txLatencyBKs | *((_QWORD *)a3 + 25))
                  || (v5 = -[NSMutableArray isEqual:](txLatencyBKs, "isEqual:")) != 0)
                {
                  txLatencyBEs = self->_txLatencyBEs;
                  if (!((unint64_t)txLatencyBEs | *((_QWORD *)a3 + 24))
                    || (v5 = -[NSMutableArray isEqual:](txLatencyBEs, "isEqual:")) != 0)
                  {
                    txLatencyVOs = self->_txLatencyVOs;
                    if (!((unint64_t)txLatencyVOs | *((_QWORD *)a3 + 27))
                      || (v5 = -[NSMutableArray isEqual:](txLatencyVOs, "isEqual:")) != 0)
                    {
                      txLatencyVIs = self->_txLatencyVIs;
                      if (!((unint64_t)txLatencyVIs | *((_QWORD *)a3 + 26))
                        || (v5 = -[NSMutableArray isEqual:](txLatencyVIs, "isEqual:")) != 0)
                      {
                        completions = self->_completions;
                        if (!((unint64_t)completions | *((_QWORD *)a3 + 5))
                          || (v5 = -[AWDWiFiNWActivityTxCompletions isEqual:](completions, "isEqual:")) != 0)
                        {
                          acCompletions = self->_acCompletions;
                          if (!((unint64_t)acCompletions | *((_QWORD *)a3 + 1))
                            || (v5 = -[NSMutableArray isEqual:](acCompletions, "isEqual:")) != 0)
                          {
                            has = (__int16)self->_has;
                            v19 = *((_WORD *)a3 + 112);
                            if ((has & 0x200) != 0)
                            {
                              if ((*((_WORD *)a3 + 112) & 0x200) == 0 || self->_rssiValue != *((_DWORD *)a3 + 25))
                                goto LABEL_97;
                            }
                            else if ((*((_WORD *)a3 + 112) & 0x200) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((*(_WORD *)&self->_has & 0x400) != 0)
                            {
                              if ((*((_WORD *)a3 + 112) & 0x400) == 0 || self->_snrValue != *((_DWORD *)a3 + 44))
                                goto LABEL_97;
                            }
                            else if ((*((_WORD *)a3 + 112) & 0x400) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 1) != 0)
                            {
                              if ((v19 & 1) == 0 || self->_ccaValue != *((_DWORD *)a3 + 6))
                                goto LABEL_97;
                            }
                            else if ((v19 & 1) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 8) != 0)
                            {
                              if ((v19 & 8) == 0 || self->_nfValue != *((_DWORD *)a3 + 16))
                                goto LABEL_97;
                            }
                            else if ((v19 & 8) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 0x20) != 0)
                            {
                              if ((v19 & 0x20) == 0 || self->_ofdmDesense != *((_DWORD *)a3 + 18))
                                goto LABEL_97;
                            }
                            else if ((v19 & 0x20) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 2) != 0)
                            {
                              if ((v19 & 2) == 0 || self->_ibssCCA != *((_DWORD *)a3 + 14))
                                goto LABEL_97;
                            }
                            else if ((v19 & 2) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 0x10) != 0)
                            {
                              if ((v19 & 0x10) == 0 || self->_obssCCA != *((_DWORD *)a3 + 17))
                                goto LABEL_97;
                            }
                            else if ((v19 & 0x10) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 4) != 0)
                            {
                              if ((v19 & 4) == 0 || self->_interferenceCCA != *((_DWORD *)a3 + 15))
                                goto LABEL_97;
                            }
                            else if ((v19 & 4) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 0x40) != 0)
                            {
                              if ((v19 & 0x40) == 0 || self->_qbssCCA != *((_DWORD *)a3 + 22))
                                goto LABEL_97;
                            }
                            else if ((v19 & 0x40) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 0x80) != 0)
                            {
                              if ((v19 & 0x80) == 0 || self->_qbssSTACount != *((_DWORD *)a3 + 23))
                                goto LABEL_97;
                            }
                            else if ((v19 & 0x80) != 0)
                            {
                              goto LABEL_97;
                            }
                            rxLatencyTID0s = self->_rxLatencyTID0s;
                            if (!((unint64_t)rxLatencyTID0s | *((_QWORD *)a3 + 14))
                              || (v5 = -[NSMutableArray isEqual:](rxLatencyTID0s, "isEqual:")) != 0)
                            {
                              rxLatencyTID1s = self->_rxLatencyTID1s;
                              if (!((unint64_t)rxLatencyTID1s | *((_QWORD *)a3 + 15))
                                || (v5 = -[NSMutableArray isEqual:](rxLatencyTID1s, "isEqual:")) != 0)
                              {
                                rxLatencyTID2s = self->_rxLatencyTID2s;
                                if (!((unint64_t)rxLatencyTID2s | *((_QWORD *)a3 + 16))
                                  || (v5 = -[NSMutableArray isEqual:](rxLatencyTID2s, "isEqual:")) != 0)
                                {
                                  rxLatencyTID3s = self->_rxLatencyTID3s;
                                  if (!((unint64_t)rxLatencyTID3s | *((_QWORD *)a3 + 17))
                                    || (v5 = -[NSMutableArray isEqual:](rxLatencyTID3s, "isEqual:")) != 0)
                                  {
                                    rxLatencyTID4s = self->_rxLatencyTID4s;
                                    if (!((unint64_t)rxLatencyTID4s | *((_QWORD *)a3 + 18))
                                      || (v5 = -[NSMutableArray isEqual:](rxLatencyTID4s, "isEqual:")) != 0)
                                    {
                                      rxLatencyTID5s = self->_rxLatencyTID5s;
                                      if (!((unint64_t)rxLatencyTID5s | *((_QWORD *)a3 + 19))
                                        || (v5 = -[NSMutableArray isEqual:](rxLatencyTID5s, "isEqual:")) != 0)
                                      {
                                        rxLatencyTID6s = self->_rxLatencyTID6s;
                                        if (!((unint64_t)rxLatencyTID6s | *((_QWORD *)a3 + 20))
                                          || (v5 = -[NSMutableArray isEqual:](rxLatencyTID6s, "isEqual:")) != 0)
                                        {
                                          rxLatencyTID7s = self->_rxLatencyTID7s;
                                          if ((unint64_t)rxLatencyTID7s | *((_QWORD *)a3 + 21))
                                            LOBYTE(v5) = -[NSMutableArray isEqual:](rxLatencyTID7s, "isEqual:");
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
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int16 has;
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
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  uint64_t v35;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v35 = 2654435761 * self->_role;
  else
    v35 = 0;
  v34 = -[NSString hash](self->_hashID, "hash");
  v33 = -[NSMutableArray hash](self->_rssis, "hash");
  v32 = -[NSMutableArray hash](self->_ccas, "hash");
  v31 = -[NSMutableArray hash](self->_snrs, "hash");
  v3 = -[NSMutableArray hash](self->_packets, "hash");
  v4 = -[NSMutableArray hash](self->_bytes, "hash");
  v5 = -[NSMutableArray hash](self->_txLatencyBKs, "hash");
  v6 = -[NSMutableArray hash](self->_txLatencyBEs, "hash");
  v7 = -[NSMutableArray hash](self->_txLatencyVOs, "hash");
  v8 = -[NSMutableArray hash](self->_txLatencyVIs, "hash");
  v9 = -[AWDWiFiNWActivityTxCompletions hash](self->_completions, "hash");
  v10 = -[NSMutableArray hash](self->_acCompletions, "hash");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v12 = 2654435761 * self->_rssiValue;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_6:
      v13 = 2654435761 * self->_snrValue;
      if ((has & 1) != 0)
        goto LABEL_7;
      goto LABEL_17;
    }
  }
  else
  {
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_6;
  }
  v13 = 0;
  if ((has & 1) != 0)
  {
LABEL_7:
    v14 = 2654435761 * self->_ccaValue;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v15 = 2654435761 * self->_nfValue;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v16 = 2654435761 * self->_ofdmDesense;
    if ((has & 2) != 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  v16 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    v17 = 2654435761 * self->_ibssCCA;
    if ((has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  v17 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    v18 = 2654435761 * self->_obssCCA;
    if ((has & 4) != 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  v18 = 0;
  if ((has & 4) != 0)
  {
LABEL_12:
    v19 = 2654435761 * self->_interferenceCCA;
    if ((has & 0x40) != 0)
      goto LABEL_13;
LABEL_23:
    v20 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_14;
LABEL_24:
    v21 = 0;
    goto LABEL_25;
  }
LABEL_22:
  v19 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_23;
LABEL_13:
  v20 = 2654435761 * self->_qbssCCA;
  if ((has & 0x80) == 0)
    goto LABEL_24;
LABEL_14:
  v21 = 2654435761 * self->_qbssSTACount;
LABEL_25:
  v22 = v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
  v23 = v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ -[NSMutableArray hash](self->_rxLatencyTID0s, "hash");
  v24 = v23 ^ -[NSMutableArray hash](self->_rxLatencyTID1s, "hash");
  v25 = v24 ^ -[NSMutableArray hash](self->_rxLatencyTID2s, "hash");
  v26 = v25 ^ -[NSMutableArray hash](self->_rxLatencyTID3s, "hash");
  v27 = v22 ^ v26 ^ -[NSMutableArray hash](self->_rxLatencyTID4s, "hash");
  v28 = -[NSMutableArray hash](self->_rxLatencyTID5s, "hash");
  v29 = v28 ^ -[NSMutableArray hash](self->_rxLatencyTID6s, "hash");
  return v27 ^ v29 ^ -[NSMutableArray hash](self->_rxLatencyTID7s, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t jj;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t kk;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t mm;
  AWDWiFiNWActivityTxCompletions *completions;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t nn;
  __int16 v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i1;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i2;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i3;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i4;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i5;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i6;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i7;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i8;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  uint64_t v188;

  v188 = *MEMORY[0x24BDAC8D0];
  if ((*((_WORD *)a3 + 112) & 0x100) != 0)
  {
    self->_role = *((_DWORD *)a3 + 24);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)a3 + 6))
    -[AWDWiFiNWActivityPeerStats setHashID:](self, "setHashID:");
  v169 = 0u;
  v168 = 0u;
  v167 = 0u;
  v166 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 13);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v166, v187, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v167;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v167 != v8)
          objc_enumerationMutation(v5);
        -[AWDWiFiNWActivityPeerStats addRssi:](self, "addRssi:", *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v166, v187, 16);
    }
    while (v7);
  }
  v165 = 0u;
  v164 = 0u;
  v163 = 0u;
  v162 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v162, v186, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v163;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v163 != v13)
          objc_enumerationMutation(v10);
        -[AWDWiFiNWActivityPeerStats addCca:](self, "addCca:", *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v162, v186, 16);
    }
    while (v12);
  }
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v15 = (void *)*((_QWORD *)a3 + 23);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v158, v185, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v159;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v159 != v18)
          objc_enumerationMutation(v15);
        -[AWDWiFiNWActivityPeerStats addSnr:](self, "addSnr:", *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v158, v185, 16);
    }
    while (v17);
  }
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v20 = (void *)*((_QWORD *)a3 + 10);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v154, v184, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v155;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v155 != v23)
          objc_enumerationMutation(v20);
        -[AWDWiFiNWActivityPeerStats addPackets:](self, "addPackets:", *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v154, v184, 16);
    }
    while (v22);
  }
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v25 = (void *)*((_QWORD *)a3 + 2);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v150, v183, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v151;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v151 != v28)
          objc_enumerationMutation(v25);
        -[AWDWiFiNWActivityPeerStats addBytes:](self, "addBytes:", *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * n));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v150, v183, 16);
    }
    while (v27);
  }
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v30 = (void *)*((_QWORD *)a3 + 25);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v146, v182, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v147;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v147 != v33)
          objc_enumerationMutation(v30);
        -[AWDWiFiNWActivityPeerStats addTxLatencyBK:](self, "addTxLatencyBK:", *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * ii));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v146, v182, 16);
    }
    while (v32);
  }
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v35 = (void *)*((_QWORD *)a3 + 24);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v142, v181, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v143;
    do
    {
      for (jj = 0; jj != v37; ++jj)
      {
        if (*(_QWORD *)v143 != v38)
          objc_enumerationMutation(v35);
        -[AWDWiFiNWActivityPeerStats addTxLatencyBE:](self, "addTxLatencyBE:", *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * jj));
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v142, v181, 16);
    }
    while (v37);
  }
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v40 = (void *)*((_QWORD *)a3 + 27);
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v138, v180, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v139;
    do
    {
      for (kk = 0; kk != v42; ++kk)
      {
        if (*(_QWORD *)v139 != v43)
          objc_enumerationMutation(v40);
        -[AWDWiFiNWActivityPeerStats addTxLatencyVO:](self, "addTxLatencyVO:", *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * kk));
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v138, v180, 16);
    }
    while (v42);
  }
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v45 = (void *)*((_QWORD *)a3 + 26);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v134, v179, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v135;
    do
    {
      for (mm = 0; mm != v47; ++mm)
      {
        if (*(_QWORD *)v135 != v48)
          objc_enumerationMutation(v45);
        -[AWDWiFiNWActivityPeerStats addTxLatencyVI:](self, "addTxLatencyVI:", *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * mm));
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v134, v179, 16);
    }
    while (v47);
  }
  completions = self->_completions;
  v51 = *((_QWORD *)a3 + 5);
  if (completions)
  {
    if (v51)
      -[AWDWiFiNWActivityTxCompletions mergeFrom:](completions, "mergeFrom:");
  }
  else if (v51)
  {
    -[AWDWiFiNWActivityPeerStats setCompletions:](self, "setCompletions:");
  }
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v52 = (void *)*((_QWORD *)a3 + 1);
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v130, v178, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v131;
    do
    {
      for (nn = 0; nn != v54; ++nn)
      {
        if (*(_QWORD *)v131 != v55)
          objc_enumerationMutation(v52);
        -[AWDWiFiNWActivityPeerStats addAcCompletions:](self, "addAcCompletions:", *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * nn));
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v130, v178, 16);
    }
    while (v54);
  }
  v57 = *((_WORD *)a3 + 112);
  if ((v57 & 0x200) != 0)
  {
    self->_rssiValue = *((_DWORD *)a3 + 25);
    *(_WORD *)&self->_has |= 0x200u;
    v57 = *((_WORD *)a3 + 112);
    if ((v57 & 0x400) == 0)
    {
LABEL_82:
      if ((v57 & 1) == 0)
        goto LABEL_83;
      goto LABEL_150;
    }
  }
  else if ((*((_WORD *)a3 + 112) & 0x400) == 0)
  {
    goto LABEL_82;
  }
  self->_snrValue = *((_DWORD *)a3 + 44);
  *(_WORD *)&self->_has |= 0x400u;
  v57 = *((_WORD *)a3 + 112);
  if ((v57 & 1) == 0)
  {
LABEL_83:
    if ((v57 & 8) == 0)
      goto LABEL_84;
    goto LABEL_151;
  }
LABEL_150:
  self->_ccaValue = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 1u;
  v57 = *((_WORD *)a3 + 112);
  if ((v57 & 8) == 0)
  {
LABEL_84:
    if ((v57 & 0x20) == 0)
      goto LABEL_85;
    goto LABEL_152;
  }
LABEL_151:
  self->_nfValue = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 8u;
  v57 = *((_WORD *)a3 + 112);
  if ((v57 & 0x20) == 0)
  {
LABEL_85:
    if ((v57 & 2) == 0)
      goto LABEL_86;
    goto LABEL_153;
  }
LABEL_152:
  self->_ofdmDesense = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  v57 = *((_WORD *)a3 + 112);
  if ((v57 & 2) == 0)
  {
LABEL_86:
    if ((v57 & 0x10) == 0)
      goto LABEL_87;
    goto LABEL_154;
  }
LABEL_153:
  self->_ibssCCA = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 2u;
  v57 = *((_WORD *)a3 + 112);
  if ((v57 & 0x10) == 0)
  {
LABEL_87:
    if ((v57 & 4) == 0)
      goto LABEL_88;
    goto LABEL_155;
  }
LABEL_154:
  self->_obssCCA = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x10u;
  v57 = *((_WORD *)a3 + 112);
  if ((v57 & 4) == 0)
  {
LABEL_88:
    if ((v57 & 0x40) == 0)
      goto LABEL_89;
    goto LABEL_156;
  }
LABEL_155:
  self->_interferenceCCA = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 4u;
  v57 = *((_WORD *)a3 + 112);
  if ((v57 & 0x40) == 0)
  {
LABEL_89:
    if ((v57 & 0x80) == 0)
      goto LABEL_91;
    goto LABEL_90;
  }
LABEL_156:
  self->_qbssCCA = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 112) & 0x80) != 0)
  {
LABEL_90:
    self->_qbssSTACount = *((_DWORD *)a3 + 23);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_91:
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v58 = (void *)*((_QWORD *)a3 + 14);
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v126, v177, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v127;
    do
    {
      for (i1 = 0; i1 != v60; ++i1)
      {
        if (*(_QWORD *)v127 != v61)
          objc_enumerationMutation(v58);
        -[AWDWiFiNWActivityPeerStats addRxLatencyTID0:](self, "addRxLatencyTID0:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * i1));
      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v126, v177, 16);
    }
    while (v60);
  }
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v63 = (void *)*((_QWORD *)a3 + 15);
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v122, v176, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v123;
    do
    {
      for (i2 = 0; i2 != v65; ++i2)
      {
        if (*(_QWORD *)v123 != v66)
          objc_enumerationMutation(v63);
        -[AWDWiFiNWActivityPeerStats addRxLatencyTID1:](self, "addRxLatencyTID1:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i2));
      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v122, v176, 16);
    }
    while (v65);
  }
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v68 = (void *)*((_QWORD *)a3 + 16);
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v118, v175, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v119;
    do
    {
      for (i3 = 0; i3 != v70; ++i3)
      {
        if (*(_QWORD *)v119 != v71)
          objc_enumerationMutation(v68);
        -[AWDWiFiNWActivityPeerStats addRxLatencyTID2:](self, "addRxLatencyTID2:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i3));
      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v118, v175, 16);
    }
    while (v70);
  }
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v73 = (void *)*((_QWORD *)a3 + 17);
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v114, v174, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v115;
    do
    {
      for (i4 = 0; i4 != v75; ++i4)
      {
        if (*(_QWORD *)v115 != v76)
          objc_enumerationMutation(v73);
        -[AWDWiFiNWActivityPeerStats addRxLatencyTID3:](self, "addRxLatencyTID3:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i4));
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v114, v174, 16);
    }
    while (v75);
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v78 = (void *)*((_QWORD *)a3 + 18);
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v110, v173, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v111;
    do
    {
      for (i5 = 0; i5 != v80; ++i5)
      {
        if (*(_QWORD *)v111 != v81)
          objc_enumerationMutation(v78);
        -[AWDWiFiNWActivityPeerStats addRxLatencyTID4:](self, "addRxLatencyTID4:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i5));
      }
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v110, v173, 16);
    }
    while (v80);
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v83 = (void *)*((_QWORD *)a3 + 19);
  v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v106, v172, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v107;
    do
    {
      for (i6 = 0; i6 != v85; ++i6)
      {
        if (*(_QWORD *)v107 != v86)
          objc_enumerationMutation(v83);
        -[AWDWiFiNWActivityPeerStats addRxLatencyTID5:](self, "addRxLatencyTID5:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i6));
      }
      v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v106, v172, 16);
    }
    while (v85);
  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v88 = (void *)*((_QWORD *)a3 + 20);
  v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v102, v171, 16);
  if (v89)
  {
    v90 = v89;
    v91 = *(_QWORD *)v103;
    do
    {
      for (i7 = 0; i7 != v90; ++i7)
      {
        if (*(_QWORD *)v103 != v91)
          objc_enumerationMutation(v88);
        -[AWDWiFiNWActivityPeerStats addRxLatencyTID6:](self, "addRxLatencyTID6:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i7));
      }
      v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v102, v171, 16);
    }
    while (v90);
  }
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v93 = (void *)*((_QWORD *)a3 + 21);
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v98, v170, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v99;
    do
    {
      for (i8 = 0; i8 != v95; ++i8)
      {
        if (*(_QWORD *)v99 != v96)
          objc_enumerationMutation(v93);
        -[AWDWiFiNWActivityPeerStats addRxLatencyTID7:](self, "addRxLatencyTID7:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i8));
      }
      v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v98, v170, 16);
    }
    while (v95);
  }
}

- (NSString)hashID
{
  return self->_hashID;
}

- (void)setHashID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)rssis
{
  return self->_rssis;
}

- (void)setRssis:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSMutableArray)ccas
{
  return self->_ccas;
}

- (void)setCcas:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)snrs
{
  return self->_snrs;
}

- (void)setSnrs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSMutableArray)packets
{
  return self->_packets;
}

- (void)setPackets:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableArray)bytes
{
  return self->_bytes;
}

- (void)setBytes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)txLatencyBKs
{
  return self->_txLatencyBKs;
}

- (void)setTxLatencyBKs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSMutableArray)txLatencyBEs
{
  return self->_txLatencyBEs;
}

- (void)setTxLatencyBEs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSMutableArray)txLatencyVOs
{
  return self->_txLatencyVOs;
}

- (void)setTxLatencyVOs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (NSMutableArray)txLatencyVIs
{
  return self->_txLatencyVIs;
}

- (void)setTxLatencyVIs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (AWDWiFiNWActivityTxCompletions)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)acCompletions
{
  return self->_acCompletions;
}

- (void)setAcCompletions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (int)rssiValue
{
  return self->_rssiValue;
}

- (int)snrValue
{
  return self->_snrValue;
}

- (unsigned)ccaValue
{
  return self->_ccaValue;
}

- (int)nfValue
{
  return self->_nfValue;
}

- (unsigned)ofdmDesense
{
  return self->_ofdmDesense;
}

- (unsigned)ibssCCA
{
  return self->_ibssCCA;
}

- (unsigned)obssCCA
{
  return self->_obssCCA;
}

- (unsigned)interferenceCCA
{
  return self->_interferenceCCA;
}

- (unsigned)qbssCCA
{
  return self->_qbssCCA;
}

- (unsigned)qbssSTACount
{
  return self->_qbssSTACount;
}

- (NSMutableArray)rxLatencyTID0s
{
  return self->_rxLatencyTID0s;
}

- (void)setRxLatencyTID0s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSMutableArray)rxLatencyTID1s
{
  return self->_rxLatencyTID1s;
}

- (void)setRxLatencyTID1s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSMutableArray)rxLatencyTID2s
{
  return self->_rxLatencyTID2s;
}

- (void)setRxLatencyTID2s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSMutableArray)rxLatencyTID3s
{
  return self->_rxLatencyTID3s;
}

- (void)setRxLatencyTID3s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSMutableArray)rxLatencyTID4s
{
  return self->_rxLatencyTID4s;
}

- (void)setRxLatencyTID4s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSMutableArray)rxLatencyTID5s
{
  return self->_rxLatencyTID5s;
}

- (void)setRxLatencyTID5s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSMutableArray)rxLatencyTID6s
{
  return self->_rxLatencyTID6s;
}

- (void)setRxLatencyTID6s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSMutableArray)rxLatencyTID7s
{
  return self->_rxLatencyTID7s;
}

- (void)setRxLatencyTID7s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

@end
