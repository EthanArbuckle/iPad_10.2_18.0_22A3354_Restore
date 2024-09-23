@implementation AWDCoreRoutineLMPAutofillSelectedInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLMPAutofillSelectedInstance setEventId:](self, "setEventId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPAutofillSelectedInstance;
  -[AWDCoreRoutineLMPAutofillSelectedInstance dealloc](&v3, sel_dealloc);
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

- (void)setInteraction:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_interaction = a3;
}

- (void)setHasInteraction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInteraction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPAutofillSelectedInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLMPAutofillSelectedInstance description](&v3, sel_description), -[AWDCoreRoutineLMPAutofillSelectedInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *eventId;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  eventId = self->_eventId;
  if (eventId)
    objc_msgSend(v3, "setObject:forKey:", eventId, CFSTR("eventId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_interaction), CFSTR("interaction"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPAutofillSelectedInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_eventId)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  NSString *eventId;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_interaction;
    *((_BYTE *)a3 + 28) |= 2u;
  }
  eventId = self->_eventId;
  if (eventId)
    objc_msgSend(a3, "setEventId:", eventId);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_interaction;
    *(_BYTE *)(v5 + 28) |= 2u;
  }

  v6[2] = -[NSString copyWithZone:](self->_eventId, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *eventId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 28) & 1) != 0)
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_interaction != *((_DWORD *)a3 + 6))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 28) & 2) != 0)
    {
      goto LABEL_14;
    }
    eventId = self->_eventId;
    if ((unint64_t)eventId | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[NSString isEqual:](eventId, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSString hash](self->_eventId, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_interaction;
  return v3 ^ v2 ^ -[NSString hash](self->_eventId, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 28);
  }
  if ((v3 & 2) != 0)
  {
    self->_interaction = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDCoreRoutineLMPAutofillSelectedInstance setEventId:](self, "setEventId:");
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
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int)interaction
{
  return self->_interaction;
}

@end
