@implementation WiFiAnalyticsAWDWiFiNWActivityControllerStats

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
  id v4;
  NSMutableArray *txmpduWMEs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txmpduWMEs = self->_txmpduWMEs;
  v8 = v4;
  if (!txmpduWMEs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_txmpduWMEs;
    self->_txmpduWMEs = v6;

    v4 = v8;
    txmpduWMEs = self->_txmpduWMEs;
  }
  -[NSMutableArray addObject:](txmpduWMEs, "addObject:", v4);

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
  id v4;
  NSMutableArray *rxmpduWMEs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rxmpduWMEs = self->_rxmpduWMEs;
  v8 = v4;
  if (!rxmpduWMEs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_rxmpduWMEs;
    self->_rxmpduWMEs = v6;

    v4 = v8;
    rxmpduWMEs = self->_rxmpduWMEs;
  }
  -[NSMutableArray addObject:](rxmpduWMEs, "addObject:", v4);

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
  id v4;
  NSMutableArray *rxmdpuLosts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rxmdpuLosts = self->_rxmdpuLosts;
  v8 = v4;
  if (!rxmdpuLosts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_rxmdpuLosts;
    self->_rxmdpuLosts = v6;

    v4 = v8;
    rxmdpuLosts = self->_rxmdpuLosts;
  }
  -[NSMutableArray addObject:](rxmdpuLosts, "addObject:", v4);

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

- (BOOL)hasOmi
{
  return self->_omi != 0;
}

