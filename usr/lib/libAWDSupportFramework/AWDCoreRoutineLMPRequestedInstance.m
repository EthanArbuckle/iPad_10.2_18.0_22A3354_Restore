@implementation AWDCoreRoutineLMPRequestedInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLMPRequestedInstance setEventId:](self, "setEventId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPRequestedInstance;
  -[AWDCoreRoutineLMPRequestedInstance dealloc](&v3, sel_dealloc);
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

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (void)setSuggested:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_suggested = a3;
}

- (void)setHasSuggested:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSuggested
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setOccurrences:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_occurrences = a3;
}

- (void)setHasOccurrences:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOccurrences
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPRequestedInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLMPRequestedInstance description](&v3, sel_description), -[AWDCoreRoutineLMPRequestedInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *eventId;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  eventId = self->_eventId;
  if (eventId)
    objc_msgSend(v3, "setObject:forKey:", eventId, CFSTR("eventId"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_suggested), CFSTR("suggested"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
LABEL_13:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_occurrences), CFSTR("occurrences"));
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_confidence), CFSTR("confidence"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 8) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_reason), CFSTR("reason"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPRequestedInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_eventId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      return;
LABEL_13:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 1u;
  }
  if (self->_eventId)
    objc_msgSend(a3, "setEventId:");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)a3 + 40) = self->_suggested;
    *((_BYTE *)a3 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 4) = self->_confidence;
  *((_BYTE *)a3 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      return;
    goto LABEL_9;
  }
LABEL_13:
  *((_DWORD *)a3 + 8) = self->_occurrences;
  *((_BYTE *)a3 + 44) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return;
LABEL_9:
  *((_DWORD *)a3 + 9) = self->_reason;
  *((_BYTE *)a3 + 44) |= 8u;
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
    *(_BYTE *)(v5 + 44) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_eventId, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 40) = self->_suggested;
    *(_BYTE *)(v6 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_11:
      *(_DWORD *)(v6 + 32) = self->_occurrences;
      *(_BYTE *)(v6 + 44) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v6;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 16) = self->_confidence;
  *(_BYTE *)(v6 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 36) = self->_reason;
    *(_BYTE *)(v6 + 44) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *eventId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    goto LABEL_32;
  }
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((_QWORD *)a3 + 3))
  {
    v5 = -[NSString isEqual:](eventId, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  if ((has & 0x10) == 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
      goto LABEL_32;
    goto LABEL_18;
  }
  if ((*((_BYTE *)a3 + 44) & 0x10) == 0)
    goto LABEL_32;
  if (self->_suggested)
  {
    if (!*((_BYTE *)a3 + 40))
      goto LABEL_32;
    goto LABEL_18;
  }
  if (*((_BYTE *)a3 + 40))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_confidence != *((_DWORD *)a3 + 4))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 44) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_occurrences != *((_DWORD *)a3 + 8))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 44) & 4) != 0)
  {
    goto LABEL_32;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_reason != *((_DWORD *)a3 + 9))
      goto LABEL_32;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_eventId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v5 = 2654435761 * self->_suggested;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_confidence;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
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
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_occurrences;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761 * self->_reason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDCoreRoutineLMPRequestedInstance setEventId:](self, "setEventId:");
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_suggested = *((_BYTE *)a3 + 40);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)a3 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_confidence = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      return;
    goto LABEL_9;
  }
LABEL_13:
  self->_occurrences = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 44) & 8) == 0)
    return;
LABEL_9:
  self->_reason = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 8u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)suggested
{
  return self->_suggested;
}

- (int)confidence
{
  return self->_confidence;
}

- (int)occurrences
{
  return self->_occurrences;
}

- (int)reason
{
  return self->_reason;
}

@end
