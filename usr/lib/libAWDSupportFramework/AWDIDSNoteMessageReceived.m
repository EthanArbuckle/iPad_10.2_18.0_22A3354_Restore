@implementation AWDIDSNoteMessageReceived

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSNoteMessageReceived setServiceIdentifier:](self, "setServiceIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSNoteMessageReceived;
  -[AWDIDSNoteMessageReceived dealloc](&v3, sel_dealloc);
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

- (void)setAccountType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_accountType = a3;
}

- (void)setHasAccountType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAccountType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setFromStorage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_fromStorage = a3;
}

- (void)setHasFromStorage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFromStorage
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)setServertimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_servertimestamp = a3;
}

- (void)setHasServertimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServertimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLocaltimedelta:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_localtimedelta = a3;
}

- (void)setHasLocaltimedelta:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocaltimedelta
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSNoteMessageReceived;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSNoteMessageReceived description](&v3, sel_description), -[AWDIDSNoteMessageReceived dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_accountType), CFSTR("accountType"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fromStorage), CFSTR("fromStorage"));
LABEL_5:
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_servertimestamp), CFSTR("servertimestamp"));
    v6 = (char)self->_has;
  }
  if ((v6 & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_localtimedelta), CFSTR("localtimedelta"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSNoteMessageReceivedReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:
  if (self->_serviceIdentifier)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 1) != 0)
    PBDataWriterWriteUint64Field();
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_accountType;
  *((_BYTE *)a3 + 52) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *((_BYTE *)a3 + 48) = self->_fromStorage;
    *((_BYTE *)a3 + 52) |= 0x10u;
  }
LABEL_5:
  if (self->_serviceIdentifier)
    objc_msgSend(a3, "setServiceIdentifier:");
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_servertimestamp;
    *((_BYTE *)a3 + 52) |= 2u;
    v6 = (char)self->_has;
  }
  if ((v6 & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_localtimedelta;
    *((_BYTE *)a3 + 52) |= 1u;
  }
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_accountType;
  *(_BYTE *)(v5 + 52) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 48) = self->_fromStorage;
    *(_BYTE *)(v5 + 52) |= 0x10u;
  }
LABEL_5:

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_servertimestamp;
    *(_BYTE *)(v6 + 52) |= 2u;
    v8 = (char)self->_has;
  }
  if ((v8 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_localtimedelta;
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
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_accountType != *((_DWORD *)a3 + 8))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 52) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
      goto LABEL_32;
    goto LABEL_20;
  }
  if ((*((_BYTE *)a3 + 52) & 0x10) == 0)
    goto LABEL_32;
  if (self->_fromStorage)
  {
    if (!*((_BYTE *)a3 + 48))
      goto LABEL_32;
    goto LABEL_20;
  }
  if (*((_BYTE *)a3 + 48))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_20:
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
    if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_servertimestamp != *((_QWORD *)a3 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
    goto LABEL_32;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_localtimedelta != *((_QWORD *)a3 + 1))
      goto LABEL_32;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_accountType;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_fromStorage;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_serviceIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761u * self->_servertimestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_10;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_10:
  v8 = 2654435761u * self->_localtimedelta;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
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
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 52) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_accountType = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
  {
LABEL_4:
    self->_fromStorage = *((_BYTE *)a3 + 48);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 5))
    -[AWDIDSNoteMessageReceived setServiceIdentifier:](self, "setServiceIdentifier:");
  v6 = *((_BYTE *)a3 + 52);
  if ((v6 & 2) != 0)
  {
    self->_servertimestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)a3 + 52);
  }
  if ((v6 & 1) != 0)
  {
    self->_localtimedelta = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)accountType
{
  return self->_accountType;
}

- (BOOL)fromStorage
{
  return self->_fromStorage;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)servertimestamp
{
  return self->_servertimestamp;
}

- (unint64_t)localtimedelta
{
  return self->_localtimedelta;
}

@end
