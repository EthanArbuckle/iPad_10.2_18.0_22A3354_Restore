@implementation AWDIDSMessageDeliveryPath

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSMessageDeliveryPath setService:](self, "setService:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSMessageDeliveryPath;
  -[AWDIDSMessageDeliveryPath dealloc](&v3, sel_dealloc);
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

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setDeliveryPathType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deliveryPathType = a3;
}

- (void)setHasDeliveryPathType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeliveryPathType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSMessageDeliveryPath;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSMessageDeliveryPath description](&v3, sel_description), -[AWDIDSMessageDeliveryPath dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *service;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_deliveryPathType), CFSTR("deliveryPathType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSMessageDeliveryPathReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_service)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_service)
    objc_msgSend(a3, "setService:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_deliveryPathType;
    *((_BYTE *)a3 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_deliveryPathType;
    *(_BYTE *)(v6 + 32) |= 2u;
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
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((_QWORD *)a3 + 3))
    {
      v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_deliveryPathType != *((_DWORD *)a3 + 4))
        goto LABEL_14;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_service, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_deliveryPathType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDIDSMessageDeliveryPath setService:](self, "setService:");
  if ((*((_BYTE *)a3 + 32) & 2) != 0)
  {
    self->_deliveryPathType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
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
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)deliveryPathType
{
  return self->_deliveryPathType;
}

@end