- (BOOL)hasRuUsage
{
  return self->_ruUsage != 0;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityControllerStats;
  -[WiFiAnalyticsAWDWiFiNWActivityControllerStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityControllerStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  WiFiAnalyticsAWDWiFiNWActivityScanActivity *scanActivity;
  void *v8;
  WiFiAnalyticsAWDWiFiNWActivityPowerPStats *powerActivity;
  void *v10;
  WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *impedingFunctions;
  void *v12;
  WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics *aggregateMetrics;
  void *v14;
  WiFiAnalyticsAWDWiFiNWActivityBtCoex *btCoex;
  void *v16;
  __int16 v17;
  void *v18;
  void *v19;
  WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *phyrate;
  void *v21;
  __int16 v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  WiFiAnalyticsAWDWiFiNWActivityOMI *omi;
  void *v46;
  WiFiAnalyticsAWDWiFiNWActivityRuUsage *ruUsage;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_controllerResets);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("controllerResets"));

    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_backoffStuck);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("backoffStuck"));

  }
  scanActivity = self->_scanActivity;
  if (scanActivity)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityScanActivity dictionaryRepresentation](scanActivity, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("scanActivity"));

  }
  powerActivity = self->_powerActivity;
  if (powerActivity)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityPowerPStats dictionaryRepresentation](powerActivity, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("powerActivity"));

  }
  impedingFunctions = self->_impedingFunctions;
  if (impedingFunctions)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions dictionaryRepresentation](impedingFunctions, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("impedingFunctions"));

  }
  aggregateMetrics = self->_aggregateMetrics;
  if (aggregateMetrics)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics dictionaryRepresentation](aggregateMetrics, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("aggregateMetrics"));

  }
  btCoex = self->_btCoex;
  if (btCoex)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityBtCoex dictionaryRepresentation](btCoex, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("btCoex"));

  }
  v17 = (__int16)self->_has;
  if ((v17 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelsVisited0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("channelsVisited0"));

    v17 = (__int16)self->_has;
  }
  if ((v17 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelsVisited1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("channelsVisited1"));

  }
  phyrate = self->_phyrate;
  if (phyrate)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation dictionaryRepresentation](phyrate, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("phyrate"));

  }
  v22 = (__int16)self->_has;
  if ((v22 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channel);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("channel"));

    v22 = (__int16)self->_has;
    if ((v22 & 0x10) == 0)
    {
LABEL_23:
      if ((v22 & 4) == 0)
        goto LABEL_24;
      goto LABEL_63;
    }
  }
  else if ((v22 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelBandwidth);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("channelBandwidth"));

  v22 = (__int16)self->_has;
  if ((v22 & 4) == 0)
  {
LABEL_24:
    if ((v22 & 1) == 0)
      goto LABEL_25;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccCaptureDriverLogs);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("ccCaptureDriverLogs"));

  v22 = (__int16)self->_has;
  if ((v22 & 1) == 0)
  {
LABEL_25:
    if ((v22 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_commandsIssued);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("commandsIssued"));

  v22 = (__int16)self->_has;
  if ((v22 & 0x80) == 0)
  {
LABEL_26:
    if ((v22 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_commanderHalted);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("commanderHalted"));

  v22 = (__int16)self->_has;
  if ((v22 & 0x200) == 0)
  {
LABEL_27:
    if ((v22 & 0x400) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_iorSuccess);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("iorSuccess"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_iorWA);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("iorWA"));

  }
LABEL_29:
  if (-[NSMutableArray count](self->_txmpduWMEs, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txmpduWMEs, "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v25 = self->_txmpduWMEs;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v65 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("txmpduWME"));
  }
  if (-[NSMutableArray count](self->_rxmpduWMEs, "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxmpduWMEs, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v32 = self->_rxmpduWMEs;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v61 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v34);
    }

    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("rxmpduWME"));
  }
  if (-[NSMutableArray count](self->_rxmdpuLosts, "count"))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rxmdpuLosts, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v39 = self->_rxmdpuLosts;
    v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v57 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v56);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v44);

        }
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v41);
    }

    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("rxmdpuLost"));
  }
  omi = self->_omi;
  if (omi)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityOMI dictionaryRepresentation](omi, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("omi"));

  }
  ruUsage = self->_ruUsage;
  if (ruUsage)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityRuUsage dictionaryRepresentation](ruUsage, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("ruUsage"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityControllerStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
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
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_phyrate)
    PBDataWriterWriteSubmessage();
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_23:
      if ((v7 & 4) == 0)
        goto LABEL_24;
      goto LABEL_57;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_24:
    if ((v7 & 1) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  v7 = (__int16)self->_has;
  if ((v7 & 1) == 0)
  {
LABEL_25:
    if ((v7 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  v7 = (__int16)self->_has;
  if ((v7 & 0x80) == 0)
  {
LABEL_26:
    if ((v7 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_27:
    if ((v7 & 0x400) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_28:
    PBDataWriterWriteUint32Field();
LABEL_29:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_txmpduWMEs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v10);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = self->_rxmpduWMEs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v15);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = self->_rxmdpuLosts;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v20);
  }

  if (self->_omi)
    PBDataWriterWriteSubmessage();
  if (self->_ruUsage)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t j;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  _DWORD *v21;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[16] = self->_controllerResets;
    *((_WORD *)v4 + 76) |= 0x100u;
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[6] = self->_backoffStuck;
    *((_WORD *)v4 + 76) |= 2u;
  }
  v21 = v4;
  if (self->_scanActivity)
  {
    objc_msgSend(v4, "setScanActivity:");
    v4 = v21;
  }
  if (self->_powerActivity)
  {
    objc_msgSend(v21, "setPowerActivity:");
    v4 = v21;
  }
  if (self->_impedingFunctions)
  {
    objc_msgSend(v21, "setImpedingFunctions:");
    v4 = v21;
  }
  if (self->_aggregateMetrics)
  {
    objc_msgSend(v21, "setAggregateMetrics:");
    v4 = v21;
  }
  if (self->_btCoex)
  {
    objc_msgSend(v21, "setBtCoex:");
    v4 = v21;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    v4[13] = self->_channelsVisited0;
    *((_WORD *)v4 + 76) |= 0x20u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    v4[14] = self->_channelsVisited1;
    *((_WORD *)v4 + 76) |= 0x40u;
  }
  if (self->_phyrate)
  {
    objc_msgSend(v21, "setPhyrate:");
    v4 = v21;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    v4[11] = self->_channel;
    *((_WORD *)v4 + 76) |= 8u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_23:
      if ((v7 & 4) == 0)
        goto LABEL_24;
      goto LABEL_48;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  v4[12] = self->_channelBandwidth;
  *((_WORD *)v4 + 76) |= 0x10u;
  v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_24:
    if ((v7 & 1) == 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_48:
  v4[10] = self->_ccCaptureDriverLogs;
  *((_WORD *)v4 + 76) |= 4u;
  v7 = (__int16)self->_has;
  if ((v7 & 1) == 0)
  {
LABEL_25:
    if ((v7 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)v4 + 1) = self->_commandsIssued;
  *((_WORD *)v4 + 76) |= 1u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x80) == 0)
  {
LABEL_26:
    if ((v7 & 0x200) == 0)
      goto LABEL_27;
LABEL_51:
    v4[20] = self->_iorSuccess;
    *((_WORD *)v4 + 76) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_50:
  v4[15] = self->_commanderHalted;
  *((_WORD *)v4 + 76) |= 0x80u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
    goto LABEL_51;
LABEL_27:
  if ((v7 & 0x400) != 0)
  {
LABEL_28:
    v4[21] = self->_iorWA;
    *((_WORD *)v4 + 76) |= 0x400u;
  }
LABEL_29:
  if (-[WiFiAnalyticsAWDWiFiNWActivityControllerStats txmpduWMEsCount](self, "txmpduWMEsCount"))
  {
    objc_msgSend(v21, "clearTxmpduWMEs");
    v8 = -[WiFiAnalyticsAWDWiFiNWActivityControllerStats txmpduWMEsCount](self, "txmpduWMEsCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityControllerStats txmpduWMEAtIndex:](self, "txmpduWMEAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addTxmpduWME:", v11);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityControllerStats rxmpduWMEsCount](self, "rxmpduWMEsCount"))
  {
    objc_msgSend(v21, "clearRxmpduWMEs");
    v12 = -[WiFiAnalyticsAWDWiFiNWActivityControllerStats rxmpduWMEsCount](self, "rxmpduWMEsCount");
    if (v12)
    {
      v13 = v12;
      for (j = 0; j != v13; ++j)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityControllerStats rxmpduWMEAtIndex:](self, "rxmpduWMEAtIndex:", j);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addRxmpduWME:", v15);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityControllerStats rxmdpuLostsCount](self, "rxmdpuLostsCount"))
  {
    objc_msgSend(v21, "clearRxmdpuLosts");
    v16 = -[WiFiAnalyticsAWDWiFiNWActivityControllerStats rxmdpuLostsCount](self, "rxmdpuLostsCount");
    if (v16)
    {
      v17 = v16;
      for (k = 0; k != v17; ++k)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityControllerStats rxmdpuLostAtIndex:](self, "rxmdpuLostAtIndex:", k);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addRxmdpuLost:", v19);

      }
    }
  }
  if (self->_omi)
    objc_msgSend(v21, "setOmi:");
  v20 = v21;
  if (self->_ruUsage)
  {
    objc_msgSend(v21, "setRuUsage:");
    v20 = v21;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __int16 v18;
  id v19;
  void *v20;
  __int16 v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_controllerResets;
    *(_WORD *)(v5 + 152) |= 0x100u;
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_backoffStuck;
    *(_WORD *)(v5 + 152) |= 2u;
  }
  v8 = -[WiFiAnalyticsAWDWiFiNWActivityScanActivity copyWithZone:](self->_scanActivity, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v8;

  v10 = -[WiFiAnalyticsAWDWiFiNWActivityPowerPStats copyWithZone:](self->_powerActivity, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v10;

  v12 = -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions copyWithZone:](self->_impedingFunctions, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v12;

  v14 = -[WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics copyWithZone:](self->_aggregateMetrics, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v14;

  v16 = -[WiFiAnalyticsAWDWiFiNWActivityBtCoex copyWithZone:](self->_btCoex, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v16;

  v18 = (__int16)self->_has;
  if ((v18 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_channelsVisited0;
    *(_WORD *)(v6 + 152) |= 0x20u;
    v18 = (__int16)self->_has;
  }
  if ((v18 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_channelsVisited1;
    *(_WORD *)(v6 + 152) |= 0x40u;
  }
  v19 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation copyWithZone:](self->_phyrate, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v19;

  v21 = (__int16)self->_has;
  if ((v21 & 8) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_channel;
    *(_WORD *)(v6 + 152) |= 8u;
    v21 = (__int16)self->_has;
    if ((v21 & 0x10) == 0)
    {
LABEL_11:
      if ((v21 & 4) == 0)
        goto LABEL_12;
      goto LABEL_41;
    }
  }
  else if ((v21 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 48) = self->_channelBandwidth;
  *(_WORD *)(v6 + 152) |= 0x10u;
  v21 = (__int16)self->_has;
  if ((v21 & 4) == 0)
  {
LABEL_12:
    if ((v21 & 1) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 40) = self->_ccCaptureDriverLogs;
  *(_WORD *)(v6 + 152) |= 4u;
  v21 = (__int16)self->_has;
  if ((v21 & 1) == 0)
  {
LABEL_13:
    if ((v21 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  *(_QWORD *)(v6 + 8) = self->_commandsIssued;
  *(_WORD *)(v6 + 152) |= 1u;
  v21 = (__int16)self->_has;
  if ((v21 & 0x80) == 0)
  {
LABEL_14:
    if ((v21 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v6 + 60) = self->_commanderHalted;
  *(_WORD *)(v6 + 152) |= 0x80u;
  v21 = (__int16)self->_has;
  if ((v21 & 0x200) == 0)
  {
LABEL_15:
    if ((v21 & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_44:
  *(_DWORD *)(v6 + 80) = self->_iorSuccess;
  *(_WORD *)(v6 + 152) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 84) = self->_iorWA;
    *(_WORD *)(v6 + 152) |= 0x400u;
  }
LABEL_17:
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v22 = self->_txmpduWMEs;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v54 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxmpduWME:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v24);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v28 = self->_rxmpduWMEs;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v50 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRxmpduWME:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v30);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v34 = self->_rxmdpuLosts;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v46 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v45);
        objc_msgSend((id)v6, "addRxmdpuLost:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v36);
  }

  v40 = -[WiFiAnalyticsAWDWiFiNWActivityOMI copyWithZone:](self->_omi, "copyWithZone:", a3);
  v41 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v40;

  v42 = -[WiFiAnalyticsAWDWiFiNWActivityRuUsage copyWithZone:](self->_ruUsage, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v42;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  WiFiAnalyticsAWDWiFiNWActivityScanActivity *scanActivity;
  WiFiAnalyticsAWDWiFiNWActivityPowerPStats *powerActivity;
  WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *impedingFunctions;
  WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics *aggregateMetrics;
  WiFiAnalyticsAWDWiFiNWActivityBtCoex *btCoex;
  __int16 v12;
  __int16 v13;
  WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *phyrate;
  NSMutableArray *txmpduWMEs;
  NSMutableArray *rxmpduWMEs;
  NSMutableArray *rxmdpuLosts;
  WiFiAnalyticsAWDWiFiNWActivityOMI *omi;
  WiFiAnalyticsAWDWiFiNWActivityRuUsage *ruUsage;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_80;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 76);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 76) & 0x100) == 0 || self->_controllerResets != *((_DWORD *)v4 + 16))
      goto LABEL_80;
  }
  else if ((*((_WORD *)v4 + 76) & 0x100) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_backoffStuck != *((_DWORD *)v4 + 6))
      goto LABEL_80;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_80;
  }
  scanActivity = self->_scanActivity;
  if ((unint64_t)scanActivity | *((_QWORD *)v4 + 17)
    && !-[WiFiAnalyticsAWDWiFiNWActivityScanActivity isEqual:](scanActivity, "isEqual:"))
  {
    goto LABEL_80;
  }
  powerActivity = self->_powerActivity;
  if ((unint64_t)powerActivity | *((_QWORD *)v4 + 13))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityPowerPStats isEqual:](powerActivity, "isEqual:"))
      goto LABEL_80;
  }
  impedingFunctions = self->_impedingFunctions;
  if ((unint64_t)impedingFunctions | *((_QWORD *)v4 + 9))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions isEqual:](impedingFunctions, "isEqual:"))
      goto LABEL_80;
  }
  aggregateMetrics = self->_aggregateMetrics;
  if ((unint64_t)aggregateMetrics | *((_QWORD *)v4 + 2))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics isEqual:](aggregateMetrics, "isEqual:"))
      goto LABEL_80;
  }
  btCoex = self->_btCoex;
  if ((unint64_t)btCoex | *((_QWORD *)v4 + 4))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityBtCoex isEqual:](btCoex, "isEqual:"))
      goto LABEL_80;
  }
  v12 = (__int16)self->_has;
  v13 = *((_WORD *)v4 + 76);
  if ((v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_channelsVisited0 != *((_DWORD *)v4 + 13))
      goto LABEL_80;
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_channelsVisited1 != *((_DWORD *)v4 + 14))
      goto LABEL_80;
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  phyrate = self->_phyrate;
  if ((unint64_t)phyrate | *((_QWORD *)v4 + 12))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation isEqual:](phyrate, "isEqual:"))
    {
LABEL_80:
      v20 = 0;
      goto LABEL_81;
    }
    v12 = (__int16)self->_has;
    v13 = *((_WORD *)v4 + 76);
  }
  if ((v12 & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_channel != *((_DWORD *)v4 + 11))
      goto LABEL_80;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_channelBandwidth != *((_DWORD *)v4 + 12))
      goto LABEL_80;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_ccCaptureDriverLogs != *((_DWORD *)v4 + 10))
      goto LABEL_80;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_commandsIssued != *((_QWORD *)v4 + 1))
      goto LABEL_80;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_commanderHalted != *((_DWORD *)v4 + 15))
      goto LABEL_80;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_iorSuccess != *((_DWORD *)v4 + 20))
      goto LABEL_80;
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_iorWA != *((_DWORD *)v4 + 21))
      goto LABEL_80;
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_80;
  }
  txmpduWMEs = self->_txmpduWMEs;
  if ((unint64_t)txmpduWMEs | *((_QWORD *)v4 + 18)
    && !-[NSMutableArray isEqual:](txmpduWMEs, "isEqual:"))
  {
    goto LABEL_80;
  }
  rxmpduWMEs = self->_rxmpduWMEs;
  if ((unint64_t)rxmpduWMEs | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](rxmpduWMEs, "isEqual:"))
      goto LABEL_80;
  }
  rxmdpuLosts = self->_rxmdpuLosts;
  if ((unint64_t)rxmdpuLosts | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](rxmdpuLosts, "isEqual:"))
      goto LABEL_80;
  }
  omi = self->_omi;
  if ((unint64_t)omi | *((_QWORD *)v4 + 11))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityOMI isEqual:](omi, "isEqual:"))
      goto LABEL_80;
  }
  ruUsage = self->_ruUsage;
  if ((unint64_t)ruUsage | *((_QWORD *)v4 + 14))
    v20 = -[WiFiAnalyticsAWDWiFiNWActivityRuUsage isEqual:](ruUsage, "isEqual:");
  else
    v20 = 1;
