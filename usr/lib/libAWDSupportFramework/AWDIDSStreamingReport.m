@implementation AWDIDSStreamingReport

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSStreamingReport setService:](self, "setService:", 0);
  -[AWDIDSStreamingReport setStreamName:](self, "setStreamName:", 0);
  -[AWDIDSStreamingReport setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSStreamingReport;
  -[AWDIDSStreamingReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (BOOL)hasStreamName
{
  return self->_streamName != 0;
}

- (void)setSamplingInterval:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_samplingInterval = a3;
}

- (void)setHasSamplingInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSamplingInterval
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setBytesSent:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bytesSent = a3;
}

- (void)setHasBytesSent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBytesSent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPacketsSent:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_packetsSent = a3;
}

- (void)setHasPacketsSent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPacketsSent
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBytesReceived:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bytesReceived = a3;
}

- (void)setHasBytesReceived:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBytesReceived
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPacketsReceived:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_packetsReceived = a3;
}

- (void)setHasPacketsReceived:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPacketsReceived
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPriority:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPriority
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSStreamingReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSStreamingReport description](&v3, sel_description), -[AWDIDSStreamingReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *service;
  NSString *streamName;
  char has;
  NSString *guid;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  streamName = self->_streamName;
  if (streamName)
    objc_msgSend(v3, "setObject:forKey:", streamName, CFSTR("streamName"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_samplingInterval), CFSTR("samplingInterval"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesSent), CFSTR("bytesSent"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsSent), CFSTR("packetsSent"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesReceived), CFSTR("bytesReceived"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsReceived), CFSTR("packetsReceived"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_priority), CFSTR("priority"));
LABEL_14:
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSStreamingReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_service)
    PBDataWriterWriteStringField();
  if (self->_streamName)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_13:
    PBDataWriterWriteUint64Field();
LABEL_14:
  if (self->_guid)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_QWORD *)a3 + 7) = self->_timestamp;
    *((_BYTE *)a3 + 88) |= 0x40u;
  }
  if (self->_service)
    objc_msgSend(a3, "setService:");
  if (self->_streamName)
    objc_msgSend(a3, "setStreamName:");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_samplingInterval;
    *((_BYTE *)a3 + 88) |= 0x20u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)a3 + 2) = self->_bytesSent;
  *((_BYTE *)a3 + 88) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 4) = self->_packetsSent;
  *((_BYTE *)a3 + 88) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 1) = self->_bytesReceived;
  *((_BYTE *)a3 + 88) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_20:
  *((_QWORD *)a3 + 3) = self->_packetsReceived;
  *((_BYTE *)a3 + 88) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((_QWORD *)a3 + 5) = self->_priority;
    *((_BYTE *)a3 + 88) |= 0x10u;
  }
LABEL_14:
  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_timestamp;
    *(_BYTE *)(v5 + 88) |= 0x40u;
  }

  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_streamName, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_QWORD *)(v6 + 48) = self->_samplingInterval;
    *(_BYTE *)(v6 + 88) |= 0x20u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 16) = self->_bytesSent;
  *(_BYTE *)(v6 + 88) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *(_QWORD *)(v6 + 32) = self->_packetsSent;
  *(_BYTE *)(v6 + 88) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_15:
    *(_QWORD *)(v6 + 24) = self->_packetsReceived;
    *(_BYTE *)(v6 + 88) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  *(_QWORD *)(v6 + 8) = self->_bytesReceived;
  *(_BYTE *)(v6 + 88) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    *(_QWORD *)(v6 + 40) = self->_priority;
    *(_BYTE *)(v6 + 88) |= 0x10u;
  }
