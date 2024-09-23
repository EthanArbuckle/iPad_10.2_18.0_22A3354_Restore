@implementation AWDIMessageNicknamePublished

- (void)dealloc
{
  objc_super v3;

  -[AWDIMessageNicknamePublished setPublicOperationalErrorDomain:](self, "setPublicOperationalErrorDomain:", 0);
  -[AWDIMessageNicknamePublished setPrivateOperationalErrorDomain:](self, "setPrivateOperationalErrorDomain:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageNicknamePublished;
  -[AWDIMessageNicknamePublished dealloc](&v3, sel_dealloc);
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

- (void)setUpdated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_updated = a3;
}

- (void)setHasUpdated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUpdated
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasAvatar:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hasAvatar = a3;
}

- (void)setHasHasAvatar:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHasAvatar
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPublicSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_publicSuccess = a3;
}

- (void)setHasPublicSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPublicSuccess
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPrivateSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_privateSuccess = a3;
}

- (void)setHasPrivateSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPrivateSuccess
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasPublicOperationalErrorDomain
{
  return self->_publicOperationalErrorDomain != 0;
}

- (void)setPublicOperationalErrorCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_publicOperationalErrorCode = a3;
}

- (void)setHasPublicOperationalErrorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPublicOperationalErrorCode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPrivateOperationalErrorDomain
{
  return self->_privateOperationalErrorDomain != 0;
}

- (void)setPrivateOperationalErrorCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_privateOperationalErrorCode = a3;
}

- (void)setHasPrivateOperationalErrorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPrivateOperationalErrorCode
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(_WORD *)&self->_has >> 3) & 1;
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

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageNicknamePublished;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMessageNicknamePublished description](&v3, sel_description), -[AWDIMessageNicknamePublished dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSString *publicOperationalErrorDomain;
  NSString *privateOperationalErrorDomain;
  __int16 v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_updated), CFSTR("updated"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hasAvatar), CFSTR("hasAvatar"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_publicSuccess), CFSTR("publicSuccess"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_privateSuccess), CFSTR("privateSuccess"));
LABEL_7:
  publicOperationalErrorDomain = self->_publicOperationalErrorDomain;
  if (publicOperationalErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", publicOperationalErrorDomain, CFSTR("publicOperationalErrorDomain"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_publicOperationalErrorCode), CFSTR("publicOperationalErrorCode"));
  privateOperationalErrorDomain = self->_privateOperationalErrorDomain;
  if (privateOperationalErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", privateOperationalErrorDomain, CFSTR("privateOperationalErrorDomain"));
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
    if ((v7 & 8) == 0)
      goto LABEL_15;
LABEL_24:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_16;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_privateOperationalErrorCode), CFSTR("privateOperationalErrorCode"));
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
    goto LABEL_24;
LABEL_15:
  if ((v7 & 2) != 0)
LABEL_16:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageNicknamePublishedReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_publicOperationalErrorDomain)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_privateOperationalErrorDomain)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
    if ((v5 & 8) == 0)
    {
LABEL_15:
      if ((v5 & 2) == 0)
        return;
LABEL_24:
      PBDataWriterWriteUint32Field();
      return;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_24;
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
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 15) = self->_updated;
  *((_WORD *)a3 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_hasAvatar;
  *((_WORD *)a3 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_21:
  *((_DWORD *)a3 + 14) = self->_publicSuccess;
  *((_WORD *)a3 + 32) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 10) = self->_privateSuccess;
    *((_WORD *)a3 + 32) |= 0x20u;
  }
LABEL_7:
  if (self->_publicOperationalErrorDomain)
    objc_msgSend(a3, "setPublicOperationalErrorDomain:");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_publicOperationalErrorCode;
    *((_WORD *)a3 + 32) |= 0x40u;
  }
  if (self->_privateOperationalErrorDomain)
    objc_msgSend(a3, "setPrivateOperationalErrorDomain:");
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_privateOperationalErrorCode;
    *((_WORD *)a3 + 32) |= 0x10u;
    v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_15:
      if ((v6 & 2) == 0)
        return;
      goto LABEL_16;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)a3 + 6) = self->_linkQuality;
  *((_WORD *)a3 + 32) |= 8u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return;
LABEL_16:
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_WORD *)a3 + 32) |= 2u;
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
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 60) = self->_updated;
  *(_WORD *)(v5 + 64) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 20) = self->_hasAvatar;
  *(_WORD *)(v5 + 64) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  *(_DWORD *)(v5 + 56) = self->_publicSuccess;
  *(_WORD *)(v5 + 64) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 40) = self->_privateSuccess;
    *(_WORD *)(v5 + 64) |= 0x20u;
  }
LABEL_7:

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_publicOperationalErrorDomain, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_publicOperationalErrorCode;
    *(_WORD *)(v6 + 64) |= 0x40u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_privateOperationalErrorDomain, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
    if ((v8 & 8) == 0)
      goto LABEL_11;
LABEL_20:
    *(_DWORD *)(v6 + 24) = self->_linkQuality;
    *(_WORD *)(v6 + 64) |= 8u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 28) = self->_privateOperationalErrorCode;
  *(_WORD *)(v6 + 64) |= 0x10u;
  v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
    goto LABEL_20;
