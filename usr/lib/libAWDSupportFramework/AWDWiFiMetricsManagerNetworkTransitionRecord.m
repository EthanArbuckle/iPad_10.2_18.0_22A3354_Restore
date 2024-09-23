@implementation AWDWiFiMetricsManagerNetworkTransitionRecord

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerNetworkTransitionRecord;
  -[AWDWiFiMetricsManagerNetworkTransitionRecord dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBeganTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_beganTimestamp = a3;
}

- (void)setHasBeganTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBeganTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setEndedTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endedTimestamp = a3;
}

- (void)setHasEndedTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndedTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setGotIPTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_gotIPTimestamp = a3;
}

- (void)setHasGotIPTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGotIPTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setErrors:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_errors = a3;
}

- (void)setHasErrors:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasErrors
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTrigger:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTrigger
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
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
  v3.super_class = (Class)AWDWiFiMetricsManagerNetworkTransitionRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerNetworkTransitionRecord description](&v3, sel_description), -[AWDWiFiMetricsManagerNetworkTransitionRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_beganTimestamp), CFSTR("beganTimestamp"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endedTimestamp), CFSTR("endedTimestamp"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_gotIPTimestamp), CFSTR("gotIPTimestamp"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_errors), CFSTR("errors"));
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_state), CFSTR("state"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_trigger), CFSTR("trigger"));
LABEL_9:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("channelScanCount"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerNetworkTransitionRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_channelScanCounts;
  unint64_t v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field();
LABEL_9:
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
  if ((has & 8) != 0)
  {
    *((_QWORD *)a3 + 7) = self->_timestamp;
    *((_BYTE *)a3 + 76) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 4) = self->_beganTimestamp;
  *((_BYTE *)a3 + 76) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 5) = self->_endedTimestamp;
  *((_BYTE *)a3 + 76) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 6) = self->_gotIPTimestamp;
  *((_BYTE *)a3 + 76) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_19:
    *((_DWORD *)a3 + 16) = self->_errors;
    *((_BYTE *)a3 + 76) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_18:
  *((_DWORD *)a3 + 17) = self->_state;
  *((_BYTE *)a3 + 76) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_19;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)a3 + 18) = self->_trigger;
    *((_BYTE *)a3 + 76) |= 0x40u;
  }
LABEL_9:
  if (-[AWDWiFiMetricsManagerNetworkTransitionRecord channelScanCountsCount](self, "channelScanCountsCount"))
  {
    objc_msgSend(a3, "clearChannelScanCounts");
    v6 = -[AWDWiFiMetricsManagerNetworkTransitionRecord channelScanCountsCount](self, "channelScanCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addChannelScanCount:", -[AWDWiFiMetricsManagerNetworkTransitionRecord channelScanCountAtIndex:](self, "channelScanCountAtIndex:", i));
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
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v4 + 56) = self->_timestamp;
    *(_BYTE *)(v4 + 76) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v4 + 32) = self->_beganTimestamp;
  *(_BYTE *)(v4 + 76) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_QWORD *)(v4 + 40) = self->_endedTimestamp;
  *(_BYTE *)(v4 + 76) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(_QWORD *)(v4 + 48) = self->_gotIPTimestamp;
  *(_BYTE *)(v4 + 76) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    *(_DWORD *)(v4 + 64) = self->_errors;
    *(_BYTE *)(v4 + 76) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *(_DWORD *)(v4 + 68) = self->_state;
  *(_BYTE *)(v4 + 76) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *(_DWORD *)(v4 + 72) = self->_trigger;
    *(_BYTE *)(v4 + 76) |= 0x40u;
  }
LABEL_9:
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 76) & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 7))
      return 0;
LABEL_7:
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 76) & 1) == 0 || self->_beganTimestamp != *((_QWORD *)a3 + 4))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 76) & 1) != 0)
    {
      return 0;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 76) & 2) == 0 || self->_endedTimestamp != *((_QWORD *)a3 + 5))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 76) & 2) != 0)
    {
      return 0;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 76) & 4) == 0 || self->_gotIPTimestamp != *((_QWORD *)a3 + 6))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 76) & 4) != 0)
    {
      return 0;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 76) & 0x20) == 0 || self->_state != *((_DWORD *)a3 + 17))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 76) & 0x20) != 0)
    {
      return 0;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 76) & 0x10) == 0 || self->_errors != *((_DWORD *)a3 + 16))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 76) & 0x10) != 0)
    {
      return 0;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 76) & 0x40) == 0 || self->_trigger != *((_DWORD *)a3 + 18))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 76) & 0x40) != 0)
    {
      return 0;
    }
    return PBRepeatedUInt32IsEqual();
  }
  if ((*((_BYTE *)a3 + 76) & 8) == 0)
    goto LABEL_7;
  return 0;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_beganTimestamp;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_endedTimestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = 2654435761u * self->_gotIPTimestamp;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_state;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ PBRepeatedUInt32Hash();
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_errors;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_trigger;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;

  v5 = *((_BYTE *)a3 + 76);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 76);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)a3 + 76) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_beganTimestamp = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 76);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_endedTimestamp = *((_QWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 76);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_gotIPTimestamp = *((_QWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 76);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_state = *((_DWORD *)a3 + 17);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 76);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_18:
  self->_errors = *((_DWORD *)a3 + 16);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 76) & 0x40) != 0)
  {
LABEL_8:
    self->_trigger = *((_DWORD *)a3 + 18);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_9:
  v6 = objc_msgSend(a3, "channelScanCountsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDWiFiMetricsManagerNetworkTransitionRecord addChannelScanCount:](self, "addChannelScanCount:", objc_msgSend(a3, "channelScanCountAtIndex:", i));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)beganTimestamp
{
  return self->_beganTimestamp;
}

- (unint64_t)endedTimestamp
{
  return self->_endedTimestamp;
}

- (unint64_t)gotIPTimestamp
{
  return self->_gotIPTimestamp;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)errors
{
  return self->_errors;
}

- (unsigned)trigger
{
  return self->_trigger;
}

@end
