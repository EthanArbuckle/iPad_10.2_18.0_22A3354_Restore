@implementation AWDIDSRegistrationAccountStatus

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSRegistrationAccountStatus setServiceIdentifier:](self, "setServiceIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationAccountStatus;
  -[AWDIDSRegistrationAccountStatus dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAccountType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accountType = a3;
}

- (void)setHasAccountType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccountType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)setDoesExist:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_doesExist = a3;
}

- (void)setHasDoesExist:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDoesExist
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsEnabled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsEnabled
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsUserDisabled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isUserDisabled = a3;
}

- (void)setHasIsUserDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsUserDisabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsiCloudSignedIn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isiCloudSignedIn = a3;
}

- (void)setHasIsiCloudSignedIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsiCloudSignedIn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRegistrationStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_registrationStatus = a3;
}

- (void)setHasRegistrationStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRegistrationStatus
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRegistrationError:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_registrationError = a3;
}

- (void)setHasRegistrationError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRegistrationError
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRegistrationErrorReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_registrationErrorReason = a3;
}

- (void)setHasRegistrationErrorReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRegistrationErrorReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsiTunesSignedIn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isiTunesSignedIn = a3;
}

- (void)setHasIsiTunesSignedIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsiTunesSignedIn
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationAccountStatus;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSRegistrationAccountStatus description](&v3, sel_description), -[AWDIDSRegistrationAccountStatus dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSString *serviceIdentifier;
  __int16 v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_accountType), CFSTR("accountType"));
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
  v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_doesExist), CFSTR("doesExist"));
    v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isEnabled), CFSTR("isEnabled"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isUserDisabled), CFSTR("isUserDisabled"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isiCloudSignedIn), CFSTR("isiCloudSignedIn"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_registrationStatus), CFSTR("registrationStatus"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_13:
    if ((v6 & 0x100) == 0)
      goto LABEL_14;
LABEL_23:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_registrationErrorReason), CFSTR("registrationErrorReason"));
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_registrationError), CFSTR("registrationError"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
    goto LABEL_23;
LABEL_14:
  if ((v6 & 0x40) != 0)
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isiTunesSignedIn), CFSTR("isiTunesSignedIn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationAccountStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_serviceIdentifier)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 0x40) == 0)
      return;
LABEL_23:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    goto LABEL_23;
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 32) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_accountType;
    *((_WORD *)a3 + 32) |= 2u;
  }
  if (self->_serviceIdentifier)
    objc_msgSend(a3, "setServiceIdentifier:");
  v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_doesExist;
    *((_WORD *)a3 + 32) |= 4u;
    v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 6) = self->_isEnabled;
  *((_WORD *)a3 + 32) |= 8u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 7) = self->_isUserDisabled;
  *((_WORD *)a3 + 32) |= 0x10u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 8) = self->_isiCloudSignedIn;
  *((_WORD *)a3 + 32) |= 0x20u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 12) = self->_registrationStatus;
  *((_WORD *)a3 + 32) |= 0x200u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_13:
    if ((v6 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 10) = self->_registrationError;
  *((_WORD *)a3 + 32) |= 0x80u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_14:
    if ((v6 & 0x40) == 0)
      return;
    goto LABEL_15;
  }
