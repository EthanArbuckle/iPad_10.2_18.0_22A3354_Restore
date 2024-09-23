@implementation AWDSafariAutoFillAuthenticationEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDSafariAutoFillAuthenticationEvent setErrorDomain:](self, "setErrorDomain:", 0);
  -[AWDSafariAutoFillAuthenticationEvent setErrorCode:](self, "setErrorCode:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariAutoFillAuthenticationEvent;
  -[AWDSafariAutoFillAuthenticationEvent dealloc](&v3, sel_dealloc);
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

- (int)category
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_category;
  else
    return 0;
}

- (void)setCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCategory
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)categoryAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DFD0[a3];
}

- (int)StringAsCategory:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CREDIT_CARD")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PASSWORD")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("UNKNOWN_CATEGORY")))
    return 3;
  return 0;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DFF0[a3];
}

- (int)StringAsStatus:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SUCCESSFUL_AUTHENTICATION")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("FAILED_AUTHENTICATION")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("HAS_CACHED_SUCCESSFUL_AUTHENTICATION")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HAS_CACHED_FAILED_AUTHENTICATION")))
    return 3;
  return 0;
}

- (int)client
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_client;
  else
    return 0;
}

- (void)setClient:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_client = a3;
}

- (void)setHasClient:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasClient
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)clientAsString:(int)a3
{
  if (a3 >= 9)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E010[a3];
}

- (int)StringAsClient:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SAFARI_CLIENT")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SAFARI_VIEW_CONTROLLER")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SF_AUTHENTICATION_SESSION")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WEB_APP")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("APP_AUTOFILL")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WEB_SHEET")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SHARED_WEB_CREDENTIALS")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DATA_ACTIVATION")) & 1) != 0)
    return 7;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("UNKNOWN_CLIENT")))
    return 8;
  return 0;
}

- (void)setOnPageLoad:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_onPageLoad = a3;
}

- (void)setHasOnPageLoad:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOnPageLoad
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariAutoFillAuthenticationEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariAutoFillAuthenticationEvent description](&v3, sel_description), -[AWDSafariAutoFillAuthenticationEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *errorDomain;
  NSString *errorCode;
  uint64_t category;
  __CFString *v9;
  uint64_t status;
  __CFString *v11;
  uint64_t client;
  __CFString *v13;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  category = self->_category;
  if (category >= 4)
    v9 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_category);
  else
    v9 = off_24C10DFD0[category];
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("category"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_17:
  status = self->_status;
  if (status >= 4)
    v11 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
  else
    v11 = off_24C10DFF0[status];
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("status"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_21:
  client = self->_client;
  if (client >= 9)
    v13 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_client);
  else
    v13 = off_24C10E010[client];
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("client"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_onPageLoad), CFSTR("onPageLoad"));
LABEL_7:
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  errorCode = self->_errorCode;
  if (errorCode)
    objc_msgSend(v3, "setObject:forKey:", errorCode, CFSTR("errorCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariAutoFillAuthenticationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  if (self->_errorCode)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_category;
  *((_BYTE *)a3 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 10) = self->_status;
  *((_BYTE *)a3 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_client;
  *((_BYTE *)a3 + 48) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((_BYTE *)a3 + 44) = self->_onPageLoad;
    *((_BYTE *)a3 + 48) |= 0x10u;
  }
LABEL_7:
  if (self->_errorDomain)
    objc_msgSend(a3, "setErrorDomain:");
  if (self->_errorCode)
    objc_msgSend(a3, "setErrorCode:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_category;
  *(_BYTE *)(v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    *(_DWORD *)(v5 + 20) = self->_client;
    *(_BYTE *)(v5 + 48) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 40) = self->_status;
  *(_BYTE *)(v5 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *(_BYTE *)(v5 + 44) = self->_onPageLoad;
    *(_BYTE *)(v5 + 48) |= 0x10u;
  }
LABEL_7:

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_errorCode, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *errorDomain;
  NSString *errorCode;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_category != *((_DWORD *)a3 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)a3 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_status != *((_DWORD *)a3 + 10))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)a3 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_client != *((_DWORD *)a3 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)a3 + 48) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x10) == 0)
      goto LABEL_32;
LABEL_26:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((_BYTE *)a3 + 48) & 0x10) == 0)
    goto LABEL_26;
  if (self->_onPageLoad)
  {
    if (!*((_BYTE *)a3 + 44))
      goto LABEL_26;
    goto LABEL_32;
  }
  if (*((_BYTE *)a3 + 44))
    goto LABEL_26;
LABEL_32:
  errorDomain = self->_errorDomain;
  if (!((unint64_t)errorDomain | *((_QWORD *)a3 + 4))
    || (v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
  {
    errorCode = self->_errorCode;
    if ((unint64_t)errorCode | *((_QWORD *)a3 + 3))
      LOBYTE(v5) = -[NSString isEqual:](errorCode, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_category;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_status;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_client;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_onPageLoad;
LABEL_12:
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_errorDomain, "hash");
  return v8 ^ -[NSString hash](self->_errorCode, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_category = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_status = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  self->_client = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 48) & 0x10) != 0)
  {
LABEL_6:
    self->_onPageLoad = *((_BYTE *)a3 + 44);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_7:
  if (*((_QWORD *)a3 + 4))
    -[AWDSafariAutoFillAuthenticationEvent setErrorDomain:](self, "setErrorDomain:");
  if (*((_QWORD *)a3 + 3))
    -[AWDSafariAutoFillAuthenticationEvent setErrorCode:](self, "setErrorCode:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)onPageLoad
{
  return self->_onPageLoad;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
