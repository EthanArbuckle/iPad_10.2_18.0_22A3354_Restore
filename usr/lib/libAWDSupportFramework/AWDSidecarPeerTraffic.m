@implementation AWDSidecarPeerTraffic

- (void)dealloc
{
  objc_super v3;

  -[AWDSidecarPeerTraffic setTxTotalDelays:](self, "setTxTotalDelays:", 0);
  -[AWDSidecarPeerTraffic setTxIPCDelays:](self, "setTxIPCDelays:", 0);
  -[AWDSidecarPeerTraffic setTxFWDelays:](self, "setTxFWDelays:", 0);
  -[AWDSidecarPeerTraffic setTxHWDelays:](self, "setTxHWDelays:", 0);
  -[AWDSidecarPeerTraffic setTxDataRates:](self, "setTxDataRates:", 0);
  -[AWDSidecarPeerTraffic setTxCCAs:](self, "setTxCCAs:", 0);
  -[AWDSidecarPeerTraffic setTxRetries:](self, "setTxRetries:", 0);
  -[AWDSidecarPeerTraffic setTxPacketBurstSizes:](self, "setTxPacketBurstSizes:", 0);
  -[AWDSidecarPeerTraffic setTxPacketBurstIntervals:](self, "setTxPacketBurstIntervals:", 0);
  -[AWDSidecarPeerTraffic setRxTotalDelays:](self, "setRxTotalDelays:", 0);
  -[AWDSidecarPeerTraffic setRxIPCDelays:](self, "setRxIPCDelays:", 0);
  -[AWDSidecarPeerTraffic setRxFWDelays:](self, "setRxFWDelays:", 0);
  -[AWDSidecarPeerTraffic setRxDataRates:](self, "setRxDataRates:", 0);
  -[AWDSidecarPeerTraffic setRxRSSIs:](self, "setRxRSSIs:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSidecarPeerTraffic;
  -[AWDSidecarPeerTraffic dealloc](&v3, sel_dealloc);
}

- (void)setTxSuccessCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_txSuccessCount = a3;
}

- (void)setHasTxSuccessCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTxSuccessCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTxExpiredCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_txExpiredCount = a3;
}

- (void)setHasTxExpiredCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTxExpiredCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTxErrorCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_txErrorCount = a3;
}

- (void)setHasTxErrorCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxErrorCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearTxTotalDelays
{
  -[NSMutableArray removeAllObjects](self->_txTotalDelays, "removeAllObjects");
}

- (void)addTxTotalDelay:(id)a3
{
  NSMutableArray *txTotalDelays;

  txTotalDelays = self->_txTotalDelays;
  if (!txTotalDelays)
  {
    txTotalDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txTotalDelays = txTotalDelays;
  }
  -[NSMutableArray addObject:](txTotalDelays, "addObject:", a3);
}

- (unint64_t)txTotalDelaysCount
{
  return -[NSMutableArray count](self->_txTotalDelays, "count");
}

- (id)txTotalDelayAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txTotalDelays, "objectAtIndex:", a3);
}

+ (Class)txTotalDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearTxIPCDelays
{
  -[NSMutableArray removeAllObjects](self->_txIPCDelays, "removeAllObjects");
}

- (void)addTxIPCDelay:(id)a3
{
  NSMutableArray *txIPCDelays;

  txIPCDelays = self->_txIPCDelays;
  if (!txIPCDelays)
  {
    txIPCDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txIPCDelays = txIPCDelays;
  }
  -[NSMutableArray addObject:](txIPCDelays, "addObject:", a3);
}

- (unint64_t)txIPCDelaysCount
{
  return -[NSMutableArray count](self->_txIPCDelays, "count");
}

- (id)txIPCDelayAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txIPCDelays, "objectAtIndex:", a3);
}

+ (Class)txIPCDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearTxFWDelays
{
  -[NSMutableArray removeAllObjects](self->_txFWDelays, "removeAllObjects");
}

- (void)addTxFWDelay:(id)a3
{
  NSMutableArray *txFWDelays;

  txFWDelays = self->_txFWDelays;
  if (!txFWDelays)
  {
    txFWDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txFWDelays = txFWDelays;
  }
  -[NSMutableArray addObject:](txFWDelays, "addObject:", a3);
}

- (unint64_t)txFWDelaysCount
{
  return -[NSMutableArray count](self->_txFWDelays, "count");
}

- (id)txFWDelayAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txFWDelays, "objectAtIndex:", a3);
}

+ (Class)txFWDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearTxHWDelays
{
  -[NSMutableArray removeAllObjects](self->_txHWDelays, "removeAllObjects");
}

- (void)addTxHWDelay:(id)a3
{
  NSMutableArray *txHWDelays;

  txHWDelays = self->_txHWDelays;
  if (!txHWDelays)
  {
    txHWDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txHWDelays = txHWDelays;
  }
  -[NSMutableArray addObject:](txHWDelays, "addObject:", a3);
}

- (unint64_t)txHWDelaysCount
{
  return -[NSMutableArray count](self->_txHWDelays, "count");
}

- (id)txHWDelayAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txHWDelays, "objectAtIndex:", a3);
}

+ (Class)txHWDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearTxDataRates
{
  -[NSMutableArray removeAllObjects](self->_txDataRates, "removeAllObjects");
}

- (void)addTxDataRate:(id)a3
{
  NSMutableArray *txDataRates;

  txDataRates = self->_txDataRates;
  if (!txDataRates)
  {
    txDataRates = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txDataRates = txDataRates;
  }
  -[NSMutableArray addObject:](txDataRates, "addObject:", a3);
}

- (unint64_t)txDataRatesCount
{
  return -[NSMutableArray count](self->_txDataRates, "count");
}

- (id)txDataRateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txDataRates, "objectAtIndex:", a3);
}

+ (Class)txDataRateType
{
  return (Class)objc_opt_class();
}

- (void)clearTxCCAs
{
  -[NSMutableArray removeAllObjects](self->_txCCAs, "removeAllObjects");
}

- (void)addTxCCA:(id)a3
{
  NSMutableArray *txCCAs;

  txCCAs = self->_txCCAs;
  if (!txCCAs)
  {
    txCCAs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txCCAs = txCCAs;
  }
  -[NSMutableArray addObject:](txCCAs, "addObject:", a3);
}

- (unint64_t)txCCAsCount
{
  return -[NSMutableArray count](self->_txCCAs, "count");
}

- (id)txCCAAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txCCAs, "objectAtIndex:", a3);
}

+ (Class)txCCAType
{
  return (Class)objc_opt_class();
}

- (void)clearTxRetries
{
  -[NSMutableArray removeAllObjects](self->_txRetries, "removeAllObjects");
}

- (void)addTxRetries:(id)a3
{
  NSMutableArray *txRetries;

  txRetries = self->_txRetries;
  if (!txRetries)
  {
    txRetries = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txRetries = txRetries;
  }
  -[NSMutableArray addObject:](txRetries, "addObject:", a3);
}

- (unint64_t)txRetriesCount
{
  return -[NSMutableArray count](self->_txRetries, "count");
}

- (id)txRetriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txRetries, "objectAtIndex:", a3);
}

+ (Class)txRetriesType
{
  return (Class)objc_opt_class();
}

- (void)clearTxPacketBurstSizes
{
  -[NSMutableArray removeAllObjects](self->_txPacketBurstSizes, "removeAllObjects");
}

