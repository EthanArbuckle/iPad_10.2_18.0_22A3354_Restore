@implementation AWDIDSRegistrationProfileHandleOperation

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSRegistrationProfileHandleOperation setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationProfileHandleOperation;
  -[AWDIDSRegistrationProfileHandleOperation dealloc](&v3, sel_dealloc);
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

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSuccess
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setResultCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_resultCode = a3;
}

- (void)setHasResultCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasResultCode
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRegistrationError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_registrationError = a3;
}

- (void)setHasRegistrationError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRegistrationError
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGenericError:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_genericError = a3;
}

- (void)setHasGenericError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGenericError
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setURLError:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_uRLError = a3;
}

- (void)setHasURLError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasURLError
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPOSIXError:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pOSIXError = a3;
}

- (void)setHasPOSIXError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPOSIXError
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setVettingStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_vettingStatus = a3;
}

- (void)setHasVettingStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasVettingStatus
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationProfileHandleOperation;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSRegistrationProfileHandleOperation description](&v3, sel_description), -[AWDIDSRegistrationProfileHandleOperation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *guid;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_success), CFSTR("success"));
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resultCode), CFSTR("resultCode"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_registrationError), CFSTR("registrationError"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_genericError), CFSTR("genericError"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pOSIXError), CFSTR("POSIXError"));
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_uRLError), CFSTR("URLError"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_12:
  if ((has & 0x100) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_vettingStatus), CFSTR("vettingStatus"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationProfileHandleOperationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_guid)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      return;
LABEL_21:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    goto LABEL_21;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 28) |= 1u;
  }
  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_success;
    *((_WORD *)a3 + 28) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_WORD *)a3 + 28) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 10) = self->_resultCode;
  *((_WORD *)a3 + 28) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 9) = self->_registrationError;
  *((_WORD *)a3 + 28) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 5) = self->_genericError;
  *((_WORD *)a3 + 28) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 12) = self->_uRLError;
  *((_WORD *)a3 + 28) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      return;
    goto LABEL_13;
  }
LABEL_21:
  *((_DWORD *)a3 + 8) = self->_pOSIXError;
  *((_WORD *)a3 + 28) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    return;
LABEL_13:
  *((_DWORD *)a3 + 13) = self->_vettingStatus;
  *((_WORD *)a3 + 28) |= 0x100u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 56) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_success;
    *(_WORD *)(v6 + 56) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 16) = self->_connectionType;
  *(_WORD *)(v6 + 56) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v6 + 40) = self->_resultCode;
  *(_WORD *)(v6 + 56) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v6 + 36) = self->_registrationError;
  *(_WORD *)(v6 + 56) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v6 + 20) = self->_genericError;
  *(_WORD *)(v6 + 56) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_19:
    *(_DWORD *)(v6 + 32) = self->_pOSIXError;
    *(_WORD *)(v6 + 56) |= 8u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      return (id)v6;
    goto LABEL_11;
  }
LABEL_18:
  *(_DWORD *)(v6 + 48) = self->_uRLError;
  *(_WORD *)(v6 + 56) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_10:
  if ((has & 0x100) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 52) = self->_vettingStatus;
    *(_WORD *)(v6 + 56) |= 0x100u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *guid;
  __int16 v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 28);
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_49;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_49:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((_QWORD *)a3 + 3))
    {
      v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v9 = *((_WORD *)a3 + 28);
    if ((has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_success != *((_DWORD *)a3 + 11))
        goto LABEL_49;
    }
    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4))
        goto LABEL_49;
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_resultCode != *((_DWORD *)a3 + 10))
        goto LABEL_49;
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_registrationError != *((_DWORD *)a3 + 9))
        goto LABEL_49;
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_genericError != *((_DWORD *)a3 + 5))
        goto LABEL_49;
    }
    else if ((v9 & 4) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_uRLError != *((_DWORD *)a3 + 12))
        goto LABEL_49;
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_pOSIXError != *((_DWORD *)a3 + 8))
        goto LABEL_49;
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_49;
    }
    LOBYTE(v5) = (v9 & 0x100) == 0;
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 28) & 0x100) == 0 || self->_vettingStatus != *((_DWORD *)a3 + 13))
        goto LABEL_49;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  __int16 has;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((*(_WORD *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_guid, "hash");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v6 = 2654435761 * self->_success;
    if ((has & 2) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_connectionType;
      if ((has & 0x20) != 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = 0;
    if ((has & 2) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_resultCode;
    if ((has & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_registrationError;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_genericError;
    if ((has & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_uRLError;
    if ((has & 8) != 0)
      goto LABEL_11;
LABEL_19:
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_12;
LABEL_20:
    v13 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_18:
  v11 = 0;
  if ((has & 8) == 0)
    goto LABEL_19;
LABEL_11:
  v12 = 2654435761 * self->_pOSIXError;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_20;
LABEL_12:
  v13 = 2654435761 * self->_vettingStatus;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if ((*((_WORD *)a3 + 28) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDIDSRegistrationProfileHandleOperation setGuid:](self, "setGuid:");
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x40) != 0)
  {
    self->_success = *((_DWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 0x40u;
    v5 = *((_WORD *)a3 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  self->_resultCode = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  self->_registrationError = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  self->_genericError = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  self->_uRLError = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0)
      return;
    goto LABEL_13;
  }
LABEL_21:
  self->_pOSIXError = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 28) & 0x100) == 0)
    return;
LABEL_13:
  self->_vettingStatus = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)resultCode
{
  return self->_resultCode;
}

- (unsigned)registrationError
{
  return self->_registrationError;
}

- (int)genericError
{
  return self->_genericError;
}

- (int)uRLError
{
  return self->_uRLError;
}

- (int)pOSIXError
{
  return self->_pOSIXError;
}

- (unsigned)vettingStatus
{
  return self->_vettingStatus;
}

@end
