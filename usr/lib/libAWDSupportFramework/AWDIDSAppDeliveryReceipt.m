@implementation AWDIDSAppDeliveryReceipt

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSAppDeliveryReceipt setService:](self, "setService:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSAppDeliveryReceipt;
  -[AWDIDSAppDeliveryReceipt dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setIsToDefaultPairedDevice:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isToDefaultPairedDevice = a3;
}

- (void)setHasIsToDefaultPairedDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsToDefaultPairedDevice
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMessageSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_messageSize = a3;
}

- (void)setHasMessageSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageSize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRTT:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_rTT = a3;
}

- (void)setHasRTT:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRTT
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPriority:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPriority
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSAppDeliveryReceipt;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSAppDeliveryReceipt description](&v3, sel_description), -[AWDIDSAppDeliveryReceipt dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *service;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_isToDefaultPairedDevice), CFSTR("isToDefaultPairedDevice"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
LABEL_13:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rTT), CFSTR("RTT"));
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return v3;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_messageSize), CFSTR("messageSize"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 4) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_priority), CFSTR("priority"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSAppDeliveryReceiptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_service)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 0x10u;
  }
  if (self->_service)
    objc_msgSend(a3, "setService:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_isToDefaultPairedDevice;
    *((_BYTE *)a3 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)a3 + 2) = self->_messageSize;
  *((_BYTE *)a3 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      return;
    goto LABEL_9;
  }
LABEL_13:
  *((_QWORD *)a3 + 4) = self->_rTT;
  *((_BYTE *)a3 + 56) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_9:
  *((_QWORD *)a3 + 3) = self->_priority;
  *((_BYTE *)a3 + 56) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 0x10u;
  }

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_isToDefaultPairedDevice;
    *(_BYTE *)(v6 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
LABEL_11:
      *(_QWORD *)(v6 + 32) = self->_rTT;
      *(_BYTE *)(v6 + 56) |= 8u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return (id)v6;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 16) = self->_messageSize;
  *(_BYTE *)(v6 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(_QWORD *)(v6 + 24) = self->_priority;
    *(_BYTE *)(v6 + 56) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *service;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 5))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((_QWORD *)a3 + 6))
    {
      v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_isToDefaultPairedDevice != *((_QWORD *)a3 + 1))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_messageSize != *((_QWORD *)a3 + 2))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_rTT != *((_QWORD *)a3 + 4))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 56) & 8) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_priority != *((_QWORD *)a3 + 3))
        goto LABEL_29;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_service, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761u * self->_isToDefaultPairedDevice;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v6 = 2654435761u * self->_messageSize;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761u * self->_rTT;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761u * self->_priority;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)a3 + 6))
    -[AWDIDSAppDeliveryReceipt setService:](self, "setService:");
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 1) != 0)
  {
    self->_isToDefaultPairedDevice = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_messageSize = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      return;
    goto LABEL_9;
  }
LABEL_13:
  self->_rTT = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 56) & 4) == 0)
    return;
LABEL_9:
  self->_priority = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
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
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unint64_t)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)rTT
{
  return self->_rTT;
}

- (unint64_t)priority
{
  return self->_priority;
}

@end
