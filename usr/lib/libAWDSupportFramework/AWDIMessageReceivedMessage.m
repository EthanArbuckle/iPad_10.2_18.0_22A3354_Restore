@implementation AWDIMessageReceivedMessage

- (void)dealloc
{
  objc_super v3;

  -[AWDIMessageReceivedMessage setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageReceivedMessage;
  -[AWDIMessageReceivedMessage dealloc](&v3, sel_dealloc);
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
  *(_BYTE *)&self->_has |= 2u;
  self->_fzError = a3;
}

- (void)setHasFzError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFzError
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMessageError:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_messageError = a3;
}

- (void)setHasMessageError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasMessageError
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setIsTypingIndicator:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isTypingIndicator = a3;
}

- (void)setHasIsTypingIndicator:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsTypingIndicator
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsGroupMessage:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isGroupMessage = a3;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsGroupMessage
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsFromPhoneNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isFromPhoneNumber = a3;
}

- (void)setHasIsFromPhoneNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsFromPhoneNumber
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsFromEmail:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isFromEmail = a3;
}

- (void)setHasIsFromEmail:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsFromEmail
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAttachments:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasAttachments = a3;
}

- (void)setHasHasAttachments:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasAttachments
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageReceivedMessage;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMessageReceivedMessage description](&v3, sel_description), -[AWDIMessageReceivedMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_fzError), CFSTR("fzError"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_messageError), CFSTR("messageError"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isTypingIndicator), CFSTR("isTypingIndicator"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isGroupMessage), CFSTR("isGroupMessage"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_19:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isFromEmail), CFSTR("isFromEmail"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_11;
  }
LABEL_18:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isFromPhoneNumber), CFSTR("isFromPhoneNumber"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_10:
  if ((has & 4) != 0)
LABEL_11:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hasAttachments), CFSTR("hasAttachments"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageReceivedMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
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
    if ((has & 4) == 0)
      return;
LABEL_19:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
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
    *((_BYTE *)a3 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_fzError;
  *((_BYTE *)a3 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 13) = self->_messageError;
  *((_BYTE *)a3 + 56) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 12) = self->_isTypingIndicator;
  *((_BYTE *)a3 + 56) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 11) = self->_isGroupMessage;
  *((_BYTE *)a3 + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 10) = self->_isFromPhoneNumber;
  *((_BYTE *)a3 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      return;
    goto LABEL_11;
  }
LABEL_19:
  *((_DWORD *)a3 + 9) = self->_isFromEmail;
  *((_BYTE *)a3 + 56) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_11:
  *((_DWORD *)a3 + 8) = self->_hasAttachments;
  *((_BYTE *)a3 + 56) |= 4u;
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
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_fzError;
  *(_BYTE *)(v5 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 52) = self->_messageError;
  *(_BYTE *)(v5 + 56) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 48) = self->_isTypingIndicator;
  *(_BYTE *)(v5 + 56) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 44) = self->_isGroupMessage;
  *(_BYTE *)(v5 + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    *(_DWORD *)(v5 + 36) = self->_isFromEmail;
    *(_BYTE *)(v5 + 56) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_9;
  }
LABEL_16:
  *(_DWORD *)(v5 + 40) = self->_isFromPhoneNumber;
  *(_BYTE *)(v5 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 32) = self->_hasAttachments;
    *(_BYTE *)(v5 + 56) |= 4u;
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
        if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 56) & 1) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_fzError != *((_DWORD *)a3 + 4))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 56) & 2) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 0x80) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 0x80) == 0 || self->_messageError != *((_DWORD *)a3 + 13))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 56) & 0x80) != 0)
      {
LABEL_43:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 0x40) == 0 || self->_isTypingIndicator != *((_DWORD *)a3 + 12))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 56) & 0x40) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 0x20) == 0 || self->_isGroupMessage != *((_DWORD *)a3 + 11))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 56) & 0x20) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_isFromPhoneNumber != *((_DWORD *)a3 + 10))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
      {
        goto LABEL_43;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_isFromEmail != *((_DWORD *)a3 + 9))
          goto LABEL_43;
      }
      else if ((*((_BYTE *)a3 + 56) & 8) != 0)
      {
        goto LABEL_43;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 4) == 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_hasAttachments != *((_DWORD *)a3 + 8))
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
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_fzError;
      if ((*(_BYTE *)&self->_has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_messageError;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_isTypingIndicator;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_isGroupMessage;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_isFromPhoneNumber;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_16:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
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
  v10 = 2654435761 * self->_isFromEmail;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_17;
LABEL_9:
  v11 = 2654435761 * self->_hasAttachments;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 3))
    -[AWDIMessageReceivedMessage setGuid:](self, "setGuid:");
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_fzError = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_messageError = *((_DWORD *)a3 + 13);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  self->_isTypingIndicator = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  self->_isGroupMessage = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  self->_isFromPhoneNumber = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      return;
    goto LABEL_11;
  }
LABEL_19:
  self->_isFromEmail = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 56) & 4) == 0)
    return;
LABEL_11:
  self->_hasAttachments = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 4u;
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

- (unsigned)messageError
{
  return self->_messageError;
}

- (unsigned)isTypingIndicator
{
  return self->_isTypingIndicator;
}

- (unsigned)isGroupMessage
{
  return self->_isGroupMessage;
}

- (unsigned)isFromPhoneNumber
{
  return self->_isFromPhoneNumber;
}

- (unsigned)isFromEmail
{
  return self->_isFromEmail;
}

- (unsigned)hasAttachments
{
  return self->_hasAttachments;
}

@end
