@implementation AWDIDSRegistrationRenewCredentialsCompleted

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSRegistrationRenewCredentialsCompleted setErrorDomain:](self, "setErrorDomain:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationRenewCredentialsCompleted;
  -[AWDIDSRegistrationRenewCredentialsCompleted dealloc](&v3, sel_dealloc);
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

- (void)setRenewResult:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_renewResult = a3;
}

- (void)setHasRenewResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRenewResult
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationRenewCredentialsCompleted;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSRegistrationRenewCredentialsCompleted description](&v3, sel_description), -[AWDIDSRegistrationRenewCredentialsCompleted dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *errorDomain;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_renewResult), CFSTR("renewResult"));
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_errorCode), CFSTR("errorCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationRenewCredentialsCompletedReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_renewResult;
    *((_BYTE *)a3 + 36) |= 4u;
  }
  if (self->_errorDomain)
    objc_msgSend(a3, "setErrorDomain:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_errorCode;
    *((_BYTE *)a3 + 36) |= 1u;
  }
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
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_renewResult;
    *(_BYTE *)(v5 + 36) |= 4u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_errorCode;
    *(_BYTE *)(v6 + 36) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *errorDomain;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_renewResult != *((_DWORD *)a3 + 8))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
      goto LABEL_19;
    }
    errorDomain = self->_errorDomain;
    if ((unint64_t)errorDomain | *((_QWORD *)a3 + 3))
    {
      v5 = -[NSString isEqual:](errorDomain, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 1) == 0;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_errorCode != *((_QWORD *)a3 + 1))
        goto LABEL_19;
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
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_renewResult;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_errorCode;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 36);
  }
  if ((v5 & 4) != 0)
  {
    self->_renewResult = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDIDSRegistrationRenewCredentialsCompleted setErrorDomain:](self, "setErrorDomain:");
  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    self->_errorCode = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)renewResult
{
  return self->_renewResult;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

@end
