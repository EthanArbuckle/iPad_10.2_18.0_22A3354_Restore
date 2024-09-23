@implementation AWDIDSQRAllocation

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSQRAllocation setTopic:](self, "setTopic:", 0);
  -[AWDIDSQRAllocation setService:](self, "setService:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSQRAllocation;
  -[AWDIDSQRAllocation dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setResult:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasResult
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasRecipientAccepted:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasRecipientAccepted = a3;
}

- (void)setHasHasRecipientAccepted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasRecipientAccepted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPayloadSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_payloadSize = a3;
}

- (void)setHasPayloadSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPayloadSize
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSQRAllocation;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSQRAllocation description](&v3, sel_description), -[AWDIDSQRAllocation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *topic;
  NSString *service;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_result), CFSTR("result"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hasRecipientAccepted), CFSTR("hasRecipientAccepted"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_payloadSize), CFSTR("payloadSize"));
LABEL_7:
  topic = self->_topic;
  if (topic)
    objc_msgSend(v3, "setObject:forKey:", topic, CFSTR("topic"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSQRAllocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_topic)
    PBDataWriterWriteStringField();
  if (self->_service)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = self->_duration;
  *((_BYTE *)a3 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 8) = self->_result;
  *((_BYTE *)a3 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  *((_DWORD *)a3 + 6) = self->_hasRecipientAccepted;
  *((_BYTE *)a3 + 56) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 7) = self->_payloadSize;
    *((_BYTE *)a3 + 56) |= 8u;
  }
LABEL_7:
  if (self->_topic)
    objc_msgSend(a3, "setTopic:");
  if (self->_service)
    objc_msgSend(a3, "setService:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_duration;
  *(_BYTE *)(v5 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    *(_DWORD *)(v5 + 24) = self->_hasRecipientAccepted;
    *(_BYTE *)(v5 + 56) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 32) = self->_result;
  *(_BYTE *)(v5 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 28) = self->_payloadSize;
    *(_BYTE *)(v5 + 56) |= 8u;
  }
LABEL_7:

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_topic, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *topic;
  NSString *service;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
LABEL_31:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_result != *((_DWORD *)a3 + 8))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_hasRecipientAccepted != *((_DWORD *)a3 + 6))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 4) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_payloadSize != *((_DWORD *)a3 + 7))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 56) & 8) != 0)
    {
      goto LABEL_31;
    }
    topic = self->_topic;
    if (!((unint64_t)topic | *((_QWORD *)a3 + 6)) || (v5 = -[NSString isEqual:](topic, "isEqual:")) != 0)
    {
      service = self->_service;
      if ((unint64_t)service | *((_QWORD *)a3 + 5))
        LOBYTE(v5) = -[NSString isEqual:](service, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_duration;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_result;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_hasRecipientAccepted;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_payloadSize;
LABEL_12:
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_topic, "hash");
  return v8 ^ -[NSString hash](self->_service, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 56);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_result = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  self->_hasRecipientAccepted = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 56) & 8) != 0)
  {
LABEL_6:
    self->_payloadSize = *((_DWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_7:
  if (*((_QWORD *)a3 + 6))
    -[AWDIDSQRAllocation setTopic:](self, "setTopic:");
  if (*((_QWORD *)a3 + 5))
    -[AWDIDSQRAllocation setService:](self, "setService:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)hasRecipientAccepted
{
  return self->_hasRecipientAccepted;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
