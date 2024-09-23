@implementation AWDWiFiMetricsManagerSoftErrorUserFeedback

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerSoftErrorUserFeedback;
  -[AWDWiFiMetricsManagerSoftErrorUserFeedback dealloc](&v3, sel_dealloc);
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

- (unint64_t)softErrorInstanceCountersCount
{
  return self->_softErrorInstanceCounters.count;
}

- (int)softErrorInstanceCounters
{
  return self->_softErrorInstanceCounters.list;
}

- (void)clearSoftErrorInstanceCounters
{
  PBRepeatedInt32Clear();
}

- (void)addSoftErrorInstanceCounters:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)softErrorInstanceCountersAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_softErrorInstanceCounters;
  unint64_t count;

  p_softErrorInstanceCounters = &self->_softErrorInstanceCounters;
  count = self->_softErrorInstanceCounters.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_softErrorInstanceCounters->list[a3];
}

- (void)setSoftErrorInstanceCounters:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)softErrorUserConfirmationCountersCount
{
  return self->_softErrorUserConfirmationCounters.count;
}

- (int)softErrorUserConfirmationCounters
{
  return self->_softErrorUserConfirmationCounters.list;
}

- (void)clearSoftErrorUserConfirmationCounters
{
  PBRepeatedInt32Clear();
}

- (void)addSoftErrorUserConfirmationCounters:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)softErrorUserConfirmationCountersAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_softErrorUserConfirmationCounters;
  unint64_t count;

  p_softErrorUserConfirmationCounters = &self->_softErrorUserConfirmationCounters;
  count = self->_softErrorUserConfirmationCounters.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_softErrorUserConfirmationCounters->list[a3];
}

- (void)setSoftErrorUserConfirmationCounters:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerSoftErrorUserFeedback;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerSoftErrorUserFeedback description](&v3, sel_description), -[AWDWiFiMetricsManagerSoftErrorUserFeedback dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("softErrorInstanceCounters"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("softErrorUserConfirmationCounters"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerSoftErrorUserFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_softErrorUserConfirmationCounters;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_softErrorInstanceCounters.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_softErrorInstanceCounters.count);
  }
  p_softErrorUserConfirmationCounters = &self->_softErrorUserConfirmationCounters;
  if (p_softErrorUserConfirmationCounters->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < p_softErrorUserConfirmationCounters->count);
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
  if (-[AWDWiFiMetricsManagerSoftErrorUserFeedback softErrorInstanceCountersCount](self, "softErrorInstanceCountersCount"))
  {
    objc_msgSend(a3, "clearSoftErrorInstanceCounters");
    v5 = -[AWDWiFiMetricsManagerSoftErrorUserFeedback softErrorInstanceCountersCount](self, "softErrorInstanceCountersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addSoftErrorInstanceCounters:", -[AWDWiFiMetricsManagerSoftErrorUserFeedback softErrorInstanceCountersAtIndex:](self, "softErrorInstanceCountersAtIndex:", i));
    }
  }
  if (-[AWDWiFiMetricsManagerSoftErrorUserFeedback softErrorUserConfirmationCountersCount](self, "softErrorUserConfirmationCountersCount"))
  {
    objc_msgSend(a3, "clearSoftErrorUserConfirmationCounters");
    v8 = -[AWDWiFiMetricsManagerSoftErrorUserFeedback softErrorUserConfirmationCountersCount](self, "softErrorUserConfirmationCountersCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addSoftErrorUserConfirmationCounters:", -[AWDWiFiMetricsManagerSoftErrorUserFeedback softErrorUserConfirmationCountersAtIndex:](self, "softErrorUserConfirmationCountersAtIndex:", j));
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
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
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
  if (PBRepeatedInt32IsEqual())
    return PBRepeatedInt32IsEqual();
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
  v3 = PBRepeatedInt32Hash() ^ v2;
  return v3 ^ PBRepeatedInt32Hash();
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
  v5 = objc_msgSend(a3, "softErrorInstanceCountersCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDWiFiMetricsManagerSoftErrorUserFeedback addSoftErrorInstanceCounters:](self, "addSoftErrorInstanceCounters:", objc_msgSend(a3, "softErrorInstanceCountersAtIndex:", i));
  }
  v8 = objc_msgSend(a3, "softErrorUserConfirmationCountersCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[AWDWiFiMetricsManagerSoftErrorUserFeedback addSoftErrorUserConfirmationCounters:](self, "addSoftErrorUserConfirmationCounters:", objc_msgSend(a3, "softErrorUserConfirmationCountersAtIndex:", j));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end