- (void)addTxPacketBurstSize:(id)a3
{
  NSMutableArray *txPacketBurstSizes;

  txPacketBurstSizes = self->_txPacketBurstSizes;
  if (!txPacketBurstSizes)
  {
    txPacketBurstSizes = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txPacketBurstSizes = txPacketBurstSizes;
  }
  -[NSMutableArray addObject:](txPacketBurstSizes, "addObject:", a3);
}

- (unint64_t)txPacketBurstSizesCount
{
  return -[NSMutableArray count](self->_txPacketBurstSizes, "count");
}

- (id)txPacketBurstSizeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txPacketBurstSizes, "objectAtIndex:", a3);
}

+ (Class)txPacketBurstSizeType
{
  return (Class)objc_opt_class();
}

- (void)clearTxPacketBurstIntervals
{
  -[NSMutableArray removeAllObjects](self->_txPacketBurstIntervals, "removeAllObjects");
}

- (void)addTxPacketBurstInterval:(id)a3
{
  NSMutableArray *txPacketBurstIntervals;

  txPacketBurstIntervals = self->_txPacketBurstIntervals;
  if (!txPacketBurstIntervals)
  {
    txPacketBurstIntervals = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txPacketBurstIntervals = txPacketBurstIntervals;
  }
  -[NSMutableArray addObject:](txPacketBurstIntervals, "addObject:", a3);
}

- (unint64_t)txPacketBurstIntervalsCount
{
  return -[NSMutableArray count](self->_txPacketBurstIntervals, "count");
}

- (id)txPacketBurstIntervalAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txPacketBurstIntervals, "objectAtIndex:", a3);
}

+ (Class)txPacketBurstIntervalType
{
  return (Class)objc_opt_class();
}

- (void)clearRxTotalDelays
{
  -[NSMutableArray removeAllObjects](self->_rxTotalDelays, "removeAllObjects");
}

- (void)addRxTotalDelay:(id)a3
{
  NSMutableArray *rxTotalDelays;

  rxTotalDelays = self->_rxTotalDelays;
  if (!rxTotalDelays)
  {
    rxTotalDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxTotalDelays = rxTotalDelays;
  }
  -[NSMutableArray addObject:](rxTotalDelays, "addObject:", a3);
}

- (unint64_t)rxTotalDelaysCount
{
  return -[NSMutableArray count](self->_rxTotalDelays, "count");
}

- (id)rxTotalDelayAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxTotalDelays, "objectAtIndex:", a3);
}

+ (Class)rxTotalDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearRxIPCDelays
{
  -[NSMutableArray removeAllObjects](self->_rxIPCDelays, "removeAllObjects");
}

- (void)addRxIPCDelay:(id)a3
{
  NSMutableArray *rxIPCDelays;

  rxIPCDelays = self->_rxIPCDelays;
  if (!rxIPCDelays)
  {
    rxIPCDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxIPCDelays = rxIPCDelays;
  }
  -[NSMutableArray addObject:](rxIPCDelays, "addObject:", a3);
}

- (unint64_t)rxIPCDelaysCount
{
  return -[NSMutableArray count](self->_rxIPCDelays, "count");
}

- (id)rxIPCDelayAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxIPCDelays, "objectAtIndex:", a3);
}

+ (Class)rxIPCDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearRxFWDelays
{
  -[NSMutableArray removeAllObjects](self->_rxFWDelays, "removeAllObjects");
}

- (void)addRxFWDelay:(id)a3
{
  NSMutableArray *rxFWDelays;

  rxFWDelays = self->_rxFWDelays;
  if (!rxFWDelays)
  {
    rxFWDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxFWDelays = rxFWDelays;
  }
  -[NSMutableArray addObject:](rxFWDelays, "addObject:", a3);
}

- (unint64_t)rxFWDelaysCount
{
  return -[NSMutableArray count](self->_rxFWDelays, "count");
}

- (id)rxFWDelayAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxFWDelays, "objectAtIndex:", a3);
}

+ (Class)rxFWDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearRxDataRates
{
  -[NSMutableArray removeAllObjects](self->_rxDataRates, "removeAllObjects");
}

- (void)addRxDataRate:(id)a3
{
  NSMutableArray *rxDataRates;

  rxDataRates = self->_rxDataRates;
  if (!rxDataRates)
  {
    rxDataRates = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxDataRates = rxDataRates;
  }
  -[NSMutableArray addObject:](rxDataRates, "addObject:", a3);
}

- (unint64_t)rxDataRatesCount
{
  return -[NSMutableArray count](self->_rxDataRates, "count");
}

- (id)rxDataRateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxDataRates, "objectAtIndex:", a3);
}

+ (Class)rxDataRateType
{
  return (Class)objc_opt_class();
}

- (void)clearRxRSSIs
{
  -[NSMutableArray removeAllObjects](self->_rxRSSIs, "removeAllObjects");
}

- (void)addRxRSSI:(id)a3
{
  NSMutableArray *rxRSSIs;

  rxRSSIs = self->_rxRSSIs;
  if (!rxRSSIs)
  {
    rxRSSIs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxRSSIs = rxRSSIs;
  }
  -[NSMutableArray addObject:](rxRSSIs, "addObject:", a3);
}

- (unint64_t)rxRSSIsCount
{
  return -[NSMutableArray count](self->_rxRSSIs, "count");
}

- (id)rxRSSIAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxRSSIs, "objectAtIndex:", a3);
}

