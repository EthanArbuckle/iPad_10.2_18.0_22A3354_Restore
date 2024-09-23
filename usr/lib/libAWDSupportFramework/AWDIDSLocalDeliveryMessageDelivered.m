@implementation AWDIDSLocalDeliveryMessageDelivered

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSLocalDeliveryMessageDelivered setService:](self, "setService:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSLocalDeliveryMessageDelivered;
  -[AWDIDSLocalDeliveryMessageDelivered dealloc](&v3, sel_dealloc);
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

- (void)setIsToDefaultPairedDevice:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isToDefaultPairedDevice = a3;
}

- (void)setHasIsToDefaultPairedDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsToDefaultPairedDevice
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMessageSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_messageSize = a3;
}

- (void)setHasMessageSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMessageSize
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDeliveryError:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deliveryError = a3;
}

- (void)setHasDeliveryError:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeliveryError
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRTT:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rTT = a3;
}

- (void)setHasRTT:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRTT
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLinkType:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLinkType
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

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSLocalDeliveryMessageDelivered;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSLocalDeliveryMessageDelivered description](&v3, sel_description), -[AWDIDSLocalDeliveryMessageDelivered dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *service;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_isToDefaultPairedDevice), CFSTR("isToDefaultPairedDevice"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_messageSize), CFSTR("messageSize"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_deliveryError), CFSTR("deliveryError"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_linkType), CFSTR("linkType"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rTT), CFSTR("RTT"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_10:
  if ((has & 0x10) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_priority), CFSTR("priority"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSLocalDeliveryMessageDeliveredReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_service)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      return;
LABEL_17:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_17;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_QWORD *)a3 + 7) = self->_timestamp;
    *((_BYTE *)a3 + 72) |= 0x40u;
  }
  if (self->_service)
    objc_msgSend(a3, "setService:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_isToDefaultPairedDevice;
    *((_BYTE *)a3 + 72) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)a3 + 4) = self->_messageSize;
  *((_BYTE *)a3 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)a3 + 1) = self->_deliveryError;
  *((_BYTE *)a3 + 72) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 6) = self->_rTT;
  *((_BYTE *)a3 + 72) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      return;
    goto LABEL_11;
  }
LABEL_17:
  *((_QWORD *)a3 + 3) = self->_linkType;
  *((_BYTE *)a3 + 72) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return;
LABEL_11:
  *((_QWORD *)a3 + 5) = self->_priority;
  *((_BYTE *)a3 + 72) |= 0x10u;
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
    *(_BYTE *)(v5 + 72) |= 0x40u;
  }

  *(_QWORD *)(v6 + 64) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_isToDefaultPairedDevice;
    *(_BYTE *)(v6 + 72) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 32) = self->_messageSize;
  *(_BYTE *)(v6 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *(_QWORD *)(v6 + 8) = self->_deliveryError;
  *(_BYTE *)(v6 + 72) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_15:
    *(_QWORD *)(v6 + 24) = self->_linkType;
    *(_BYTE *)(v6 + 72) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v6;
    goto LABEL_9;
  }
LABEL_14:
  *(_QWORD *)(v6 + 48) = self->_rTT;
  *(_BYTE *)(v6 + 72) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    *(_QWORD *)(v6 + 40) = self->_priority;
    *(_BYTE *)(v6 + 72) |= 0x10u;
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
    if ((has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x40) == 0 || self->_timestamp != *((_QWORD *)a3 + 7))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x40) != 0)
    {
LABEL_39:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((_QWORD *)a3 + 8))
    {
      v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 2) == 0 || self->_isToDefaultPairedDevice != *((_QWORD *)a3 + 2))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 2) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 8) == 0 || self->_messageSize != *((_QWORD *)a3 + 4))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 8) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 1) == 0 || self->_deliveryError != *((_QWORD *)a3 + 1))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 1) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x20) == 0 || self->_rTT != *((_QWORD *)a3 + 6))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x20) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 4) == 0 || self->_linkType != *((_QWORD *)a3 + 3))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 4) != 0)
    {
      goto LABEL_39;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 72) & 0x10) == 0;
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x10) == 0 || self->_priority != *((_QWORD *)a3 + 5))
        goto LABEL_39;
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
  unint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_service, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761u * self->_isToDefaultPairedDevice;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v6 = 2654435761u * self->_messageSize;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    v7 = 2654435761u * self->_deliveryError;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v8 = 2654435761u * self->_rTT;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_15:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
LABEL_16:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_9:
  v9 = 2654435761u * self->_linkType;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_16;
LABEL_10:
  v10 = 2654435761u * self->_priority;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 72) & 0x40) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)a3 + 8))
    -[AWDIDSLocalDeliveryMessageDelivered setService:](self, "setService:");
  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 2) != 0)
  {
    self->_isToDefaultPairedDevice = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 72);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)a3 + 72) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_messageSize = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  self->_deliveryError = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  self->_rTT = *((_QWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      return;
    goto LABEL_11;
  }
LABEL_17:
  self->_linkType = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 72) & 0x10) == 0)
    return;
LABEL_11:
  self->_priority = *((_QWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
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
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unint64_t)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)deliveryError
{
  return self->_deliveryError;
}

- (unint64_t)rTT
{
  return self->_rTT;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)priority
{
  return self->_priority;
}

@end
