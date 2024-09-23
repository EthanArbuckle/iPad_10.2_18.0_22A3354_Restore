@implementation AWDMDNSResponderDNSMessageSizeStats

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderDNSMessageSizeStats;
  -[AWDMDNSResponderDNSMessageSizeStats dealloc](&v3, sel_dealloc);
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

- (unint64_t)querySizeCountsCount
{
  return self->_querySizeCounts.count;
}

- (unsigned)querySizeCounts
{
  return self->_querySizeCounts.list;
}

- (void)clearQuerySizeCounts
{
  PBRepeatedUInt32Clear();
}

- (void)addQuerySizeCount:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)querySizeCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_querySizeCounts;
  unint64_t count;

  p_querySizeCounts = &self->_querySizeCounts;
  count = self->_querySizeCounts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_querySizeCounts->list[a3];
}

- (void)setQuerySizeCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)responseSizeCountsCount
{
  return self->_responseSizeCounts.count;
}

- (unsigned)responseSizeCounts
{
  return self->_responseSizeCounts.list;
}

- (void)clearResponseSizeCounts
{
  PBRepeatedUInt32Clear();
}

- (void)addResponseSizeCount:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)responseSizeCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_responseSizeCounts;
  unint64_t count;

  p_responseSizeCounts = &self->_responseSizeCounts;
  count = self->_responseSizeCounts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_responseSizeCounts->list[a3];
}

- (void)setResponseSizeCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderDNSMessageSizeStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMDNSResponderDNSMessageSizeStats description](&v3, sel_description), -[AWDMDNSResponderDNSMessageSizeStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("querySizeCount"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("responseSizeCount"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMDNSResponderDNSMessageSizeStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_responseSizeCounts;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_querySizeCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_querySizeCounts.count)
    {
      v4 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v4;
      }
      while (v4 < self->_querySizeCounts.count);
    }
    PBDataWriterRecallMark();
  }
  p_responseSizeCounts = &self->_responseSizeCounts;
  if (p_responseSizeCounts->count)
  {
    PBDataWriterPlaceMark();
    if (p_responseSizeCounts->count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < p_responseSizeCounts->count);
    }
    PBDataWriterRecallMark();
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
    *((_QWORD *)a3 + 7) = self->_timestamp;
    *((_BYTE *)a3 + 64) |= 1u;
  }
  if (-[AWDMDNSResponderDNSMessageSizeStats querySizeCountsCount](self, "querySizeCountsCount"))
  {
    objc_msgSend(a3, "clearQuerySizeCounts");
    v5 = -[AWDMDNSResponderDNSMessageSizeStats querySizeCountsCount](self, "querySizeCountsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addQuerySizeCount:", -[AWDMDNSResponderDNSMessageSizeStats querySizeCountAtIndex:](self, "querySizeCountAtIndex:", i));
    }
  }
  if (-[AWDMDNSResponderDNSMessageSizeStats responseSizeCountsCount](self, "responseSizeCountsCount"))
  {
    objc_msgSend(a3, "clearResponseSizeCounts");
    v8 = -[AWDMDNSResponderDNSMessageSizeStats responseSizeCountsCount](self, "responseSizeCountsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addResponseSizeCount:", -[AWDMDNSResponderDNSMessageSizeStats responseSizeCountAtIndex:](self, "responseSizeCountAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 56) = self->_timestamp;
    *(_BYTE *)(v4 + 64) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 7))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 64) & 1) != 0)
  {
    return 0;
  }
  if (PBRepeatedUInt32IsEqual())
    return PBRepeatedUInt32IsEqual();
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
  v3 = PBRepeatedUInt32Hash() ^ v2;
  return v3 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;

  if ((*((_BYTE *)a3 + 64) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = objc_msgSend(a3, "querySizeCountsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDMDNSResponderDNSMessageSizeStats addQuerySizeCount:](self, "addQuerySizeCount:", objc_msgSend(a3, "querySizeCountAtIndex:", i));
  }
  v8 = objc_msgSend(a3, "responseSizeCountsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[AWDMDNSResponderDNSMessageSizeStats addResponseSizeCount:](self, "addResponseSizeCount:", objc_msgSend(a3, "responseSizeCountAtIndex:", j));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end
