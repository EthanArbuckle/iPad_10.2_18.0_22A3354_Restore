@implementation AWDPushReceivedSlow

- (void)dealloc
{
  objc_super v3;

  -[AWDPushReceivedSlow setGuid:](self, "setGuid:", 0);
  -[AWDPushReceivedSlow setTopic:](self, "setTopic:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPushReceivedSlow;
  -[AWDPushReceivedSlow dealloc](&v3, sel_dealloc);
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
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

- (void)setConnectionType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setReceiveOffset:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_receiveOffset = a3;
}

- (void)setHasReceiveOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasReceiveOffset
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPayloadSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_payloadSize = a3;
}

- (void)setHasPayloadSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPayloadSize
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsFromStorage:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isFromStorage = a3;
}

- (void)setHasIsFromStorage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsFromStorage
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDualChannelState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dualChannelState = a3;
}

- (void)setHasDualChannelState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDualChannelState
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
  v3.super_class = (Class)AWDPushReceivedSlow;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPushReceivedSlow description](&v3, sel_description), -[AWDPushReceivedSlow dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guid;
  char has;
  NSString *topic;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_receiveOffset), CFSTR("receiveOffset"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_payloadSize), CFSTR("payloadSize"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_19:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isFromStorage), CFSTR("isFromStorage"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_10:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dualChannelState), CFSTR("dualChannelState"));
LABEL_11:
  topic = self->_topic;
  if (topic)
    objc_msgSend(v4, "setObject:forKey:", topic, CFSTR("topic"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushReceivedSlowReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_guid)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:
  if (self->_topic)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_BYTE *)a3 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_linkQuality;
  *((_BYTE *)a3 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 11) = self->_receiveOffset;
  *((_BYTE *)a3 + 56) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 10) = self->_payloadSize;
  *((_BYTE *)a3 + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  *((_DWORD *)a3 + 8) = self->_isFromStorage;
  *((_BYTE *)a3 + 56) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 5) = self->_dualChannelState;
    *((_BYTE *)a3 + 56) |= 4u;
  }
LABEL_11:
  if (self->_topic)
    objc_msgSend(a3, "setTopic:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectionType;
  *(_BYTE *)(v5 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 36) = self->_linkQuality;
  *(_BYTE *)(v5 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 44) = self->_receiveOffset;
  *(_BYTE *)(v5 + 56) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
LABEL_15:
    *(_DWORD *)(v5 + 32) = self->_isFromStorage;
    *(_BYTE *)(v5 + 56) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *(_DWORD *)(v5 + 40) = self->_payloadSize;
  *(_BYTE *)(v5 + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 20) = self->_dualChannelState;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
LABEL_9:

  *(_QWORD *)(v5 + 48) = -[NSString copyWithZone:](self->_topic, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *guid;
  NSString *topic;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_41;
      }
      else if ((*((_BYTE *)a3 + 56) & 1) != 0)
      {
LABEL_41:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4))
          goto LABEL_41;
      }
      else if ((*((_BYTE *)a3 + 56) & 2) != 0)
      {
        goto LABEL_41;
      }
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_linkQuality != *((_DWORD *)a3 + 9))
          goto LABEL_41;
      }
      else if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
      {
        goto LABEL_41;
      }
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 0x40) == 0 || self->_receiveOffset != *((_DWORD *)a3 + 11))
          goto LABEL_41;
      }
      else if ((*((_BYTE *)a3 + 56) & 0x40) != 0)
      {
        goto LABEL_41;
      }
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 0x20) == 0 || self->_payloadSize != *((_DWORD *)a3 + 10))
          goto LABEL_41;
      }
      else if ((*((_BYTE *)a3 + 56) & 0x20) != 0)
      {
        goto LABEL_41;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_isFromStorage != *((_DWORD *)a3 + 8))
          goto LABEL_41;
      }
      else if ((*((_BYTE *)a3 + 56) & 8) != 0)
      {
        goto LABEL_41;
      }
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_dualChannelState != *((_DWORD *)a3 + 5))
          goto LABEL_41;
      }
      else if ((*((_BYTE *)a3 + 56) & 4) != 0)
      {
        goto LABEL_41;
      }
      topic = self->_topic;
      if ((unint64_t)topic | *((_QWORD *)a3 + 6))
        LOBYTE(v5) = -[NSString isEqual:](topic, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_guid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_connectionType;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_linkQuality;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_receiveOffset;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_payloadSize;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_15:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_topic, "hash");
  }
LABEL_13:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761 * self->_isFromStorage;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_8:
  v10 = 2654435761 * self->_dualChannelState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_topic, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 3))
    -[AWDPushReceivedSlow setGuid:](self, "setGuid:");
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_linkQuality = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  self->_receiveOffset = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  self->_payloadSize = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  self->_isFromStorage = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 56) & 4) != 0)
  {
LABEL_10:
    self->_dualChannelState = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_11:
  if (*((_QWORD *)a3 + 6))
    -[AWDPushReceivedSlow setTopic:](self, "setTopic:");
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (unsigned)receiveOffset
{
  return self->_receiveOffset;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (unsigned)isFromStorage
{
  return self->_isFromStorage;
}

- (unsigned)dualChannelState
{
  return self->_dualChannelState;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