LABEL_11:
  if ((v8 & 2) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 16) = self->_connectionType;
    *(_WORD *)(v6 + 64) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *publicOperationalErrorDomain;
  __int16 v9;
  NSString *privateOperationalErrorDomain;
  __int16 v11;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 32);
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_52;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_52:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x100) == 0 || self->_updated != *((_DWORD *)a3 + 15))
        goto LABEL_52;
    }
    else if ((*((_WORD *)a3 + 32) & 0x100) != 0)
    {
      goto LABEL_52;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_hasAvatar != *((_DWORD *)a3 + 5))
        goto LABEL_52;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_52;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_publicSuccess != *((_DWORD *)a3 + 14))
        goto LABEL_52;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_52;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_privateSuccess != *((_DWORD *)a3 + 10))
        goto LABEL_52;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_52;
    }
    publicOperationalErrorDomain = self->_publicOperationalErrorDomain;
    if ((unint64_t)publicOperationalErrorDomain | *((_QWORD *)a3 + 6))
    {
      v5 = -[NSString isEqual:](publicOperationalErrorDomain, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v9 = *((_WORD *)a3 + 32);
    if ((has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_publicOperationalErrorCode != *((_DWORD *)a3 + 11))
        goto LABEL_52;
    }
    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_52;
    }
    privateOperationalErrorDomain = self->_privateOperationalErrorDomain;
    if ((unint64_t)privateOperationalErrorDomain | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](privateOperationalErrorDomain, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v11 = *((_WORD *)a3 + 32);
    if ((has & 0x10) != 0)
    {
      if ((v11 & 0x10) == 0 || self->_privateOperationalErrorCode != *((_DWORD *)a3 + 7))
        goto LABEL_52;
    }
    else if ((v11 & 0x10) != 0)
    {
      goto LABEL_52;
    }
    if ((has & 8) != 0)
    {
      if ((v11 & 8) == 0 || self->_linkQuality != *((_DWORD *)a3 + 6))
        goto LABEL_52;
    }
    else if ((v11 & 8) != 0)
    {
      goto LABEL_52;
    }
    LOBYTE(v5) = (v11 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v11 & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4))
        goto LABEL_52;
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_updated;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_hasAvatar;
    if ((has & 0x80) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v6 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_publicSuccess;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_privateSuccess;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
LABEL_12:
  v9 = -[NSString hash](self->_publicOperationalErrorDomain, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v10 = 2654435761 * self->_publicOperationalErrorCode;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_privateOperationalErrorDomain, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x10) == 0)
  {
    v13 = 0;
    if ((v12 & 8) != 0)
      goto LABEL_17;
LABEL_20:
    v14 = 0;
    if ((v12 & 2) != 0)
      goto LABEL_18;
LABEL_21:
    v15 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v9 ^ v11 ^ v13 ^ v14 ^ v15;
  }
  v13 = 2654435761 * self->_privateOperationalErrorCode;
  if ((v12 & 8) == 0)
    goto LABEL_20;
LABEL_17:
  v14 = 2654435761 * self->_linkQuality;
  if ((v12 & 2) == 0)
    goto LABEL_21;
LABEL_18:
  v15 = 2654435761 * self->_connectionType;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v9 ^ v11 ^ v13 ^ v14 ^ v15;
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
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*((_WORD *)a3 + 32) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_updated = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  self->_hasAvatar = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_21:
  self->_publicSuccess = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 32) & 0x20) != 0)
  {
LABEL_6:
    self->_privateSuccess = *((_DWORD *)a3 + 10);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_7:
  if (*((_QWORD *)a3 + 6))
    -[AWDIMessageNicknamePublished setPublicOperationalErrorDomain:](self, "setPublicOperationalErrorDomain:");
  if ((*((_WORD *)a3 + 32) & 0x40) != 0)
  {
    self->_publicOperationalErrorCode = *((_DWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDIMessageNicknamePublished setPrivateOperationalErrorDomain:](self, "setPrivateOperationalErrorDomain:");
  v6 = *((_WORD *)a3 + 32);
  if ((v6 & 0x10) != 0)
  {
    self->_privateOperationalErrorCode = *((_DWORD *)a3 + 7);
    *(_WORD *)&self->_has |= 0x10u;
    v6 = *((_WORD *)a3 + 32);
    if ((v6 & 8) == 0)
    {
LABEL_15:
      if ((v6 & 2) == 0)
        return;
      goto LABEL_16;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_15;
  }
  self->_linkQuality = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 32) & 2) == 0)
    return;
LABEL_16:
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
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

- (unsigned)privateSuccess
{
  return self->_privateSuccess;
}

- (NSString)publicOperationalErrorDomain
{
  return self->_publicOperationalErrorDomain;
}

- (void)setPublicOperationalErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unsigned)publicOperationalErrorCode
{
  return self->_publicOperationalErrorCode;
}

- (NSString)privateOperationalErrorDomain
{
  return self->_privateOperationalErrorDomain;
}

- (void)setPrivateOperationalErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)privateOperationalErrorCode
{
  return self->_privateOperationalErrorCode;
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