+ (Class)rxRSSIType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSidecarPeerTraffic;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSidecarPeerTraffic description](&v3, sel_description), -[AWDSidecarPeerTraffic dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *txTotalDelays;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *txIPCDelays;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *txFWDelays;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  NSMutableArray *txHWDelays;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  NSMutableArray *txDataRates;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  NSMutableArray *txCCAs;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ii;
  void *v41;
  NSMutableArray *txRetries;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t jj;
  void *v47;
  NSMutableArray *txPacketBurstSizes;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t kk;
  void *v53;
  NSMutableArray *txPacketBurstIntervals;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t mm;
  void *v59;
  NSMutableArray *rxTotalDelays;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t nn;
  void *v65;
  NSMutableArray *rxIPCDelays;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i1;
  void *v71;
  NSMutableArray *rxFWDelays;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i2;
  void *v77;
  NSMutableArray *rxDataRates;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i3;
  void *v83;
  NSMutableArray *rxRSSIs;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i4;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
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
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txSuccessCount), CFSTR("txSuccessCount"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txExpiredCount), CFSTR("txExpiredCount"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txErrorCount), CFSTR("txErrorCount"));
LABEL_5:
  if (-[NSMutableArray count](self->_txTotalDelays, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txTotalDelays, "count"));
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    txTotalDelays = self->_txTotalDelays;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txTotalDelays, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v143;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v143 != v9)
            objc_enumerationMutation(txTotalDelays);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v142 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txTotalDelays, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("txTotalDelay"));

  }
  if (-[NSMutableArray count](self->_txIPCDelays, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txIPCDelays, "count"));
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    txIPCDelays = self->_txIPCDelays;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txIPCDelays, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v139;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v139 != v15)
            objc_enumerationMutation(txIPCDelays);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v138 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txIPCDelays, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("txIPCDelay"));

  }
  if (-[NSMutableArray count](self->_txFWDelays, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txFWDelays, "count"));
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    txFWDelays = self->_txFWDelays;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txFWDelays, "countByEnumeratingWithState:objects:count:", &v134, v157, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v135;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v135 != v21)
            objc_enumerationMutation(txFWDelays);
          objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txFWDelays, "countByEnumeratingWithState:objects:count:", &v134, v157, 16);
      }
      while (v20);
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("txFWDelay"));

  }
  if (-[NSMutableArray count](self->_txHWDelays, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txHWDelays, "count"));
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    txHWDelays = self->_txHWDelays;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txHWDelays, "countByEnumeratingWithState:objects:count:", &v130, v156, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v131;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v131 != v27)
            objc_enumerationMutation(txHWDelays);
          objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * m), "dictionaryRepresentation"));
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txHWDelays, "countByEnumeratingWithState:objects:count:", &v130, v156, 16);
      }
      while (v26);
    }
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("txHWDelay"));

  }
  if (-[NSMutableArray count](self->_txDataRates, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txDataRates, "count"));
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    txDataRates = self->_txDataRates;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txDataRates, "countByEnumeratingWithState:objects:count:", &v126, v155, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v127;
      do
      {
        for (n = 0; n != v32; ++n)
        {
          if (*(_QWORD *)v127 != v33)
            objc_enumerationMutation(txDataRates);
          objc_msgSend(v29, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * n), "dictionaryRepresentation"));
        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txDataRates, "countByEnumeratingWithState:objects:count:", &v126, v155, 16);
      }
      while (v32);
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("txDataRate"));

  }
  if (-[NSMutableArray count](self->_txCCAs, "count"))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txCCAs, "count"));
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    txCCAs = self->_txCCAs;
    v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txCCAs, "countByEnumeratingWithState:objects:count:", &v122, v154, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v123;
      do
      {
        for (ii = 0; ii != v38; ++ii)
        {
          if (*(_QWORD *)v123 != v39)
            objc_enumerationMutation(txCCAs);
          objc_msgSend(v35, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * ii), "dictionaryRepresentation"));
        }
        v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txCCAs, "countByEnumeratingWithState:objects:count:", &v122, v154, 16);
      }
      while (v38);
    }
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("txCCA"));

  }
  if (-[NSMutableArray count](self->_txRetries, "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txRetries, "count"));
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    txRetries = self->_txRetries;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txRetries, "countByEnumeratingWithState:objects:count:", &v118, v153, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v119;
      do
      {
        for (jj = 0; jj != v44; ++jj)
        {
          if (*(_QWORD *)v119 != v45)
            objc_enumerationMutation(txRetries);
          objc_msgSend(v41, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * jj), "dictionaryRepresentation"));
        }
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txRetries, "countByEnumeratingWithState:objects:count:", &v118, v153, 16);
      }
      while (v44);
    }
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("txRetries"));

  }
  if (-[NSMutableArray count](self->_txPacketBurstSizes, "count"))
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txPacketBurstSizes, "count"));
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    txPacketBurstSizes = self->_txPacketBurstSizes;
    v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstSizes, "countByEnumeratingWithState:objects:count:", &v114, v152, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v115;
      do
      {
        for (kk = 0; kk != v50; ++kk)
        {
          if (*(_QWORD *)v115 != v51)
            objc_enumerationMutation(txPacketBurstSizes);
          objc_msgSend(v47, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * kk), "dictionaryRepresentation"));
        }
        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstSizes, "countByEnumeratingWithState:objects:count:", &v114, v152, 16);
      }
      while (v50);
    }
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("txPacketBurstSize"));

  }
  if (-[NSMutableArray count](self->_txPacketBurstIntervals, "count"))
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txPacketBurstIntervals, "count"));
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    txPacketBurstIntervals = self->_txPacketBurstIntervals;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstIntervals, "countByEnumeratingWithState:objects:count:", &v110, v151, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v111;
      do
      {
        for (mm = 0; mm != v56; ++mm)
        {
          if (*(_QWORD *)v111 != v57)
            objc_enumerationMutation(txPacketBurstIntervals);
          objc_msgSend(v53, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * mm), "dictionaryRepresentation"));
        }
        v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstIntervals, "countByEnumeratingWithState:objects:count:", &v110, v151, 16);
      }
      while (v56);
    }
    objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("txPacketBurstInterval"));

  }
  if (-[NSMutableArray count](self->_rxTotalDelays, "count"))
  {
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxTotalDelays, "count"));
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    rxTotalDelays = self->_rxTotalDelays;
    v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxTotalDelays, "countByEnumeratingWithState:objects:count:", &v106, v150, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v107;
      do
      {
        for (nn = 0; nn != v62; ++nn)
        {
          if (*(_QWORD *)v107 != v63)
            objc_enumerationMutation(rxTotalDelays);
          objc_msgSend(v59, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * nn), "dictionaryRepresentation"));
        }
        v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxTotalDelays, "countByEnumeratingWithState:objects:count:", &v106, v150, 16);
      }
      while (v62);
    }
    objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("rxTotalDelay"));

  }
  if (-[NSMutableArray count](self->_rxIPCDelays, "count"))
  {
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxIPCDelays, "count"));
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    rxIPCDelays = self->_rxIPCDelays;
    v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxIPCDelays, "countByEnumeratingWithState:objects:count:", &v102, v149, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v103;
      do
      {
        for (i1 = 0; i1 != v68; ++i1)
        {
          if (*(_QWORD *)v103 != v69)
            objc_enumerationMutation(rxIPCDelays);
          objc_msgSend(v65, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * i1), "dictionaryRepresentation"));
        }
        v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxIPCDelays, "countByEnumeratingWithState:objects:count:", &v102, v149, 16);
      }
      while (v68);
    }
    objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("rxIPCDelay"));

  }
  if (-[NSMutableArray count](self->_rxFWDelays, "count"))
  {
    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxFWDelays, "count"));
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    rxFWDelays = self->_rxFWDelays;
    v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxFWDelays, "countByEnumeratingWithState:objects:count:", &v98, v148, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v99;
      do
      {
        for (i2 = 0; i2 != v74; ++i2)
        {
          if (*(_QWORD *)v99 != v75)
            objc_enumerationMutation(rxFWDelays);
          objc_msgSend(v71, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * i2), "dictionaryRepresentation"));
        }
        v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxFWDelays, "countByEnumeratingWithState:objects:count:", &v98, v148, 16);
      }
      while (v74);
    }
    objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("rxFWDelay"));

  }
  if (-[NSMutableArray count](self->_rxDataRates, "count"))
  {
    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxDataRates, "count"));
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    rxDataRates = self->_rxDataRates;
    v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxDataRates, "countByEnumeratingWithState:objects:count:", &v94, v147, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v95;
      do
      {
        for (i3 = 0; i3 != v80; ++i3)
        {
          if (*(_QWORD *)v95 != v81)
            objc_enumerationMutation(rxDataRates);
          objc_msgSend(v77, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i3), "dictionaryRepresentation"));
        }
        v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxDataRates, "countByEnumeratingWithState:objects:count:", &v94, v147, 16);
      }
      while (v80);
    }
    objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("rxDataRate"));

  }
  if (-[NSMutableArray count](self->_rxRSSIs, "count"))
  {
    v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxRSSIs, "count"));
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    rxRSSIs = self->_rxRSSIs;
    v85 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxRSSIs, "countByEnumeratingWithState:objects:count:", &v90, v146, 16);
    if (v85)
    {
      v86 = v85;
      v87 = *(_QWORD *)v91;
      do
      {
        for (i4 = 0; i4 != v86; ++i4)
        {
          if (*(_QWORD *)v91 != v87)
            objc_enumerationMutation(rxRSSIs);
          objc_msgSend(v83, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i4), "dictionaryRepresentation"));
        }
        v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxRSSIs, "countByEnumeratingWithState:objects:count:", &v90, v146, 16);
      }
      while (v86);
    }
    objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("rxRSSI"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSidecarPeerTrafficReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *txTotalDelays;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *txIPCDelays;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *txFWDelays;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *txHWDelays;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  NSMutableArray *txDataRates;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  NSMutableArray *txCCAs;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  NSMutableArray *txRetries;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t jj;
  NSMutableArray *txPacketBurstSizes;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t kk;
  NSMutableArray *txPacketBurstIntervals;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t mm;
  NSMutableArray *rxTotalDelays;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t nn;
  NSMutableArray *rxIPCDelays;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i1;
  NSMutableArray *rxFWDelays;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i2;
  NSMutableArray *rxDataRates;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i3;
  NSMutableArray *rxRSSIs;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i4;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
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
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x24BDAC8D0];
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  txTotalDelays = self->_txTotalDelays;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txTotalDelays, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v128;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v128 != v8)
          objc_enumerationMutation(txTotalDelays);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txTotalDelays, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
    }
    while (v7);
  }
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  txIPCDelays = self->_txIPCDelays;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txIPCDelays, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v124;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v124 != v13)
          objc_enumerationMutation(txIPCDelays);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txIPCDelays, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
    }
    while (v12);
  }
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  txFWDelays = self->_txFWDelays;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txFWDelays, "countByEnumeratingWithState:objects:count:", &v119, v142, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v120;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v120 != v18)
          objc_enumerationMutation(txFWDelays);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txFWDelays, "countByEnumeratingWithState:objects:count:", &v119, v142, 16);
    }
    while (v17);
  }
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  txHWDelays = self->_txHWDelays;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txHWDelays, "countByEnumeratingWithState:objects:count:", &v115, v141, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v116;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v116 != v23)
          objc_enumerationMutation(txHWDelays);
        PBDataWriterWriteSubmessage();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txHWDelays, "countByEnumeratingWithState:objects:count:", &v115, v141, 16);
    }
    while (v22);
  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  txDataRates = self->_txDataRates;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txDataRates, "countByEnumeratingWithState:objects:count:", &v111, v140, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v112;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v112 != v28)
          objc_enumerationMutation(txDataRates);
        PBDataWriterWriteSubmessage();
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txDataRates, "countByEnumeratingWithState:objects:count:", &v111, v140, 16);
    }
    while (v27);
  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  txCCAs = self->_txCCAs;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txCCAs, "countByEnumeratingWithState:objects:count:", &v107, v139, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v108;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v108 != v33)
          objc_enumerationMutation(txCCAs);
        PBDataWriterWriteSubmessage();
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txCCAs, "countByEnumeratingWithState:objects:count:", &v107, v139, 16);
    }
    while (v32);
  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  txRetries = self->_txRetries;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txRetries, "countByEnumeratingWithState:objects:count:", &v103, v138, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v104;
    do
    {
      for (jj = 0; jj != v37; ++jj)
      {
        if (*(_QWORD *)v104 != v38)
          objc_enumerationMutation(txRetries);
        PBDataWriterWriteSubmessage();
      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txRetries, "countByEnumeratingWithState:objects:count:", &v103, v138, 16);
    }
    while (v37);
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  txPacketBurstSizes = self->_txPacketBurstSizes;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstSizes, "countByEnumeratingWithState:objects:count:", &v99, v137, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v100;
    do
    {
      for (kk = 0; kk != v42; ++kk)
      {
        if (*(_QWORD *)v100 != v43)
          objc_enumerationMutation(txPacketBurstSizes);
        PBDataWriterWriteSubmessage();
      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstSizes, "countByEnumeratingWithState:objects:count:", &v99, v137, 16);
    }
    while (v42);
  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  txPacketBurstIntervals = self->_txPacketBurstIntervals;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstIntervals, "countByEnumeratingWithState:objects:count:", &v95, v136, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v96;
    do
    {
      for (mm = 0; mm != v47; ++mm)
      {
        if (*(_QWORD *)v96 != v48)
          objc_enumerationMutation(txPacketBurstIntervals);
        PBDataWriterWriteSubmessage();
      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstIntervals, "countByEnumeratingWithState:objects:count:", &v95, v136, 16);
    }
    while (v47);
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  rxTotalDelays = self->_rxTotalDelays;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxTotalDelays, "countByEnumeratingWithState:objects:count:", &v91, v135, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v92;
    do
    {
      for (nn = 0; nn != v52; ++nn)
      {
        if (*(_QWORD *)v92 != v53)
          objc_enumerationMutation(rxTotalDelays);
        PBDataWriterWriteSubmessage();
      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxTotalDelays, "countByEnumeratingWithState:objects:count:", &v91, v135, 16);
    }
    while (v52);
  }
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  rxIPCDelays = self->_rxIPCDelays;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxIPCDelays, "countByEnumeratingWithState:objects:count:", &v87, v134, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v88;
    do
    {
      for (i1 = 0; i1 != v57; ++i1)
      {
        if (*(_QWORD *)v88 != v58)
          objc_enumerationMutation(rxIPCDelays);
        PBDataWriterWriteSubmessage();
      }
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxIPCDelays, "countByEnumeratingWithState:objects:count:", &v87, v134, 16);
    }
    while (v57);
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  rxFWDelays = self->_rxFWDelays;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxFWDelays, "countByEnumeratingWithState:objects:count:", &v83, v133, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v84;
    do
    {
      for (i2 = 0; i2 != v62; ++i2)
      {
        if (*(_QWORD *)v84 != v63)
          objc_enumerationMutation(rxFWDelays);
        PBDataWriterWriteSubmessage();
      }
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxFWDelays, "countByEnumeratingWithState:objects:count:", &v83, v133, 16);
    }
    while (v62);
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  rxDataRates = self->_rxDataRates;
  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxDataRates, "countByEnumeratingWithState:objects:count:", &v79, v132, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v80;
    do
    {
      for (i3 = 0; i3 != v67; ++i3)
      {
        if (*(_QWORD *)v80 != v68)
          objc_enumerationMutation(rxDataRates);
        PBDataWriterWriteSubmessage();
      }
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxDataRates, "countByEnumeratingWithState:objects:count:", &v79, v132, 16);
    }
    while (v67);
  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  rxRSSIs = self->_rxRSSIs;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxRSSIs, "countByEnumeratingWithState:objects:count:", &v75, v131, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v76;
    do
    {
      for (i4 = 0; i4 != v72; ++i4)
      {
        if (*(_QWORD *)v76 != v73)
          objc_enumerationMutation(rxRSSIs);
        PBDataWriterWriteSubmessage();
      }
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxRSSIs, "countByEnumeratingWithState:objects:count:", &v75, v131, 16);
    }
    while (v72);
  }
}

