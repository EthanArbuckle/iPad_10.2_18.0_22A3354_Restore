@implementation AWDIMessageCloudKitValidatePurgeableAttachment

- (void)dealloc
{
  objc_super v3;

  -[AWDIMessageCloudKitValidatePurgeableAttachment setOperationalErrorDomain:](self, "setOperationalErrorDomain:", 0);
  -[AWDIMessageCloudKitValidatePurgeableAttachment setValidationErrorDomain:](self, "setValidationErrorDomain:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitValidatePurgeableAttachment;
  -[AWDIMessageCloudKitValidatePurgeableAttachment dealloc](&v3, sel_dealloc);
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

- (void)setValidatedAttachment:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_validatedAttachment = a3;
}

- (void)setHasValidatedAttachment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasValidatedAttachment
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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

- (BOOL)hasOperationalErrorDomain
{
  return self->_operationalErrorDomain != 0;
}

- (void)setOperationalErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_operationalErrorCode = a3;
}

- (void)setHasOperationalErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOperationalErrorCode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasValidationErrorDomain
{
  return self->_validationErrorDomain != 0;
}

- (void)setValidationErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_validationErrorCode = a3;
}

- (void)setHasValidationErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasValidationErrorCode
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v3.super_class = (Class)AWDIMessageCloudKitValidatePurgeableAttachment;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMessageCloudKitValidatePurgeableAttachment description](&v3, sel_description), -[AWDIMessageCloudKitValidatePurgeableAttachment dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *operationalErrorDomain;
  NSString *validationErrorDomain;
  char v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_validatedAttachment), CFSTR("validatedAttachment"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_attachmentSize), CFSTR("attachmentSize"));
LABEL_5:
  operationalErrorDomain = self->_operationalErrorDomain;
  if (operationalErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", operationalErrorDomain, CFSTR("operationalErrorDomain"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_operationalErrorCode), CFSTR("operationalErrorCode"));
  validationErrorDomain = self->_validationErrorDomain;
  if (validationErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", validationErrorDomain, CFSTR("validationErrorDomain"));
  v7 = (char)self->_has;
  if ((v7 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_13;
LABEL_20:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_14;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_validationErrorCode), CFSTR("validationErrorCode"));
  v7 = (char)self->_has;
  if ((v7 & 8) != 0)
    goto LABEL_20;
LABEL_13:
  if ((v7 & 4) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageCloudKitValidatePurgeableAttachmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_operationalErrorDomain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_validationErrorDomain)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
    if ((v5 & 8) == 0)
    {
LABEL_13:
      if ((v5 & 4) == 0)
        return;
LABEL_20:
      PBDataWriterWriteUint32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
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
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_validatedAttachment;
  *((_BYTE *)a3 + 56) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 4) = self->_attachmentSize;
    *((_BYTE *)a3 + 56) |= 2u;
  }
LABEL_5:
  if (self->_operationalErrorDomain)
    objc_msgSend(a3, "setOperationalErrorDomain:");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_operationalErrorCode;
    *((_BYTE *)a3 + 56) |= 0x10u;
  }
  if (self->_validationErrorDomain)
    objc_msgSend(a3, "setValidationErrorDomain:");
  v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_validationErrorCode;
    *((_BYTE *)a3 + 56) |= 0x40u;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0)
        return;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)a3 + 6) = self->_linkQuality;
  *((_BYTE *)a3 + 56) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_connectionType;
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
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_validatedAttachment;
  *(_BYTE *)(v5 + 56) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_attachmentSize;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
LABEL_5:

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_operationalErrorDomain, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_operationalErrorCode;
    *(_BYTE *)(v6 + 56) |= 0x10u;
  }

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_validationErrorDomain, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_16:
    *(_DWORD *)(v6 + 24) = self->_linkQuality;
    *(_BYTE *)(v6 + 56) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v6;
    goto LABEL_10;
  }
  *(_DWORD *)(v6 + 44) = self->_validationErrorCode;
  *(_BYTE *)(v6 + 56) |= 0x40u;
  v8 = (char)self->_has;
  if ((v8 & 8) != 0)
    goto LABEL_16;
LABEL_9:
  if ((v8 & 4) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 20) = self->_connectionType;
    *(_BYTE *)(v6 + 56) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *operationalErrorDomain;
  NSString *validationErrorDomain;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
LABEL_42:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x20) == 0 || self->_validatedAttachment != *((_DWORD *)a3 + 10))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x20) != 0)
    {
      goto LABEL_42;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_attachmentSize != *((_DWORD *)a3 + 4))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
      goto LABEL_42;
    }
    operationalErrorDomain = self->_operationalErrorDomain;
    if ((unint64_t)operationalErrorDomain | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](operationalErrorDomain, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_operationalErrorCode != *((_DWORD *)a3 + 7))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_42;
    }
    validationErrorDomain = self->_validationErrorDomain;
    if ((unint64_t)validationErrorDomain | *((_QWORD *)a3 + 6))
    {
      v5 = -[NSString isEqual:](validationErrorDomain, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x40) == 0 || self->_validationErrorCode != *((_DWORD *)a3 + 11))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x40) != 0)
    {
      goto LABEL_42;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_linkQuality != *((_DWORD *)a3 + 6))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 56) & 8) != 0)
    {
      goto LABEL_42;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 5))
        goto LABEL_42;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_validatedAttachment;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_attachmentSize;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_operationalErrorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v7 = 2654435761 * self->_operationalErrorCode;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_validationErrorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_13;
LABEL_16:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_14;
LABEL_17:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  v9 = 2654435761 * self->_validationErrorCode;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_16;
LABEL_13:
  v10 = 2654435761 * self->_linkQuality;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_17;
LABEL_14:
  v11 = 2654435761 * self->_connectionType;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;

  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 56);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_validatedAttachment = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 56) & 2) != 0)
  {
LABEL_4:
    self->_attachmentSize = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 4))
    -[AWDIMessageCloudKitValidatePurgeableAttachment setOperationalErrorDomain:](self, "setOperationalErrorDomain:");
  if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
  {
    self->_operationalErrorCode = *((_DWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)a3 + 6))
    -[AWDIMessageCloudKitValidatePurgeableAttachment setValidationErrorDomain:](self, "setValidationErrorDomain:");
  v6 = *((_BYTE *)a3 + 56);
  if ((v6 & 0x40) != 0)
  {
    self->_validationErrorCode = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 0x40u;
    v6 = *((_BYTE *)a3 + 56);
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0)
        return;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_linkQuality = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 56) & 4) == 0)
    return;
LABEL_14:
  self->_connectionType = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)validatedAttachment
{
  return self->_validatedAttachment;
}

- (unsigned)attachmentSize
{
  return self->_attachmentSize;
}

- (NSString)operationalErrorDomain
{
  return self->_operationalErrorDomain;
}

- (void)setOperationalErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)operationalErrorCode
{
  return self->_operationalErrorCode;
}

- (NSString)validationErrorDomain
{
  return self->_validationErrorDomain;
}

- (void)setValidationErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unsigned)validationErrorCode
{
  return self->_validationErrorCode;
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