LABEL_81:

  return v20;
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
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  uint64_t v29;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v29 = 2654435761 * self->_controllerResets;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v29 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = -[WiFiAnalyticsAWDWiFiNWActivityScanActivity hash](self->_scanActivity, "hash", 2654435761 * self->_backoffStuck);
      goto LABEL_6;
    }
  }
  v4 = -[WiFiAnalyticsAWDWiFiNWActivityScanActivity hash](self->_scanActivity, "hash", 0);
LABEL_6:
  v5 = v4;
  v6 = -[WiFiAnalyticsAWDWiFiNWActivityPowerPStats hash](self->_powerActivity, "hash");
  v7 = -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions hash](self->_impedingFunctions, "hash");
  v8 = -[WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics hash](self->_aggregateMetrics, "hash");
  v9 = -[WiFiAnalyticsAWDWiFiNWActivityBtCoex hash](self->_btCoex, "hash");
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
  v13 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation hash](self->_phyrate, "hash");
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
  v22 = v28 ^ v29 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16;
  v23 = v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ -[NSMutableArray hash](self->_txmpduWMEs, "hash");
  v24 = v23 ^ -[NSMutableArray hash](self->_rxmpduWMEs, "hash");
  v25 = v24 ^ -[NSMutableArray hash](self->_rxmdpuLosts, "hash");
  v26 = v22 ^ v25 ^ -[WiFiAnalyticsAWDWiFiNWActivityOMI hash](self->_omi, "hash");
  return v26 ^ -[WiFiAnalyticsAWDWiFiNWActivityRuUsage hash](self->_ruUsage, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;
  __int16 v6;
  WiFiAnalyticsAWDWiFiNWActivityScanActivity *scanActivity;
  uint64_t v8;
  WiFiAnalyticsAWDWiFiNWActivityPowerPStats *powerActivity;
  uint64_t v10;
  WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *impedingFunctions;
  uint64_t v12;
  WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics *aggregateMetrics;
  uint64_t v14;
  WiFiAnalyticsAWDWiFiNWActivityBtCoex *btCoex;
  uint64_t v16;
  __int16 v17;
  WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *phyrate;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  WiFiAnalyticsAWDWiFiNWActivityOMI *omi;
  uint64_t v37;
  WiFiAnalyticsAWDWiFiNWActivityRuUsage *ruUsage;
  uint64_t v39;
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
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int *)a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 76);
  if ((v6 & 0x100) != 0)
  {
    self->_controllerResets = v4[16];
    *(_WORD *)&self->_has |= 0x100u;
    v6 = *((_WORD *)v4 + 76);
  }
  if ((v6 & 2) != 0)
  {
    self->_backoffStuck = v4[6];
    *(_WORD *)&self->_has |= 2u;
  }
  scanActivity = self->_scanActivity;
  v8 = *((_QWORD *)v5 + 17);
  if (scanActivity)
  {
    if (v8)
      -[WiFiAnalyticsAWDWiFiNWActivityScanActivity mergeFrom:](scanActivity, "mergeFrom:");
  }
  else if (v8)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setScanActivity:](self, "setScanActivity:");
  }
  powerActivity = self->_powerActivity;
  v10 = *((_QWORD *)v5 + 13);
  if (powerActivity)
  {
    if (v10)
      -[WiFiAnalyticsAWDWiFiNWActivityPowerPStats mergeFrom:](powerActivity, "mergeFrom:");
  }
  else if (v10)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setPowerActivity:](self, "setPowerActivity:");
  }
  impedingFunctions = self->_impedingFunctions;
  v12 = *((_QWORD *)v5 + 9);
  if (impedingFunctions)
  {
    if (v12)
      -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions mergeFrom:](impedingFunctions, "mergeFrom:");
  }
  else if (v12)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setImpedingFunctions:](self, "setImpedingFunctions:");
  }
  aggregateMetrics = self->_aggregateMetrics;
  v14 = *((_QWORD *)v5 + 2);
  if (aggregateMetrics)
  {
    if (v14)
      -[WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics mergeFrom:](aggregateMetrics, "mergeFrom:");
  }
  else if (v14)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setAggregateMetrics:](self, "setAggregateMetrics:");
  }
  btCoex = self->_btCoex;
  v16 = *((_QWORD *)v5 + 4);
  if (btCoex)
  {
    if (v16)
      -[WiFiAnalyticsAWDWiFiNWActivityBtCoex mergeFrom:](btCoex, "mergeFrom:");
  }
  else if (v16)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setBtCoex:](self, "setBtCoex:");
  }
  v17 = *((_WORD *)v5 + 76);
  if ((v17 & 0x20) != 0)
  {
    self->_channelsVisited0 = v5[13];
    *(_WORD *)&self->_has |= 0x20u;
    v17 = *((_WORD *)v5 + 76);
  }
  if ((v17 & 0x40) != 0)
  {
    self->_channelsVisited1 = v5[14];
    *(_WORD *)&self->_has |= 0x40u;
  }
  phyrate = self->_phyrate;
  v19 = *((_QWORD *)v5 + 12);
  if (phyrate)
  {
    if (v19)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation mergeFrom:](phyrate, "mergeFrom:");
  }
  else if (v19)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setPhyrate:](self, "setPhyrate:");
  }
  v20 = *((_WORD *)v5 + 76);
  if ((v20 & 8) != 0)
  {
    self->_channel = v5[11];
    *(_WORD *)&self->_has |= 8u;
    v20 = *((_WORD *)v5 + 76);
    if ((v20 & 0x10) == 0)
    {
LABEL_41:
      if ((v20 & 4) == 0)
        goto LABEL_42;
      goto LABEL_73;
    }
  }
  else if ((v20 & 0x10) == 0)
  {
    goto LABEL_41;
  }
  self->_channelBandwidth = v5[12];
  *(_WORD *)&self->_has |= 0x10u;
  v20 = *((_WORD *)v5 + 76);
  if ((v20 & 4) == 0)
  {
LABEL_42:
    if ((v20 & 1) == 0)
      goto LABEL_43;
    goto LABEL_74;
  }
