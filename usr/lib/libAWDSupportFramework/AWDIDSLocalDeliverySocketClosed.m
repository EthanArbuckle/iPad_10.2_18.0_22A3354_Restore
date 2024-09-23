@implementation AWDIDSLocalDeliverySocketClosed

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSLocalDeliverySocketClosed setService:](self, "setService:", 0);
  -[AWDIDSLocalDeliverySocketClosed setStreamName:](self, "setStreamName:", 0);
  -[AWDIDSLocalDeliverySocketClosed setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSLocalDeliverySocketClosed;
  -[AWDIDSLocalDeliverySocketClosed dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTimestamp
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setIsToDefaultPairedDevice:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isToDefaultPairedDevice = a3;
}

- (void)setHasIsToDefaultPairedDevice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsToDefaultPairedDevice
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCloseError:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_closeError = a3;
}

- (void)setHasCloseError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCloseError
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSocketError:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_socketError = a3;
}

- (void)setHasSocketError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSocketError
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setBytesSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bytesSent = a3;
}

- (void)setHasBytesSent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBytesSent
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPacketsSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_packetsSent = a3;
}

- (void)setHasPacketsSent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPacketsSent
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setBytesReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bytesReceived = a3;
}

- (void)setHasBytesReceived:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBytesReceived
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPacketsReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_packetsReceived = a3;
}

- (void)setHasPacketsReceived:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPacketsReceived
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPriority:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasStreamName
{
  return self->_streamName != 0;
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSLocalDeliverySocketClosed;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSLocalDeliverySocketClosed description](&v3, sel_description), -[AWDIDSLocalDeliverySocketClosed dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *service;
  __int16 has;
  NSString *streamName;
  NSString *guid;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_isToDefaultPairedDevice), CFSTR("isToDefaultPairedDevice"));
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_21;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_closeError), CFSTR("closeError"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_socketError), CFSTR("socketError"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesSent), CFSTR("bytesSent"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsSent), CFSTR("packetsSent"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesReceived), CFSTR("bytesReceived"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsReceived), CFSTR("packetsReceived"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_priority), CFSTR("priority"));
LABEL_14:
  streamName = self->_streamName;
  if (streamName)
    objc_msgSend(v3, "setObject:forKey:", streamName, CFSTR("streamName"));
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSLocalDeliverySocketClosedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_service)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_13:
    PBDataWriterWriteUint64Field();
LABEL_14:
  if (self->_streamName)
    PBDataWriterWriteStringField();
  if (self->_guid)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_QWORD *)a3 + 9) = self->_timestamp;
    *((_WORD *)a3 + 52) |= 0x100u;
  }
  if (self->_service)
    objc_msgSend(a3, "setService:");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_isToDefaultPairedDevice;
    *((_WORD *)a3 + 52) |= 8u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)a3 + 3) = self->_closeError;
  *((_WORD *)a3 + 52) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 8) = self->_socketError;
  *((_WORD *)a3 + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 2) = self->_bytesSent;
  *((_WORD *)a3 + 52) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 6) = self->_packetsSent;
  *((_WORD *)a3 + 52) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 1) = self->_bytesReceived;
  *((_WORD *)a3 + 52) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  *((_QWORD *)a3 + 5) = self->_packetsReceived;
  *((_WORD *)a3 + 52) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    *((_QWORD *)a3 + 7) = self->_priority;
    *((_WORD *)a3 + 52) |= 0x40u;
  }
LABEL_14:
  if (self->_streamName)
    objc_msgSend(a3, "setStreamName:");
  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_timestamp;
    *(_WORD *)(v5 + 104) |= 0x100u;
  }

  *(_QWORD *)(v6 + 88) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_isToDefaultPairedDevice;
    *(_WORD *)(v6 + 104) |= 8u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 24) = self->_closeError;
  *(_WORD *)(v6 + 104) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_QWORD *)(v6 + 64) = self->_socketError;
  *(_WORD *)(v6 + 104) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *(_QWORD *)(v6 + 16) = self->_bytesSent;
  *(_WORD *)(v6 + 104) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *(_QWORD *)(v6 + 48) = self->_packetsSent;
  *(_WORD *)(v6 + 104) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
LABEL_19:
    *(_QWORD *)(v6 + 40) = self->_packetsReceived;
    *(_WORD *)(v6 + 104) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_18:
  *(_QWORD *)(v6 + 8) = self->_bytesReceived;
  *(_WORD *)(v6 + 104) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_19;
LABEL_10:
  if ((has & 0x40) != 0)
  {
LABEL_11:
    *(_QWORD *)(v6 + 56) = self->_priority;
    *(_WORD *)(v6 + 104) |= 0x40u;
  }
