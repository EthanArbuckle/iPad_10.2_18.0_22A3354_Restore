@implementation AWDIMessageCloudKitAttachmentDownloadFailed

- (void)dealloc
{
  objc_super v3;

  -[AWDIMessageCloudKitAttachmentDownloadFailed setMessageGuid:](self, "setMessageGuid:", 0);
  -[AWDIMessageCloudKitAttachmentDownloadFailed setAttachmentGuid:](self, "setAttachmentGuid:", 0);
  -[AWDIMessageCloudKitAttachmentDownloadFailed setErrorDomain:](self, "setErrorDomain:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitAttachmentDownloadFailed;
  -[AWDIMessageCloudKitAttachmentDownloadFailed dealloc](&v3, sel_dealloc);
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

- (BOOL)hasMessageGuid
{
  return self->_messageGuid != 0;
}

- (BOOL)hasAttachmentGuid
{
  return self->_attachmentGuid != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int)a3
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

- (void)setAttachmentSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_attachmentSize = a3;
}

- (void)setHasAttachmentSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAttachmentSize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitAttachmentDownloadFailed;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMessageCloudKitAttachmentDownloadFailed description](&v3, sel_description), -[AWDIMessageCloudKitAttachmentDownloadFailed dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *messageGuid;
  NSString *attachmentGuid;
  NSString *errorDomain;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  messageGuid = self->_messageGuid;
  if (messageGuid)
    objc_msgSend(v3, "setObject:forKey:", messageGuid, CFSTR("messageGuid"));
  attachmentGuid = self->_attachmentGuid;
  if (attachmentGuid)
    objc_msgSend(v3, "setObject:forKey:", attachmentGuid, CFSTR("attachmentGuid"));
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_errorCode), CFSTR("errorCode"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
LABEL_17:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
      if ((*(_BYTE *)&self->_has & 2) == 0)
        return v3;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_12:
  if ((has & 2) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_attachmentSize), CFSTR("attachmentSize"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageCloudKitAttachmentDownloadFailedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_messageGuid)
    PBDataWriterWriteStringField();
  if (self->_attachmentGuid)
    PBDataWriterWriteStringField();
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      return;
LABEL_17:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_17;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 64) |= 1u;
  }
  if (self->_messageGuid)
    objc_msgSend(a3, "setMessageGuid:");
  if (self->_attachmentGuid)
    objc_msgSend(a3, "setAttachmentGuid:");
  if (self->_errorDomain)
    objc_msgSend(a3, "setErrorDomain:");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_errorCode;
    *((_BYTE *)a3 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)a3 + 12) = self->_linkQuality;
  *((_BYTE *)a3 + 64) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      return;
    goto LABEL_13;
  }
LABEL_17:
  *((_DWORD *)a3 + 7) = self->_connectionType;
  *((_BYTE *)a3 + 64) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return;
LABEL_13:
  *((_DWORD *)a3 + 6) = self->_attachmentSize;
  *((_BYTE *)a3 + 64) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
  }

  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_messageGuid, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_attachmentGuid, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_errorCode;
    *(_BYTE *)(v6 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_11:
      *(_DWORD *)(v6 + 28) = self->_connectionType;
      *(_BYTE *)(v6 + 64) |= 4u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        return (id)v6;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 48) = self->_linkQuality;
  *(_BYTE *)(v6 + 64) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 2) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 24) = self->_attachmentSize;
    *(_BYTE *)(v6 + 64) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *messageGuid;
  NSString *attachmentGuid;
  NSString *errorDomain;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_32;
    }
    else if ((*((_BYTE *)a3 + 64) & 1) != 0)
    {
LABEL_32:
      LOBYTE(v5) = 0;
      return v5;
    }
    messageGuid = self->_messageGuid;
    if (!((unint64_t)messageGuid | *((_QWORD *)a3 + 7))
      || (v5 = -[NSString isEqual:](messageGuid, "isEqual:")) != 0)
    {
      attachmentGuid = self->_attachmentGuid;
      if (!((unint64_t)attachmentGuid | *((_QWORD *)a3 + 2))
        || (v5 = -[NSString isEqual:](attachmentGuid, "isEqual:")) != 0)
      {
        errorDomain = self->_errorDomain;
        if (!((unint64_t)errorDomain | *((_QWORD *)a3 + 5))
          || (v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
        {
          if ((*(_BYTE *)&self->_has & 8) != 0)
          {
            if ((*((_BYTE *)a3 + 64) & 8) == 0 || self->_errorCode != *((_DWORD *)a3 + 8))
              goto LABEL_32;
          }
          else if ((*((_BYTE *)a3 + 64) & 8) != 0)
          {
            goto LABEL_32;
          }
          if ((*(_BYTE *)&self->_has & 0x10) != 0)
          {
            if ((*((_BYTE *)a3 + 64) & 0x10) == 0 || self->_linkQuality != *((_DWORD *)a3 + 12))
              goto LABEL_32;
          }
          else if ((*((_BYTE *)a3 + 64) & 0x10) != 0)
          {
            goto LABEL_32;
          }
          if ((*(_BYTE *)&self->_has & 4) != 0)
          {
            if ((*((_BYTE *)a3 + 64) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 7))
              goto LABEL_32;
          }
          else if ((*((_BYTE *)a3 + 64) & 4) != 0)
          {
            goto LABEL_32;
          }
          LOBYTE(v5) = (*((_BYTE *)a3 + 64) & 2) == 0;
          if ((*(_BYTE *)&self->_has & 2) != 0)
          {
            if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_attachmentSize != *((_DWORD *)a3 + 6))
              goto LABEL_32;
            LOBYTE(v5) = 1;
          }
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
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_messageGuid, "hash");
  v5 = -[NSString hash](self->_attachmentGuid, "hash");
  v6 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v7 = 2654435761 * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_linkQuality;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_7;
LABEL_11:
      v9 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_8;
LABEL_12:
      v10 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_7:
  v9 = 2654435761 * self->_connectionType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_8:
  v10 = 2654435761 * self->_attachmentSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 64) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 7))
    -[AWDIMessageCloudKitAttachmentDownloadFailed setMessageGuid:](self, "setMessageGuid:");
  if (*((_QWORD *)a3 + 2))
    -[AWDIMessageCloudKitAttachmentDownloadFailed setAttachmentGuid:](self, "setAttachmentGuid:");
  if (*((_QWORD *)a3 + 5))
    -[AWDIMessageCloudKitAttachmentDownloadFailed setErrorDomain:](self, "setErrorDomain:");
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 8) != 0)
  {
    self->_errorCode = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 64);
    if ((v5 & 0x10) == 0)
    {
LABEL_11:
      if ((v5 & 4) == 0)
        goto LABEL_12;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)a3 + 64) & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_linkQuality = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0)
      return;
    goto LABEL_13;
  }
LABEL_17:
  self->_connectionType = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 64) & 2) == 0)
    return;
LABEL_13:
  self->_attachmentSize = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)messageGuid
{
  return self->_messageGuid;
}

- (void)setMessageGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)attachmentGuid
{
  return self->_attachmentGuid;
}

- (void)setAttachmentGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)attachmentSize
{
  return self->_attachmentSize;
}

@end
