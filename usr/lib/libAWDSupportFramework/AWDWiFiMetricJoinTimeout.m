@implementation AWDWiFiMetricJoinTimeout

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricJoinTimeout;
  -[AWDWiFiMetricJoinTimeout dealloc](&v3, sel_dealloc);
}

- (void)setSequence:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sequence = a3;
}

- (void)setHasSequence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequence
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)joinClassificationInfosCount
{
  return self->_joinClassificationInfos.count;
}

- (unsigned)joinClassificationInfos
{
  return self->_joinClassificationInfos.list;
}

- (void)clearJoinClassificationInfos
{
  PBRepeatedUInt32Clear();
}

- (void)addJoinClassificationInfo:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)joinClassificationInfoAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_joinClassificationInfos;
  unint64_t count;

  p_joinClassificationInfos = &self->_joinClassificationInfos;
  count = self->_joinClassificationInfos.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_joinClassificationInfos->list[a3];
}

- (void)setJoinClassificationInfos:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)joinTargetClassificationInfosCount
{
  return self->_joinTargetClassificationInfos.count;
}

- (unsigned)joinTargetClassificationInfos
{
  return self->_joinTargetClassificationInfos.list;
}

- (void)clearJoinTargetClassificationInfos
{
  PBRepeatedUInt32Clear();
}

- (void)addJoinTargetClassificationInfo:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)joinTargetClassificationInfoAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_joinTargetClassificationInfos;
  unint64_t count;

  p_joinTargetClassificationInfos = &self->_joinTargetClassificationInfos;
  count = self->_joinTargetClassificationInfos.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_joinTargetClassificationInfos->list[a3];
}

- (void)setJoinTargetClassificationInfos:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)associationStatesCount
{
  return self->_associationStates.count;
}

- (unsigned)associationStates
{
  return self->_associationStates.list;
}

- (void)clearAssociationStates
{
  PBRepeatedUInt32Clear();
}

- (void)addAssociationState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)associationStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_associationStates;
  unint64_t count;

  p_associationStates = &self->_associationStates;
  count = self->_associationStates.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_associationStates->list[a3];
}

- (void)setAssociationStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)channelsCount
{
  return self->_channels.count;
}

- (unsigned)channels
{
  return self->_channels.list;
}

- (void)clearChannels
{
  PBRepeatedUInt32Clear();
}

- (void)addChannel:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)channelAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_channels;
  unint64_t count;

  p_channels = &self->_channels;
  count = self->_channels.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_channels->list[a3];
}

- (void)setChannels:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)totalNumberOfJoinAttemptsCount
{
  return self->_totalNumberOfJoinAttempts.count;
}

- (unsigned)totalNumberOfJoinAttempts
{
  return self->_totalNumberOfJoinAttempts.list;
}

- (void)clearTotalNumberOfJoinAttempts
{
  PBRepeatedUInt32Clear();
}

- (void)addTotalNumberOfJoinAttempts:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)totalNumberOfJoinAttemptsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_totalNumberOfJoinAttempts;
  unint64_t count;

  p_totalNumberOfJoinAttempts = &self->_totalNumberOfJoinAttempts;
  count = self->_totalNumberOfJoinAttempts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_totalNumberOfJoinAttempts->list[a3];
}