LABEL_12:

  *(_QWORD *)(v6 + 96) = -[NSString copyWithZone:](self->_streamName, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  NSString *service;
  __int16 v8;
  NSString *streamName;
  NSString *guid;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_timestamp != *((_QWORD *)a3 + 9))
        goto LABEL_54;
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
LABEL_54:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((_QWORD *)a3 + 11))
    {
      v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v8 = *((_WORD *)a3 + 52);
    if ((has & 8) != 0)
    {
      if ((v8 & 8) == 0 || self->_isToDefaultPairedDevice != *((_QWORD *)a3 + 4))
        goto LABEL_54;
    }
    else if ((v8 & 8) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 4) != 0)
    {
      if ((v8 & 4) == 0 || self->_closeError != *((_QWORD *)a3 + 3))
        goto LABEL_54;
    }
    else if ((v8 & 4) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x80) != 0)
    {
      if ((v8 & 0x80) == 0 || self->_socketError != *((_QWORD *)a3 + 8))
        goto LABEL_54;
    }
    else if ((v8 & 0x80) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 2) != 0)
    {
      if ((v8 & 2) == 0 || self->_bytesSent != *((_QWORD *)a3 + 2))
        goto LABEL_54;
    }
    else if ((v8 & 2) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x20) != 0)
    {
      if ((v8 & 0x20) == 0 || self->_packetsSent != *((_QWORD *)a3 + 6))
        goto LABEL_54;
    }
    else if ((v8 & 0x20) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 1) != 0)
    {
      if ((v8 & 1) == 0 || self->_bytesReceived != *((_QWORD *)a3 + 1))
        goto LABEL_54;
    }
    else if ((v8 & 1) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x10) != 0)
    {
      if ((v8 & 0x10) == 0 || self->_packetsReceived != *((_QWORD *)a3 + 5))
        goto LABEL_54;
    }
    else if ((v8 & 0x10) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x40) != 0)
    {
      if ((v8 & 0x40) == 0 || self->_priority != *((_QWORD *)a3 + 7))
        goto LABEL_54;
    }
    else if ((v8 & 0x40) != 0)
    {
      goto LABEL_54;
    }
    streamName = self->_streamName;
    if (!((unint64_t)streamName | *((_QWORD *)a3 + 12))
      || (v5 = -[NSString isEqual:](streamName, "isEqual:")) != 0)
    {
      guid = self->_guid;
      if ((unint64_t)guid | *((_QWORD *)a3 + 10))
        LOBYTE(v5) = -[NSString isEqual:](guid, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSUInteger v14;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_service, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v6 = 2654435761u * self->_isToDefaultPairedDevice;
    if ((has & 4) != 0)
    {
LABEL_6:
      v7 = 2654435761u * self->_closeError;
      if ((has & 0x80) != 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = 0;
    if ((has & 4) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_socketError;
    if ((has & 2) != 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_bytesSent;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_packetsSent;
    if ((has & 1) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
  if ((has & 1) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_bytesReceived;
    if ((has & 0x10) != 0)
      goto LABEL_11;
LABEL_19:
    v12 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_12;
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
LABEL_18:
  v11 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_19;
LABEL_11:
  v12 = 2654435761u * self->_packetsReceived;
  if ((has & 0x40) == 0)
    goto LABEL_20;
LABEL_12:
  v13 = 2654435761u * self->_priority;
LABEL_21:
  v14 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSString hash](self->_streamName, "hash");
  return v14 ^ -[NSString hash](self->_guid, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if ((*((_WORD *)a3 + 52) & 0x100) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)a3 + 11))
    -[AWDIDSLocalDeliverySocketClosed setService:](self, "setService:");
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 8) != 0)
  {
    self->_isToDefaultPairedDevice = *((_QWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)a3 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_closeError = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_socketError = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_bytesSent = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  self->_packetsSent = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  self->_bytesReceived = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  self->_packetsReceived = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 52) & 0x40) != 0)
  {
LABEL_13:
    self->_priority = *((_QWORD *)a3 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_14:
  if (*((_QWORD *)a3 + 12))
    -[AWDIDSLocalDeliverySocketClosed setStreamName:](self, "setStreamName:");
  if (*((_QWORD *)a3 + 10))
    -[AWDIDSLocalDeliverySocketClosed setGuid:](self, "setGuid:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unint64_t)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (unint64_t)closeError
{
  return self->_closeError;
}

- (unint64_t)socketError
{
  return self->_socketError;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (unint64_t)packetsSent
{
  return self->_packetsSent;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (unint64_t)packetsReceived
{
  return self->_packetsReceived;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
