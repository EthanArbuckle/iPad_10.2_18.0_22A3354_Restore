@implementation AWDWiFiMetricsManagerOneStatsAssociationInfo

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerOneStatsAssociationInfo setChipCounters:](self, "setChipCounters:", 0);
  -[AWDWiFiMetricsManagerOneStatsAssociationInfo setBtCoexStats:](self, "setBtCoexStats:", 0);
  -[AWDWiFiMetricsManagerOneStatsAssociationInfo setBtCoexModeChange:](self, "setBtCoexModeChange:", 0);
  -[AWDWiFiMetricsManagerOneStatsAssociationInfo setChipCountersPerSlices:](self, "setChipCountersPerSlices:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerOneStatsAssociationInfo;
  -[AWDWiFiMetricsManagerOneStatsAssociationInfo dealloc](&v3, sel_dealloc);
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

- (BOOL)hasChipCounters
{
  return self->_chipCounters != 0;
}

- (BOOL)hasBtCoexStats
{
  return self->_btCoexStats != 0;
}

- (BOOL)hasBtCoexModeChange
{
  return self->_btCoexModeChange != 0;
}

- (void)clearChipCountersPerSlices
{
  -[NSMutableArray removeAllObjects](self->_chipCountersPerSlices, "removeAllObjects");
}

- (void)addChipCountersPerSlice:(id)a3
{
  NSMutableArray *chipCountersPerSlices;

  chipCountersPerSlices = self->_chipCountersPerSlices;
  if (!chipCountersPerSlices)
  {
    chipCountersPerSlices = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_chipCountersPerSlices = chipCountersPerSlices;
  }
  -[NSMutableArray addObject:](chipCountersPerSlices, "addObject:", a3);
}

- (unint64_t)chipCountersPerSlicesCount
{
  return -[NSMutableArray count](self->_chipCountersPerSlices, "count");
}

- (id)chipCountersPerSliceAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_chipCountersPerSlices, "objectAtIndex:", a3);
}

