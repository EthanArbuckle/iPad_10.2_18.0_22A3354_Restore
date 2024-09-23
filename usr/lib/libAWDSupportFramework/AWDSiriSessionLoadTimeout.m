@implementation AWDSiriSessionLoadTimeout

- (void)dealloc
{
  objc_super v3;

  -[AWDSiriSessionLoadTimeout setConnectionURL:](self, "setConnectionURL:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriSessionLoadTimeout;
  -[AWDSiriSessionLoadTimeout dealloc](&v3, sel_dealloc);
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

- (BOOL)hasConnectionURL
{
  return self->_connectionURL != 0;
}

- (void)setInterfaceIndex:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_interfaceIndex = a3;
}

- (void)setHasInterfaceIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInterfaceIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSendBufferSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sendBufferSize = a3;
}

- (void)setHasSendBufferSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSendBufferSize
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setWwanPreferred:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_wwanPreferred = a3;
}

- (void)setHasWwanPreferred:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWwanPreferred
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setConnectionTechnology:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_connectionTechnology = a3;
}

- (void)setHasConnectionTechnology:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectionTechnology
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSiriSessionLoadTimeout;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSiriSessionLoadTimeout description](&v3, sel_description), -[AWDSiriSessionLoadTimeout dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *connectionURL;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  connectionURL = self->_connectionURL;
  if (connectionURL)
    objc_msgSend(v3, "setObject:forKey:", connectionURL, CFSTR("connectionURL"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_interfaceIndex), CFSTR("interfaceIndex"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
LABEL_13:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wwanPreferred), CFSTR("wwanPreferred"));
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sendBufferSize), CFSTR("sendBufferSize"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 1) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectionTechnology), CFSTR("connectionTechnology"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSiriSessionLoadTimeoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_connectionURL)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 52) |= 8u;
  }
  if (self->_connectionURL)
    objc_msgSend(a3, "setConnectionURL:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_interfaceIndex;
    *((_BYTE *)a3 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)a3 + 3) = self->_sendBufferSize;
  *((_BYTE *)a3 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      return;
    goto LABEL_9;
  }
LABEL_13:
  *((_BYTE *)a3 + 48) = self->_wwanPreferred;
  *((_BYTE *)a3 + 52) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return;
LABEL_9:
  *((_QWORD *)a3 + 1) = self->_connectionTechnology;
  *((_BYTE *)a3 + 52) |= 1u;
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
    *(_BYTE *)(v5 + 52) |= 8u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_connectionURL, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_interfaceIndex;
    *(_BYTE *)(v6 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
LABEL_11:
      *(_BYTE *)(v6 + 48) = self->_wwanPreferred;
      *(_BYTE *)(v6 + 52) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return (id)v6;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 24) = self->_sendBufferSize;
  *(_BYTE *)(v6 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    *(_QWORD *)(v6 + 8) = self->_connectionTechnology;
    *(_BYTE *)(v6 + 52) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *connectionURL;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 52) & 8) != 0)
  {
    goto LABEL_32;
  }
  connectionURL = self->_connectionURL;
  if ((unint64_t)connectionURL | *((_QWORD *)a3 + 5))
  {
    v5 = -[NSString isEqual:](connectionURL, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_interfaceIndex != *((_QWORD *)a3 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_sendBufferSize != *((_QWORD *)a3 + 3))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 52) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 0x10) == 0)
  {
    if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
      goto LABEL_32;
    goto LABEL_28;
  }
  if ((*((_BYTE *)a3 + 52) & 0x10) == 0)
    goto LABEL_32;
  if (self->_wwanPreferred)
  {
    if (!*((_BYTE *)a3 + 48))
      goto LABEL_32;
    goto LABEL_28;
  }
  if (*((_BYTE *)a3 + 48))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_28:
  LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_connectionTechnology != *((_QWORD *)a3 + 1))
      goto LABEL_32;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_connectionURL, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761u * self->_interfaceIndex;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v6 = 2654435761u * self->_sendBufferSize;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_wwanPreferred;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761u * self->_connectionTechnology;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 52) & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDSiriSessionLoadTimeout setConnectionURL:](self, "setConnectionURL:");
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 2) != 0)
  {
    self->_interfaceIndex = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 52) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_sendBufferSize = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0)
      return;
    goto LABEL_9;
  }
LABEL_13:
  self->_wwanPreferred = *((_BYTE *)a3 + 48);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 52) & 1) == 0)
    return;
LABEL_9:
  self->_connectionTechnology = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)connectionURL
{
  return self->_connectionURL;
}

- (void)setConnectionURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)interfaceIndex
{
  return self->_interfaceIndex;
}

- (unint64_t)sendBufferSize
{
  return self->_sendBufferSize;
}

- (BOOL)wwanPreferred
{
  return self->_wwanPreferred;
}

- (unint64_t)connectionTechnology
{
  return self->_connectionTechnology;
}

@end