- (void)setTotalNumberOfJoinAttempts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricJoinTimeout;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricJoinTimeout description](&v3, sel_description), -[AWDWiFiMetricJoinTimeout dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sequence), CFSTR("sequence"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("joinClassificationInfo"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("joinTargetClassificationInfo"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("associationState"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("channel"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("totalNumberOfJoinAttempts"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricJoinTimeoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_totalNumberOfJoinAttempts;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_joinClassificationInfos.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_joinClassificationInfos.count);
  }
  if (self->_joinTargetClassificationInfos.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_joinTargetClassificationInfos.count);
  }
  if (self->_associationStates.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_associationStates.count);
  }
  if (self->_channels.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_channels.count);
  }
  p_totalNumberOfJoinAttempts = &self->_totalNumberOfJoinAttempts;
  if (p_totalNumberOfJoinAttempts->count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v9;
    }
    while (v9 < p_totalNumberOfJoinAttempts->count);
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
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  unint64_t v17;
  unint64_t v18;
  uint64_t n;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 32) = self->_sequence;
    *((_BYTE *)a3 + 132) |= 1u;
  }
  if (-[AWDWiFiMetricJoinTimeout joinClassificationInfosCount](self, "joinClassificationInfosCount"))
  {
    objc_msgSend(a3, "clearJoinClassificationInfos");
    v5 = -[AWDWiFiMetricJoinTimeout joinClassificationInfosCount](self, "joinClassificationInfosCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addJoinClassificationInfo:", -[AWDWiFiMetricJoinTimeout joinClassificationInfoAtIndex:](self, "joinClassificationInfoAtIndex:", i));
    }
  }
  if (-[AWDWiFiMetricJoinTimeout joinTargetClassificationInfosCount](self, "joinTargetClassificationInfosCount"))
  {
    objc_msgSend(a3, "clearJoinTargetClassificationInfos");
    v8 = -[AWDWiFiMetricJoinTimeout joinTargetClassificationInfosCount](self, "joinTargetClassificationInfosCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addJoinTargetClassificationInfo:", -[AWDWiFiMetricJoinTimeout joinTargetClassificationInfoAtIndex:](self, "joinTargetClassificationInfoAtIndex:", j));
    }
  }
  if (-[AWDWiFiMetricJoinTimeout associationStatesCount](self, "associationStatesCount"))
  {
    objc_msgSend(a3, "clearAssociationStates");
    v11 = -[AWDWiFiMetricJoinTimeout associationStatesCount](self, "associationStatesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addAssociationState:", -[AWDWiFiMetricJoinTimeout associationStateAtIndex:](self, "associationStateAtIndex:", k));
    }
  }
  if (-[AWDWiFiMetricJoinTimeout channelsCount](self, "channelsCount"))
  {
    objc_msgSend(a3, "clearChannels");
    v14 = -[AWDWiFiMetricJoinTimeout channelsCount](self, "channelsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addChannel:", -[AWDWiFiMetricJoinTimeout channelAtIndex:](self, "channelAtIndex:", m));
    }
  }
  if (-[AWDWiFiMetricJoinTimeout totalNumberOfJoinAttemptsCount](self, "totalNumberOfJoinAttemptsCount"))
  {
    objc_msgSend(a3, "clearTotalNumberOfJoinAttempts");
    v17 = -[AWDWiFiMetricJoinTimeout totalNumberOfJoinAttemptsCount](self, "totalNumberOfJoinAttemptsCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(a3, "addTotalNumberOfJoinAttempts:", -[AWDWiFiMetricJoinTimeout totalNumberOfJoinAttemptsAtIndex:](self, "totalNumberOfJoinAttemptsAtIndex:", n));
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
    *(_DWORD *)(v4 + 128) = self->_sequence;
    *(_BYTE *)(v4 + 132) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
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
    if ((*((_BYTE *)a3 + 132) & 1) == 0 || self->_sequence != *((_DWORD *)a3 + 32))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 132) & 1) != 0)
  {
    return 0;
  }
  if (PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    return PBRepeatedUInt32IsEqual();
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_sequence;
  else
    v2 = 0;
  v3 = PBRepeatedUInt32Hash() ^ v2;
  v4 = PBRepeatedUInt32Hash();
  v5 = v3 ^ v4 ^ PBRepeatedUInt32Hash();
  v6 = PBRepeatedUInt32Hash();
  return v5 ^ v6 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  uint64_t v17;
  uint64_t v18;
  uint64_t n;

  if ((*((_BYTE *)a3 + 132) & 1) != 0)
  {
    self->_sequence = *((_DWORD *)a3 + 32);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = objc_msgSend(a3, "joinClassificationInfosCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDWiFiMetricJoinTimeout addJoinClassificationInfo:](self, "addJoinClassificationInfo:", objc_msgSend(a3, "joinClassificationInfoAtIndex:", i));
  }
  v8 = objc_msgSend(a3, "joinTargetClassificationInfosCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[AWDWiFiMetricJoinTimeout addJoinTargetClassificationInfo:](self, "addJoinTargetClassificationInfo:", objc_msgSend(a3, "joinTargetClassificationInfoAtIndex:", j));
  }
  v11 = objc_msgSend(a3, "associationStatesCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[AWDWiFiMetricJoinTimeout addAssociationState:](self, "addAssociationState:", objc_msgSend(a3, "associationStateAtIndex:", k));
  }
  v14 = objc_msgSend(a3, "channelsCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[AWDWiFiMetricJoinTimeout addChannel:](self, "addChannel:", objc_msgSend(a3, "channelAtIndex:", m));
  }
  v17 = objc_msgSend(a3, "totalNumberOfJoinAttemptsCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
      -[AWDWiFiMetricJoinTimeout addTotalNumberOfJoinAttempts:](self, "addTotalNumberOfJoinAttempts:", objc_msgSend(a3, "totalNumberOfJoinAttemptsAtIndex:", n));
  }
}

- (unsigned)sequence
{
  return self->_sequence;
}

@end