+ (Class)chipCountersPerSliceType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerOneStatsAssociationInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerOneStatsAssociationInfo description](&v3, sel_description), -[AWDWiFiMetricsManagerOneStatsAssociationInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDWiFiMetricsManagerChipCounters *chipCounters;
  AWDWiFiMetricsManagerBTCoexStats *btCoexStats;
  AWDWiFiMetricsManagerBTCoexModeChange *btCoexModeChange;
  void *v7;
  NSMutableArray *chipCountersPerSlices;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  chipCounters = self->_chipCounters;
  if (chipCounters)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerChipCounters dictionaryRepresentation](chipCounters, "dictionaryRepresentation"), CFSTR("chipCounters"));
  btCoexStats = self->_btCoexStats;
  if (btCoexStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerBTCoexStats dictionaryRepresentation](btCoexStats, "dictionaryRepresentation"), CFSTR("btCoexStats"));
  btCoexModeChange = self->_btCoexModeChange;
  if (btCoexModeChange)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerBTCoexModeChange dictionaryRepresentation](btCoexModeChange, "dictionaryRepresentation"), CFSTR("btCoexModeChange"));
  if (-[NSMutableArray count](self->_chipCountersPerSlices, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_chipCountersPerSlices, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    chipCountersPerSlices = self->_chipCountersPerSlices;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(chipCountersPerSlices);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("chipCountersPerSlice"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerOneStatsAssociationInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *chipCountersPerSlices;
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
  if (self->_chipCounters)
    PBDataWriterWriteSubmessage();
  if (self->_btCoexStats)
    PBDataWriterWriteSubmessage();
  if (self->_btCoexModeChange)
    PBDataWriterWriteSubmessage();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  chipCountersPerSlices = self->_chipCountersPerSlices;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_enumerationMutation(chipCountersPerSlices);
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
    *((_BYTE *)a3 + 48) |= 1u;
  }
  if (self->_chipCounters)
    objc_msgSend(a3, "setChipCounters:");
  if (self->_btCoexStats)
    objc_msgSend(a3, "setBtCoexStats:");
  if (self->_btCoexModeChange)
    objc_msgSend(a3, "setBtCoexModeChange:");
  if (-[AWDWiFiMetricsManagerOneStatsAssociationInfo chipCountersPerSlicesCount](self, "chipCountersPerSlicesCount"))
  {
    objc_msgSend(a3, "clearChipCountersPerSlices");
    v5 = -[AWDWiFiMetricsManagerOneStatsAssociationInfo chipCountersPerSlicesCount](self, "chipCountersPerSlicesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addChipCountersPerSlice:", -[AWDWiFiMetricsManagerOneStatsAssociationInfo chipCountersPerSliceAtIndex:](self, "chipCountersPerSliceAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *chipCountersPerSlices;
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
    *(_BYTE *)(v5 + 48) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[AWDWiFiMetricsManagerChipCounters copyWithZone:](self->_chipCounters, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[AWDWiFiMetricsManagerBTCoexStats copyWithZone:](self->_btCoexStats, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 16) = -[AWDWiFiMetricsManagerBTCoexModeChange copyWithZone:](self->_btCoexModeChange, "copyWithZone:", a3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  chipCountersPerSlices = self->_chipCountersPerSlices;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          objc_enumerationMutation(chipCountersPerSlices);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addChipCountersPerSlice:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDWiFiMetricsManagerChipCounters *chipCounters;
  AWDWiFiMetricsManagerBTCoexStats *btCoexStats;
  AWDWiFiMetricsManagerBTCoexModeChange *btCoexModeChange;
  NSMutableArray *chipCountersPerSlices;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_15;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    chipCounters = self->_chipCounters;
    if (!((unint64_t)chipCounters | *((_QWORD *)a3 + 4))
      || (v5 = -[AWDWiFiMetricsManagerChipCounters isEqual:](chipCounters, "isEqual:")) != 0)
    {
      btCoexStats = self->_btCoexStats;
      if (!((unint64_t)btCoexStats | *((_QWORD *)a3 + 3))
        || (v5 = -[AWDWiFiMetricsManagerBTCoexStats isEqual:](btCoexStats, "isEqual:")) != 0)
      {
        btCoexModeChange = self->_btCoexModeChange;
        if (!((unint64_t)btCoexModeChange | *((_QWORD *)a3 + 2))
          || (v5 = -[AWDWiFiMetricsManagerBTCoexModeChange isEqual:](btCoexModeChange, "isEqual:")) != 0)
        {
          chipCountersPerSlices = self->_chipCountersPerSlices;
          if ((unint64_t)chipCountersPerSlices | *((_QWORD *)a3 + 5))
            LOBYTE(v5) = -[NSMutableArray isEqual:](chipCountersPerSlices, "isEqual:");
          else
            LOBYTE(v5) = 1;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDWiFiMetricsManagerChipCounters hash](self->_chipCounters, "hash") ^ v3;
  v5 = -[AWDWiFiMetricsManagerBTCoexStats hash](self->_btCoexStats, "hash");
  v6 = v4 ^ v5 ^ -[AWDWiFiMetricsManagerBTCoexModeChange hash](self->_btCoexModeChange, "hash");
  return v6 ^ -[NSMutableArray hash](self->_chipCountersPerSlices, "hash");
}

- (void)mergeFrom:(id)a3
{
  AWDWiFiMetricsManagerChipCounters *chipCounters;
  uint64_t v6;
  AWDWiFiMetricsManagerBTCoexStats *btCoexStats;
  uint64_t v8;
  AWDWiFiMetricsManagerBTCoexModeChange *btCoexModeChange;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  chipCounters = self->_chipCounters;
  v6 = *((_QWORD *)a3 + 4);
  if (chipCounters)
  {
    if (v6)
      -[AWDWiFiMetricsManagerChipCounters mergeFrom:](chipCounters, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDWiFiMetricsManagerOneStatsAssociationInfo setChipCounters:](self, "setChipCounters:");
  }
  btCoexStats = self->_btCoexStats;
  v8 = *((_QWORD *)a3 + 3);
  if (btCoexStats)
  {
    if (v8)
      -[AWDWiFiMetricsManagerBTCoexStats mergeFrom:](btCoexStats, "mergeFrom:");
  }
  else if (v8)
  {
    -[AWDWiFiMetricsManagerOneStatsAssociationInfo setBtCoexStats:](self, "setBtCoexStats:");
  }
  btCoexModeChange = self->_btCoexModeChange;
  v10 = *((_QWORD *)a3 + 2);
  if (btCoexModeChange)
  {
    if (v10)
      -[AWDWiFiMetricsManagerBTCoexModeChange mergeFrom:](btCoexModeChange, "mergeFrom:");
  }
  else if (v10)
  {
    -[AWDWiFiMetricsManagerOneStatsAssociationInfo setBtCoexModeChange:](self, "setBtCoexModeChange:");
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 5);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[AWDWiFiMetricsManagerOneStatsAssociationInfo addChipCountersPerSlice:](self, "addChipCountersPerSlice:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiMetricsManagerChipCounters)chipCounters
{
  return self->_chipCounters;
}

- (void)setChipCounters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (AWDWiFiMetricsManagerBTCoexStats)btCoexStats
{
  return self->_btCoexStats;
}

- (void)setBtCoexStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (AWDWiFiMetricsManagerBTCoexModeChange)btCoexModeChange
{
  return self->_btCoexModeChange;
}

- (void)setBtCoexModeChange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)chipCountersPerSlices
{
  return self->_chipCountersPerSlices;
}

- (void)setChipCountersPerSlices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
