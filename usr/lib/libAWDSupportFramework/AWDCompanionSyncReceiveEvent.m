@implementation AWDCompanionSyncReceiveEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDCompanionSyncReceiveEvent setService:](self, "setService:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncReceiveEvent;
  -[AWDCompanionSyncReceiveEvent dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSequenceNumber
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

- (void)setProcessingTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_processingTime = a3;
}

- (void)setHasProcessingTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProcessingTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncReceiveEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCompanionSyncReceiveEvent description](&v3, sel_description), -[AWDCompanionSyncReceiveEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *service;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_8;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sequenceNumber), CFSTR("sequence_number"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_processingTime), CFSTR("processingTime"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCompanionSyncReceiveEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_service)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        return;
LABEL_11:
      PBDataWriterWriteUint64Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 8u;
  }
  if (self->_service)
    objc_msgSend(a3, "setService:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_sequenceNumber;
    *((_BYTE *)a3 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        return;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)a3 + 1) = self->_duration;
  *((_BYTE *)a3 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return;
LABEL_8:
  *((_QWORD *)a3 + 2) = self->_processingTime;
  *((_BYTE *)a3 + 48) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 8u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    *(_QWORD *)(v6 + 8) = self->_duration;
    *(_BYTE *)(v6 + 48) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_6;
  }
  *(_QWORD *)(v6 + 24) = self->_sequenceNumber;
  *(_BYTE *)(v6 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_QWORD *)(v6 + 16) = self->_processingTime;
    *(_BYTE *)(v6 + 48) |= 2u;
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
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((_QWORD *)a3 + 5))
    {
      v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_sequenceNumber != *((_QWORD *)a3 + 3))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
      goto LABEL_24;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_processingTime != *((_QWORD *)a3 + 2))
        goto LABEL_24;
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

  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_service, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761u * self->_sequenceNumber;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761u * self->_duration;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_7:
  v7 = 2654435761u * self->_processingTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 48) & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDCompanionSyncReceiveEvent setService:](self, "setService:");
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 4) != 0)
  {
    self->_sequenceNumber = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0)
        return;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_duration = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 48) & 2) == 0)
    return;
LABEL_8:
  self->_processingTime = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
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
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unint64_t)processingTime
{
  return self->_processingTime;
}

@end
