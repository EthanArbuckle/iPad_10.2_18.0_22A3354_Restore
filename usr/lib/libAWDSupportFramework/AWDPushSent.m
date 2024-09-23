@implementation AWDPushSent

- (void)dealloc
{
  objc_super v3;

  -[AWDPushSent setGuid:](self, "setGuid:", 0);
  -[AWDPushSent setTopic:](self, "setTopic:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPushSent;
  -[AWDPushSent dealloc](&v3, sel_dealloc);
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
  *(_BYTE *)&self->_has |= 0x20u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setFlushes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_flushes = a3;
}

- (void)setHasFlushes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFlushes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSendDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_sendDuration = a3;
}

- (void)setHasSendDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSendDuration
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setPayloadSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_payloadSize = a3;
}

- (void)setHasPayloadSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPayloadSize
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setError:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasError
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
  v3.super_class = (Class)AWDPushSent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPushSent description](&v3, sel_description), -[AWDPushSent dictionaryRepresentation](self, "dictionaryRepresentation"));
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
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flushes), CFSTR("flushes"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sendDuration), CFSTR("sendDuration"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_payloadSize), CFSTR("payloadSize"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_error), CFSTR("error"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_11:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dualChannelState), CFSTR("dualChannelState"));
LABEL_12:
  topic = self->_topic;
  if (topic)
    objc_msgSend(v4, "setObject:forKey:", topic, CFSTR("topic"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushSentReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field();
LABEL_12:
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
    *((_BYTE *)a3 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_BYTE *)a3 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_linkQuality;
  *((_BYTE *)a3 + 64) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 7) = self->_flushes;
  *((_BYTE *)a3 + 64) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 12) = self->_sendDuration;
  *((_BYTE *)a3 + 64) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_payloadSize;
  *((_BYTE *)a3 + 64) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  *((_DWORD *)a3 + 6) = self->_error;
  *((_BYTE *)a3 + 64) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)a3 + 5) = self->_dualChannelState;
    *((_BYTE *)a3 + 64) |= 4u;
  }
LABEL_12:
  if (self->_topic)
    objc_msgSend(a3, "setTopic:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectionType;
  *(_BYTE *)(v5 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 40) = self->_linkQuality;
  *(_BYTE *)(v5 + 64) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 28) = self->_flushes;
  *(_BYTE *)(v5 + 64) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 48) = self->_sendDuration;
  *(_BYTE *)(v5 + 64) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    *(_DWORD *)(v5 + 24) = self->_error;
    *(_BYTE *)(v5 + 64) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  *(_DWORD *)(v5 + 44) = self->_payloadSize;
  *(_BYTE *)(v5 + 64) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 20) = self->_dualChannelState;
    *(_BYTE *)(v5 + 64) |= 4u;
  }
LABEL_10:

  *(_QWORD *)(v5 + 56) = -[NSString copyWithZone:](self->_topic, "copyWithZone:", a3);
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
    if (!((unint64_t)guid | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_46;
      }
      else if ((*((_BYTE *)a3 + 64) & 1) != 0)
      {
        goto LABEL_46;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4))
          goto LABEL_46;
      }
      else if ((*((_BYTE *)a3 + 64) & 2) != 0)
      {
        goto LABEL_46;
      }
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
      {
        if ((*((_BYTE *)a3 + 64) & 0x20) == 0 || self->_linkQuality != *((_DWORD *)a3 + 10))
          goto LABEL_46;
      }
      else if ((*((_BYTE *)a3 + 64) & 0x20) != 0)
      {
        goto LABEL_46;
      }
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 64) & 0x10) == 0 || self->_flushes != *((_DWORD *)a3 + 7))
          goto LABEL_46;
      }
      else if ((*((_BYTE *)a3 + 64) & 0x10) != 0)
      {
        goto LABEL_46;
      }
      if ((*(_BYTE *)&self->_has & 0x80) != 0)
      {
        if ((*((_BYTE *)a3 + 64) & 0x80) == 0 || self->_sendDuration != *((_DWORD *)a3 + 12))
          goto LABEL_46;
      }
      else if ((*((_BYTE *)a3 + 64) & 0x80) != 0)
      {
LABEL_46:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
      {
        if ((*((_BYTE *)a3 + 64) & 0x40) == 0 || self->_payloadSize != *((_DWORD *)a3 + 11))
          goto LABEL_46;
      }
      else if ((*((_BYTE *)a3 + 64) & 0x40) != 0)
      {
        goto LABEL_46;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 64) & 8) == 0 || self->_error != *((_DWORD *)a3 + 6))
          goto LABEL_46;
      }
      else if ((*((_BYTE *)a3 + 64) & 8) != 0)
      {
        goto LABEL_46;
      }
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 64) & 4) == 0 || self->_dualChannelState != *((_DWORD *)a3 + 5))
          goto LABEL_46;
      }
      else if ((*((_BYTE *)a3 + 64) & 4) != 0)
      {
        goto LABEL_46;
      }
      topic = self->_topic;
      if ((unint64_t)topic | *((_QWORD *)a3 + 7))
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
  uint64_t v11;

  v3 = -[NSString hash](self->_guid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_connectionType;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_linkQuality;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_flushes;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_sendDuration;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_payloadSize;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_16:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_17:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_topic, "hash");
  }
LABEL_15:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_16;
LABEL_8:
  v10 = 2654435761 * self->_error;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_17;
LABEL_9:
  v11 = 2654435761 * self->_dualChannelState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_topic, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 4))
    -[AWDPushSent setGuid:](self, "setGuid:");
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 64);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)a3 + 64) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_linkQuality = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_flushes = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  self->_sendDuration = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  self->_payloadSize = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  self->_error = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 64) & 4) != 0)
  {
LABEL_11:
    self->_dualChannelState = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((_QWORD *)a3 + 7))
    -[AWDPushSent setTopic:](self, "setTopic:");
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
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

- (unsigned)flushes
{
  return self->_flushes;
}

- (unsigned)sendDuration
{
  return self->_sendDuration;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (unsigned)error
{
  return self->_error;
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
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
