@implementation AWDWiFiNWActivityControllerStats

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiNWActivityControllerStats setScanActivity:](self, "setScanActivity:", 0);
  -[AWDWiFiNWActivityControllerStats setPowerActivity:](self, "setPowerActivity:", 0);
  -[AWDWiFiNWActivityControllerStats setImpedingFunctions:](self, "setImpedingFunctions:", 0);
  -[AWDWiFiNWActivityControllerStats setAggregateMetrics:](self, "setAggregateMetrics:", 0);
  -[AWDWiFiNWActivityControllerStats setBtCoex:](self, "setBtCoex:", 0);
  -[AWDWiFiNWActivityControllerStats setPhyrate:](self, "setPhyrate:", 0);
  -[AWDWiFiNWActivityControllerStats setTxmpduWMEs:](self, "setTxmpduWMEs:", 0);
  -[AWDWiFiNWActivityControllerStats setRxmpduWMEs:](self, "setRxmpduWMEs:", 0);
  -[AWDWiFiNWActivityControllerStats setRxmdpuLosts:](self, "setRxmdpuLosts:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityControllerStats;
  -[AWDWiFiNWActivityControllerStats dealloc](&v3, sel_dealloc);
}

- (void)setControllerResets:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_controllerResets = a3;
}

- (void)setHasControllerResets:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasControllerResets
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setBackoffStuck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_backoffStuck = a3;
}

- (void)setHasBackoffStuck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBackoffStuck
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasScanActivity
{
  return self->_scanActivity != 0;
}

- (BOOL)hasPowerActivity
{
  return self->_powerActivity != 0;
}

- (BOOL)hasImpedingFunctions
{
  return self->_impedingFunctions != 0;
}

- (BOOL)hasAggregateMetrics
{
  return self->_aggregateMetrics != 0;
}

- (BOOL)hasBtCoex
{
  return self->_btCoex != 0;
}

- (void)setChannelsVisited0:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_channelsVisited0 = a3;
}

- (void)setHasChannelsVisited0:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasChannelsVisited0
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setChannelsVisited1:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_channelsVisited1 = a3;
}

- (void)setHasChannelsVisited1:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasChannelsVisited1
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPhyrate
{
  return self->_phyrate != 0;
}

- (void)setChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setChannelBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_channelBandwidth = a3;
}

- (void)setHasChannelBandwidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasChannelBandwidth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCcCaptureDriverLogs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ccCaptureDriverLogs = a3;
}

- (void)setHasCcCaptureDriverLogs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCcCaptureDriverLogs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCommandsIssued:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_commandsIssued = a3;
}

- (void)setHasCommandsIssued:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCommandsIssued
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCommanderHalted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_commanderHalted = a3;
}

- (void)setHasCommanderHalted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasCommanderHalted
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIorSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_iorSuccess = a3;
}

- (void)setHasIorSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIorSuccess
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIorWA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_iorWA = a3;
}

- (void)setHasIorWA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIorWA
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)clearTxmpduWMEs
{
  -[NSMutableArray removeAllObjects](self->_txmpduWMEs, "removeAllObjects");
}

- (void)addTxmpduWME:(id)a3
{
  NSMutableArray *txmpduWMEs;

  txmpduWMEs = self->_txmpduWMEs;
  if (!txmpduWMEs)
  {
    txmpduWMEs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_txmpduWMEs = txmpduWMEs;
  }
  -[NSMutableArray addObject:](txmpduWMEs, "addObject:", a3);
}

- (unint64_t)txmpduWMEsCount
{
  return -[NSMutableArray count](self->_txmpduWMEs, "count");
}

- (id)txmpduWMEAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txmpduWMEs, "objectAtIndex:", a3);
}

+ (Class)txmpduWMEType
{
  return (Class)objc_opt_class();
}

- (void)clearRxmpduWMEs
{
  -[NSMutableArray removeAllObjects](self->_rxmpduWMEs, "removeAllObjects");
}

- (void)addRxmpduWME:(id)a3
{
  NSMutableArray *rxmpduWMEs;

  rxmpduWMEs = self->_rxmpduWMEs;
  if (!rxmpduWMEs)
  {
    rxmpduWMEs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxmpduWMEs = rxmpduWMEs;
  }
  -[NSMutableArray addObject:](rxmpduWMEs, "addObject:", a3);
}

