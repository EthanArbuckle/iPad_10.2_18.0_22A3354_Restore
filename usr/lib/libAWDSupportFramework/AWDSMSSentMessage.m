@implementation AWDSMSSentMessage

- (void)dealloc
{
  objc_super v3;

  -[AWDSMSSentMessage setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSMSSentMessage;
  -[AWDSMSSentMessage dealloc](&v3, sel_dealloc);
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

- (void)setFzError:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_fzError = a3;
}

- (void)setHasFzError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFzError
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCtError:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ctError = a3;
}

- (void)setHasCtError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCtError
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsGroupMessage:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isGroupMessage = a3;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsGroupMessage
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsToPhoneNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isToPhoneNumber = a3;
}

- (void)setHasIsToPhoneNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsToPhoneNumber
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsToEmail:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isToEmail = a3;
}

- (void)setHasIsToEmail:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsToEmail
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasAttachments:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_hasAttachments = a3;
}

- (void)setHasHasAttachments:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasAttachments
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSendDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_sendDuration = a3;
}

- (void)setHasSendDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSendDuration
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSMSSentMessage;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSMSSentMessage description](&v3, sel_description), -[AWDSMSSentMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
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
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_fzError), CFSTR("fzError"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_ctError), CFSTR("ctError"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isGroupMessage), CFSTR("isGroupMessage"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isToPhoneNumber), CFSTR("isToPhoneNumber"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_18:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hasAttachments), CFSTR("hasAttachments"));
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      return v4;
LABEL_19:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sendDuration), CFSTR("sendDuration"));
    return v4;
  }
LABEL_17:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isToEmail), CFSTR("isToEmail"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_18;
LABEL_10:
  if (has < 0)
    goto LABEL_19;
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSMSSentMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_14;
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
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      return;
LABEL_19:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    goto LABEL_19;
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
    *((_BYTE *)a3 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 5) = self->_fzError;
  *((_BYTE *)a3 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 4) = self->_ctError;
  *((_BYTE *)a3 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_isGroupMessage;
  *((_BYTE *)a3 + 52) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 11) = self->_isToPhoneNumber;
  *((_BYTE *)a3 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 10) = self->_isToEmail;
  *((_BYTE *)a3 + 52) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      return;
LABEL_19:
    *((_DWORD *)a3 + 12) = self->_sendDuration;
    *((_BYTE *)a3 + 52) |= 0x80u;
    return;
  }
LABEL_18:
  *((_DWORD *)a3 + 8) = self->_hasAttachments;
  *((_BYTE *)a3 + 52) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    goto LABEL_19;
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
    *(_BYTE *)(v5 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 20) = self->_fzError;
  *(_BYTE *)(v5 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 16) = self->_ctError;
  *(_BYTE *)(v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 36) = self->_isGroupMessage;
  *(_BYTE *)(v5 + 52) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 44) = self->_isToPhoneNumber;
  *(_BYTE *)(v5 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_16:
    *(_DWORD *)(v5 + 32) = self->_hasAttachments;
    *(_BYTE *)(v5 + 52) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      return (id)v5;
LABEL_17:
    *(_DWORD *)(v5 + 48) = self->_sendDuration;
    *(_BYTE *)(v5 + 52) |= 0x80u;
    return (id)v5;
  }
LABEL_15:
  *(_DWORD *)(v5 + 40) = self->_isToEmail;
  *(_BYTE *)(v5 + 52) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
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
        if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 52) & 1) != 0)
      {
LABEL_43:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_fzError != *((_DWORD *)a3 + 5))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 52) & 4) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_ctError != *((_DWORD *)a3 + 4))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 52) & 2) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 0x10) == 0 || self->_isGroupMessage != *((_DWORD *)a3 + 9))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 0x40) == 0 || self->_isToPhoneNumber != *((_DWORD *)a3 + 11))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 52) & 0x40) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 0x20) == 0 || self->_isToEmail != *((_DWORD *)a3 + 10))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 52) & 0x20) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_hasAttachments != *((_DWORD *)a3 + 8))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 52) & 8) != 0)
      {
        goto LABEL_43;
      }
      LOBYTE(v5) = *((char *)a3 + 52) >= 0;
      if ((*(_BYTE *)&self->_has & 0x80) != 0)
      {
        if ((*((_BYTE *)a3 + 52) & 0x80) == 0 || self->_sendDuration != *((_DWORD *)a3 + 12))
          goto LABEL_43;
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
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_guid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_fzError;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_12;
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
    v6 = 2654435761 * self->_ctError;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_isGroupMessage;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_isToPhoneNumber;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_isToEmail;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_16:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_9;
LABEL_17:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_15:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_16;
LABEL_8:
  v10 = 2654435761 * self->_hasAttachments;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_17;
LABEL_9:
  v11 = 2654435761 * self->_sendDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 3))
    -[AWDSMSSentMessage setGuid:](self, "setGuid:");
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)a3 + 52) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_fzError = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_ctError = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  self->_isGroupMessage = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  self->_isToPhoneNumber = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  self->_isToEmail = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      return;
LABEL_19:
    self->_sendDuration = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 0x80u;
    return;
  }
LABEL_18:
  self->_hasAttachments = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 52) & 0x80) != 0)
    goto LABEL_19;
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

- (int)fzError
{
  return self->_fzError;
}

- (int)ctError
{
  return self->_ctError;
}

- (unsigned)isGroupMessage
{
  return self->_isGroupMessage;
}

- (unsigned)isToPhoneNumber
{
  return self->_isToPhoneNumber;
}

- (unsigned)isToEmail
{
  return self->_isToEmail;
}

- (unsigned)hasAttachments
{
  return self->_hasAttachments;
}

- (unsigned)sendDuration
{
  return self->_sendDuration;
}

@end
