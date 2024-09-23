@implementation AWDFaceTimeCallCancelSent

- (void)dealloc
{
  objc_super v3;

  -[AWDFaceTimeCallCancelSent setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallCancelSent;
  -[AWDFaceTimeCallCancelSent dealloc](&v3, sel_dealloc);
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
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

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCancelCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cancelCode = a3;
}

- (void)setHasCancelCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCancelCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSendDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_sendDuration = a3;
}

- (void)setHasSendDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSendDuration
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsVideo:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsVideo
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setOnLockScreen:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_onLockScreen = a3;
}

- (void)setHasOnLockScreen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOnLockScreen
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallCancelSent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDFaceTimeCallCancelSent description](&v3, sel_description), -[AWDFaceTimeCallCancelSent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guid;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_errorCode), CFSTR("errorCode"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cancelCode), CFSTR("cancelCode"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_15:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isVideo), CFSTR("isVideo"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v4;
    goto LABEL_9;
  }
LABEL_14:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sendDuration), CFSTR("sendDuration"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 0x10) != 0)
LABEL_9:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_onLockScreen), CFSTR("onLockScreen"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFaceTimeCallCancelSentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_guid)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return;
LABEL_15:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 5) = self->_errorCode;
  *((_BYTE *)a3 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 4) = self->_cancelCode;
  *((_BYTE *)a3 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 10) = self->_sendDuration;
  *((_BYTE *)a3 + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return;
    goto LABEL_9;
  }
LABEL_15:
  *((_DWORD *)a3 + 8) = self->_isVideo;
  *((_BYTE *)a3 + 44) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return;
LABEL_9:
  *((_DWORD *)a3 + 9) = self->_onLockScreen;
  *((_BYTE *)a3 + 44) |= 0x10u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 20) = self->_errorCode;
  *(_BYTE *)(v5 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(_DWORD *)(v5 + 16) = self->_cancelCode;
  *(_BYTE *)(v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_13:
    *(_DWORD *)(v5 + 32) = self->_isVideo;
    *(_BYTE *)(v5 + 44) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v5;
    goto LABEL_7;
  }
LABEL_12:
  *(_DWORD *)(v5 + 40) = self->_sendDuration;
  *(_BYTE *)(v5 + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 36) = self->_onLockScreen;
    *(_BYTE *)(v5 + 44) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *guid;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_33;
      }
      else if ((*((_BYTE *)a3 + 44) & 1) != 0)
      {
LABEL_33:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_errorCode != *((_DWORD *)a3 + 5))
          goto LABEL_33;
      }
      else if ((*((_BYTE *)a3 + 44) & 4) != 0)
      {
        goto LABEL_33;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_cancelCode != *((_DWORD *)a3 + 4))
          goto LABEL_33;
      }
      else if ((*((_BYTE *)a3 + 44) & 2) != 0)
      {
        goto LABEL_33;
      }
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 0x20) == 0 || self->_sendDuration != *((_DWORD *)a3 + 10))
          goto LABEL_33;
      }
      else if ((*((_BYTE *)a3 + 44) & 0x20) != 0)
      {
        goto LABEL_33;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_isVideo != *((_DWORD *)a3 + 8))
          goto LABEL_33;
      }
      else if ((*((_BYTE *)a3 + 44) & 8) != 0)
      {
        goto LABEL_33;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 0x10) == 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_onLockScreen != *((_DWORD *)a3 + 9))
          goto LABEL_33;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_guid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_errorCode;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_cancelCode;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_sendDuration;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_12:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
LABEL_13:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_11:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v8 = 2654435761 * self->_isVideo;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_7:
  v9 = 2654435761 * self->_onLockScreen;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 3))
    -[AWDFaceTimeCallCancelSent setGuid:](self, "setGuid:");
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_errorCode = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_cancelCode = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  self->_sendDuration = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      return;
    goto LABEL_9;
  }
LABEL_15:
  self->_isVideo = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 44) & 0x10) == 0)
    return;
LABEL_9:
  self->_onLockScreen = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
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

- (int)errorCode
{
  return self->_errorCode;
}

- (unsigned)cancelCode
{
  return self->_cancelCode;
}

- (unsigned)sendDuration
{
  return self->_sendDuration;
}

- (unsigned)isVideo
{
  return self->_isVideo;
}

- (unsigned)onLockScreen
{
  return self->_onLockScreen;
}

@end