- (unint64_t)rxmpduWMEsCount
{
  return -[NSMutableArray count](self->_rxmpduWMEs, "count");
}

- (id)rxmpduWMEAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxmpduWMEs, "objectAtIndex:", a3);
}

+ (Class)rxmpduWMEType
{
  return (Class)objc_opt_class();
}

- (void)clearRxmdpuLosts
{
  -[NSMutableArray removeAllObjects](self->_rxmdpuLosts, "removeAllObjects");
}

- (void)addRxmdpuLost:(id)a3
{
  NSMutableArray *rxmdpuLosts;

  rxmdpuLosts = self->_rxmdpuLosts;
  if (!rxmdpuLosts)
  {
    rxmdpuLosts = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rxmdpuLosts = rxmdpuLosts;
  }
  -[NSMutableArray addObject:](rxmdpuLosts, "addObject:", a3);
}

- (unint64_t)rxmdpuLostsCount
{
  return -[NSMutableArray count](self->_rxmdpuLosts, "count");
}

- (id)rxmdpuLostAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rxmdpuLosts, "objectAtIndex:", a3);
}

+ (Class)rxmdpuLostType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityControllerStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityControllerStats description](&v3, sel_description), -[AWDWiFiNWActivityControllerStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  AWDWiFiNWActivityScanActivity *scanActivity;
  AWDWiFiNWActivityPowerPStats *powerActivity;
  AWDWiFiNWActivityImpedingFunctions *impedingFunctions;
  AWDWiFiNWActivityAggregateMetrics *aggregateMetrics;
  AWDWiFiNWActivityBtCoex *btCoex;
  __int16 v10;
  AWDWiFiNWActivityRateAndAggregation *phyrate;
  __int16 v12;
  void *v13;
  NSMutableArray *txmpduWMEs;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableArray *rxmpduWMEs;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSMutableArray *rxmdpuLosts;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_controllerResets), CFSTR("controllerResets"));
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_backoffStuck), CFSTR("backoffStuck"));
  scanActivity = self->_scanActivity;
  if (scanActivity)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityScanActivity dictionaryRepresentation](scanActivity, "dictionaryRepresentation"), CFSTR("scanActivity"));
  powerActivity = self->_powerActivity;
  if (powerActivity)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityPowerPStats dictionaryRepresentation](powerActivity, "dictionaryRepresentation"), CFSTR("powerActivity"));
  impedingFunctions = self->_impedingFunctions;
  if (impedingFunctions)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityImpedingFunctions dictionaryRepresentation](impedingFunctions, "dictionaryRepresentation"), CFSTR("impedingFunctions"));
  aggregateMetrics = self->_aggregateMetrics;
  if (aggregateMetrics)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityAggregateMetrics dictionaryRepresentation](aggregateMetrics, "dictionaryRepresentation"), CFSTR("aggregateMetrics"));
  btCoex = self->_btCoex;
  if (btCoex)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityBtCoex dictionaryRepresentation](btCoex, "dictionaryRepresentation"), CFSTR("btCoex"));
  v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelsVisited0), CFSTR("channelsVisited0"));
    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x40) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelsVisited1), CFSTR("channelsVisited1"));
  phyrate = self->_phyrate;
  if (phyrate)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityRateAndAggregation dictionaryRepresentation](phyrate, "dictionaryRepresentation"), CFSTR("phyrate"));
  v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channel), CFSTR("channel"));
    v12 = (__int16)self->_has;
    if ((v12 & 0x10) == 0)
    {
LABEL_23:
      if ((v12 & 4) == 0)
        goto LABEL_24;
      goto LABEL_59;
    }
  }
  else if ((v12 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelBandwidth), CFSTR("channelBandwidth"));
  v12 = (__int16)self->_has;
  if ((v12 & 4) == 0)
  {
LABEL_24:
    if ((v12 & 1) == 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccCaptureDriverLogs), CFSTR("ccCaptureDriverLogs"));
  v12 = (__int16)self->_has;
  if ((v12 & 1) == 0)
  {
LABEL_25:
    if ((v12 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_commandsIssued), CFSTR("commandsIssued"));
  v12 = (__int16)self->_has;
  if ((v12 & 0x80) == 0)
  {
LABEL_26:
    if ((v12 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_commanderHalted), CFSTR("commanderHalted"));
  v12 = (__int16)self->_has;
  if ((v12 & 0x200) == 0)
  {
LABEL_27:
    if ((v12 & 0x400) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_iorSuccess), CFSTR("iorSuccess"));
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_28:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_iorWA), CFSTR("iorWA"));
LABEL_29:
  if (-[NSMutableArray count](self->_txmpduWMEs, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txmpduWMEs, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    txmpduWMEs = self->_txmpduWMEs;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txmpduWMEs, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(txmpduWMEs);
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txmpduWMEs, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v16);
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("txmpduWME"));

  }
  if (-[NSMutableArray count](self->_rxmpduWMEs, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxmpduWMEs, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    rxmpduWMEs = self->_rxmpduWMEs;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmpduWMEs, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(rxmpduWMEs);
          objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmpduWMEs, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v22);
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("rxmpduWME"));

  }
  if (-[NSMutableArray count](self->_rxmdpuLosts, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxmdpuLosts, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    rxmdpuLosts = self->_rxmdpuLosts;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmdpuLosts, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(rxmdpuLosts);
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmdpuLosts, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v28);
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("rxmdpuLost"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityControllerStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;
  NSMutableArray *txmpduWMEs;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *rxmpduWMEs;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *rxmdpuLosts;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_scanActivity)
    PBDataWriterWriteSubmessage();
  if (self->_powerActivity)
    PBDataWriterWriteSubmessage();
  if (self->_impedingFunctions)
    PBDataWriterWriteSubmessage();
  if (self->_aggregateMetrics)
    PBDataWriterWriteSubmessage();
  if (self->_btCoex)
    PBDataWriterWriteSubmessage();
  v5 = (__int16)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 0x40) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_phyrate)
    PBDataWriterWriteSubmessage();
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = (__int16)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_23:
      if ((v6 & 4) == 0)
        goto LABEL_24;
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_24:
    if ((v6 & 1) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_25:
    if ((v6 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_26:
    if ((v6 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_27:
    if ((v6 & 0x400) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_28:
    PBDataWriterWriteUint32Field();
LABEL_29:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  txmpduWMEs = self->_txmpduWMEs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txmpduWMEs, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(txmpduWMEs);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txmpduWMEs, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v9);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  rxmpduWMEs = self->_rxmpduWMEs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmpduWMEs, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(rxmpduWMEs);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmpduWMEs, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  rxmdpuLosts = self->_rxmdpuLosts;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmdpuLosts, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(rxmdpuLosts);
        PBDataWriterWriteSubmessage();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmdpuLosts, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;
  __int16 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_controllerResets;
    *((_WORD *)a3 + 68) |= 0x100u;
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_backoffStuck;
    *((_WORD *)a3 + 68) |= 2u;
  }
  if (self->_scanActivity)
    objc_msgSend(a3, "setScanActivity:");
  if (self->_powerActivity)
    objc_msgSend(a3, "setPowerActivity:");
  if (self->_impedingFunctions)
    objc_msgSend(a3, "setImpedingFunctions:");
  if (self->_aggregateMetrics)
    objc_msgSend(a3, "setAggregateMetrics:");
  if (self->_btCoex)
    objc_msgSend(a3, "setBtCoex:");
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_channelsVisited0;
    *((_WORD *)a3 + 68) |= 0x20u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_channelsVisited1;
    *((_WORD *)a3 + 68) |= 0x40u;
  }
  if (self->_phyrate)
    objc_msgSend(a3, "setPhyrate:");
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_channel;
    *((_WORD *)a3 + 68) |= 8u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_23:
      if ((v7 & 4) == 0)
        goto LABEL_24;
      goto LABEL_44;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)a3 + 12) = self->_channelBandwidth;
  *((_WORD *)a3 + 68) |= 0x10u;
  v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_24:
    if ((v7 & 1) == 0)
      goto LABEL_25;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 10) = self->_ccCaptureDriverLogs;
  *((_WORD *)a3 + 68) |= 4u;
  v7 = (__int16)self->_has;
  if ((v7 & 1) == 0)
  {
LABEL_25:
    if ((v7 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)a3 + 1) = self->_commandsIssued;
  *((_WORD *)a3 + 68) |= 1u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x80) == 0)
  {
LABEL_26:
    if ((v7 & 0x200) == 0)
      goto LABEL_27;
LABEL_47:
    *((_DWORD *)a3 + 20) = self->_iorSuccess;
    *((_WORD *)a3 + 68) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_46:
  *((_DWORD *)a3 + 15) = self->_commanderHalted;
  *((_WORD *)a3 + 68) |= 0x80u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
    goto LABEL_47;
LABEL_27:
  if ((v7 & 0x400) != 0)
  {
LABEL_28:
    *((_DWORD *)a3 + 21) = self->_iorWA;
    *((_WORD *)a3 + 68) |= 0x400u;
  }
LABEL_29:
  if (-[AWDWiFiNWActivityControllerStats txmpduWMEsCount](self, "txmpduWMEsCount"))
  {
    objc_msgSend(a3, "clearTxmpduWMEs");
    v8 = -[AWDWiFiNWActivityControllerStats txmpduWMEsCount](self, "txmpduWMEsCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
        objc_msgSend(a3, "addTxmpduWME:", -[AWDWiFiNWActivityControllerStats txmpduWMEAtIndex:](self, "txmpduWMEAtIndex:", i));
    }
  }
  if (-[AWDWiFiNWActivityControllerStats rxmpduWMEsCount](self, "rxmpduWMEsCount"))
  {
    objc_msgSend(a3, "clearRxmpduWMEs");
    v11 = -[AWDWiFiNWActivityControllerStats rxmpduWMEsCount](self, "rxmpduWMEsCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
        objc_msgSend(a3, "addRxmpduWME:", -[AWDWiFiNWActivityControllerStats rxmpduWMEAtIndex:](self, "rxmpduWMEAtIndex:", j));
    }
  }
  if (-[AWDWiFiNWActivityControllerStats rxmdpuLostsCount](self, "rxmdpuLostsCount"))
  {
    objc_msgSend(a3, "clearRxmdpuLosts");
    v14 = -[AWDWiFiNWActivityControllerStats rxmdpuLostsCount](self, "rxmdpuLostsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
        objc_msgSend(a3, "addRxmdpuLost:", -[AWDWiFiNWActivityControllerStats rxmdpuLostAtIndex:](self, "rxmdpuLostAtIndex:", k));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  __int16 v8;
  __int16 v9;
  NSMutableArray *txmpduWMEs;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *rxmpduWMEs;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSMutableArray *rxmdpuLosts;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_controllerResets;
    *(_WORD *)(v5 + 136) |= 0x100u;
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_backoffStuck;
    *(_WORD *)(v5 + 136) |= 2u;
  }

  *(_QWORD *)(v6 + 120) = -[AWDWiFiNWActivityScanActivity copyWithZone:](self->_scanActivity, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 96) = -[AWDWiFiNWActivityPowerPStats copyWithZone:](self->_powerActivity, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 72) = -[AWDWiFiNWActivityImpedingFunctions copyWithZone:](self->_impedingFunctions, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 16) = -[AWDWiFiNWActivityAggregateMetrics copyWithZone:](self->_aggregateMetrics, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 32) = -[AWDWiFiNWActivityBtCoex copyWithZone:](self->_btCoex, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_channelsVisited0;
    *(_WORD *)(v6 + 136) |= 0x20u;
    v8 = (__int16)self->_has;
  }
  if ((v8 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_channelsVisited1;
    *(_WORD *)(v6 + 136) |= 0x40u;
  }

  *(_QWORD *)(v6 + 88) = -[AWDWiFiNWActivityRateAndAggregation copyWithZone:](self->_phyrate, "copyWithZone:", a3);
  v9 = (__int16)self->_has;
  if ((v9 & 8) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_channel;
    *(_WORD *)(v6 + 136) |= 8u;
    v9 = (__int16)self->_has;
    if ((v9 & 0x10) == 0)
    {
LABEL_11:
      if ((v9 & 4) == 0)
        goto LABEL_12;
      goto LABEL_41;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 48) = self->_channelBandwidth;
  *(_WORD *)(v6 + 136) |= 0x10u;
  v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_12:
    if ((v9 & 1) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 40) = self->_ccCaptureDriverLogs;
  *(_WORD *)(v6 + 136) |= 4u;
  v9 = (__int16)self->_has;
  if ((v9 & 1) == 0)
  {
LABEL_13:
    if ((v9 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  *(_QWORD *)(v6 + 8) = self->_commandsIssued;
  *(_WORD *)(v6 + 136) |= 1u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x80) == 0)
  {
LABEL_14:
    if ((v9 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v6 + 60) = self->_commanderHalted;
  *(_WORD *)(v6 + 136) |= 0x80u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x200) == 0)
  {
LABEL_15:
    if ((v9 & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_44:
  *(_DWORD *)(v6 + 80) = self->_iorSuccess;
  *(_WORD *)(v6 + 136) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 84) = self->_iorWA;
    *(_WORD *)(v6 + 136) |= 0x400u;
  }
LABEL_17:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  txmpduWMEs = self->_txmpduWMEs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txmpduWMEs, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(txmpduWMEs);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxmpduWME:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](txmpduWMEs, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v12);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  rxmpduWMEs = self->_rxmpduWMEs;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmpduWMEs, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(rxmpduWMEs);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxmpduWME:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmpduWMEs, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v18);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  rxmdpuLosts = self->_rxmdpuLosts;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmdpuLosts, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(rxmdpuLosts);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxmdpuLost:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rxmdpuLosts, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v24);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  AWDWiFiNWActivityScanActivity *scanActivity;
  AWDWiFiNWActivityPowerPStats *powerActivity;
  AWDWiFiNWActivityImpedingFunctions *impedingFunctions;
  AWDWiFiNWActivityAggregateMetrics *aggregateMetrics;
  AWDWiFiNWActivityBtCoex *btCoex;
  __int16 v13;
  __int16 v14;
  AWDWiFiNWActivityRateAndAggregation *phyrate;
  __int16 v16;
  NSMutableArray *txmpduWMEs;
  NSMutableArray *rxmpduWMEs;
  NSMutableArray *rxmdpuLosts;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 68);
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x100) == 0 || self->_controllerResets != *((_DWORD *)a3 + 16))
        goto LABEL_76;
    }
    else if ((*((_WORD *)a3 + 68) & 0x100) != 0)
    {
LABEL_76:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_backoffStuck != *((_DWORD *)a3 + 6))
        goto LABEL_76;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_76;
    }
    scanActivity = self->_scanActivity;
    if (!((unint64_t)scanActivity | *((_QWORD *)a3 + 15))
      || (v5 = -[AWDWiFiNWActivityScanActivity isEqual:](scanActivity, "isEqual:")) != 0)
    {
      powerActivity = self->_powerActivity;
      if (!((unint64_t)powerActivity | *((_QWORD *)a3 + 12))
        || (v5 = -[AWDWiFiNWActivityPowerPStats isEqual:](powerActivity, "isEqual:")) != 0)
      {
        impedingFunctions = self->_impedingFunctions;
        if (!((unint64_t)impedingFunctions | *((_QWORD *)a3 + 9))
          || (v5 = -[AWDWiFiNWActivityImpedingFunctions isEqual:](impedingFunctions, "isEqual:")) != 0)
        {
          aggregateMetrics = self->_aggregateMetrics;
          if (!((unint64_t)aggregateMetrics | *((_QWORD *)a3 + 2))
            || (v5 = -[AWDWiFiNWActivityAggregateMetrics isEqual:](aggregateMetrics, "isEqual:")) != 0)
          {
            btCoex = self->_btCoex;
            if (!((unint64_t)btCoex | *((_QWORD *)a3 + 4))
              || (v5 = -[AWDWiFiNWActivityBtCoex isEqual:](btCoex, "isEqual:")) != 0)
            {
              v13 = (__int16)self->_has;
              v14 = *((_WORD *)a3 + 68);
              if ((v13 & 0x20) != 0)
              {
                if ((v14 & 0x20) == 0 || self->_channelsVisited0 != *((_DWORD *)a3 + 13))
                  goto LABEL_76;
              }
              else if ((v14 & 0x20) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x40) != 0)
              {
                if ((v14 & 0x40) == 0 || self->_channelsVisited1 != *((_DWORD *)a3 + 14))
                  goto LABEL_76;
              }
              else if ((v14 & 0x40) != 0)
              {
                goto LABEL_76;
              }
              phyrate = self->_phyrate;
              if ((unint64_t)phyrate | *((_QWORD *)a3 + 11))
              {
                v5 = -[AWDWiFiNWActivityRateAndAggregation isEqual:](phyrate, "isEqual:");
                if (!v5)
                  return v5;
                v13 = (__int16)self->_has;
              }
              v16 = *((_WORD *)a3 + 68);
              if ((v13 & 8) != 0)
              {
                if ((v16 & 8) == 0 || self->_channel != *((_DWORD *)a3 + 11))
                  goto LABEL_76;
              }
              else if ((v16 & 8) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x10) != 0)
              {
                if ((v16 & 0x10) == 0 || self->_channelBandwidth != *((_DWORD *)a3 + 12))
                  goto LABEL_76;
              }
              else if ((v16 & 0x10) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 4) != 0)
              {
                if ((v16 & 4) == 0 || self->_ccCaptureDriverLogs != *((_DWORD *)a3 + 10))
                  goto LABEL_76;
              }
              else if ((v16 & 4) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 1) != 0)
              {
                if ((v16 & 1) == 0 || self->_commandsIssued != *((_QWORD *)a3 + 1))
                  goto LABEL_76;
              }
              else if ((v16 & 1) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x80) != 0)
              {
                if ((v16 & 0x80) == 0 || self->_commanderHalted != *((_DWORD *)a3 + 15))
                  goto LABEL_76;
              }
              else if ((v16 & 0x80) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x200) != 0)
              {
                if ((*((_WORD *)a3 + 68) & 0x200) == 0 || self->_iorSuccess != *((_DWORD *)a3 + 20))
                  goto LABEL_76;
              }
              else if ((*((_WORD *)a3 + 68) & 0x200) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x400) != 0)
              {
                if ((*((_WORD *)a3 + 68) & 0x400) == 0 || self->_iorWA != *((_DWORD *)a3 + 21))
                  goto LABEL_76;
              }
              else if ((*((_WORD *)a3 + 68) & 0x400) != 0)
              {
                goto LABEL_76;
              }
              txmpduWMEs = self->_txmpduWMEs;
              if (!((unint64_t)txmpduWMEs | *((_QWORD *)a3 + 16))
                || (v5 = -[NSMutableArray isEqual:](txmpduWMEs, "isEqual:")) != 0)
              {
                rxmpduWMEs = self->_rxmpduWMEs;
                if (!((unint64_t)rxmpduWMEs | *((_QWORD *)a3 + 14))
                  || (v5 = -[NSMutableArray isEqual:](rxmpduWMEs, "isEqual:")) != 0)
                {
                  rxmdpuLosts = self->_rxmdpuLosts;
                  if ((unint64_t)rxmdpuLosts | *((_QWORD *)a3 + 13))
                    LOBYTE(v5) = -[NSMutableArray isEqual:](rxmdpuLosts, "isEqual:");
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
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v27 = 2654435761 * self->_controllerResets;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v27 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = -[AWDWiFiNWActivityScanActivity hash](self->_scanActivity, "hash", 2654435761 * self->_backoffStuck);
      goto LABEL_6;
    }
  }
  v4 = -[AWDWiFiNWActivityScanActivity hash](self->_scanActivity, "hash", 0);
