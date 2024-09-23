@implementation AWDWiFiMetricsManagerNetworkTransitionCumulative

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerNetworkTransitionCumulative;
  -[AWDWiFiMetricsManagerNetworkTransitionCumulative dealloc](&v3, sel_dealloc);
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

- (void)setColocatedNetworksFoundCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_colocatedNetworksFoundCount = a3;
}

- (void)setHasColocatedNetworksFoundCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasColocatedNetworksFoundCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)channelScanCountsCount
{
  return self->_channelScanCounts.count;
}

- (unsigned)channelScanCounts
{
  return self->_channelScanCounts.list;
}

- (void)clearChannelScanCounts
{
  PBRepeatedUInt32Clear();
}

- (void)addChannelScanCount:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)channelScanCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_channelScanCounts;
  unint64_t count;

  p_channelScanCounts = &self->_channelScanCounts;
  count = self->_channelScanCounts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_channelScanCounts->list[a3];
}

- (void)setChannelScanCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerNetworkTransitionCumulative;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerNetworkTransitionCumulative description](&v3, sel_description), -[AWDWiFiMetricsManagerNetworkTransitionCumulative dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_colocatedNetworksFoundCount), CFSTR("colocatedNetworksFoundCount"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("channelScanCount"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerNetworkTransitionCumulativeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_channelScanCounts;
  unint64_t v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  p_channelScanCounts = &self->_channelScanCounts;
  if (p_channelScanCounts->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < p_channelScanCounts->count);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_colocatedNetworksFoundCount;
    *((_BYTE *)a3 + 44) |= 2u;
  }
  if (-[AWDWiFiMetricsManagerNetworkTransitionCumulative channelScanCountsCount](self, "channelScanCountsCount"))
  {
    objc_msgSend(a3, "clearChannelScanCounts");
    v6 = -[AWDWiFiMetricsManagerNetworkTransitionCumulative channelScanCountsCount](self, "channelScanCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addChannelScanCount:", -[AWDWiFiMetricsManagerNetworkTransitionCumulative channelScanCountAtIndex:](self, "channelScanCountAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v4 + 32) = self->_timestamp;
    *(_BYTE *)(v4 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_colocatedNetworksFoundCount;
    *(_BYTE *)(v4 + 44) |= 2u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
      return 0;
LABEL_7:
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_colocatedNetworksFoundCount != *((_DWORD *)a3 + 10))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      return 0;
    }
    return PBRepeatedUInt32IsEqual();
  }
  if ((*((_BYTE *)a3 + 44) & 1) == 0)
    goto LABEL_7;
  return 0;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ PBRepeatedUInt32Hash();
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_colocatedNetworksFoundCount;
  return v3 ^ v2 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;

  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_colocatedNetworksFoundCount = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = objc_msgSend(a3, "channelScanCountsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDWiFiMetricsManagerNetworkTransitionCumulative addChannelScanCount:](self, "addChannelScanCount:", objc_msgSend(a3, "channelScanCountAtIndex:", i));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)colocatedNetworksFoundCount
{
  return self->_colocatedNetworksFoundCount;
}

@end
