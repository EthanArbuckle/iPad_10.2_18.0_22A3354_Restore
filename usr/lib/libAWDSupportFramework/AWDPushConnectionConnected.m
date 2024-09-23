@implementation AWDPushConnectionConnected

- (void)dealloc
{
  objc_super v3;

  -[AWDPushConnectionConnected setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPushConnectionConnected;
  -[AWDPushConnectionConnected dealloc](&v3, sel_dealloc);
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

- (void)setConnectDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_connectDuration = a3;
}

- (void)setHasConnectDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (void)setDualChannelState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_dualChannelState = a3;
}

- (void)setHasDualChannelState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDualChannelState
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDnsDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_dnsDuration = a3;
}

- (void)setHasDnsDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDnsDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTlsDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_tlsDuration = a3;
}

- (void)setHasTlsDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTlsDuration
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPushConnectionConnected;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPushConnectionConnected description](&v3, sel_description), -[AWDPushConnectionConnected dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guid;
  char has;

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
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectDuration), CFSTR("connectDuration"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_17:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dnsDuration), CFSTR("dnsDuration"));
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v4;
    goto LABEL_10;
  }
LABEL_16:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dualChannelState), CFSTR("dualChannelState"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_9:
  if ((has & 0x40) != 0)
LABEL_10:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tlsDuration), CFSTR("tlsDuration"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushConnectionConnectedReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      return;
LABEL_17:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    goto LABEL_17;
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
    *((_BYTE *)a3 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectDuration;
  *((_BYTE *)a3 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_connectionType;
  *((_BYTE *)a3 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 10) = self->_linkQuality;
  *((_BYTE *)a3 + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 7) = self->_dualChannelState;
  *((_BYTE *)a3 + 48) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      return;
    goto LABEL_10;
  }
LABEL_17:
  *((_DWORD *)a3 + 6) = self->_dnsDuration;
  *((_BYTE *)a3 + 48) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    return;
LABEL_10:
  *((_DWORD *)a3 + 11) = self->_tlsDuration;
  *((_BYTE *)a3 + 48) |= 0x40u;
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
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectDuration;
  *(_BYTE *)(v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 20) = self->_connectionType;
  *(_BYTE *)(v5 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 40) = self->_linkQuality;
  *(_BYTE *)(v5 + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
LABEL_15:
    *(_DWORD *)(v5 + 24) = self->_dnsDuration;
    *(_BYTE *)(v5 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return (id)v5;
    goto LABEL_8;
  }
LABEL_14:
  *(_DWORD *)(v5 + 28) = self->_dualChannelState;
  *(_BYTE *)(v5 + 48) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 44) = self->_tlsDuration;
    *(_BYTE *)(v5 + 48) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *guid;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_38;
      }
      else if ((*((_BYTE *)a3 + 48) & 1) != 0)
      {
LABEL_38:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_connectDuration != *((_DWORD *)a3 + 4))
          goto LABEL_38;
      }
      else if ((*((_BYTE *)a3 + 48) & 2) != 0)
      {
        goto LABEL_38;
      }
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 5))
          goto LABEL_38;
      }
      else if ((*((_BYTE *)a3 + 48) & 4) != 0)
      {
        goto LABEL_38;
      }
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 0x20) == 0 || self->_linkQuality != *((_DWORD *)a3 + 10))
          goto LABEL_38;
      }
      else if ((*((_BYTE *)a3 + 48) & 0x20) != 0)
      {
        goto LABEL_38;
      }
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 0x10) == 0 || self->_dualChannelState != *((_DWORD *)a3 + 7))
          goto LABEL_38;
      }
      else if ((*((_BYTE *)a3 + 48) & 0x10) != 0)
      {
        goto LABEL_38;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_dnsDuration != *((_DWORD *)a3 + 6))
          goto LABEL_38;
      }
      else if ((*((_BYTE *)a3 + 48) & 8) != 0)
      {
        goto LABEL_38;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 0x40) == 0;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 0x40) == 0 || self->_tlsDuration != *((_DWORD *)a3 + 11))
          goto LABEL_38;
        LOBYTE(v5) = 1;
      }
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
      v5 = 2654435761 * self->_connectDuration;
      if ((*(_BYTE *)&self->_has & 4) != 0)
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
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_connectionType;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_linkQuality;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_dualChannelState;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_13:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761 * self->_dnsDuration;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v10 = 2654435761 * self->_tlsDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 4))
    -[AWDPushConnectionConnected setGuid:](self, "setGuid:");
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectDuration = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_connectionType = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  self->_linkQuality = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  self->_dualChannelState = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0)
      return;
    goto LABEL_10;
  }
LABEL_17:
  self->_dnsDuration = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 48) & 0x40) == 0)
    return;
LABEL_10:
  self->_tlsDuration = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
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

- (unsigned)connectDuration
{
  return self->_connectDuration;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (unsigned)dualChannelState
{
  return self->_dualChannelState;
}

- (unsigned)dnsDuration
{
  return self->_dnsDuration;
}

- (unsigned)tlsDuration
{
  return self->_tlsDuration;
}

@end
