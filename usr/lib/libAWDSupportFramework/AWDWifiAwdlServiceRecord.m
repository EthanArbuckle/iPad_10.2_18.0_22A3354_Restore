@implementation AWDWifiAwdlServiceRecord

- (void)dealloc
{
  objc_super v3;

  -[AWDWifiAwdlServiceRecord setServiceKey:](self, "setServiceKey:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiAwdlServiceRecord;
  -[AWDWifiAwdlServiceRecord dealloc](&v3, sel_dealloc);
}

- (void)setOpcode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_opcode = a3;
}

- (void)setHasOpcode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOpcode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setServiceId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_serviceId = a3;
}

- (void)setHasServiceId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServiceId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (BOOL)hasServiceKey
{
  return self->_serviceKey != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWifiAwdlServiceRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWifiAwdlServiceRecord description](&v3, sel_description), -[AWDWifiAwdlServiceRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSData *serviceKey;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_opcode), CFSTR("opcode"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_type), CFSTR("type"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_serviceId), CFSTR("serviceId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
LABEL_6:
  serviceKey = self->_serviceKey;
  if (serviceKey)
    objc_msgSend(v3, "setObject:forKey:", serviceKey, CFSTR("serviceKey"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiAwdlServiceRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_5:
    PBDataWriterWriteUint64Field();
LABEL_6:
  if (self->_serviceKey)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  char has;
  NSData *serviceKey;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_opcode;
    *((_BYTE *)a3 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_type;
  *((_BYTE *)a3 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  *((_DWORD *)a3 + 5) = self->_serviceId;
  *((_BYTE *)a3 + 36) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    *((_QWORD *)a3 + 1) = self->_duration;
    *((_BYTE *)a3 + 36) |= 1u;
  }
LABEL_6:
  serviceKey = self->_serviceKey;
  if (serviceKey)
    objc_msgSend(a3, "setServiceKey:", serviceKey);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_opcode;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 20) = self->_serviceId;
      *(_BYTE *)(v5 + 36) |= 4u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_type;
  *(_BYTE *)(v5 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
LABEL_6:

  v6[3] = -[NSData copyWithZone:](self->_serviceKey, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *serviceKey;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_opcode != *((_DWORD *)a3 + 4))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 8) == 0 || self->_type != *((_DWORD *)a3 + 8))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 36) & 8) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_serviceId != *((_DWORD *)a3 + 5))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
      goto LABEL_24;
    }
    serviceKey = self->_serviceKey;
    if ((unint64_t)serviceKey | *((_QWORD *)a3 + 3))
      LOBYTE(v5) = -[NSData isEqual:](serviceKey, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_opcode;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_type;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ -[NSData hash](self->_serviceKey, "hash");
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_serviceId;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761u * self->_duration;
  return v3 ^ v2 ^ v4 ^ v5 ^ -[NSData hash](self->_serviceKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 2) != 0)
  {
    self->_opcode = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_type = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  self->_serviceId = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
LABEL_5:
    self->_duration = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_6:
  if (*((_QWORD *)a3 + 3))
    -[AWDWifiAwdlServiceRecord setServiceKey:](self, "setServiceKey:");
}

- (unsigned)opcode
{
  return self->_opcode;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)serviceId
{
  return self->_serviceId;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSData)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
