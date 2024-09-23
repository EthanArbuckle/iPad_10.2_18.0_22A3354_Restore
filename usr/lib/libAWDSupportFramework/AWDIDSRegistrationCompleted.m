@implementation AWDIDSRegistrationCompleted

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSRegistrationCompleted setServiceIdentifier:](self, "setServiceIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationCompleted;
  -[AWDIDSRegistrationCompleted dealloc](&v3, sel_dealloc);
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

- (void)setRegistrationType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_registrationType = a3;
}

- (void)setHasRegistrationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRegistrationType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)setWasSuccessful:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_wasSuccessful = a3;
}

- (void)setHasWasSuccessful:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWasSuccessful
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRegistrationError:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_registrationError = a3;
}

- (void)setHasRegistrationError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRegistrationError
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCircleStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_circleStatus = a3;
}

- (void)setHasCircleStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCircleStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationCompleted;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSRegistrationCompleted description](&v3, sel_description), -[AWDIDSRegistrationCompleted dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *serviceIdentifier;
  char v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_registrationType), CFSTR("registrationType"));
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
  v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_registrationError), CFSTR("registrationError"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_10;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wasSuccessful), CFSTR("wasSuccessful"));
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v6 & 2) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_circleStatus), CFSTR("circleStatus"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_serviceIdentifier)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        return;
LABEL_13:
      PBDataWriterWriteInt32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_registrationType;
    *((_BYTE *)a3 + 44) |= 8u;
  }
  if (self->_serviceIdentifier)
    objc_msgSend(a3, "setServiceIdentifier:");
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_wasSuccessful;
    *((_BYTE *)a3 + 44) |= 0x10u;
    v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        return;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 5) = self->_registrationError;
  *((_BYTE *)a3 + 44) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return;
LABEL_10:
  *((_DWORD *)a3 + 4) = self->_circleStatus;
  *((_BYTE *)a3 + 44) |= 2u;
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
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_registrationType;
    *(_BYTE *)(v5 + 44) |= 8u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    *(_DWORD *)(v6 + 20) = self->_registrationError;
    *(_BYTE *)(v6 + 44) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 40) = self->_wasSuccessful;
  *(_BYTE *)(v6 + 44) |= 0x10u;
  v8 = (char)self->_has;
  if ((v8 & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v8 & 2) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 16) = self->_circleStatus;
    *(_BYTE *)(v6 + 44) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *serviceIdentifier;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_registrationType != *((_DWORD *)a3 + 6))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 8) != 0)
    {
      goto LABEL_29;
    }
    serviceIdentifier = self->_serviceIdentifier;
    if ((unint64_t)serviceIdentifier | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](serviceIdentifier, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_wasSuccessful != *((_DWORD *)a3 + 10))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_registrationError != *((_DWORD *)a3 + 5))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_circleStatus != *((_DWORD *)a3 + 4))
        goto LABEL_29;
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
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_registrationType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_serviceIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_11:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  }
  v6 = 2654435761 * self->_wasSuccessful;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_8:
  v7 = 2654435761 * self->_registrationError;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_9:
  v8 = 2654435761 * self->_circleStatus;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;

  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 44);
  }
  if ((v5 & 8) != 0)
  {
    self->_registrationType = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDIDSRegistrationCompleted setServiceIdentifier:](self, "setServiceIdentifier:");
  v6 = *((_BYTE *)a3 + 44);
  if ((v6 & 0x10) != 0)
  {
    self->_wasSuccessful = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)a3 + 44);
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        return;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_registrationError = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 44) & 2) == 0)
    return;
LABEL_10:
  self->_circleStatus = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)registrationType
{
  return self->_registrationType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)wasSuccessful
{
  return self->_wasSuccessful;
}

- (int)registrationError
{
  return self->_registrationError;
}

- (int)circleStatus
{
  return self->_circleStatus;
}

@end
