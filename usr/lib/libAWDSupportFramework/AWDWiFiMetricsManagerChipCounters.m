@implementation AWDWiFiMetricsManagerChipCounters

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerChipCounters setFrameCounters:](self, "setFrameCounters:", 0);
  -[AWDWiFiMetricsManagerChipCounters setTxGeneralStats:](self, "setTxGeneralStats:", 0);
  -[AWDWiFiMetricsManagerChipCounters setTxErrorStats:](self, "setTxErrorStats:", 0);
  -[AWDWiFiMetricsManagerChipCounters setRxGeneralStats:](self, "setRxGeneralStats:", 0);
  -[AWDWiFiMetricsManagerChipCounters setRxMACErrorStats:](self, "setRxMACErrorStats:", 0);
  -[AWDWiFiMetricsManagerChipCounters setRxMACCounterStats:](self, "setRxMACCounterStats:", 0);
  -[AWDWiFiMetricsManagerChipCounters setRxPhyErrors:](self, "setRxPhyErrors:", 0);
  -[AWDWiFiMetricsManagerChipCounters setUcastWPA2Counters:](self, "setUcastWPA2Counters:", 0);
  -[AWDWiFiMetricsManagerChipCounters setMcastWPA2Counters:](self, "setMcastWPA2Counters:", 0);
  -[AWDWiFiMetricsManagerChipCounters setFrameCounterPerInterfaces:](self, "setFrameCounterPerInterfaces:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerChipCounters;
  -[AWDWiFiMetricsManagerChipCounters dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFrameCounters
{
  return self->_frameCounters != 0;
}

- (BOOL)hasTxGeneralStats
{
  return self->_txGeneralStats != 0;
}

- (BOOL)hasTxErrorStats
{
  return self->_txErrorStats != 0;
}

- (BOOL)hasRxGeneralStats
{
  return self->_rxGeneralStats != 0;
}

- (BOOL)hasRxMACErrorStats
{
  return self->_rxMACErrorStats != 0;
}

- (BOOL)hasRxMACCounterStats
{
  return self->_rxMACCounterStats != 0;
}

- (BOOL)hasRxPhyErrors
{
  return self->_rxPhyErrors != 0;
}

- (BOOL)hasUcastWPA2Counters
{
  return self->_ucastWPA2Counters != 0;
}

- (BOOL)hasMcastWPA2Counters
{
  return self->_mcastWPA2Counters != 0;
}

- (void)clearFrameCounterPerInterfaces
{
  -[NSMutableArray removeAllObjects](self->_frameCounterPerInterfaces, "removeAllObjects");
}

- (void)addFrameCounterPerInterface:(id)a3
{
  NSMutableArray *frameCounterPerInterfaces;

  frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
  if (!frameCounterPerInterfaces)
  {
    frameCounterPerInterfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_frameCounterPerInterfaces = frameCounterPerInterfaces;
  }
  -[NSMutableArray addObject:](frameCounterPerInterfaces, "addObject:", a3);
}

- (unint64_t)frameCounterPerInterfacesCount
{
  return -[NSMutableArray count](self->_frameCounterPerInterfaces, "count");
}

- (id)frameCounterPerInterfaceAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_frameCounterPerInterfaces, "objectAtIndex:", a3);
}

