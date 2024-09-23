@implementation AWDIMessageQueryFinished

- (void)dealloc
{
  objc_super v3;

  -[AWDIMessageQueryFinished setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageQueryFinished;
  -[AWDIMessageQueryFinished dealloc](&v3, sel_dealloc);
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
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

- (void)setSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSuccess
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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

- (void)setQueryDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_queryDuration = a3;
}

- (void)setHasQueryDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQueryDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsPhoneNumber:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isPhoneNumber = a3;
}

- (void)setHasIsPhoneNumber:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsPhoneNumber
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsEmail:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isEmail = a3;
}

- (void)setHasIsEmail:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsEmail
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResultCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_resultCode = a3;
}

- (void)setHasResultCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasResultCode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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
  *(_WORD *)&self->_has |= 0x200u;
  self->_uRLError = a3;
}

- (void)setHasURLError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasURLError
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPOSIXError:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pOSIXError = a3;
}

- (void)setHasPOSIXError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPOSIXError
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setWasReversePushAttempted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_wasReversePushAttempted = a3;
}

- (void)setHasWasReversePushAttempted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWasReversePushAttempted
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageQueryFinished;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMessageQueryFinished description](&v3, sel_description), -[AWDIMessageQueryFinished dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guid;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_success), CFSTR("success"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_queryDuration), CFSTR("queryDuration"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isPhoneNumber), CFSTR("isPhoneNumber"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isEmail), CFSTR("isEmail"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resultCode), CFSTR("resultCode"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_genericError), CFSTR("genericError"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
LABEL_25:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pOSIXError), CFSTR("POSIXError"));
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return v4;
    goto LABEL_14;
  }
LABEL_24:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_uRLError), CFSTR("URLError"));
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_25;
LABEL_13:
  if ((has & 0x400) != 0)
LABEL_14:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wasReversePushAttempted), CFSTR("wasReversePushAttempted"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageQueryFinishedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  if (self->_guid)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      return;
LABEL_25:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    goto LABEL_25;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 13) = self->_success;
  *((_WORD *)a3 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_WORD *)a3 + 32) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_queryDuration;
  *((_WORD *)a3 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 9) = self->_isPhoneNumber;
  *((_WORD *)a3 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 8) = self->_isEmail;
  *((_WORD *)a3 + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 12) = self->_resultCode;
  *((_WORD *)a3 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 5) = self->_genericError;
  *((_WORD *)a3 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 14) = self->_uRLError;
  *((_WORD *)a3 + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      return;
    goto LABEL_14;
  }
LABEL_25:
  *((_DWORD *)a3 + 10) = self->_pOSIXError;
  *((_WORD *)a3 + 32) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    return;
LABEL_14:
  *((_DWORD *)a3 + 15) = self->_wasReversePushAttempted;
  *((_WORD *)a3 + 32) |= 0x400u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 64) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 52) = self->_success;
  *(_WORD *)(v5 + 64) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 16) = self->_connectionType;
  *(_WORD *)(v5 + 64) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 44) = self->_queryDuration;
  *(_WORD *)(v5 + 64) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 36) = self->_isPhoneNumber;
  *(_WORD *)(v5 + 64) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 32) = self->_isEmail;
  *(_WORD *)(v5 + 64) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 48) = self->_resultCode;
  *(_WORD *)(v5 + 64) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 20) = self->_genericError;
  *(_WORD *)(v5 + 64) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_23:
    *(_DWORD *)(v5 + 40) = self->_pOSIXError;
    *(_WORD *)(v5 + 64) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return (id)v5;
    goto LABEL_12;
  }
LABEL_22:
  *(_DWORD *)(v5 + 56) = self->_uRLError;
  *(_WORD *)(v5 + 64) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x400) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 60) = self->_wasReversePushAttempted;
    *(_WORD *)(v5 + 64) |= 0x400u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *guid;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      has = (__int16)self->_has;
      v8 = *((_WORD *)a3 + 32);
      if ((has & 1) != 0)
      {
        if ((v8 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_58;
      }
      else if ((v8 & 1) != 0)
      {
LABEL_58:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 32) & 0x100) == 0 || self->_success != *((_DWORD *)a3 + 13))
          goto LABEL_58;
      }
      else if ((*((_WORD *)a3 + 32) & 0x100) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4))
          goto LABEL_58;
      }
      else if ((v8 & 2) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_queryDuration != *((_DWORD *)a3 + 11))
          goto LABEL_58;
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_isPhoneNumber != *((_DWORD *)a3 + 9))
          goto LABEL_58;
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_isEmail != *((_DWORD *)a3 + 8))
          goto LABEL_58;
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_resultCode != *((_DWORD *)a3 + 12))
          goto LABEL_58;
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_genericError != *((_DWORD *)a3 + 5))
          goto LABEL_58;
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 32) & 0x200) == 0 || self->_uRLError != *((_DWORD *)a3 + 14))
          goto LABEL_58;
      }
      else if ((*((_WORD *)a3 + 32) & 0x200) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_pOSIXError != *((_DWORD *)a3 + 10))
          goto LABEL_58;
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_58;
      }
      LOBYTE(v5) = (v8 & 0x400) == 0;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 32) & 0x400) == 0 || self->_wasReversePushAttempted != *((_DWORD *)a3 + 15))
          goto LABEL_58;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = -[NSString hash](self->_guid, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_success;
      if ((has & 2) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_connectionType;
    if ((has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_queryDuration;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_isPhoneNumber;
    if ((has & 8) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_isEmail;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v11 = 2654435761 * self->_resultCode;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v12 = 2654435761 * self->_genericError;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v13 = 2654435761 * self->_uRLError;
    if ((has & 0x20) != 0)
      goto LABEL_11;
LABEL_22:
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
LABEL_23:
    v15 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  v13 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_22;
LABEL_11:
  v14 = 2654435761 * self->_pOSIXError;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_23;
LABEL_12:
  v15 = 2654435761 * self->_wasReversePushAttempted;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if (*((_QWORD *)a3 + 3))
    -[AWDIMessageQueryFinished setGuid:](self, "setGuid:");
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)a3 + 32);
    if ((v5 & 0x100) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((*((_WORD *)a3 + 32) & 0x100) == 0)
  {
    goto LABEL_5;
  }
  self->_success = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_queryDuration = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_isPhoneNumber = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_isEmail = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  self->_resultCode = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  self->_genericError = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  self->_uRLError = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0)
      return;
    goto LABEL_14;
  }
LABEL_25:
  self->_pOSIXError = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 32) & 0x400) == 0)
    return;
LABEL_14:
  self->_wasReversePushAttempted = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x400u;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)queryDuration
{
  return self->_queryDuration;
}

- (unsigned)isPhoneNumber
{
  return self->_isPhoneNumber;
}

- (unsigned)isEmail
{
  return self->_isEmail;
}

- (int)resultCode
{
  return self->_resultCode;
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

- (unsigned)wasReversePushAttempted
{
  return self->_wasReversePushAttempted;
}

@end
