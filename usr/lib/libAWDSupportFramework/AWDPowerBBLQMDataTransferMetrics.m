@implementation AWDPowerBBLQMDataTransferMetrics

- (void)dealloc
{
  objc_super v3;

  -[AWDPowerBBLQMDataTransferMetrics setLQMBytes:](self, "setLQMBytes:", 0);
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBLQMDataTransferMetrics;
  -[AWDPowerBBLQMDataTransferMetrics dealloc](&v3, sel_dealloc);
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

- (void)clearLQMBytes
{
  -[NSMutableArray removeAllObjects](self->_lQMBytes, "removeAllObjects");
}

- (void)addLQMBytes:(id)a3
{
  NSMutableArray *lQMBytes;

  lQMBytes = self->_lQMBytes;
  if (!lQMBytes)
  {
    lQMBytes = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_lQMBytes = lQMBytes;
  }
  -[NSMutableArray addObject:](lQMBytes, "addObject:", a3);
}

- (unint64_t)lQMBytesCount
{
  return -[NSMutableArray count](self->_lQMBytes, "count");
}

- (id)lQMBytesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_lQMBytes, "objectAtIndex:", a3);
}

+ (Class)lQMBytesType
{
  return (Class)objc_opt_class();
}

- (unint64_t)lQMTransitionCntBucketsCount
{
  return self->_lQMTransitionCntBuckets.count;
}

- (unsigned)lQMTransitionCntBuckets
{
  return self->_lQMTransitionCntBuckets.list;
}

- (void)clearLQMTransitionCntBuckets
{
  PBRepeatedUInt32Clear();
}

- (void)addLQMTransitionCntBuckets:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)lQMTransitionCntBucketsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_lQMTransitionCntBuckets;
  unint64_t count;

  p_lQMTransitionCntBuckets = &self->_lQMTransitionCntBuckets;
  count = self->_lQMTransitionCntBuckets.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_lQMTransitionCntBuckets->list[a3];
}

- (void)setLQMTransitionCntBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBLQMDataTransferMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerBBLQMDataTransferMetrics description](&v3, sel_description), -[AWDPowerBBLQMDataTransferMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *lQMBytes;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  if (-[NSMutableArray count](self->_lQMBytes, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_lQMBytes, "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    lQMBytes = self->_lQMBytes;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lQMBytes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(lQMBytes);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lQMBytes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("LQMBytes"));

  }
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("LQMTransitionCntBuckets"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBBLQMDataTransferMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *lQMBytes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_lQMTransitionCntBuckets;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  lQMBytes = self->_lQMBytes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lQMBytes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(lQMBytes);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lQMBytes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  p_lQMTransitionCntBuckets = &self->_lQMTransitionCntBuckets;
  if (p_lQMTransitionCntBuckets->count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v10;
    }
    while (v10 < p_lQMTransitionCntBuckets->count);
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 1u;
  }
  if (-[AWDPowerBBLQMDataTransferMetrics lQMBytesCount](self, "lQMBytesCount"))
  {
    objc_msgSend(a3, "clearLQMBytes");
    v5 = -[AWDPowerBBLQMDataTransferMetrics lQMBytesCount](self, "lQMBytesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addLQMBytes:", -[AWDPowerBBLQMDataTransferMetrics lQMBytesAtIndex:](self, "lQMBytesAtIndex:", i));
    }
  }
  if (-[AWDPowerBBLQMDataTransferMetrics lQMTransitionCntBucketsCount](self, "lQMTransitionCntBucketsCount"))
  {
    objc_msgSend(a3, "clearLQMTransitionCntBuckets");
    v8 = -[AWDPowerBBLQMDataTransferMetrics lQMTransitionCntBucketsCount](self, "lQMTransitionCntBucketsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addLQMTransitionCntBuckets:", -[AWDPowerBBLQMDataTransferMetrics lQMTransitionCntBucketsAtIndex:](self, "lQMTransitionCntBucketsAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *lQMBytes;
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
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  lQMBytes = self->_lQMBytes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lQMBytes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(lQMBytes);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addLQMBytes:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lQMBytes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  PBRepeatedUInt32Copy();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NSMutableArray *lQMBytes;

  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    return 0;
  }
  lQMBytes = self->_lQMBytes;
  if (!((unint64_t)lQMBytes | *((_QWORD *)a3 + 5))
    || -[NSMutableArray isEqual:](lQMBytes, "isEqual:"))
  {
    return PBRepeatedUInt32IsEqual();
  }
  return 0;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_timestamp;
  else
    v2 = 0;
  v3 = -[NSMutableArray hash](self->_lQMBytes, "hash");
  return v3 ^ v2 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[AWDPowerBBLQMDataTransferMetrics addLQMBytes:](self, "addLQMBytes:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v10 = objc_msgSend(a3, "lQMTransitionCntBucketsCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[AWDPowerBBLQMDataTransferMetrics addLQMTransitionCntBuckets:](self, "addLQMTransitionCntBuckets:", objc_msgSend(a3, "lQMTransitionCntBucketsAtIndex:", j));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)lQMBytes
{
  return self->_lQMBytes;
}

- (void)setLQMBytes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
