@implementation AWDWiFiUIConfigureEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiUIConfigureEvent setProcess:](self, "setProcess:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIConfigureEvent;
  -[AWDWiFiUIConfigureEvent dealloc](&v3, sel_dealloc);
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

- (BOOL)hasProcess
{
  return self->_process != 0;
}

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPreviousType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_previousType = a3;
}

- (void)setHasPreviousType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreviousType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIConfigureEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiUIConfigureEvent description](&v3, sel_description), -[AWDWiFiUIConfigureEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *process;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  process = self->_process;
  if (process)
    objc_msgSend(v3, "setObject:forKey:", process, CFSTR("process"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_type), CFSTR("type"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_previousType), CFSTR("previousType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiUIConfigureEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_process)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 1u;
  }
  if (self->_process)
    objc_msgSend(a3, "setProcess:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_type;
    *((_BYTE *)a3 + 36) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_previousType;
    *((_BYTE *)a3 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 36) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_process, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_type;
    *(_BYTE *)(v6 + 36) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_previousType;
    *(_BYTE *)(v6 + 36) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *process;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    process = self->_process;
    if ((unint64_t)process | *((_QWORD *)a3 + 3))
    {
      v5 = -[NSString isEqual:](process, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_type != *((_DWORD *)a3 + 8))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_previousType != *((_DWORD *)a3 + 4))
        goto LABEL_19;
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
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_process, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_previousType;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDWiFiUIConfigureEvent setProcess:](self, "setProcess:");
  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 4) != 0)
  {
    self->_type = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_previousType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)previousType
{
  return self->_previousType;
}

@end
