@implementation AWDIDSWebTunnelRequestCompleted

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSWebTunnelRequestCompleted setServiceIdentifier:](self, "setServiceIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSWebTunnelRequestCompleted;
  -[AWDIDSWebTunnelRequestCompleted dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)setTimeTaken:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timeTaken = a3;
}

- (void)setHasTimeTaken:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeTaken
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeliveryType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_deliveryType = a3;
}

- (void)setHasDeliveryType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeliveryType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTunnelError:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_tunnelError = a3;
}

- (void)setHasTunnelError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTunnelError
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRequestSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestSize = a3;
}

- (void)setHasRequestSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReversePushAttempted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_reversePushAttempted = a3;
}

- (void)setHasReversePushAttempted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasReversePushAttempted
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSWebTunnelRequestCompleted;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSWebTunnelRequestCompleted description](&v3, sel_description), -[AWDIDSWebTunnelRequestCompleted dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *serviceIdentifier;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeTaken), CFSTR("timeTaken"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deliveryType), CFSTR("deliveryType"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestSize), CFSTR("requestSize"));
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_10;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_tunnelError), CFSTR("tunnelError"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_9:
  if ((has & 0x20) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reversePushAttempted), CFSTR("reversePushAttempted"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSWebTunnelRequestCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_serviceIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      return;
LABEL_15:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 4u;
  }
  if (self->_serviceIdentifier)
    objc_msgSend(a3, "setServiceIdentifier:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timeTaken;
    *((_BYTE *)a3 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 8) = self->_deliveryType;
  *((_BYTE *)a3 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 12) = self->_tunnelError;
  *((_BYTE *)a3 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      return;
    goto LABEL_10;
  }
LABEL_15:
  *((_QWORD *)a3 + 1) = self->_requestSize;
  *((_BYTE *)a3 + 56) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return;
LABEL_10:
  *((_BYTE *)a3 + 52) = self->_reversePushAttempted;
  *((_BYTE *)a3 + 56) |= 0x20u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 4u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_timeTaken;
    *(_BYTE *)(v6 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 32) = self->_deliveryType;
  *(_BYTE *)(v6 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
LABEL_13:
    *(_QWORD *)(v6 + 8) = self->_requestSize;
    *(_BYTE *)(v6 + 56) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v6;
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 48) = self->_tunnelError;
  *(_BYTE *)(v6 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 52) = self->_reversePushAttempted;
    *(_BYTE *)(v6 + 56) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *serviceIdentifier;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_32;
    }
    else if ((*((_BYTE *)a3 + 56) & 4) != 0)
    {
      goto LABEL_32;
    }
    serviceIdentifier = self->_serviceIdentifier;
    if ((unint64_t)serviceIdentifier | *((_QWORD *)a3 + 5))
    {
      v5 = -[NSString isEqual:](serviceIdentifier, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_timeTaken != *((_QWORD *)a3 + 2))
        goto LABEL_32;
    }
    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
      goto LABEL_32;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_deliveryType != *((_DWORD *)a3 + 8))
        goto LABEL_32;
    }
    else if ((*((_BYTE *)a3 + 56) & 8) != 0)
    {
      goto LABEL_32;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_tunnelError != *((_DWORD *)a3 + 12))
        goto LABEL_32;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_32;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_requestSize != *((_QWORD *)a3 + 1))
        goto LABEL_32;
    }
    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
      goto LABEL_32;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x20) == 0)
      {
LABEL_32:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_reversePushAttempted)
      {
        if (!*((_BYTE *)a3 + 52))
          goto LABEL_32;
      }
      else if (*((_BYTE *)a3 + 52))
      {
        goto LABEL_32;
      }
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
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_serviceIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761u * self->_timeTaken;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_deliveryType;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_tunnelError;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
LABEL_13:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_9;
LABEL_14:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_8:
  v8 = 2654435761u * self->_requestSize;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_9:
  v9 = 2654435761 * self->_reversePushAttempted;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 56) & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDIDSWebTunnelRequestCompleted setServiceIdentifier:](self, "setServiceIdentifier:");
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timeTaken = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 56);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_deliveryType = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  self->_tunnelError = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      return;
    goto LABEL_10;
  }
LABEL_15:
  self->_requestSize = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 56) & 0x20) == 0)
    return;
LABEL_10:
  self->_reversePushAttempted = *((_BYTE *)a3 + 52);
  *(_BYTE *)&self->_has |= 0x20u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)timeTaken
{
  return self->_timeTaken;
}

- (int)deliveryType
{
  return self->_deliveryType;
}

- (int)tunnelError
{
  return self->_tunnelError;
}

- (unint64_t)requestSize
{
  return self->_requestSize;
}

- (BOOL)reversePushAttempted
{
  return self->_reversePushAttempted;
}

@end
