@implementation AWDWiFiMetricsManagerBGScanBlacklistedNetworks

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks setInterfaceName:](self, "setInterfaceName:", 0);
  -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks setBlacklistingHistorys:](self, "setBlacklistingHistorys:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBGScanBlacklistedNetworks;
  -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks dealloc](&v3, sel_dealloc);
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

- (BOOL)hasInterfaceName
{
  return self->_interfaceName != 0;
}

- (void)clearBlacklistingHistorys
{
  -[NSMutableArray removeAllObjects](self->_blacklistingHistorys, "removeAllObjects");
}

- (void)addBlacklistingHistory:(id)a3
{
  NSMutableArray *blacklistingHistorys;

  blacklistingHistorys = self->_blacklistingHistorys;
  if (!blacklistingHistorys)
  {
    blacklistingHistorys = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_blacklistingHistorys = blacklistingHistorys;
  }
  -[NSMutableArray addObject:](blacklistingHistorys, "addObject:", a3);
}

- (unint64_t)blacklistingHistorysCount
{
  return -[NSMutableArray count](self->_blacklistingHistorys, "count");
}

- (id)blacklistingHistoryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_blacklistingHistorys, "objectAtIndex:", a3);
}

+ (Class)blacklistingHistoryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBGScanBlacklistedNetworks;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks description](&v3, sel_description), -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *interfaceName;
  void *v5;
  NSMutableArray *blacklistingHistorys;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  interfaceName = self->_interfaceName;
  if (interfaceName)
    objc_msgSend(v3, "setObject:forKey:", interfaceName, CFSTR("interfaceName"));
  if (-[NSMutableArray count](self->_blacklistingHistorys, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_blacklistingHistorys, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    blacklistingHistorys = self->_blacklistingHistorys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingHistorys, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(blacklistingHistorys);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingHistorys, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("blacklistingHistory"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerBGScanBlacklistedNetworksReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *blacklistingHistorys;
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
  if (self->_interfaceName)
    PBDataWriterWriteStringField();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  blacklistingHistorys = self->_blacklistingHistorys;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingHistorys, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_enumerationMutation(blacklistingHistorys);
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingHistorys, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_interfaceName)
    objc_msgSend(a3, "setInterfaceName:");
  if (-[AWDWiFiMetricsManagerBGScanBlacklistedNetworks blacklistingHistorysCount](self, "blacklistingHistorysCount"))
  {
    objc_msgSend(a3, "clearBlacklistingHistorys");
    v5 = -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks blacklistingHistorysCount](self, "blacklistingHistorysCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addBlacklistingHistory:", -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks blacklistingHistoryAtIndex:](self, "blacklistingHistoryAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *blacklistingHistorys;
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
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  v6[3] = -[NSString copyWithZone:](self->_interfaceName, "copyWithZone:", a3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  blacklistingHistorys = self->_blacklistingHistorys;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingHistorys, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          objc_enumerationMutation(blacklistingHistorys);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addBlacklistingHistory:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingHistorys, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *interfaceName;
  NSMutableArray *blacklistingHistorys;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    interfaceName = self->_interfaceName;
    if (!((unint64_t)interfaceName | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](interfaceName, "isEqual:")) != 0)
    {
      blacklistingHistorys = self->_blacklistingHistorys;
      if ((unint64_t)blacklistingHistorys | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[NSMutableArray isEqual:](blacklistingHistorys, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_interfaceName, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_blacklistingHistorys, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks setInterfaceName:](self, "setInterfaceName:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks addBlacklistingHistory:](self, "addBlacklistingHistory:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)blacklistingHistorys
{
  return self->_blacklistingHistorys;
}

- (void)setBlacklistingHistorys:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
