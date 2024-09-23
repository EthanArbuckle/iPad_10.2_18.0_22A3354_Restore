@implementation AWDCoreRoutineLMPResponseInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLMPResponseInstance setEventId:](self, "setEventId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPResponseInstance;
  -[AWDCoreRoutineLMPResponseInstance dealloc](&v3, sel_dealloc);
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

- (void)setSelected:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_selected = a3;
}

- (void)setHasSelected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSelected
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v3.super_class = (Class)AWDCoreRoutineLMPResponseInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLMPResponseInstance description](&v3, sel_description), -[AWDCoreRoutineLMPResponseInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_selected), CFSTR("selected"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_interaction), CFSTR("interaction"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPResponseInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_eventId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_eventId)
    objc_msgSend(a3, "setEventId:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)a3 + 28) = self->_selected;
    *((_BYTE *)a3 + 32) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_interaction;
    *((_BYTE *)a3 + 32) |= 2u;
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
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_eventId, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v6 + 28) = self->_selected;
    *(_BYTE *)(v6 + 32) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_interaction;
    *(_BYTE *)(v6 + 32) |= 2u;
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
    if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    goto LABEL_22;
  }
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((_QWORD *)a3 + 2))
  {
    v5 = -[NSString isEqual:](eventId, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  if ((has & 4) == 0)
  {
    if ((*((_BYTE *)a3 + 32) & 4) != 0)
      goto LABEL_22;
    goto LABEL_18;
  }
  if ((*((_BYTE *)a3 + 32) & 4) == 0)
    goto LABEL_22;
  if (self->_selected)
  {
    if (!*((_BYTE *)a3 + 28))
      goto LABEL_22;
    goto LABEL_18;
  }
  if (*((_BYTE *)a3 + 28))
  {
LABEL_22:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_interaction != *((_DWORD *)a3 + 6))
      goto LABEL_22;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_eventId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_selected;
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
  v6 = 2654435761 * self->_interaction;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDCoreRoutineLMPResponseInstance setEventId:](self, "setEventId:");
  v5 = *((_BYTE *)a3 + 32);
  if ((v5 & 4) != 0)
  {
    self->_selected = *((_BYTE *)a3 + 28);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_interaction = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
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

- (BOOL)selected
{
  return self->_selected;
}

- (int)interaction
{
  return self->_interaction;
}

@end