LABEL_73:
  self->_ccCaptureDriverLogs = v5[10];
  *(_WORD *)&self->_has |= 4u;
  v20 = *((_WORD *)v5 + 76);
  if ((v20 & 1) == 0)
  {
LABEL_43:
    if ((v20 & 0x80) == 0)
      goto LABEL_44;
    goto LABEL_75;
  }
LABEL_74:
  self->_commandsIssued = *((_QWORD *)v5 + 1);
  *(_WORD *)&self->_has |= 1u;
  v20 = *((_WORD *)v5 + 76);
  if ((v20 & 0x80) == 0)
  {
LABEL_44:
    if ((v20 & 0x200) == 0)
      goto LABEL_45;
    goto LABEL_76;
  }
LABEL_75:
  self->_commanderHalted = v5[15];
  *(_WORD *)&self->_has |= 0x80u;
  v20 = *((_WORD *)v5 + 76);
  if ((v20 & 0x200) == 0)
  {
LABEL_45:
    if ((v20 & 0x400) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
LABEL_76:
  self->_iorSuccess = v5[20];
  *(_WORD *)&self->_has |= 0x200u;
  if ((v5[38] & 0x400) != 0)
  {
LABEL_46:
    self->_iorWA = v5[21];
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_47:
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v21 = *((id *)v5 + 18);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(v21);
        -[WiFiAnalyticsAWDWiFiNWActivityControllerStats addTxmpduWME:](self, "addTxmpduWME:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v23);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v26 = *((id *)v5 + 16);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(v26);
        -[WiFiAnalyticsAWDWiFiNWActivityControllerStats addRxmpduWME:](self, "addRxmpduWME:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v28);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v31 = *((id *)v5 + 15);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v31);
        -[WiFiAnalyticsAWDWiFiNWActivityControllerStats addRxmdpuLost:](self, "addRxmdpuLost:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k), (_QWORD)v40);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v33);
  }

  omi = self->_omi;
  v37 = *((_QWORD *)v5 + 11);
  if (omi)
  {
    if (v37)
      -[WiFiAnalyticsAWDWiFiNWActivityOMI mergeFrom:](omi, "mergeFrom:");
  }
  else if (v37)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setOmi:](self, "setOmi:");
  }
  ruUsage = self->_ruUsage;
  v39 = *((_QWORD *)v5 + 14);
  if (ruUsage)
  {
    if (v39)
      -[WiFiAnalyticsAWDWiFiNWActivityRuUsage mergeFrom:](ruUsage, "mergeFrom:");
  }
  else if (v39)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setRuUsage:](self, "setRuUsage:");
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

- (WiFiAnalyticsAWDWiFiNWActivityScanActivity)scanActivity
{
  return self->_scanActivity;
}

- (void)setScanActivity:(id)a3
{
  objc_storeStrong((id *)&self->_scanActivity, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityPowerPStats)powerActivity
{
  return self->_powerActivity;
}

- (void)setPowerActivity:(id)a3
{
  objc_storeStrong((id *)&self->_powerActivity, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions)impedingFunctions
{
  return self->_impedingFunctions;
}

- (void)setImpedingFunctions:(id)a3
{
  objc_storeStrong((id *)&self->_impedingFunctions, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics)aggregateMetrics
{
  return self->_aggregateMetrics;
}

- (void)setAggregateMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateMetrics, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityBtCoex)btCoex
{
  return self->_btCoex;
}

- (void)setBtCoex:(id)a3
{
  objc_storeStrong((id *)&self->_btCoex, a3);
}

- (unsigned)channelsVisited0
{
  return self->_channelsVisited0;
}

- (unsigned)channelsVisited1
{
  return self->_channelsVisited1;
}

- (WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation)phyrate
{
  return self->_phyrate;
}

- (void)setPhyrate:(id)a3
{
  objc_storeStrong((id *)&self->_phyrate, a3);
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
  objc_storeStrong((id *)&self->_txmpduWMEs, a3);
}

- (NSMutableArray)rxmpduWMEs
{
  return self->_rxmpduWMEs;
}

- (void)setRxmpduWMEs:(id)a3
{
  objc_storeStrong((id *)&self->_rxmpduWMEs, a3);
}

- (NSMutableArray)rxmdpuLosts
{
  return self->_rxmdpuLosts;
}

- (void)setRxmdpuLosts:(id)a3
{
  objc_storeStrong((id *)&self->_rxmdpuLosts, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityOMI)omi
{
  return self->_omi;
}

- (void)setOmi:(id)a3
{
  objc_storeStrong((id *)&self->_omi, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityRuUsage)ruUsage
{
  return self->_ruUsage;
}

- (void)setRuUsage:(id)a3
{
  objc_storeStrong((id *)&self->_ruUsage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txmpduWMEs, 0);
  objc_storeStrong((id *)&self->_scanActivity, 0);
  objc_storeStrong((id *)&self->_rxmpduWMEs, 0);
  objc_storeStrong((id *)&self->_rxmdpuLosts, 0);
  objc_storeStrong((id *)&self->_ruUsage, 0);
  objc_storeStrong((id *)&self->_powerActivity, 0);
  objc_storeStrong((id *)&self->_phyrate, 0);
  objc_storeStrong((id *)&self->_omi, 0);
  objc_storeStrong((id *)&self->_impedingFunctions, 0);
  objc_storeStrong((id *)&self->_btCoex, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics, 0);
}

@end