LABEL_10:

  *(_QWORD *)(v6 + 64) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *service;
  NSString *streamName;
  NSString *guid;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 88) & 0x40) == 0 || self->_timestamp != *((_QWORD *)a3 + 7))
        goto LABEL_43;
    }
    else if ((*((_BYTE *)a3 + 88) & 0x40) != 0)
    {
LABEL_43:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if (!((unint64_t)service | *((_QWORD *)a3 + 9)) || (v5 = -[NSString isEqual:](service, "isEqual:")) != 0)
    {
      streamName = self->_streamName;
      if (!((unint64_t)streamName | *((_QWORD *)a3 + 10))
        || (v5 = -[NSString isEqual:](streamName, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 0x20) != 0)
        {
          if ((*((_BYTE *)a3 + 88) & 0x20) == 0 || self->_samplingInterval != *((_QWORD *)a3 + 6))
            goto LABEL_43;
        }
        else if ((*((_BYTE *)a3 + 88) & 0x20) != 0)
        {
          goto LABEL_43;
        }
        if ((*(_BYTE *)&self->_has & 2) != 0)
        {
          if ((*((_BYTE *)a3 + 88) & 2) == 0 || self->_bytesSent != *((_QWORD *)a3 + 2))
            goto LABEL_43;
        }
        else if ((*((_BYTE *)a3 + 88) & 2) != 0)
        {
          goto LABEL_43;
        }
        if ((*(_BYTE *)&self->_has & 8) != 0)
        {
          if ((*((_BYTE *)a3 + 88) & 8) == 0 || self->_packetsSent != *((_QWORD *)a3 + 4))
            goto LABEL_43;
        }
        else if ((*((_BYTE *)a3 + 88) & 8) != 0)
        {
          goto LABEL_43;
        }
        if ((*(_BYTE *)&self->_has & 1) != 0)
        {
          if ((*((_BYTE *)a3 + 88) & 1) == 0 || self->_bytesReceived != *((_QWORD *)a3 + 1))
            goto LABEL_43;
        }
        else if ((*((_BYTE *)a3 + 88) & 1) != 0)
        {
          goto LABEL_43;
        }
        if ((*(_BYTE *)&self->_has & 4) != 0)
        {
          if ((*((_BYTE *)a3 + 88) & 4) == 0 || self->_packetsReceived != *((_QWORD *)a3 + 3))
            goto LABEL_43;
        }
        else if ((*((_BYTE *)a3 + 88) & 4) != 0)
        {
          goto LABEL_43;
        }
        if ((*(_BYTE *)&self->_has & 0x10) != 0)
        {
          if ((*((_BYTE *)a3 + 88) & 0x10) == 0 || self->_priority != *((_QWORD *)a3 + 5))
            goto LABEL_43;
        }
        else if ((*((_BYTE *)a3 + 88) & 0x10) != 0)
        {
          goto LABEL_43;
        }
        guid = self->_guid;
        if ((unint64_t)guid | *((_QWORD *)a3 + 8))
          LOBYTE(v5) = -[NSString isEqual:](guid, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_service, "hash");
  v5 = -[NSString hash](self->_streamName, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v6 = 2654435761u * self->_samplingInterval;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v7 = 2654435761u * self->_bytesSent;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_packetsSent;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_bytesReceived;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_15:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
LABEL_16:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_guid, "hash");
  }
LABEL_14:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_9:
  v10 = 2654435761u * self->_packetsReceived;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_16;
LABEL_10:
  v11 = 2654435761u * self->_priority;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_guid, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 88) & 0x40) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)a3 + 9))
    -[AWDIDSStreamingReport setService:](self, "setService:");
  if (*((_QWORD *)a3 + 10))
    -[AWDIDSStreamingReport setStreamName:](self, "setStreamName:");
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 0x20) != 0)
  {
    self->_samplingInterval = *((_QWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)a3 + 88);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)a3 + 88) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_bytesSent = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  self->_packetsSent = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  self->_bytesReceived = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_20:
  self->_packetsReceived = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 88) & 0x10) != 0)
  {
LABEL_13:
    self->_priority = *((_QWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_14:
  if (*((_QWORD *)a3 + 8))
    -[AWDIDSStreamingReport setGuid:](self, "setGuid:");
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
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (unint64_t)samplingInterval
{
  return self->_samplingInterval;
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

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
