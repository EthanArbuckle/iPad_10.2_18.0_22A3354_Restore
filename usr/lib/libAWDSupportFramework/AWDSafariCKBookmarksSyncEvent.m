@implementation AWDSafariCKBookmarksSyncEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDSafariCKBookmarksSyncEvent setErrorDomain:](self, "setErrorDomain:", 0);
  -[AWDSafariCKBookmarksSyncEvent setErrorCode:](self, "setErrorCode:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksSyncEvent;
  -[AWDSafariCKBookmarksSyncEvent dealloc](&v3, sel_dealloc);
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

- (void)setResult:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResult
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksSyncEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariCKBookmarksSyncEvent description](&v3, sel_description), -[AWDSafariCKBookmarksSyncEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *errorDomain;
  NSString *errorCode;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_result), CFSTR("result"));
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  errorCode = self->_errorCode;
  if (errorCode)
    objc_msgSend(v3, "setObject:forKey:", errorCode, CFSTR("errorCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariCKBookmarksSyncEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  if (self->_errorCode)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_result;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (self->_errorDomain)
    objc_msgSend(a3, "setErrorDomain:");
  if (self->_errorCode)
    objc_msgSend(a3, "setErrorCode:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_result;
    *(_BYTE *)(v5 + 40) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_errorCode, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *errorDomain;
  NSString *errorCode;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_result != *((_QWORD *)a3 + 1))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_16;
    }
    errorDomain = self->_errorDomain;
    if (!((unint64_t)errorDomain | *((_QWORD *)a3 + 4))
      || (v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
    {
      errorCode = self->_errorCode;
      if ((unint64_t)errorCode | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NSString isEqual:](errorCode, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_result;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_errorDomain, "hash");
  return v5 ^ -[NSString hash](self->_errorCode, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_result = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDSafariCKBookmarksSyncEvent setErrorDomain:](self, "setErrorDomain:");
  if (*((_QWORD *)a3 + 3))
    -[AWDSafariCKBookmarksSyncEvent setErrorCode:](self, "setErrorCode:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)result
{
  return self->_result;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