- (void)copyTo:(id)a3
{
  char has;
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
  unint64_t v18;
  unint64_t v19;
  uint64_t n;
  unint64_t v21;
  unint64_t v22;
  uint64_t ii;
  unint64_t v24;
  unint64_t v25;
  uint64_t jj;
  unint64_t v27;
  unint64_t v28;
  uint64_t kk;
  unint64_t v30;
  unint64_t v31;
  uint64_t mm;
  unint64_t v33;
  unint64_t v34;
  uint64_t nn;
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

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_63:
    *((_QWORD *)a3 + 2) = self->_txExpiredCount;
    *((_BYTE *)a3 + 144) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)a3 + 3) = self->_txSuccessCount;
  *((_BYTE *)a3 + 144) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_63;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)a3 + 1) = self->_txErrorCount;
    *((_BYTE *)a3 + 144) |= 1u;
  }
LABEL_5:
  if (-[AWDSidecarPeerTraffic txTotalDelaysCount](self, "txTotalDelaysCount"))
  {
    objc_msgSend(a3, "clearTxTotalDelays");
    v6 = -[AWDSidecarPeerTraffic txTotalDelaysCount](self, "txTotalDelaysCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addTxTotalDelay:", -[AWDSidecarPeerTraffic txTotalDelayAtIndex:](self, "txTotalDelayAtIndex:", i));
    }
  }
  if (-[AWDSidecarPeerTraffic txIPCDelaysCount](self, "txIPCDelaysCount"))
  {
    objc_msgSend(a3, "clearTxIPCDelays");
    v9 = -[AWDSidecarPeerTraffic txIPCDelaysCount](self, "txIPCDelaysCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addTxIPCDelay:", -[AWDSidecarPeerTraffic txIPCDelayAtIndex:](self, "txIPCDelayAtIndex:", j));
    }
  }
  if (-[AWDSidecarPeerTraffic txFWDelaysCount](self, "txFWDelaysCount"))
  {
    objc_msgSend(a3, "clearTxFWDelays");
    v12 = -[AWDSidecarPeerTraffic txFWDelaysCount](self, "txFWDelaysCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addTxFWDelay:", -[AWDSidecarPeerTraffic txFWDelayAtIndex:](self, "txFWDelayAtIndex:", k));
    }
  }
  if (-[AWDSidecarPeerTraffic txHWDelaysCount](self, "txHWDelaysCount"))
  {
    objc_msgSend(a3, "clearTxHWDelays");
    v15 = -[AWDSidecarPeerTraffic txHWDelaysCount](self, "txHWDelaysCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(a3, "addTxHWDelay:", -[AWDSidecarPeerTraffic txHWDelayAtIndex:](self, "txHWDelayAtIndex:", m));
    }
  }
  if (-[AWDSidecarPeerTraffic txDataRatesCount](self, "txDataRatesCount"))
  {
    objc_msgSend(a3, "clearTxDataRates");
    v18 = -[AWDSidecarPeerTraffic txDataRatesCount](self, "txDataRatesCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
        objc_msgSend(a3, "addTxDataRate:", -[AWDSidecarPeerTraffic txDataRateAtIndex:](self, "txDataRateAtIndex:", n));
    }
  }
  if (-[AWDSidecarPeerTraffic txCCAsCount](self, "txCCAsCount"))
  {
    objc_msgSend(a3, "clearTxCCAs");
    v21 = -[AWDSidecarPeerTraffic txCCAsCount](self, "txCCAsCount");
    if (v21)
    {
      v22 = v21;
      for (ii = 0; ii != v22; ++ii)
        objc_msgSend(a3, "addTxCCA:", -[AWDSidecarPeerTraffic txCCAAtIndex:](self, "txCCAAtIndex:", ii));
    }
  }
  if (-[AWDSidecarPeerTraffic txRetriesCount](self, "txRetriesCount"))
  {
    objc_msgSend(a3, "clearTxRetries");
    v24 = -[AWDSidecarPeerTraffic txRetriesCount](self, "txRetriesCount");
    if (v24)
    {
      v25 = v24;
      for (jj = 0; jj != v25; ++jj)
        objc_msgSend(a3, "addTxRetries:", -[AWDSidecarPeerTraffic txRetriesAtIndex:](self, "txRetriesAtIndex:", jj));
    }
  }
  if (-[AWDSidecarPeerTraffic txPacketBurstSizesCount](self, "txPacketBurstSizesCount"))
  {
    objc_msgSend(a3, "clearTxPacketBurstSizes");
    v27 = -[AWDSidecarPeerTraffic txPacketBurstSizesCount](self, "txPacketBurstSizesCount");
    if (v27)
    {
      v28 = v27;
      for (kk = 0; kk != v28; ++kk)
        objc_msgSend(a3, "addTxPacketBurstSize:", -[AWDSidecarPeerTraffic txPacketBurstSizeAtIndex:](self, "txPacketBurstSizeAtIndex:", kk));
    }
  }
  if (-[AWDSidecarPeerTraffic txPacketBurstIntervalsCount](self, "txPacketBurstIntervalsCount"))
  {
    objc_msgSend(a3, "clearTxPacketBurstIntervals");
    v30 = -[AWDSidecarPeerTraffic txPacketBurstIntervalsCount](self, "txPacketBurstIntervalsCount");
    if (v30)
    {
      v31 = v30;
      for (mm = 0; mm != v31; ++mm)
        objc_msgSend(a3, "addTxPacketBurstInterval:", -[AWDSidecarPeerTraffic txPacketBurstIntervalAtIndex:](self, "txPacketBurstIntervalAtIndex:", mm));
    }
  }
  if (-[AWDSidecarPeerTraffic rxTotalDelaysCount](self, "rxTotalDelaysCount"))
  {
    objc_msgSend(a3, "clearRxTotalDelays");
    v33 = -[AWDSidecarPeerTraffic rxTotalDelaysCount](self, "rxTotalDelaysCount");
    if (v33)
    {
      v34 = v33;
      for (nn = 0; nn != v34; ++nn)
        objc_msgSend(a3, "addRxTotalDelay:", -[AWDSidecarPeerTraffic rxTotalDelayAtIndex:](self, "rxTotalDelayAtIndex:", nn));
    }
  }
  if (-[AWDSidecarPeerTraffic rxIPCDelaysCount](self, "rxIPCDelaysCount"))
  {
    objc_msgSend(a3, "clearRxIPCDelays");
    v36 = -[AWDSidecarPeerTraffic rxIPCDelaysCount](self, "rxIPCDelaysCount");
    if (v36)
    {
      v37 = v36;
      for (i1 = 0; i1 != v37; ++i1)
        objc_msgSend(a3, "addRxIPCDelay:", -[AWDSidecarPeerTraffic rxIPCDelayAtIndex:](self, "rxIPCDelayAtIndex:", i1));
    }
  }
  if (-[AWDSidecarPeerTraffic rxFWDelaysCount](self, "rxFWDelaysCount"))
  {
    objc_msgSend(a3, "clearRxFWDelays");
    v39 = -[AWDSidecarPeerTraffic rxFWDelaysCount](self, "rxFWDelaysCount");
    if (v39)
    {
      v40 = v39;
      for (i2 = 0; i2 != v40; ++i2)
        objc_msgSend(a3, "addRxFWDelay:", -[AWDSidecarPeerTraffic rxFWDelayAtIndex:](self, "rxFWDelayAtIndex:", i2));
    }
  }
  if (-[AWDSidecarPeerTraffic rxDataRatesCount](self, "rxDataRatesCount"))
  {
    objc_msgSend(a3, "clearRxDataRates");
    v42 = -[AWDSidecarPeerTraffic rxDataRatesCount](self, "rxDataRatesCount");
    if (v42)
    {
      v43 = v42;
      for (i3 = 0; i3 != v43; ++i3)
        objc_msgSend(a3, "addRxDataRate:", -[AWDSidecarPeerTraffic rxDataRateAtIndex:](self, "rxDataRateAtIndex:", i3));
    }
  }
  if (-[AWDSidecarPeerTraffic rxRSSIsCount](self, "rxRSSIsCount"))
  {
    objc_msgSend(a3, "clearRxRSSIs");
    v45 = -[AWDSidecarPeerTraffic rxRSSIsCount](self, "rxRSSIsCount");
    if (v45)
    {
      v46 = v45;
      for (i4 = 0; i4 != v46; ++i4)
        objc_msgSend(a3, "addRxRSSI:", -[AWDSidecarPeerTraffic rxRSSIAtIndex:](self, "rxRSSIAtIndex:", i4));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *txTotalDelays;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *txIPCDelays;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *txFWDelays;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *txHWDelays;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  NSMutableArray *txDataRates;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  NSMutableArray *txCCAs;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ii;
  void *v43;
  NSMutableArray *txRetries;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t jj;
  void *v49;
  NSMutableArray *txPacketBurstSizes;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t kk;
  void *v55;
  NSMutableArray *txPacketBurstIntervals;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t mm;
  void *v61;
  NSMutableArray *rxTotalDelays;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t nn;
  void *v67;
  NSMutableArray *rxIPCDelays;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i1;
  void *v73;
  NSMutableArray *rxFWDelays;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i2;
  void *v79;
  NSMutableArray *rxDataRates;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i3;
  void *v85;
  NSMutableArray *rxRSSIs;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i4;
  void *v91;
  __int128 v93;
  __int128 v94;
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
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_txSuccessCount;
    *(_BYTE *)(v5 + 144) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_txExpiredCount;
  *(_BYTE *)(v5 + 144) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_txErrorCount;
    *(_BYTE *)(v5 + 144) |= 1u;
  }
LABEL_5:
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  txTotalDelays = self->_txTotalDelays;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txTotalDelays, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v146;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v146 != v11)
          objc_enumerationMutation(txTotalDelays);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxTotalDelay:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txTotalDelays, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
    }
    while (v10);
  }
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  txIPCDelays = self->_txIPCDelays;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txIPCDelays, "countByEnumeratingWithState:objects:count:", &v141, v161, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v142;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v142 != v17)
          objc_enumerationMutation(txIPCDelays);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxIPCDelay:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txIPCDelays, "countByEnumeratingWithState:objects:count:", &v141, v161, 16);
    }
    while (v16);
  }
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  txFWDelays = self->_txFWDelays;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txFWDelays, "countByEnumeratingWithState:objects:count:", &v137, v160, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v138;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v138 != v23)
          objc_enumerationMutation(txFWDelays);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxFWDelay:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txFWDelays, "countByEnumeratingWithState:objects:count:", &v137, v160, 16);
    }
    while (v22);
  }
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  txHWDelays = self->_txHWDelays;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txHWDelays, "countByEnumeratingWithState:objects:count:", &v133, v159, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v134;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v134 != v29)
          objc_enumerationMutation(txHWDelays);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxHWDelay:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txHWDelays, "countByEnumeratingWithState:objects:count:", &v133, v159, 16);
    }
    while (v28);
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  txDataRates = self->_txDataRates;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txDataRates, "countByEnumeratingWithState:objects:count:", &v129, v158, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v130;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v130 != v35)
          objc_enumerationMutation(txDataRates);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxDataRate:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txDataRates, "countByEnumeratingWithState:objects:count:", &v129, v158, 16);
    }
    while (v34);
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  txCCAs = self->_txCCAs;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txCCAs, "countByEnumeratingWithState:objects:count:", &v125, v157, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v126;
    do
    {
      for (ii = 0; ii != v40; ++ii)
      {
        if (*(_QWORD *)v126 != v41)
          objc_enumerationMutation(txCCAs);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxCCA:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txCCAs, "countByEnumeratingWithState:objects:count:", &v125, v157, 16);
    }
    while (v40);
  }
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  txRetries = self->_txRetries;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txRetries, "countByEnumeratingWithState:objects:count:", &v121, v156, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v122;
    do
    {
      for (jj = 0; jj != v46; ++jj)
      {
        if (*(_QWORD *)v122 != v47)
          objc_enumerationMutation(txRetries);
        v49 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxRetries:", v49);

      }
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txRetries, "countByEnumeratingWithState:objects:count:", &v121, v156, 16);
    }
    while (v46);
  }
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  txPacketBurstSizes = self->_txPacketBurstSizes;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstSizes, "countByEnumeratingWithState:objects:count:", &v117, v155, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v118;
    do
    {
      for (kk = 0; kk != v52; ++kk)
      {
        if (*(_QWORD *)v118 != v53)
          objc_enumerationMutation(txPacketBurstSizes);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxPacketBurstSize:", v55);

      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstSizes, "countByEnumeratingWithState:objects:count:", &v117, v155, 16);
    }
    while (v52);
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  txPacketBurstIntervals = self->_txPacketBurstIntervals;
  v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstIntervals, "countByEnumeratingWithState:objects:count:", &v113, v154, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v114;
    do
    {
      for (mm = 0; mm != v58; ++mm)
      {
        if (*(_QWORD *)v114 != v59)
          objc_enumerationMutation(txPacketBurstIntervals);
        v61 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxPacketBurstInterval:", v61);

      }
      v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txPacketBurstIntervals, "countByEnumeratingWithState:objects:count:", &v113, v154, 16);
    }
    while (v58);
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  rxTotalDelays = self->_rxTotalDelays;
  v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxTotalDelays, "countByEnumeratingWithState:objects:count:", &v109, v153, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v110;
    do
    {
      for (nn = 0; nn != v64; ++nn)
      {
        if (*(_QWORD *)v110 != v65)
          objc_enumerationMutation(rxTotalDelays);
        v67 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * nn), "copyWithZone:", a3);
        objc_msgSend(v6, "addRxTotalDelay:", v67);

      }
      v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxTotalDelays, "countByEnumeratingWithState:objects:count:", &v109, v153, 16);
    }
    while (v64);
  }
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  rxIPCDelays = self->_rxIPCDelays;
  v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxIPCDelays, "countByEnumeratingWithState:objects:count:", &v105, v152, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v106;
    do
    {
      for (i1 = 0; i1 != v70; ++i1)
      {
        if (*(_QWORD *)v106 != v71)
          objc_enumerationMutation(rxIPCDelays);
        v73 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i1), "copyWithZone:", a3);
        objc_msgSend(v6, "addRxIPCDelay:", v73);

      }
      v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxIPCDelays, "countByEnumeratingWithState:objects:count:", &v105, v152, 16);
    }
    while (v70);
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  rxFWDelays = self->_rxFWDelays;
  v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxFWDelays, "countByEnumeratingWithState:objects:count:", &v101, v151, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v102;
    do
    {
      for (i2 = 0; i2 != v76; ++i2)
      {
        if (*(_QWORD *)v102 != v77)
          objc_enumerationMutation(rxFWDelays);
        v79 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i2), "copyWithZone:", a3);
        objc_msgSend(v6, "addRxFWDelay:", v79);

      }
      v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxFWDelays, "countByEnumeratingWithState:objects:count:", &v101, v151, 16);
    }
    while (v76);
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  rxDataRates = self->_rxDataRates;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxDataRates, "countByEnumeratingWithState:objects:count:", &v97, v150, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v98;
    do
    {
      for (i3 = 0; i3 != v82; ++i3)
      {
        if (*(_QWORD *)v98 != v83)
          objc_enumerationMutation(rxDataRates);
        v85 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i3), "copyWithZone:", a3);
        objc_msgSend(v6, "addRxDataRate:", v85);

      }
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxDataRates, "countByEnumeratingWithState:objects:count:", &v97, v150, 16);
    }
    while (v82);
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  rxRSSIs = self->_rxRSSIs;
  v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxRSSIs, "countByEnumeratingWithState:objects:count:", &v93, v149, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v94;
    do
    {
      for (i4 = 0; i4 != v88; ++i4)
      {
        if (*(_QWORD *)v94 != v89)
          objc_enumerationMutation(rxRSSIs);
        v91 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i4), "copyWithZone:", a3);
        objc_msgSend(v6, "addRxRSSI:", v91);

      }
      v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxRSSIs, "countByEnumeratingWithState:objects:count:", &v93, v149, 16);
    }
    while (v88);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *txTotalDelays;
  NSMutableArray *txIPCDelays;
  NSMutableArray *txFWDelays;
  NSMutableArray *txHWDelays;
  NSMutableArray *txDataRates;
  NSMutableArray *txCCAs;
  NSMutableArray *txRetries;
  NSMutableArray *txPacketBurstSizes;
  NSMutableArray *txPacketBurstIntervals;
  NSMutableArray *rxTotalDelays;
  NSMutableArray *rxIPCDelays;
  NSMutableArray *rxFWDelays;
  NSMutableArray *rxDataRates;
  NSMutableArray *rxRSSIs;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 144) & 4) == 0 || self->_txSuccessCount != *((_QWORD *)a3 + 3))
        goto LABEL_45;
    }
    else if ((*((_BYTE *)a3 + 144) & 4) != 0)
    {
LABEL_45:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 144) & 2) == 0 || self->_txExpiredCount != *((_QWORD *)a3 + 2))
        goto LABEL_45;
    }
    else if ((*((_BYTE *)a3 + 144) & 2) != 0)
    {
      goto LABEL_45;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 144) & 1) == 0 || self->_txErrorCount != *((_QWORD *)a3 + 1))
        goto LABEL_45;
    }
    else if ((*((_BYTE *)a3 + 144) & 1) != 0)
    {
      goto LABEL_45;
    }
    txTotalDelays = self->_txTotalDelays;
    if (!((unint64_t)txTotalDelays | *((_QWORD *)a3 + 17))
      || (v5 = -[NSMutableArray isEqual:](txTotalDelays, "isEqual:")) != 0)
    {
      txIPCDelays = self->_txIPCDelays;
      if (!((unint64_t)txIPCDelays | *((_QWORD *)a3 + 13))
        || (v5 = -[NSMutableArray isEqual:](txIPCDelays, "isEqual:")) != 0)
      {
        txFWDelays = self->_txFWDelays;
        if (!((unint64_t)txFWDelays | *((_QWORD *)a3 + 11))
          || (v5 = -[NSMutableArray isEqual:](txFWDelays, "isEqual:")) != 0)
        {
          txHWDelays = self->_txHWDelays;
          if (!((unint64_t)txHWDelays | *((_QWORD *)a3 + 12))
            || (v5 = -[NSMutableArray isEqual:](txHWDelays, "isEqual:")) != 0)
          {
            txDataRates = self->_txDataRates;
            if (!((unint64_t)txDataRates | *((_QWORD *)a3 + 10))
              || (v5 = -[NSMutableArray isEqual:](txDataRates, "isEqual:")) != 0)
            {
              txCCAs = self->_txCCAs;
              if (!((unint64_t)txCCAs | *((_QWORD *)a3 + 9))
                || (v5 = -[NSMutableArray isEqual:](txCCAs, "isEqual:")) != 0)
              {
                txRetries = self->_txRetries;
                if (!((unint64_t)txRetries | *((_QWORD *)a3 + 16))
                  || (v5 = -[NSMutableArray isEqual:](txRetries, "isEqual:")) != 0)
                {
                  txPacketBurstSizes = self->_txPacketBurstSizes;
                  if (!((unint64_t)txPacketBurstSizes | *((_QWORD *)a3 + 15))
                    || (v5 = -[NSMutableArray isEqual:](txPacketBurstSizes, "isEqual:")) != 0)
                  {
                    txPacketBurstIntervals = self->_txPacketBurstIntervals;
                    if (!((unint64_t)txPacketBurstIntervals | *((_QWORD *)a3 + 14))
                      || (v5 = -[NSMutableArray isEqual:](txPacketBurstIntervals, "isEqual:")) != 0)
                    {
                      rxTotalDelays = self->_rxTotalDelays;
                      if (!((unint64_t)rxTotalDelays | *((_QWORD *)a3 + 8))
                        || (v5 = -[NSMutableArray isEqual:](rxTotalDelays, "isEqual:")) != 0)
                      {
                        rxIPCDelays = self->_rxIPCDelays;
                        if (!((unint64_t)rxIPCDelays | *((_QWORD *)a3 + 6))
                          || (v5 = -[NSMutableArray isEqual:](rxIPCDelays, "isEqual:")) != 0)
                        {
                          rxFWDelays = self->_rxFWDelays;
                          if (!((unint64_t)rxFWDelays | *((_QWORD *)a3 + 5))
                            || (v5 = -[NSMutableArray isEqual:](rxFWDelays, "isEqual:")) != 0)
                          {
                            rxDataRates = self->_rxDataRates;
                            if (!((unint64_t)rxDataRates | *((_QWORD *)a3 + 4))
                              || (v5 = -[NSMutableArray isEqual:](rxDataRates, "isEqual:")) != 0)
                            {
                              rxRSSIs = self->_rxRSSIs;
                              if ((unint64_t)rxRSSIs | *((_QWORD *)a3 + 7))
                                LOBYTE(v5) = -[NSMutableArray isEqual:](rxRSSIs, "isEqual:");
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
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
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

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761u * self->_txSuccessCount;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_txExpiredCount;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761u * self->_txErrorCount;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_txTotalDelays, "hash");
  v7 = -[NSMutableArray hash](self->_txIPCDelays, "hash");
  v8 = v6 ^ v7 ^ -[NSMutableArray hash](self->_txFWDelays, "hash");
  v9 = -[NSMutableArray hash](self->_txHWDelays, "hash");
  v10 = v9 ^ -[NSMutableArray hash](self->_txDataRates, "hash");
  v11 = v8 ^ v10 ^ -[NSMutableArray hash](self->_txCCAs, "hash");
  v12 = -[NSMutableArray hash](self->_txRetries, "hash");
  v13 = v12 ^ -[NSMutableArray hash](self->_txPacketBurstSizes, "hash");
  v14 = v13 ^ -[NSMutableArray hash](self->_txPacketBurstIntervals, "hash");
  v15 = v11 ^ v14 ^ -[NSMutableArray hash](self->_rxTotalDelays, "hash");
  v16 = -[NSMutableArray hash](self->_rxIPCDelays, "hash");
  v17 = v16 ^ -[NSMutableArray hash](self->_rxFWDelays, "hash");
  v18 = v17 ^ -[NSMutableArray hash](self->_rxDataRates, "hash");
  return v15 ^ v18 ^ -[NSMutableArray hash](self->_rxRSSIs, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
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
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t mm;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t nn;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i1;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i2;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i3;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i4;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
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
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 144);
  if ((v5 & 4) != 0)
  {
    self->_txSuccessCount = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 144);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 144) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_txExpiredCount = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 144) & 1) != 0)
  {
LABEL_4:
    self->_txErrorCount = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 17);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v129;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v129 != v9)
          objc_enumerationMutation(v6);
        -[AWDSidecarPeerTraffic addTxTotalDelay:](self, "addTxTotalDelay:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
    }
    while (v8);
  }
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 13);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v125;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v125 != v14)
          objc_enumerationMutation(v11);
        -[AWDSidecarPeerTraffic addTxIPCDelay:](self, "addTxIPCDelay:", *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
    }
    while (v13);
  }
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v16 = (void *)*((_QWORD *)a3 + 11);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v120, v143, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v121;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v121 != v19)
          objc_enumerationMutation(v16);
        -[AWDSidecarPeerTraffic addTxFWDelay:](self, "addTxFWDelay:", *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v120, v143, 16);
    }
    while (v18);
  }
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v21 = (void *)*((_QWORD *)a3 + 12);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v117;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v117 != v24)
          objc_enumerationMutation(v21);
        -[AWDSidecarPeerTraffic addTxHWDelay:](self, "addTxHWDelay:", *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
    }
    while (v23);
  }
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v26 = (void *)*((_QWORD *)a3 + 10);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v112, v141, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v113;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v113 != v29)
          objc_enumerationMutation(v26);
        -[AWDSidecarPeerTraffic addTxDataRate:](self, "addTxDataRate:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * n));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v112, v141, 16);
    }
    while (v28);
  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v31 = (void *)*((_QWORD *)a3 + 9);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v108, v140, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v109;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v109 != v34)
          objc_enumerationMutation(v31);
        -[AWDSidecarPeerTraffic addTxCCA:](self, "addTxCCA:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * ii));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v108, v140, 16);
    }
    while (v33);
  }
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v36 = (void *)*((_QWORD *)a3 + 16);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v104, v139, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v105;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v105 != v39)
          objc_enumerationMutation(v36);
        -[AWDSidecarPeerTraffic addTxRetries:](self, "addTxRetries:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * jj));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v104, v139, 16);
    }
    while (v38);
  }
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v41 = (void *)*((_QWORD *)a3 + 15);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v100, v138, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v101;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v101 != v44)
          objc_enumerationMutation(v41);
        -[AWDSidecarPeerTraffic addTxPacketBurstSize:](self, "addTxPacketBurstSize:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * kk));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v100, v138, 16);
    }
    while (v43);
  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v46 = (void *)*((_QWORD *)a3 + 14);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v96, v137, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v97;
    do
    {
      for (mm = 0; mm != v48; ++mm)
      {
        if (*(_QWORD *)v97 != v49)
          objc_enumerationMutation(v46);
        -[AWDSidecarPeerTraffic addTxPacketBurstInterval:](self, "addTxPacketBurstInterval:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * mm));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v96, v137, 16);
    }
    while (v48);
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v51 = (void *)*((_QWORD *)a3 + 8);
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v92, v136, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v93;
    do
    {
      for (nn = 0; nn != v53; ++nn)
      {
        if (*(_QWORD *)v93 != v54)
          objc_enumerationMutation(v51);
        -[AWDSidecarPeerTraffic addRxTotalDelay:](self, "addRxTotalDelay:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * nn));
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v92, v136, 16);
    }
    while (v53);
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v56 = (void *)*((_QWORD *)a3 + 6);
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v88, v135, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v89;
    do
    {
      for (i1 = 0; i1 != v58; ++i1)
      {
        if (*(_QWORD *)v89 != v59)
          objc_enumerationMutation(v56);
        -[AWDSidecarPeerTraffic addRxIPCDelay:](self, "addRxIPCDelay:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i1));
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v88, v135, 16);
    }
    while (v58);
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v61 = (void *)*((_QWORD *)a3 + 5);
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v84, v134, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v85;
    do
    {
      for (i2 = 0; i2 != v63; ++i2)
      {
        if (*(_QWORD *)v85 != v64)
          objc_enumerationMutation(v61);
        -[AWDSidecarPeerTraffic addRxFWDelay:](self, "addRxFWDelay:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i2));
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v84, v134, 16);
    }
    while (v63);
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v66 = (void *)*((_QWORD *)a3 + 4);
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v80, v133, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v81;
    do
    {
      for (i3 = 0; i3 != v68; ++i3)
      {
        if (*(_QWORD *)v81 != v69)
          objc_enumerationMutation(v66);
        -[AWDSidecarPeerTraffic addRxDataRate:](self, "addRxDataRate:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i3));
      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v80, v133, 16);
    }
    while (v68);
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v71 = (void *)*((_QWORD *)a3 + 7);
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v76, v132, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v77;
    do
    {
      for (i4 = 0; i4 != v73; ++i4)
      {
        if (*(_QWORD *)v77 != v74)
          objc_enumerationMutation(v71);
        -[AWDSidecarPeerTraffic addRxRSSI:](self, "addRxRSSI:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i4));
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v76, v132, 16);
    }
    while (v73);
  }
}

- (unint64_t)txSuccessCount
{
  return self->_txSuccessCount;
}

- (unint64_t)txExpiredCount
{
  return self->_txExpiredCount;
}

- (unint64_t)txErrorCount
{
  return self->_txErrorCount;
}

- (NSMutableArray)txTotalDelays
{
  return self->_txTotalDelays;
}

- (void)setTxTotalDelays:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSMutableArray)txIPCDelays
{
  return self->_txIPCDelays;
}

- (void)setTxIPCDelays:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSMutableArray)txFWDelays
{
  return self->_txFWDelays;
}

- (void)setTxFWDelays:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)txHWDelays
{
  return self->_txHWDelays;
}

- (void)setTxHWDelays:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSMutableArray)txDataRates
{
  return self->_txDataRates;
}

- (void)setTxDataRates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableArray)txCCAs
{
  return self->_txCCAs;
}

- (void)setTxCCAs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableArray)txRetries
{
  return self->_txRetries;
}

- (void)setTxRetries:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSMutableArray)txPacketBurstSizes
{
  return self->_txPacketBurstSizes;
}

- (void)setTxPacketBurstSizes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSMutableArray)txPacketBurstIntervals
{
  return self->_txPacketBurstIntervals;
}

- (void)setTxPacketBurstIntervals:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSMutableArray)rxTotalDelays
{
  return self->_rxTotalDelays;
}

- (void)setRxTotalDelays:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableArray)rxIPCDelays
{
  return self->_rxIPCDelays;
}

- (void)setRxIPCDelays:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)rxFWDelays
{
  return self->_rxFWDelays;
}

- (void)setRxFWDelays:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)rxDataRates
{
  return self->_rxDataRates;
}

- (void)setRxDataRates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)rxRSSIs
{
  return self->_rxRSSIs;
}

- (void)setRxRSSIs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
