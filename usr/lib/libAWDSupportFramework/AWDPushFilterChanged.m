@implementation AWDPushFilterChanged

- (void)dealloc
{
  objc_super v3;

  -[AWDPushFilterChanged setGuid:](self, "setGuid:", 0);
  -[AWDPushFilterChanged setTopic:](self, "setTopic:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPushFilterChanged;
  -[AWDPushFilterChanged dealloc](&v3, sel_dealloc);
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

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setChangedReason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_changedReason = a3;
}

- (void)setHasChangedReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChangedReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setChangedTopicsCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_changedTopicsCount = a3;
}

- (void)setHasChangedTopicsCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasChangedTopicsCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPushFilterChanged;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPushFilterChanged description](&v3, sel_description), -[AWDPushFilterChanged dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *guid;
  char has;
  NSString *topic;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_changedReason), CFSTR("changedReason"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_changedTopicsCount), CFSTR("changedTopicsCount"));
  topic = self->_topic;
  if (topic)
    objc_msgSend(v3, "setObject:forKey:", topic, CFSTR("topic"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushFilterChangedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_guid)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_topic)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_changedReason;
    *((_BYTE *)a3 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_changedTopicsCount;
    *((_BYTE *)a3 + 40) |= 4u;
  }
  if (self->_topic)
    objc_msgSend(a3, "setTopic:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_changedReason;
    *(_BYTE *)(v6 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_changedTopicsCount;
    *(_BYTE *)(v6 + 40) |= 4u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_topic, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *guid;
  NSString *topic;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
LABEL_22:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((_QWORD *)a3 + 3))
    {
      v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_changedReason != *((_DWORD *)a3 + 4))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
      goto LABEL_22;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_changedTopicsCount != *((_DWORD *)a3 + 5))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
      goto LABEL_22;
    }
    topic = self->_topic;
    if ((unint64_t)topic | *((_QWORD *)a3 + 4))
      LOBYTE(v5) = -[NSString isEqual:](topic, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_guid, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_changedReason;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_topic, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_changedTopicsCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_topic, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDPushFilterChanged setGuid:](self, "setGuid:");
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_changedReason = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_changedTopicsCount = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDPushFilterChanged setTopic:](self, "setTopic:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)changedReason
{
  return self->_changedReason;
}

- (unsigned)changedTopicsCount
{
  return self->_changedTopicsCount;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