+ (Class)frameCounterPerInterfaceType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerChipCounters;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerChipCounters description](&v3, sel_description), -[AWDWiFiMetricsManagerChipCounters dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDWiFiMetricsManagerFrameCounterStats *frameCounters;
  AWDChipCountersTx *txGeneralStats;
  AWDChipErrorCountersTx *txErrorStats;
  AWDChipCountersRx *rxGeneralStats;
  AWDMacCountersRxErrors *rxMACErrorStats;
  AWDMacCountersRx *rxMACCounterStats;
  AWDRxPhyErrors *rxPhyErrors;
  AWDWPA2Counters *ucastWPA2Counters;
  AWDWPA2Counters *mcastWPA2Counters;
  void *v13;
  NSMutableArray *frameCounterPerInterfaces;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  frameCounters = self->_frameCounters;
  if (frameCounters)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerFrameCounterStats dictionaryRepresentation](frameCounters, "dictionaryRepresentation"), CFSTR("frameCounters"));
  txGeneralStats = self->_txGeneralStats;
  if (txGeneralStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDChipCountersTx dictionaryRepresentation](txGeneralStats, "dictionaryRepresentation"), CFSTR("txGeneralStats"));
  txErrorStats = self->_txErrorStats;
  if (txErrorStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDChipErrorCountersTx dictionaryRepresentation](txErrorStats, "dictionaryRepresentation"), CFSTR("txErrorStats"));
  rxGeneralStats = self->_rxGeneralStats;
  if (rxGeneralStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDChipCountersRx dictionaryRepresentation](rxGeneralStats, "dictionaryRepresentation"), CFSTR("rxGeneralStats"));
  rxMACErrorStats = self->_rxMACErrorStats;
  if (rxMACErrorStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDMacCountersRxErrors dictionaryRepresentation](rxMACErrorStats, "dictionaryRepresentation"), CFSTR("rxMACErrorStats"));
  rxMACCounterStats = self->_rxMACCounterStats;
  if (rxMACCounterStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDMacCountersRx dictionaryRepresentation](rxMACCounterStats, "dictionaryRepresentation"), CFSTR("rxMACCounterStats"));
  rxPhyErrors = self->_rxPhyErrors;
  if (rxPhyErrors)
    objc_msgSend(v3, "setObject:forKey:", -[AWDRxPhyErrors dictionaryRepresentation](rxPhyErrors, "dictionaryRepresentation"), CFSTR("rxPhyErrors"));
  ucastWPA2Counters = self->_ucastWPA2Counters;
  if (ucastWPA2Counters)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWPA2Counters dictionaryRepresentation](ucastWPA2Counters, "dictionaryRepresentation"), CFSTR("ucastWPA2Counters"));
  mcastWPA2Counters = self->_mcastWPA2Counters;
  if (mcastWPA2Counters)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWPA2Counters dictionaryRepresentation](mcastWPA2Counters, "dictionaryRepresentation"), CFSTR("mcastWPA2Counters"));
  if (-[NSMutableArray count](self->_frameCounterPerInterfaces, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_frameCounterPerInterfaces, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](frameCounterPerInterfaces, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(frameCounterPerInterfaces);
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](frameCounterPerInterfaces, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("frameCounterPerInterface"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerChipCountersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *frameCounterPerInterfaces;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_frameCounters)
    PBDataWriterWriteSubmessage();
  if (self->_txGeneralStats)
    PBDataWriterWriteSubmessage();
  if (self->_txErrorStats)
    PBDataWriterWriteSubmessage();
  if (self->_rxGeneralStats)
    PBDataWriterWriteSubmessage();
  if (self->_rxMACErrorStats)
    PBDataWriterWriteSubmessage();
  if (self->_rxMACCounterStats)
    PBDataWriterWriteSubmessage();
  if (self->_rxPhyErrors)
    PBDataWriterWriteSubmessage();
  if (self->_ucastWPA2Counters)
    PBDataWriterWriteSubmessage();
  if (self->_mcastWPA2Counters)
    PBDataWriterWriteSubmessage();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](frameCounterPerInterfaces, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(frameCounterPerInterfaces);
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](frameCounterPerInterfaces, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 96) |= 1u;
  }
  if (self->_frameCounters)
    objc_msgSend(a3, "setFrameCounters:");
  if (self->_txGeneralStats)
    objc_msgSend(a3, "setTxGeneralStats:");
  if (self->_txErrorStats)
    objc_msgSend(a3, "setTxErrorStats:");
  if (self->_rxGeneralStats)
    objc_msgSend(a3, "setRxGeneralStats:");
  if (self->_rxMACErrorStats)
    objc_msgSend(a3, "setRxMACErrorStats:");
  if (self->_rxMACCounterStats)
    objc_msgSend(a3, "setRxMACCounterStats:");
  if (self->_rxPhyErrors)
    objc_msgSend(a3, "setRxPhyErrors:");
  if (self->_ucastWPA2Counters)
    objc_msgSend(a3, "setUcastWPA2Counters:");
  if (self->_mcastWPA2Counters)
    objc_msgSend(a3, "setMcastWPA2Counters:");
  if (-[AWDWiFiMetricsManagerChipCounters frameCounterPerInterfacesCount](self, "frameCounterPerInterfacesCount"))
  {
    objc_msgSend(a3, "clearFrameCounterPerInterfaces");
    v5 = -[AWDWiFiMetricsManagerChipCounters frameCounterPerInterfacesCount](self, "frameCounterPerInterfacesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addFrameCounterPerInterface:", -[AWDWiFiMetricsManagerChipCounters frameCounterPerInterfaceAtIndex:](self, "frameCounterPerInterfaceAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *frameCounterPerInterfaces;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 96) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[AWDWiFiMetricsManagerFrameCounterStats copyWithZone:](self->_frameCounters, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 80) = -[AWDChipCountersTx copyWithZone:](self->_txGeneralStats, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 72) = -[AWDChipErrorCountersTx copyWithZone:](self->_txErrorStats, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 40) = -[AWDChipCountersRx copyWithZone:](self->_rxGeneralStats, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 56) = -[AWDMacCountersRxErrors copyWithZone:](self->_rxMACErrorStats, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[AWDMacCountersRx copyWithZone:](self->_rxMACCounterStats, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 64) = -[AWDRxPhyErrors copyWithZone:](self->_rxPhyErrors, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 88) = -[AWDWPA2Counters copyWithZone:](self->_ucastWPA2Counters, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 32) = -[AWDWPA2Counters copyWithZone:](self->_mcastWPA2Counters, "copyWithZone:", a3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](frameCounterPerInterfaces, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(frameCounterPerInterfaces);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFrameCounterPerInterface:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](frameCounterPerInterfaces, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDWiFiMetricsManagerFrameCounterStats *frameCounters;
  AWDChipCountersTx *txGeneralStats;
  AWDChipErrorCountersTx *txErrorStats;
  AWDChipCountersRx *rxGeneralStats;
  AWDMacCountersRxErrors *rxMACErrorStats;
  AWDMacCountersRx *rxMACCounterStats;
  AWDRxPhyErrors *rxPhyErrors;
  AWDWPA2Counters *ucastWPA2Counters;
  AWDWPA2Counters *mcastWPA2Counters;
  NSMutableArray *frameCounterPerInterfaces;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 96) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 96) & 1) != 0)
    {
LABEL_27:
      LOBYTE(v5) = 0;
      return v5;
    }
    frameCounters = self->_frameCounters;
    if (!((unint64_t)frameCounters | *((_QWORD *)a3 + 3))
      || (v5 = -[AWDWiFiMetricsManagerFrameCounterStats isEqual:](frameCounters, "isEqual:")) != 0)
    {
      txGeneralStats = self->_txGeneralStats;
      if (!((unint64_t)txGeneralStats | *((_QWORD *)a3 + 10))
        || (v5 = -[AWDChipCountersTx isEqual:](txGeneralStats, "isEqual:")) != 0)
      {
        txErrorStats = self->_txErrorStats;
        if (!((unint64_t)txErrorStats | *((_QWORD *)a3 + 9))
          || (v5 = -[AWDChipErrorCountersTx isEqual:](txErrorStats, "isEqual:")) != 0)
        {
          rxGeneralStats = self->_rxGeneralStats;
          if (!((unint64_t)rxGeneralStats | *((_QWORD *)a3 + 5))
            || (v5 = -[AWDChipCountersRx isEqual:](rxGeneralStats, "isEqual:")) != 0)
          {
            rxMACErrorStats = self->_rxMACErrorStats;
            if (!((unint64_t)rxMACErrorStats | *((_QWORD *)a3 + 7))
              || (v5 = -[AWDMacCountersRxErrors isEqual:](rxMACErrorStats, "isEqual:")) != 0)
            {
              rxMACCounterStats = self->_rxMACCounterStats;
              if (!((unint64_t)rxMACCounterStats | *((_QWORD *)a3 + 6))
                || (v5 = -[AWDMacCountersRx isEqual:](rxMACCounterStats, "isEqual:")) != 0)
              {
                rxPhyErrors = self->_rxPhyErrors;
                if (!((unint64_t)rxPhyErrors | *((_QWORD *)a3 + 8))
                  || (v5 = -[AWDRxPhyErrors isEqual:](rxPhyErrors, "isEqual:")) != 0)
                {
                  ucastWPA2Counters = self->_ucastWPA2Counters;
                  if (!((unint64_t)ucastWPA2Counters | *((_QWORD *)a3 + 11))
                    || (v5 = -[AWDWPA2Counters isEqual:](ucastWPA2Counters, "isEqual:")) != 0)
                  {
                    mcastWPA2Counters = self->_mcastWPA2Counters;
                    if (!((unint64_t)mcastWPA2Counters | *((_QWORD *)a3 + 4))
                      || (v5 = -[AWDWPA2Counters isEqual:](mcastWPA2Counters, "isEqual:")) != 0)
                    {
                      frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
                      if ((unint64_t)frameCounterPerInterfaces | *((_QWORD *)a3 + 2))
                        LOBYTE(v5) = -[NSMutableArray isEqual:](frameCounterPerInterfaces, "isEqual:");
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
  return v5;
}

- (unint64_t)hash
{
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDWiFiMetricsManagerFrameCounterStats hash](self->_frameCounters, "hash") ^ v3;
  v5 = -[AWDChipCountersTx hash](self->_txGeneralStats, "hash");
  v6 = v4 ^ v5 ^ -[AWDChipErrorCountersTx hash](self->_txErrorStats, "hash");
  v7 = -[AWDChipCountersRx hash](self->_rxGeneralStats, "hash");
  v8 = v7 ^ -[AWDMacCountersRxErrors hash](self->_rxMACErrorStats, "hash");
  v9 = v6 ^ v8 ^ -[AWDMacCountersRx hash](self->_rxMACCounterStats, "hash");
  v10 = -[AWDRxPhyErrors hash](self->_rxPhyErrors, "hash");
  v11 = v10 ^ -[AWDWPA2Counters hash](self->_ucastWPA2Counters, "hash");
  v12 = v11 ^ -[AWDWPA2Counters hash](self->_mcastWPA2Counters, "hash");
  return v9 ^ v12 ^ -[NSMutableArray hash](self->_frameCounterPerInterfaces, "hash");
}

- (void)mergeFrom:(id)a3
{
  AWDWiFiMetricsManagerFrameCounterStats *frameCounters;
  uint64_t v6;
  AWDChipCountersTx *txGeneralStats;
  uint64_t v8;
  AWDChipErrorCountersTx *txErrorStats;
  uint64_t v10;
  AWDChipCountersRx *rxGeneralStats;
  uint64_t v12;
  AWDMacCountersRxErrors *rxMACErrorStats;
  uint64_t v14;
  AWDMacCountersRx *rxMACCounterStats;
  uint64_t v16;
  AWDRxPhyErrors *rxPhyErrors;
  uint64_t v18;
  AWDWPA2Counters *ucastWPA2Counters;
  uint64_t v20;
  AWDWPA2Counters *mcastWPA2Counters;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 96) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  frameCounters = self->_frameCounters;
  v6 = *((_QWORD *)a3 + 3);
  if (frameCounters)
  {
    if (v6)
      -[AWDWiFiMetricsManagerFrameCounterStats mergeFrom:](frameCounters, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDWiFiMetricsManagerChipCounters setFrameCounters:](self, "setFrameCounters:");
  }
  txGeneralStats = self->_txGeneralStats;
  v8 = *((_QWORD *)a3 + 10);
  if (txGeneralStats)
  {
    if (v8)
      -[AWDChipCountersTx mergeFrom:](txGeneralStats, "mergeFrom:");
  }
  else if (v8)
  {
    -[AWDWiFiMetricsManagerChipCounters setTxGeneralStats:](self, "setTxGeneralStats:");
  }
  txErrorStats = self->_txErrorStats;
  v10 = *((_QWORD *)a3 + 9);
  if (txErrorStats)
  {
    if (v10)
      -[AWDChipErrorCountersTx mergeFrom:](txErrorStats, "mergeFrom:");
  }
  else if (v10)
  {
    -[AWDWiFiMetricsManagerChipCounters setTxErrorStats:](self, "setTxErrorStats:");
  }
  rxGeneralStats = self->_rxGeneralStats;
  v12 = *((_QWORD *)a3 + 5);
  if (rxGeneralStats)
  {
    if (v12)
      -[AWDChipCountersRx mergeFrom:](rxGeneralStats, "mergeFrom:");
  }
  else if (v12)
  {
    -[AWDWiFiMetricsManagerChipCounters setRxGeneralStats:](self, "setRxGeneralStats:");
  }
  rxMACErrorStats = self->_rxMACErrorStats;
  v14 = *((_QWORD *)a3 + 7);
  if (rxMACErrorStats)
  {
    if (v14)
      -[AWDMacCountersRxErrors mergeFrom:](rxMACErrorStats, "mergeFrom:");
  }
  else if (v14)
  {
    -[AWDWiFiMetricsManagerChipCounters setRxMACErrorStats:](self, "setRxMACErrorStats:");
  }
  rxMACCounterStats = self->_rxMACCounterStats;
  v16 = *((_QWORD *)a3 + 6);
  if (rxMACCounterStats)
  {
    if (v16)
      -[AWDMacCountersRx mergeFrom:](rxMACCounterStats, "mergeFrom:");
  }
  else if (v16)
  {
    -[AWDWiFiMetricsManagerChipCounters setRxMACCounterStats:](self, "setRxMACCounterStats:");
  }
  rxPhyErrors = self->_rxPhyErrors;
  v18 = *((_QWORD *)a3 + 8);
  if (rxPhyErrors)
  {
    if (v18)
      -[AWDRxPhyErrors mergeFrom:](rxPhyErrors, "mergeFrom:");
  }
  else if (v18)
  {
    -[AWDWiFiMetricsManagerChipCounters setRxPhyErrors:](self, "setRxPhyErrors:");
  }
  ucastWPA2Counters = self->_ucastWPA2Counters;
  v20 = *((_QWORD *)a3 + 11);
  if (ucastWPA2Counters)
  {
    if (v20)
      -[AWDWPA2Counters mergeFrom:](ucastWPA2Counters, "mergeFrom:");
  }
  else if (v20)
  {
    -[AWDWiFiMetricsManagerChipCounters setUcastWPA2Counters:](self, "setUcastWPA2Counters:");
  }
  mcastWPA2Counters = self->_mcastWPA2Counters;
  v22 = *((_QWORD *)a3 + 4);
  if (mcastWPA2Counters)
  {
    if (v22)
      -[AWDWPA2Counters mergeFrom:](mcastWPA2Counters, "mergeFrom:");
  }
  else if (v22)
  {
    -[AWDWiFiMetricsManagerChipCounters setMcastWPA2Counters:](self, "setMcastWPA2Counters:");
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = (void *)*((_QWORD *)a3 + 2);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(v23);
        -[AWDWiFiMetricsManagerChipCounters addFrameCounterPerInterface:](self, "addFrameCounterPerInterface:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v25);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiMetricsManagerFrameCounterStats)frameCounters
{
  return self->_frameCounters;
}

- (void)setFrameCounters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (AWDChipCountersTx)txGeneralStats
{
  return self->_txGeneralStats;
}

- (void)setTxGeneralStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (AWDChipErrorCountersTx)txErrorStats
{
  return self->_txErrorStats;
}

- (void)setTxErrorStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (AWDChipCountersRx)rxGeneralStats
{
  return self->_rxGeneralStats;
}

- (void)setRxGeneralStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AWDMacCountersRxErrors)rxMACErrorStats
{
  return self->_rxMACErrorStats;
}

- (void)setRxMACErrorStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (AWDMacCountersRx)rxMACCounterStats
{
  return self->_rxMACCounterStats;
}

- (void)setRxMACCounterStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (AWDRxPhyErrors)rxPhyErrors
{
  return self->_rxPhyErrors;
}

- (void)setRxPhyErrors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (AWDWPA2Counters)ucastWPA2Counters
{
  return self->_ucastWPA2Counters;
}

- (void)setUcastWPA2Counters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (AWDWPA2Counters)mcastWPA2Counters
{
  return self->_mcastWPA2Counters;
}

- (void)setMcastWPA2Counters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)frameCounterPerInterfaces
{
  return self->_frameCounterPerInterfaces;
}

- (void)setFrameCounterPerInterfaces:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
