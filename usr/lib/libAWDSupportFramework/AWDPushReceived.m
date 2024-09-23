@implementation AWDPushReceived

- (void)dealloc
{
  objc_super v3;

  -[AWDPushReceived setGuid:](self, "setGuid:", 0);
  -[AWDPushReceived setTopic:](self, "setTopic:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPushReceived;
  -[AWDPushReceived dealloc](&v3, sel_dealloc);
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

- (int)wakeStatus
{
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    return self->_wakeStatus;
  else
    return 0;
}

- (void)setWakeStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_wakeStatus = a3;
}

- (void)setHasWakeStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasWakeStatus
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)wakeStatusAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DF98[a3];
}

- (int)StringAsWakeStatus:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Wake")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NoWake")))
    return 2;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPushReceived;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPushReceived description](&v3, sel_description), -[AWDPushReceived dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guid;
  char has;
  NSString *topic;
  uint64_t wakeStatus;
  __CFString *v9;

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
      goto LABEL_18;
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
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_receiveOffset), CFSTR("receiveOffset"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_payloadSize), CFSTR("payloadSize"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_21:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isFromStorage), CFSTR("isFromStorage"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_10:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dualChannelState), CFSTR("dualChannelState"));
LABEL_11:
  topic = self->_topic;
  if (topic)
    objc_msgSend(v4, "setObject:forKey:", topic, CFSTR("topic"));
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    wakeStatus = self->_wakeStatus;
    if (wakeStatus >= 3)
      v9 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_wakeStatus);
    else
      v9 = off_24C10DF98[wakeStatus];
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("wakeStatus"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushReceivedReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_17;
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
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:
  if (self->_topic)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteInt32Field();
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
    *((_BYTE *)a3 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_BYTE *)a3 + 60) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 9) = self->_linkQuality;
  *((_BYTE *)a3 + 60) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_receiveOffset;
  *((_BYTE *)a3 + 60) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 10) = self->_payloadSize;
  *((_BYTE *)a3 + 60) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_21:
  *((_DWORD *)a3 + 8) = self->_isFromStorage;
  *((_BYTE *)a3 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 5) = self->_dualChannelState;
    *((_BYTE *)a3 + 60) |= 4u;
  }
LABEL_11:
  if (self->_topic)
    objc_msgSend(a3, "setTopic:");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_wakeStatus;
    *((_BYTE *)a3 + 60) |= 0x80u;
  }
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
    *(_BYTE *)(v5 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectionType;
  *(_BYTE *)(v5 + 60) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 36) = self->_linkQuality;
  *(_BYTE *)(v5 + 60) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 44) = self->_receiveOffset;
  *(_BYTE *)(v5 + 60) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 40) = self->_payloadSize;
  *(_BYTE *)(v5 + 60) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  *(_DWORD *)(v5 + 32) = self->_isFromStorage;
  *(_BYTE *)(v5 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 20) = self->_dualChannelState;
    *(_BYTE *)(v5 + 60) |= 4u;
  }
LABEL_9:

  *(_QWORD *)(v5 + 48) = -[NSString copyWithZone:](self->_topic, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_wakeStatus;
    *(_BYTE *)(v5 + 60) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *guid;
  char has;
  NSString *topic;
  int v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      has = (char)self->_has;
      if ((has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_47;
      }
      else if ((*((_BYTE *)a3 + 60) & 1) != 0)
      {
LABEL_47:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4))
          goto LABEL_47;
      }
      else if ((*((_BYTE *)a3 + 60) & 2) != 0)
      {
        goto LABEL_47;
      }
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 0x10) == 0 || self->_linkQuality != *((_DWORD *)a3 + 9))
          goto LABEL_47;
      }
      else if ((*((_BYTE *)a3 + 60) & 0x10) != 0)
      {
        goto LABEL_47;
      }
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 0x40) == 0 || self->_receiveOffset != *((_DWORD *)a3 + 11))
          goto LABEL_47;
      }
      else if ((*((_BYTE *)a3 + 60) & 0x40) != 0)
      {
        goto LABEL_47;
      }
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 0x20) == 0 || self->_payloadSize != *((_DWORD *)a3 + 10))
          goto LABEL_47;
      }
      else if ((*((_BYTE *)a3 + 60) & 0x20) != 0)
      {
        goto LABEL_47;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 8) == 0 || self->_isFromStorage != *((_DWORD *)a3 + 8))
          goto LABEL_47;
      }
      else if ((*((_BYTE *)a3 + 60) & 8) != 0)
      {
        goto LABEL_47;
      }
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 4) == 0 || self->_dualChannelState != *((_DWORD *)a3 + 5))
          goto LABEL_47;
      }
      else if ((*((_BYTE *)a3 + 60) & 4) != 0)
      {
        goto LABEL_47;
      }
      topic = self->_topic;
      if ((unint64_t)topic | *((_QWORD *)a3 + 6))
      {
        v5 = -[NSString isEqual:](topic, "isEqual:");
        if (!v5)
          return v5;
        has = (char)self->_has;
      }
      v9 = *((char *)a3 + 60);
      if (has < 0)
      {
        if ((v9 & 0x80000000) == 0 || self->_wakeStatus != *((_DWORD *)a3 + 14))
          goto LABEL_47;
        LOBYTE(v5) = 1;
      }
      else
      {
        LOBYTE(v5) = v9 >= 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v14;

  v3 = -[NSString hash](self->_guid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v14 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_connectionType;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_linkQuality;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_receiveOffset;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_payloadSize;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_isFromStorage;
    goto LABEL_14;
  }
LABEL_13:
  v8 = 0;
LABEL_14:
  v9 = v3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v10 = 2654435761 * self->_dualChannelState;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_topic, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v12 = 2654435761 * self->_wakeStatus;
  else
    v12 = 0;
  return v14 ^ v9 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 3))
    -[AWDPushReceived setGuid:](self, "setGuid:");
  v5 = *((_BYTE *)a3 + 60);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 60);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)a3 + 60) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 60);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_linkQuality = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 60);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_receiveOffset = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)a3 + 60);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_payloadSize = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 60);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_21:
  self->_isFromStorage = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 60) & 4) != 0)
  {
LABEL_10:
    self->_dualChannelState = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_11:
  if (*((_QWORD *)a3 + 6))
    -[AWDPushReceived setTopic:](self, "setTopic:");
  if (*((char *)a3 + 60) < 0)
  {
    self->_wakeStatus = *((_DWORD *)a3 + 14);
    *(_BYTE *)&self->_has |= 0x80u;
  }
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
