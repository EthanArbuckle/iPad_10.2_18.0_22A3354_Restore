@implementation AWDPushProxyManagerSend

- (void)dealloc
{
  objc_super v3;

  -[AWDPushProxyManagerSend setGuid:](self, "setGuid:", 0);
  -[AWDPushProxyManagerSend setTopic:](self, "setTopic:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPushProxyManagerSend;
  -[AWDPushProxyManagerSend dealloc](&v3, sel_dealloc);
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

- (void)setMessageCommand:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_messageCommand = a3;
}

- (void)setHasMessageCommand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMessageCommand
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

- (void)setIsNearby:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isNearby = a3;
}

- (void)setHasIsNearby:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsNearby
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPushProxyManagerSend;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPushProxyManagerSend description](&v3, sel_description), -[AWDPushProxyManagerSend dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *guid;
  NSString *topic;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_messageCommand), CFSTR("messageCommand"));
  topic = self->_topic;
  if (topic)
    objc_msgSend(v3, "setObject:forKey:", topic, CFSTR("topic"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNearby), CFSTR("isNearby"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushProxyManagerSendReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_guid)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_topic)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_messageCommand;
    *((_BYTE *)a3 + 40) |= 4u;
  }
  if (self->_topic)
    objc_msgSend(a3, "setTopic:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_isNearby;
    *((_BYTE *)a3 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_messageCommand;
    *(_BYTE *)(v6 + 40) |= 4u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_topic, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_isNearby;
    *(_BYTE *)(v6 + 40) |= 2u;
  }
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
    if ((unint64_t)guid | *((_QWORD *)a3 + 2))
    {
      v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_messageCommand != *((_DWORD *)a3 + 7))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
      goto LABEL_22;
    }
    topic = self->_topic;
    if ((unint64_t)topic | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](topic, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_isNearby != *((_DWORD *)a3 + 6))
        goto LABEL_22;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_guid, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v5 = 2654435761 * self->_messageCommand;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_topic, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_isNearby;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDPushProxyManagerSend setGuid:](self, "setGuid:");
  if ((*((_BYTE *)a3 + 40) & 4) != 0)
  {
    self->_messageCommand = *((_DWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDPushProxyManagerSend setTopic:](self, "setTopic:");
  if ((*((_BYTE *)a3 + 40) & 2) != 0)
  {
    self->_isNearby = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
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
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)messageCommand
{
  return self->_messageCommand;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)isNearby
{
  return self->_isNearby;
}

@end
