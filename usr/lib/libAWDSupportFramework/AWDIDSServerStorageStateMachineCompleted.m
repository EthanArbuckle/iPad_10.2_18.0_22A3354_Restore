@implementation AWDIDSServerStorageStateMachineCompleted

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSServerStorageStateMachineCompleted setServiceIdentifier:](self, "setServiceIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSServerStorageStateMachineCompleted;
  -[AWDIDSServerStorageStateMachineCompleted dealloc](&v3, sel_dealloc);
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

- (void)setWasPrimary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_wasPrimary = a3;
}

- (void)setHasWasPrimary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWasPrimary
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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

- (void)setTotalMessages:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_totalMessages = a3;
}

- (void)setHasTotalMessages:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalMessages
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLinkType:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLinkType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSServerStorageStateMachineCompleted;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSServerStorageStateMachineCompleted description](&v3, sel_description), -[AWDIDSServerStorageStateMachineCompleted dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *serviceIdentifier;
  char v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wasPrimary), CFSTR("wasPrimary"));
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
  v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalMessages), CFSTR("totalMessages"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_10;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeTaken), CFSTR("timeTaken"));
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v6 & 1) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_linkType), CFSTR("linkType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSServerStorageStateMachineCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_serviceIdentifier)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (char)self->_has;
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0)
        return;
LABEL_13:
      PBDataWriterWriteUint64Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)a3 + 48) = self->_wasPrimary;
    *((_BYTE *)a3 + 52) |= 0x10u;
  }
  if (self->_serviceIdentifier)
    objc_msgSend(a3, "setServiceIdentifier:");
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timeTaken;
    *((_BYTE *)a3 + 52) |= 2u;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 1) == 0)
        return;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)a3 + 4) = self->_totalMessages;
  *((_BYTE *)a3 + 52) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return;
LABEL_10:
  *((_QWORD *)a3 + 1) = self->_linkType;
  *((_BYTE *)a3 + 52) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  char v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_wasPrimary;
    *(_BYTE *)(v5 + 52) |= 0x10u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_11:
    *(_QWORD *)(v6 + 32) = self->_totalMessages;
    *(_BYTE *)(v6 + 52) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v6;
    goto LABEL_8;
  }
  *(_QWORD *)(v6 + 16) = self->_timeTaken;
  *(_BYTE *)(v6 + 52) |= 2u;
  v8 = (char)self->_has;
  if ((v8 & 8) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v8 & 1) != 0)
  {
LABEL_8:
    *(_QWORD *)(v6 + 8) = self->_linkType;
    *(_BYTE *)(v6 + 52) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *serviceIdentifier;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 52) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
      goto LABEL_32;
    goto LABEL_15;
  }
  if ((*((_BYTE *)a3 + 52) & 0x10) == 0)
    goto LABEL_32;
  if (self->_wasPrimary)
  {
    if (!*((_BYTE *)a3 + 48))
      goto LABEL_32;
    goto LABEL_15;
  }
  if (*((_BYTE *)a3 + 48))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
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
    if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_timeTaken != *((_QWORD *)a3 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_totalMessages != *((_QWORD *)a3 + 4))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 52) & 8) != 0)
  {
    goto LABEL_32;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_linkType != *((_QWORD *)a3 + 1))
      goto LABEL_32;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_wasPrimary;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_serviceIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_11:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  }
  v6 = 2654435761u * self->_timeTaken;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_8:
  v7 = 2654435761u * self->_totalMessages;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_9:
  v8 = 2654435761u * self->_linkType;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;

  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 52);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_wasPrimary = *((_BYTE *)a3 + 48);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDIDSServerStorageStateMachineCompleted setServiceIdentifier:](self, "setServiceIdentifier:");
  v6 = *((_BYTE *)a3 + 52);
  if ((v6 & 2) != 0)
  {
    self->_timeTaken = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)a3 + 52);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 1) == 0)
        return;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 52) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_totalMessages = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 52) & 1) == 0)
    return;
LABEL_10:
  self->_linkType = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)wasPrimary
{
  return self->_wasPrimary;
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

- (unint64_t)totalMessages
{
  return self->_totalMessages;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

@end
