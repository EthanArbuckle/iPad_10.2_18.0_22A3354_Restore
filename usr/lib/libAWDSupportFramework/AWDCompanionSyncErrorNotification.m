@implementation AWDCompanionSyncErrorNotification

- (void)dealloc
{
  objc_super v3;

  -[AWDCompanionSyncErrorNotification setService:](self, "setService:", 0);
  -[AWDCompanionSyncErrorNotification setErrorDomain:](self, "setErrorDomain:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncErrorNotification;
  -[AWDCompanionSyncErrorNotification dealloc](&v3, sel_dealloc);
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

- (BOOL)hasService
{
  return self->_service != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncErrorNotification;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCompanionSyncErrorNotification description](&v3, sel_description), -[AWDCompanionSyncErrorNotification dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *service;
  NSString *errorDomain;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_errorCode), CFSTR("errorCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCompanionSyncErrorNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_service)
    PBDataWriterWriteStringField();
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 2u;
  }
  if (self->_service)
    objc_msgSend(a3, "setService:");
  if (self->_errorDomain)
    objc_msgSend(a3, "setErrorDomain:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_errorCode;
    *((_BYTE *)a3 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 2u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_errorCode;
    *(_BYTE *)(v6 + 40) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *service;
  NSString *errorDomain;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_15;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if (!((unint64_t)service | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](service, "isEqual:")) != 0)
    {
      errorDomain = self->_errorDomain;
      if (!((unint64_t)errorDomain | *((_QWORD *)a3 + 3))
        || (v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 1) == 0;
        if ((*(_BYTE *)&self->_has & 1) != 0)
        {
          if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_errorCode != *((_QWORD *)a3 + 1))
            goto LABEL_15;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_service, "hash");
  v5 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_errorCode;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 40) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDCompanionSyncErrorNotification setService:](self, "setService:");
  if (*((_QWORD *)a3 + 3))
    -[AWDCompanionSyncErrorNotification setErrorDomain:](self, "setErrorDomain:");
  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_errorCode = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

@end