LABEL_23:
  *((_DWORD *)a3 + 11) = self->_registrationErrorReason;
  *((_WORD *)a3 + 32) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x40) == 0)
    return;
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_isiTunesSignedIn;
  *((_WORD *)a3 + 32) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 64) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_accountType;
    *(_WORD *)(v5 + 64) |= 2u;
  }

  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_doesExist;
    *(_WORD *)(v6 + 64) |= 4u;
    v8 = (__int16)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_7:
      if ((v8 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((v8 & 8) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 24) = self->_isEnabled;
  *(_WORD *)(v6 + 64) |= 8u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_8:
    if ((v8 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v6 + 28) = self->_isUserDisabled;
  *(_WORD *)(v6 + 64) |= 0x10u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x20) == 0)
  {
LABEL_9:
    if ((v8 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v6 + 32) = self->_isiCloudSignedIn;
  *(_WORD *)(v6 + 64) |= 0x20u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_10:
    if ((v8 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v6 + 48) = self->_registrationStatus;
  *(_WORD *)(v6 + 64) |= 0x200u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x80) == 0)
  {
LABEL_11:
    if ((v8 & 0x100) == 0)
      goto LABEL_12;
LABEL_21:
    *(_DWORD *)(v6 + 44) = self->_registrationErrorReason;
    *(_WORD *)(v6 + 64) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return (id)v6;
    goto LABEL_13;
  }
LABEL_20:
  *(_DWORD *)(v6 + 40) = self->_registrationError;
  *(_WORD *)(v6 + 64) |= 0x80u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0)
    goto LABEL_21;
LABEL_12:
  if ((v8 & 0x40) != 0)
  {
LABEL_13:
    *(_DWORD *)(v6 + 36) = self->_isiTunesSignedIn;
    *(_WORD *)(v6 + 64) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *serviceIdentifier;
  __int16 v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 32);
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_54;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_54:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_accountType != *((_DWORD *)a3 + 4))
        goto LABEL_54;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_54;
    }
    serviceIdentifier = self->_serviceIdentifier;
    if ((unint64_t)serviceIdentifier | *((_QWORD *)a3 + 7))
    {
      v5 = -[NSString isEqual:](serviceIdentifier, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v9 = *((_WORD *)a3 + 32);
    if ((has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_doesExist != *((_DWORD *)a3 + 5))
        goto LABEL_54;
    }
    else if ((v9 & 4) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_isEnabled != *((_DWORD *)a3 + 6))
        goto LABEL_54;
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_isUserDisabled != *((_DWORD *)a3 + 7))
        goto LABEL_54;
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_isiCloudSignedIn != *((_DWORD *)a3 + 8))
        goto LABEL_54;
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x200) == 0 || self->_registrationStatus != *((_DWORD *)a3 + 12))
        goto LABEL_54;
    }
    else if ((*((_WORD *)a3 + 32) & 0x200) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_registrationError != *((_DWORD *)a3 + 10))
        goto LABEL_54;
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_54;
    }
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x100) == 0 || self->_registrationErrorReason != *((_DWORD *)a3 + 11))
        goto LABEL_54;
    }
    else if ((*((_WORD *)a3 + 32) & 0x100) != 0)
    {
      goto LABEL_54;
    }
    LOBYTE(v5) = (v9 & 0x40) == 0;
    if ((has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_isiTunesSignedIn != *((_DWORD *)a3 + 9))
        goto LABEL_54;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_accountType;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_serviceIdentifier, "hash");
  v7 = (__int16)self->_has;
  if ((v7 & 4) != 0)
  {
    v8 = 2654435761 * self->_doesExist;
    if ((v7 & 8) != 0)
    {
LABEL_8:
      v9 = 2654435761 * self->_isEnabled;
      if ((v7 & 0x10) != 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else
  {
    v8 = 0;
    if ((v7 & 8) != 0)
      goto LABEL_8;
  }
  v9 = 0;
  if ((v7 & 0x10) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_isUserDisabled;
    if ((v7 & 0x20) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
  if ((v7 & 0x20) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_isiCloudSignedIn;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_registrationStatus;
    if ((v7 & 0x80) != 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  v12 = 0;
  if ((v7 & 0x80) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_registrationError;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_13;
LABEL_21:
    v14 = 0;
    if ((v7 & 0x40) != 0)
      goto LABEL_14;
LABEL_22:
    v15 = 0;
    return v5 ^ v4 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v6;
  }
LABEL_20:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_21;
LABEL_13:
  v14 = 2654435761 * self->_registrationErrorReason;
  if ((v7 & 0x40) == 0)
    goto LABEL_22;
LABEL_14:
  v15 = 2654435761 * self->_isiTunesSignedIn;
  return v5 ^ v4 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  __int16 v6;

  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)a3 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_accountType = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 7))
    -[AWDIDSRegistrationAccountStatus setServiceIdentifier:](self, "setServiceIdentifier:");
  v6 = *((_WORD *)a3 + 32);
  if ((v6 & 4) != 0)
  {
    self->_doesExist = *((_DWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 4u;
    v6 = *((_WORD *)a3 + 32);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_isEnabled = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  self->_isUserDisabled = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  self->_isiCloudSignedIn = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x200) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  self->_registrationStatus = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x80) == 0)
  {
LABEL_13:
    if ((v6 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  self->_registrationError = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_14:
    if ((v6 & 0x40) == 0)
      return;
    goto LABEL_15;
  }
LABEL_23:
  self->_registrationErrorReason = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 32) & 0x40) == 0)
    return;
LABEL_15:
  self->_isiTunesSignedIn = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)accountType
{
  return self->_accountType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (unsigned)doesExist
{
  return self->_doesExist;
}

- (unsigned)isEnabled
{
  return self->_isEnabled;
}

- (unsigned)isUserDisabled
{
  return self->_isUserDisabled;
}

- (unsigned)isiCloudSignedIn
{
  return self->_isiCloudSignedIn;
}

- (int)registrationStatus
{
  return self->_registrationStatus;
}

- (int)registrationError
{
  return self->_registrationError;
}

- (int)registrationErrorReason
{
  return self->_registrationErrorReason;
}

- (unsigned)isiTunesSignedIn
{
  return self->_isiTunesSignedIn;
}

@end
