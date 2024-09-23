@implementation AWDIDSGenericConnectionSetupDurationEvent

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

- (void)setLinkType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLinkType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setConnectionSetupDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_connectionSetupDuration = a3;
}

- (void)setHasConnectionSetupDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectionSetupDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSGenericConnectionSetupDurationEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSGenericConnectionSetupDurationEvent description](&v3, sel_description), -[AWDIDSGenericConnectionSetupDurationEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_linkType), CFSTR("linkType"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectionSetupDuration), CFSTR("connectionSetupDuration"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_errorCode), CFSTR("errorCode"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_success), CFSTR("success"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSGenericConnectionSetupDurationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_13;
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
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_linkType;
  *((_BYTE *)a3 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)a3 + 1) = self->_connectionSetupDuration;
  *((_BYTE *)a3 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)a3 + 36) = self->_success;
  *((_BYTE *)a3 + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return;
LABEL_13:
    *((_DWORD *)a3 + 6) = self->_connectionType;
    *((_BYTE *)a3 + 40) |= 4u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 7) = self->_errorCode;
  *((_BYTE *)a3 + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_timestamp;
    *((_BYTE *)result + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_linkType;
  *((_BYTE *)result + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_QWORD *)result + 1) = self->_connectionSetupDuration;
  *((_BYTE *)result + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 36) = self->_success;
  *((_BYTE *)result + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_errorCode;
  *((_BYTE *)result + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 6) = self->_connectionType;
  *((_BYTE *)result + 40) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 40) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 0x10) == 0 || self->_linkType != *((_DWORD *)a3 + 8))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_connectionSetupDuration != *((_QWORD *)a3 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    if ((*((_BYTE *)a3 + 40) & 0x20) != 0)
      goto LABEL_34;
    goto LABEL_25;
  }
  if ((*((_BYTE *)a3 + 40) & 0x20) == 0)
    goto LABEL_34;
  if (self->_success)
  {
    if (!*((_BYTE *)a3 + 36))
      goto LABEL_34;
    goto LABEL_25;
  }
  if (*((_BYTE *)a3 + 36))
  {
LABEL_34:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_25:
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_errorCode != *((_DWORD *)a3 + 7))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 40) & 8) != 0)
  {
    goto LABEL_34;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 6))
      goto LABEL_34;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_linkType;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_connectionSetupDuration;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_success;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_connectionType;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 40);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_linkType = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  self->_connectionSetupDuration = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  self->_success = *((_BYTE *)a3 + 36);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0)
      return;
LABEL_13:
    self->_connectionType = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }
LABEL_12:
  self->_errorCode = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 40) & 4) != 0)
    goto LABEL_13;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)linkType
{
  return self->_linkType;
}

- (unint64_t)connectionSetupDuration
{
  return self->_connectionSetupDuration;
}

- (BOOL)success
{
  return self->_success;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

@end