LABEL_6:
  v5 = v4;
  v6 = -[AWDWiFiNWActivityPowerPStats hash](self->_powerActivity, "hash");
  v7 = -[AWDWiFiNWActivityImpedingFunctions hash](self->_impedingFunctions, "hash");
  v8 = -[AWDWiFiNWActivityAggregateMetrics hash](self->_aggregateMetrics, "hash");
  v9 = -[AWDWiFiNWActivityBtCoex hash](self->_btCoex, "hash");
  v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
  {
    v11 = 2654435761 * self->_channelsVisited0;
    if ((v10 & 0x40) != 0)
      goto LABEL_8;
  }
  else
  {
    v11 = 0;
    if ((v10 & 0x40) != 0)
    {
LABEL_8:
      v12 = 2654435761 * self->_channelsVisited1;
      goto LABEL_11;
    }
  }
  v12 = 0;
LABEL_11:
  v13 = -[AWDWiFiNWActivityRateAndAggregation hash](self->_phyrate, "hash");
  v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    v15 = 2654435761 * self->_channel;
    if ((v14 & 0x10) != 0)
    {
LABEL_13:
      v16 = 2654435761 * self->_channelBandwidth;
      if ((v14 & 4) != 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  else
  {
    v15 = 0;
    if ((v14 & 0x10) != 0)
      goto LABEL_13;
  }
  v16 = 0;
  if ((v14 & 4) != 0)
  {
LABEL_14:
    v17 = 2654435761 * self->_ccCaptureDriverLogs;
    if ((v14 & 1) != 0)
      goto LABEL_15;
    goto LABEL_22;
  }
LABEL_21:
  v17 = 0;
  if ((v14 & 1) != 0)
  {
LABEL_15:
    v18 = 2654435761u * self->_commandsIssued;
    if ((v14 & 0x80) != 0)
      goto LABEL_16;
    goto LABEL_23;
  }
LABEL_22:
  v18 = 0;
  if ((v14 & 0x80) != 0)
  {
LABEL_16:
    v19 = 2654435761 * self->_commanderHalted;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_17;
LABEL_24:
    v20 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_18;
LABEL_25:
    v21 = 0;
    goto LABEL_26;
  }
LABEL_23:
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_24;
LABEL_17:
  v20 = 2654435761 * self->_iorSuccess;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_25;
LABEL_18:
  v21 = 2654435761 * self->_iorWA;
LABEL_26:
  v22 = v26 ^ v27 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16;
  v23 = v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ -[NSMutableArray hash](self->_txmpduWMEs, "hash");
  v24 = v23 ^ -[NSMutableArray hash](self->_rxmpduWMEs, "hash");
  return v22 ^ v24 ^ -[NSMutableArray hash](self->_rxmdpuLosts, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  AWDWiFiNWActivityScanActivity *scanActivity;
  uint64_t v7;
  AWDWiFiNWActivityPowerPStats *powerActivity;
  uint64_t v9;
  AWDWiFiNWActivityImpedingFunctions *impedingFunctions;
  uint64_t v11;
  AWDWiFiNWActivityAggregateMetrics *aggregateMetrics;
  uint64_t v13;
  AWDWiFiNWActivityBtCoex *btCoex;
  uint64_t v15;
  __int16 v16;
  AWDWiFiNWActivityRateAndAggregation *phyrate;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
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
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x100) != 0)
  {
    self->_controllerResets = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)a3 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_backoffStuck = *((_DWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 2u;
  }
  scanActivity = self->_scanActivity;
  v7 = *((_QWORD *)a3 + 15);
  if (scanActivity)
  {
    if (v7)
      -[AWDWiFiNWActivityScanActivity mergeFrom:](scanActivity, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDWiFiNWActivityControllerStats setScanActivity:](self, "setScanActivity:");
  }
  powerActivity = self->_powerActivity;
  v9 = *((_QWORD *)a3 + 12);
  if (powerActivity)
  {
    if (v9)
      -[AWDWiFiNWActivityPowerPStats mergeFrom:](powerActivity, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDWiFiNWActivityControllerStats setPowerActivity:](self, "setPowerActivity:");
  }
  impedingFunctions = self->_impedingFunctions;
  v11 = *((_QWORD *)a3 + 9);
  if (impedingFunctions)
  {
    if (v11)
      -[AWDWiFiNWActivityImpedingFunctions mergeFrom:](impedingFunctions, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDWiFiNWActivityControllerStats setImpedingFunctions:](self, "setImpedingFunctions:");
  }
  aggregateMetrics = self->_aggregateMetrics;
  v13 = *((_QWORD *)a3 + 2);
  if (aggregateMetrics)
  {
    if (v13)
      -[AWDWiFiNWActivityAggregateMetrics mergeFrom:](aggregateMetrics, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDWiFiNWActivityControllerStats setAggregateMetrics:](self, "setAggregateMetrics:");
  }
  btCoex = self->_btCoex;
  v15 = *((_QWORD *)a3 + 4);
  if (btCoex)
  {
    if (v15)
      -[AWDWiFiNWActivityBtCoex mergeFrom:](btCoex, "mergeFrom:");
  }
  else if (v15)
  {
    -[AWDWiFiNWActivityControllerStats setBtCoex:](self, "setBtCoex:");
  }
  v16 = *((_WORD *)a3 + 68);
  if ((v16 & 0x20) != 0)
  {
    self->_channelsVisited0 = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x20u;
    v16 = *((_WORD *)a3 + 68);
  }
  if ((v16 & 0x40) != 0)
  {
    self->_channelsVisited1 = *((_DWORD *)a3 + 14);
    *(_WORD *)&self->_has |= 0x40u;
  }
  phyrate = self->_phyrate;
  v18 = *((_QWORD *)a3 + 11);
  if (phyrate)
  {
    if (v18)
      -[AWDWiFiNWActivityRateAndAggregation mergeFrom:](phyrate, "mergeFrom:");
  }
  else if (v18)
  {
    -[AWDWiFiNWActivityControllerStats setPhyrate:](self, "setPhyrate:");
  }
  v19 = *((_WORD *)a3 + 68);
  if ((v19 & 8) != 0)
  {
    self->_channel = *((_DWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 8u;
    v19 = *((_WORD *)a3 + 68);
    if ((v19 & 0x10) == 0)
    {
LABEL_41:
      if ((v19 & 4) == 0)
        goto LABEL_42;
      goto LABEL_71;
    }
  }
  else if ((v19 & 0x10) == 0)
  {
    goto LABEL_41;
  }
  self->_channelBandwidth = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x10u;
  v19 = *((_WORD *)a3 + 68);
  if ((v19 & 4) == 0)
  {
LABEL_42:
    if ((v19 & 1) == 0)
      goto LABEL_43;
    goto LABEL_72;
  }
LABEL_71:
  self->_ccCaptureDriverLogs = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 4u;
  v19 = *((_WORD *)a3 + 68);
  if ((v19 & 1) == 0)
  {
LABEL_43:
    if ((v19 & 0x80) == 0)
      goto LABEL_44;
    goto LABEL_73;
  }
LABEL_72:
  self->_commandsIssued = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v19 = *((_WORD *)a3 + 68);
  if ((v19 & 0x80) == 0)
  {
LABEL_44:
    if ((v19 & 0x200) == 0)
      goto LABEL_45;
    goto LABEL_74;
  }
LABEL_73:
  self->_commanderHalted = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x80u;
  v19 = *((_WORD *)a3 + 68);
  if ((v19 & 0x200) == 0)
  {
LABEL_45:
    if ((v19 & 0x400) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
LABEL_74:
  self->_iorSuccess = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 68) & 0x400) != 0)
  {
LABEL_46:
    self->_iorWA = *((_DWORD *)a3 + 21);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_47:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = (void *)*((_QWORD *)a3 + 16);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        -[AWDWiFiNWActivityControllerStats addTxmpduWME:](self, "addTxmpduWME:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v22);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = (void *)*((_QWORD *)a3 + 14);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        -[AWDWiFiNWActivityControllerStats addRxmpduWME:](self, "addRxmpduWME:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v27);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = (void *)*((_QWORD *)a3 + 13);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        -[AWDWiFiNWActivityControllerStats addRxmdpuLost:](self, "addRxmdpuLost:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v32);
  }
}

- (unsigned)controllerResets
{
  return self->_controllerResets;
}

- (unsigned)backoffStuck
{
  return self->_backoffStuck;
}

- (AWDWiFiNWActivityScanActivity)scanActivity
{
  return self->_scanActivity;
}

- (void)setScanActivity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (AWDWiFiNWActivityPowerPStats)powerActivity
{
  return self->_powerActivity;
}

- (void)setPowerActivity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (AWDWiFiNWActivityImpedingFunctions)impedingFunctions
{
  return self->_impedingFunctions;
}

- (void)setImpedingFunctions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (AWDWiFiNWActivityAggregateMetrics)aggregateMetrics
{
  return self->_aggregateMetrics;
}

- (void)setAggregateMetrics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (AWDWiFiNWActivityBtCoex)btCoex
{
  return self->_btCoex;
}

- (void)setBtCoex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)channelsVisited0
{
  return self->_channelsVisited0;
}

- (unsigned)channelsVisited1
{
  return self->_channelsVisited1;
}

- (AWDWiFiNWActivityRateAndAggregation)phyrate
{
  return self->_phyrate;
}

- (void)setPhyrate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)channelBandwidth
{
  return self->_channelBandwidth;
}

- (unsigned)ccCaptureDriverLogs
{
  return self->_ccCaptureDriverLogs;
}

- (unint64_t)commandsIssued
{
  return self->_commandsIssued;
}

- (unsigned)commanderHalted
{
  return self->_commanderHalted;
}

- (unsigned)iorSuccess
{
  return self->_iorSuccess;
}

- (unsigned)iorWA
{
  return self->_iorWA;
}

- (NSMutableArray)txmpduWMEs
{
  return self->_txmpduWMEs;
}

- (void)setTxmpduWMEs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSMutableArray)rxmpduWMEs
{
  return self->_rxmpduWMEs;
}

- (void)setRxmpduWMEs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSMutableArray)rxmdpuLosts
{
  return self->_rxmdpuLosts;
}

- (void)setRxmdpuLosts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
