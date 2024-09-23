@implementation AWDIMessageNicknameRetrieved

- (void)dealloc
{
  objc_super v3;

  -[AWDIMessageNicknameRetrieved setPublicOperationalErrorDomain:](self, "setPublicOperationalErrorDomain:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageNicknameRetrieved;
  -[AWDIMessageNicknameRetrieved dealloc](&v3, sel_dealloc);
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

- (void)setTimeTaken:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeTaken = a3;
}

- (void)setHasTimeTaken:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeTaken
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUpdated:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_updated = a3;
}

- (void)setHasUpdated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasUpdated
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasAvatar:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_hasAvatar = a3;
}

- (void)setHasHasAvatar:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasAvatar
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPublicSuccess:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_publicSuccess = a3;
}

- (void)setHasPublicSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPublicSuccess
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasPublicOperationalErrorDomain
{
  return self->_publicOperationalErrorDomain != 0;
}

- (void)setPublicOperationalErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_publicOperationalErrorCode = a3;
}

- (void)setHasPublicOperationalErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPublicOperationalErrorCode
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v3.super_class = (Class)AWDIMessageNicknameRetrieved;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMessageNicknameRetrieved description](&v3, sel_description), -[AWDIMessageNicknameRetrieved dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *publicOperationalErrorDomain;
  char v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeTaken), CFSTR("timeTaken"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_updated), CFSTR("updated"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hasAvatar), CFSTR("hasAvatar"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_publicSuccess), CFSTR("publicSuccess"));
LABEL_7:
  publicOperationalErrorDomain = self->_publicOperationalErrorDomain;
  if (publicOperationalErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", publicOperationalErrorDomain, CFSTR("publicOperationalErrorDomain"));
  v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_11;
LABEL_20:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_12;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_publicOperationalErrorCode), CFSTR("publicOperationalErrorCode"));
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
    goto LABEL_20;
LABEL_11:
  if ((v6 & 4) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageNicknameRetrievedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_publicOperationalErrorDomain)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
    if ((v5 & 0x10) == 0)
    {
LABEL_11:
      if ((v5 & 4) == 0)
        return;
LABEL_20:
      PBDataWriterWriteUint32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_20;
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = self->_timeTaken;
  *((_BYTE *)a3 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 13) = self->_updated;
  *((_BYTE *)a3 + 56) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  *((_DWORD *)a3 + 7) = self->_hasAvatar;
  *((_BYTE *)a3 + 56) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 12) = self->_publicSuccess;
    *((_BYTE *)a3 + 56) |= 0x40u;
  }
LABEL_7:
  if (self->_publicOperationalErrorDomain)
    objc_msgSend(a3, "setPublicOperationalErrorDomain:");
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_publicOperationalErrorCode;
    *((_BYTE *)a3 + 56) |= 0x20u;
    v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0)
        return;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)a3 + 8) = self->_linkQuality;
  *((_BYTE *)a3 + 56) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_12:
  *((_DWORD *)a3 + 6) = self->_connectionType;
  *((_BYTE *)a3 + 56) |= 4u;
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
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_timeTaken;
  *(_BYTE *)(v5 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 52) = self->_updated;
  *(_BYTE *)(v5 + 56) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  *(_DWORD *)(v5 + 28) = self->_hasAvatar;
  *(_BYTE *)(v5 + 56) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 48) = self->_publicSuccess;
    *(_BYTE *)(v5 + 56) |= 0x40u;
  }
LABEL_7:

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_publicOperationalErrorDomain, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_9;
LABEL_18:
    *(_DWORD *)(v6 + 32) = self->_linkQuality;
    *(_BYTE *)(v6 + 56) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v6;
    goto LABEL_10;
  }
  *(_DWORD *)(v6 + 36) = self->_publicOperationalErrorCode;
  *(_BYTE *)(v6 + 56) |= 0x20u;
  v8 = (char)self->_has;
  if ((v8 & 0x10) != 0)
    goto LABEL_18;
LABEL_9:
  if ((v8 & 4) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 24) = self->_connectionType;
    *(_BYTE *)(v6 + 56) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *publicOperationalErrorDomain;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
      goto LABEL_44;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_timeTaken != *((_QWORD *)a3 + 1))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
      goto LABEL_44;
    }
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x80) == 0 || self->_updated != *((_DWORD *)a3 + 13))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x80) != 0)
    {
LABEL_44:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_hasAvatar != *((_DWORD *)a3 + 7))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 56) & 8) != 0)
    {
      goto LABEL_44;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x40) == 0 || self->_publicSuccess != *((_DWORD *)a3 + 12))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x40) != 0)
    {
      goto LABEL_44;
    }
    publicOperationalErrorDomain = self->_publicOperationalErrorDomain;
    if ((unint64_t)publicOperationalErrorDomain | *((_QWORD *)a3 + 5))
    {
      v5 = -[NSString isEqual:](publicOperationalErrorDomain, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x20) == 0 || self->_publicOperationalErrorCode != *((_DWORD *)a3 + 9))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x20) != 0)
    {
      goto LABEL_44;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_linkQuality != *((_DWORD *)a3 + 8))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_44;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 6))
        goto LABEL_44;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_timeTaken;
      if ((*(_BYTE *)&self->_has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_updated;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_hasAvatar;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_publicSuccess;
    goto LABEL_12;
  }
LABEL_11:
  v7 = 0;
LABEL_12:
  v8 = -[NSString hash](self->_publicOperationalErrorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_14;
LABEL_17:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_15;
LABEL_18:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v8;
  }
  v9 = 2654435761 * self->_publicOperationalErrorCode;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_17;
LABEL_14:
  v10 = 2654435761 * self->_linkQuality;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_18;
LABEL_15:
  v11 = 2654435761 * self->_connectionType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;

  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 56);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_timeTaken = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_updated = *((_DWORD *)a3 + 13);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  self->_hasAvatar = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 56) & 0x40) != 0)
  {
LABEL_6:
    self->_publicSuccess = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_7:
  if (*((_QWORD *)a3 + 5))
    -[AWDIMessageNicknameRetrieved setPublicOperationalErrorDomain:](self, "setPublicOperationalErrorDomain:");
  v6 = *((_BYTE *)a3 + 56);
  if ((v6 & 0x20) != 0)
  {
    self->_publicOperationalErrorCode = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)a3 + 56);
    if ((v6 & 0x10) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0)
        return;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_linkQuality = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 56) & 4) == 0)
    return;
LABEL_12:
  self->_connectionType = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)timeTaken
{
  return self->_timeTaken;
}

- (unsigned)updated
{
  return self->_updated;
}

- (unsigned)hasAvatar
{
  return self->_hasAvatar;
}

- (unsigned)publicSuccess
{
  return self->_publicSuccess;
}

- (NSString)publicOperationalErrorDomain
{
  return self->_publicOperationalErrorDomain;
}

- (void)setPublicOperationalErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unsigned)publicOperationalErrorCode
{
  return self->_publicOperationalErrorCode;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

@end
