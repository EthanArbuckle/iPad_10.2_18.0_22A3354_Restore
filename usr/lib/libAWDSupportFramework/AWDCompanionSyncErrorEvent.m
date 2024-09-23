@implementation AWDCompanionSyncErrorEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDCompanionSyncErrorEvent setService:](self, "setService:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncErrorEvent;
  -[AWDCompanionSyncErrorEvent dealloc](&v3, sel_dealloc);
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

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)error
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_error;
  else
    return 0;
}

- (void)setError:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasError
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)errorAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D8E8[a3];
}

- (int)StringAsError:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("None")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Duplicate")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("OutOfSequence")))
    return 2;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncErrorEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCompanionSyncErrorEvent description](&v3, sel_description), -[AWDCompanionSyncErrorEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *service;
  char has;
  uint64_t error;
  __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sequenceNumber), CFSTR("sequence_number"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    error = self->_error;
    if (error >= 3)
      v7 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_error);
    else
      v7 = off_24C10D8E8[error];
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("error"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCompanionSyncErrorEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_service)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 2u;
  }
  if (self->_service)
    objc_msgSend(a3, "setService:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_sequenceNumber;
    *((_BYTE *)a3 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_error;
    *((_BYTE *)a3 + 40) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 2u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_sequenceNumber;
    *(_BYTE *)(v6 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_error;
    *(_BYTE *)(v6 + 40) |= 4u;
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
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_sequenceNumber != *((_QWORD *)a3 + 1))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_error != *((_DWORD *)a3 + 6))
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
  unint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_service, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761u * self->_sequenceNumber;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_error;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 40) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDCompanionSyncErrorEvent setService:](self, "setService:");
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) != 0)
  {
    self->_sequenceNumber = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_error = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
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
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

@end
