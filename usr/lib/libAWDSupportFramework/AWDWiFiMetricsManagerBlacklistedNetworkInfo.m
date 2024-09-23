@implementation AWDWiFiMetricsManagerBlacklistedNetworkInfo

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerBlacklistedNetworkInfo setSsidHash:](self, "setSsidHash:", 0);
  -[AWDWiFiMetricsManagerBlacklistedNetworkInfo setBlacklistingRecords:](self, "setBlacklistingRecords:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBlacklistedNetworkInfo;
  -[AWDWiFiMetricsManagerBlacklistedNetworkInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)hasSsidHash
{
  return self->_ssidHash != 0;
}

- (void)setNetworkFlags:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_networkFlags = a3;
}

- (void)setHasNetworkFlags:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNetworkFlags
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReserverdInfo:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reserverdInfo = a3;
}

- (void)setHasReserverdInfo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReserverdInfo
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearBlacklistingRecords
{
  -[NSMutableArray removeAllObjects](self->_blacklistingRecords, "removeAllObjects");
}

- (void)addBlacklistingRecord:(id)a3
{
  NSMutableArray *blacklistingRecords;

  blacklistingRecords = self->_blacklistingRecords;
  if (!blacklistingRecords)
  {
    blacklistingRecords = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_blacklistingRecords = blacklistingRecords;
  }
  -[NSMutableArray addObject:](blacklistingRecords, "addObject:", a3);
}

- (unint64_t)blacklistingRecordsCount
{
  return -[NSMutableArray count](self->_blacklistingRecords, "count");
}

- (id)blacklistingRecordAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_blacklistingRecords, "objectAtIndex:", a3);
}

+ (Class)blacklistingRecordType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBlacklistedNetworkInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerBlacklistedNetworkInfo description](&v3, sel_description), -[AWDWiFiMetricsManagerBlacklistedNetworkInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *ssidHash;
  char has;
  void *v7;
  NSMutableArray *blacklistingRecords;
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
  v4 = v3;
  ssidHash = self->_ssidHash;
  if (ssidHash)
    objc_msgSend(v3, "setObject:forKey:", ssidHash, CFSTR("ssidHash"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_networkFlags), CFSTR("networkFlags"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reserverdInfo), CFSTR("reserverdInfo"));
  if (-[NSMutableArray count](self->_blacklistingRecords, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_blacklistingRecords, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    blacklistingRecords = self->_blacklistingRecords;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingRecords, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(blacklistingRecords);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingRecords, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("blacklistingRecord"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerBlacklistedNetworkInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *blacklistingRecords;
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
  if (self->_ssidHash)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  blacklistingRecords = self->_blacklistingRecords;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingRecords, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(blacklistingRecords);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingRecords, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  if (self->_ssidHash)
    objc_msgSend(a3, "setSsidHash:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_networkFlags;
    *((_BYTE *)a3 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_reserverdInfo;
    *((_BYTE *)a3 + 32) |= 2u;
  }
  if (-[AWDWiFiMetricsManagerBlacklistedNetworkInfo blacklistingRecordsCount](self, "blacklistingRecordsCount"))
  {
    objc_msgSend(a3, "clearBlacklistingRecords");
    v6 = -[AWDWiFiMetricsManagerBlacklistedNetworkInfo blacklistingRecordsCount](self, "blacklistingRecordsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addBlacklistingRecord:", -[AWDWiFiMetricsManagerBlacklistedNetworkInfo blacklistingRecordAtIndex:](self, "blacklistingRecordAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;
  NSMutableArray *blacklistingRecords;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_ssidHash, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_networkFlags;
    *(_BYTE *)(v5 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_reserverdInfo;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  blacklistingRecords = self->_blacklistingRecords;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingRecords, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(blacklistingRecords);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBlacklistingRecord:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blacklistingRecords, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *ssidHash;
  NSMutableArray *blacklistingRecords;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    ssidHash = self->_ssidHash;
    if (!((unint64_t)ssidHash | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](ssidHash, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_networkFlags != *((_DWORD *)a3 + 4))
          goto LABEL_16;
      }
      else if ((*((_BYTE *)a3 + 32) & 1) != 0)
      {
LABEL_16:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_reserverdInfo != *((_DWORD *)a3 + 5))
          goto LABEL_16;
      }
      else if ((*((_BYTE *)a3 + 32) & 2) != 0)
      {
        goto LABEL_16;
      }
      blacklistingRecords = self->_blacklistingRecords;
      if ((unint64_t)blacklistingRecords | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[NSMutableArray isEqual:](blacklistingRecords, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_ssidHash, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_networkFlags;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_blacklistingRecords, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_reserverdInfo;
  return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_blacklistingRecords, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)a3 + 3))
    -[AWDWiFiMetricsManagerBlacklistedNetworkInfo setSsidHash:](self, "setSsidHash:");
  v5 = *((_BYTE *)a3 + 32);
  if ((v5 & 1) != 0)
  {
    self->_networkFlags = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_reserverdInfo = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[AWDWiFiMetricsManagerBlacklistedNetworkInfo addBlacklistingRecord:](self, "addBlacklistingRecord:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (NSString)ssidHash
{
  return self->_ssidHash;
}

- (void)setSsidHash:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)networkFlags
{
  return self->_networkFlags;
}

- (unsigned)reserverdInfo
{
  return self->_reserverdInfo;
}

- (NSMutableArray)blacklistingRecords
{
  return self->_blacklistingRecords;
}

- (void)setBlacklistingRecords:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
