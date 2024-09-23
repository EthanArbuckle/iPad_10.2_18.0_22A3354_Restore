@implementation AWDIMessageAttachmentUpload

- (void)dealloc
{
  objc_super v3;

  -[AWDIMessageAttachmentUpload setGuid:](self, "setGuid:", 0);
  -[AWDIMessageAttachmentUpload setFirstLevelMMCSErrorDomain:](self, "setFirstLevelMMCSErrorDomain:", 0);
  -[AWDIMessageAttachmentUpload setSecondLevelMMCSErrorDomain:](self, "setSecondLevelMMCSErrorDomain:", 0);
  -[AWDIMessageAttachmentUpload setThirdLevelMMCSErrorDomain:](self, "setThirdLevelMMCSErrorDomain:", 0);
  -[AWDIMessageAttachmentUpload setFourthLevelMMCSErrorDomain:](self, "setFourthLevelMMCSErrorDomain:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageAttachmentUpload;
  -[AWDIMessageAttachmentUpload dealloc](&v3, sel_dealloc);
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

- (void)setFzError:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_fzError = a3;
}

- (void)setHasFzError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFzError
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMessageError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_messageError = a3;
}

- (void)setHasMessageError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMessageError
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTokenError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_tokenError = a3;
}

- (void)setHasTokenError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasTokenError
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setGenericError:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_genericError = a3;
}

- (void)setHasGenericError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGenericError
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setUploadDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_uploadDuration = a3;
}

- (void)setHasUploadDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasUploadDuration
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLinkQuality
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAttachmentSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_attachmentSize = a3;
}

- (void)setHasAttachmentSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAttachmentSize
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTimeFromLastPrewarm:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_timeFromLastPrewarm = a3;
}

- (void)setHasTimeFromLastPrewarm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTimeFromLastPrewarm
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setLastPrewarmDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_lastPrewarmDuration = a3;
}

- (void)setHasLastPrewarmDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLastPrewarmDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setFirstLevelMMCSError:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_firstLevelMMCSError = a3;
}

- (void)setHasFirstLevelMMCSError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFirstLevelMMCSError
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasFirstLevelMMCSErrorDomain
{
  return self->_firstLevelMMCSErrorDomain != 0;
}

- (void)setSecondLevelMMCSError:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_secondLevelMMCSError = a3;
}

- (void)setHasSecondLevelMMCSError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSecondLevelMMCSError
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasSecondLevelMMCSErrorDomain
{
  return self->_secondLevelMMCSErrorDomain != 0;
}

- (void)setThirdLevelMMCSError:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_thirdLevelMMCSError = a3;
}

- (void)setHasThirdLevelMMCSError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasThirdLevelMMCSError
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasThirdLevelMMCSErrorDomain
{
  return self->_thirdLevelMMCSErrorDomain != 0;
}

- (void)setFourthLevelMMCSError:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_fourthLevelMMCSError = a3;
}

- (void)setHasFourthLevelMMCSError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFourthLevelMMCSError
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasFourthLevelMMCSErrorDomain
{
  return self->_fourthLevelMMCSErrorDomain != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageAttachmentUpload;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMessageAttachmentUpload description](&v3, sel_description), -[AWDIMessageAttachmentUpload dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guid;
  __int16 has;
  NSString *firstLevelMMCSErrorDomain;
  NSString *secondLevelMMCSErrorDomain;
  NSString *thirdLevelMMCSErrorDomain;
  NSString *fourthLevelMMCSErrorDomain;

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
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_33;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_fzError), CFSTR("fzError"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_messageError), CFSTR("messageError"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tokenError), CFSTR("tokenError"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_genericError), CFSTR("genericError"));
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uploadDuration), CFSTR("uploadDuration"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_attachmentSize), CFSTR("attachmentSize"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_timeFromLastPrewarm), CFSTR("timeFromLastPrewarm"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_41:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastPrewarmDuration), CFSTR("lastPrewarmDuration"));
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_15:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_firstLevelMMCSError), CFSTR("firstLevelMMCSError"));
LABEL_16:
  firstLevelMMCSErrorDomain = self->_firstLevelMMCSErrorDomain;
  if (firstLevelMMCSErrorDomain)
    objc_msgSend(v4, "setObject:forKey:", firstLevelMMCSErrorDomain, CFSTR("firstLevelMMCSErrorDomain"));
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_secondLevelMMCSError), CFSTR("secondLevelMMCSError"));
  secondLevelMMCSErrorDomain = self->_secondLevelMMCSErrorDomain;
  if (secondLevelMMCSErrorDomain)
    objc_msgSend(v4, "setObject:forKey:", secondLevelMMCSErrorDomain, CFSTR("secondLevelMMCSErrorDomain"));
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_thirdLevelMMCSError), CFSTR("thirdLevelMMCSError"));
  thirdLevelMMCSErrorDomain = self->_thirdLevelMMCSErrorDomain;
  if (thirdLevelMMCSErrorDomain)
    objc_msgSend(v4, "setObject:forKey:", thirdLevelMMCSErrorDomain, CFSTR("thirdLevelMMCSErrorDomain"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_fourthLevelMMCSError), CFSTR("fourthLevelMMCSError"));
  fourthLevelMMCSErrorDomain = self->_fourthLevelMMCSErrorDomain;
  if (fourthLevelMMCSErrorDomain)
    objc_msgSend(v4, "setObject:forKey:", fourthLevelMMCSErrorDomain, CFSTR("fourthLevelMMCSErrorDomain"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageAttachmentUploadReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_32;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_15:
    PBDataWriterWriteInt32Field();
LABEL_16:
  if (self->_firstLevelMMCSErrorDomain)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_secondLevelMMCSErrorDomain)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_thirdLevelMMCSErrorDomain)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_fourthLevelMMCSErrorDomain)
    PBDataWriterWriteStringField();
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
    *((_WORD *)a3 + 62) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_32;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 14) = self->_fzError;
  *((_WORD *)a3 + 62) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 20) = self->_messageError;
  *((_WORD *)a3 + 62) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 29) = self->_tokenError;
  *((_WORD *)a3 + 62) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 15) = self->_genericError;
  *((_WORD *)a3 + 62) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 30) = self->_uploadDuration;
  *((_WORD *)a3 + 62) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 19) = self->_linkQuality;
  *((_WORD *)a3 + 62) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 5) = self->_connectionType;
  *((_WORD *)a3 + 62) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 4) = self->_attachmentSize;
  *((_WORD *)a3 + 62) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 28) = self->_timeFromLastPrewarm;
  *((_WORD *)a3 + 62) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_40:
  *((_DWORD *)a3 + 18) = self->_lastPrewarmDuration;
  *((_WORD *)a3 + 62) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_15:
    *((_DWORD *)a3 + 6) = self->_firstLevelMMCSError;
    *((_WORD *)a3 + 62) |= 8u;
  }
LABEL_16:
  if (self->_firstLevelMMCSErrorDomain)
    objc_msgSend(a3, "setFirstLevelMMCSErrorDomain:");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)a3 + 21) = self->_secondLevelMMCSError;
    *((_WORD *)a3 + 62) |= 0x400u;
  }
  if (self->_secondLevelMMCSErrorDomain)
    objc_msgSend(a3, "setSecondLevelMMCSErrorDomain:");
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((_DWORD *)a3 + 24) = self->_thirdLevelMMCSError;
    *((_WORD *)a3 + 62) |= 0x800u;
  }
  if (self->_thirdLevelMMCSErrorDomain)
    objc_msgSend(a3, "setThirdLevelMMCSErrorDomain:");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_fourthLevelMMCSError;
    *((_WORD *)a3 + 62) |= 0x10u;
  }
  if (self->_fourthLevelMMCSErrorDomain)
    objc_msgSend(a3, "setFourthLevelMMCSErrorDomain:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 64) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 124) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 56) = self->_fzError;
  *(_WORD *)(v5 + 124) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 80) = self->_messageError;
  *(_WORD *)(v5 + 124) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 116) = self->_tokenError;
  *(_WORD *)(v5 + 124) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 60) = self->_genericError;
  *(_WORD *)(v5 + 124) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 120) = self->_uploadDuration;
  *(_WORD *)(v5 + 124) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 76) = self->_linkQuality;
  *(_WORD *)(v5 + 124) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 20) = self->_connectionType;
  *(_WORD *)(v5 + 124) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 16) = self->_attachmentSize;
  *(_WORD *)(v5 + 124) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 112) = self->_timeFromLastPrewarm;
  *(_WORD *)(v5 + 124) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  *(_DWORD *)(v5 + 72) = self->_lastPrewarmDuration;
  *(_WORD *)(v5 + 124) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    *(_DWORD *)(v5 + 24) = self->_firstLevelMMCSError;
    *(_WORD *)(v5 + 124) |= 8u;
  }
LABEL_14:

  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_firstLevelMMCSErrorDomain, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_secondLevelMMCSError;
    *(_WORD *)(v5 + 124) |= 0x400u;
  }

  *(_QWORD *)(v5 + 88) = -[NSString copyWithZone:](self->_secondLevelMMCSErrorDomain, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_thirdLevelMMCSError;
    *(_WORD *)(v5 + 124) |= 0x800u;
  }

  *(_QWORD *)(v5 + 104) = -[NSString copyWithZone:](self->_thirdLevelMMCSErrorDomain, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_fourthLevelMMCSError;
    *(_WORD *)(v5 + 124) |= 0x10u;
  }

  *(_QWORD *)(v5 + 48) = -[NSString copyWithZone:](self->_fourthLevelMMCSErrorDomain, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *guid;
  __int16 has;
  __int16 v8;
  NSString *firstLevelMMCSErrorDomain;
  NSString *secondLevelMMCSErrorDomain;
  NSString *thirdLevelMMCSErrorDomain;
  __int16 v12;
  NSString *fourthLevelMMCSErrorDomain;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((_QWORD *)a3 + 8)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      has = (__int16)self->_has;
      v8 = *((_WORD *)a3 + 62);
      if ((has & 1) != 0)
      {
        if ((v8 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_90;
      }
      else if ((v8 & 1) != 0)
      {
LABEL_90:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_fzError != *((_DWORD *)a3 + 14))
          goto LABEL_90;
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_90;
      }
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 62) & 0x200) == 0 || self->_messageError != *((_DWORD *)a3 + 20))
          goto LABEL_90;
      }
      else if ((*((_WORD *)a3 + 62) & 0x200) != 0)
      {
        goto LABEL_90;
      }
      if ((*(_WORD *)&self->_has & 0x2000) != 0)
      {
        if ((*((_WORD *)a3 + 62) & 0x2000) == 0 || self->_tokenError != *((_DWORD *)a3 + 29))
          goto LABEL_90;
      }
      else if ((*((_WORD *)a3 + 62) & 0x2000) != 0)
      {
        goto LABEL_90;
      }
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_genericError != *((_DWORD *)a3 + 15))
          goto LABEL_90;
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_90;
      }
      if ((*(_WORD *)&self->_has & 0x4000) != 0)
      {
        if ((*((_WORD *)a3 + 62) & 0x4000) == 0 || self->_uploadDuration != *((_DWORD *)a3 + 30))
          goto LABEL_90;
      }
      else if ((*((_WORD *)a3 + 62) & 0x4000) != 0)
      {
        goto LABEL_90;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 62) & 0x100) == 0 || self->_linkQuality != *((_DWORD *)a3 + 19))
          goto LABEL_90;
      }
      else if ((*((_WORD *)a3 + 62) & 0x100) != 0)
      {
        goto LABEL_90;
      }
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 5))
          goto LABEL_90;
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_90;
      }
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_attachmentSize != *((_DWORD *)a3 + 4))
          goto LABEL_90;
      }
      else if ((v8 & 2) != 0)
      {
        goto LABEL_90;
      }
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
      {
        if ((*((_WORD *)a3 + 62) & 0x1000) == 0 || self->_timeFromLastPrewarm != *((_DWORD *)a3 + 28))
          goto LABEL_90;
      }
      else if ((*((_WORD *)a3 + 62) & 0x1000) != 0)
      {
        goto LABEL_90;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_lastPrewarmDuration != *((_DWORD *)a3 + 18))
          goto LABEL_90;
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_90;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_firstLevelMMCSError != *((_DWORD *)a3 + 6))
          goto LABEL_90;
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_90;
      }
      firstLevelMMCSErrorDomain = self->_firstLevelMMCSErrorDomain;
      if ((unint64_t)firstLevelMMCSErrorDomain | *((_QWORD *)a3 + 4))
      {
        v5 = -[NSString isEqual:](firstLevelMMCSErrorDomain, "isEqual:");
        if (!v5)
          return v5;
        has = (__int16)self->_has;
      }
      if ((has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 62) & 0x400) == 0 || self->_secondLevelMMCSError != *((_DWORD *)a3 + 21))
          goto LABEL_90;
      }
      else if ((*((_WORD *)a3 + 62) & 0x400) != 0)
      {
        goto LABEL_90;
      }
      secondLevelMMCSErrorDomain = self->_secondLevelMMCSErrorDomain;
      if ((unint64_t)secondLevelMMCSErrorDomain | *((_QWORD *)a3 + 11))
      {
        v5 = -[NSString isEqual:](secondLevelMMCSErrorDomain, "isEqual:");
        if (!v5)
          return v5;
        has = (__int16)self->_has;
      }
      if ((has & 0x800) != 0)
      {
        if ((*((_WORD *)a3 + 62) & 0x800) == 0 || self->_thirdLevelMMCSError != *((_DWORD *)a3 + 24))
          goto LABEL_90;
      }
      else if ((*((_WORD *)a3 + 62) & 0x800) != 0)
      {
        goto LABEL_90;
      }
      thirdLevelMMCSErrorDomain = self->_thirdLevelMMCSErrorDomain;
      if ((unint64_t)thirdLevelMMCSErrorDomain | *((_QWORD *)a3 + 13))
      {
        v5 = -[NSString isEqual:](thirdLevelMMCSErrorDomain, "isEqual:");
        if (!v5)
          return v5;
        has = (__int16)self->_has;
      }
      v12 = *((_WORD *)a3 + 62);
      if ((has & 0x10) != 0)
      {
        if ((v12 & 0x10) == 0 || self->_fourthLevelMMCSError != *((_DWORD *)a3 + 10))
          goto LABEL_90;
      }
      else if ((v12 & 0x10) != 0)
      {
        goto LABEL_90;
      }
      fourthLevelMMCSErrorDomain = self->_fourthLevelMMCSErrorDomain;
      if ((unint64_t)fourthLevelMMCSErrorDomain | *((_QWORD *)a3 + 6))
        LOBYTE(v5) = -[NSString isEqual:](fourthLevelMMCSErrorDomain, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSUInteger v24;

  v24 = -[NSString hash](self->_guid, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v23 = 2654435761u * self->_timestamp;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v22 = 2654435761 * self->_fzError;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v23 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  v22 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v21 = 2654435761 * self->_messageError;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_5:
    v20 = 2654435761 * self->_tokenError;
    if ((has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v20 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    v19 = 2654435761 * self->_genericError;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_7:
    v18 = 2654435761 * self->_uploadDuration;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v17 = 2654435761 * self->_linkQuality;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v17 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v16 = 2654435761 * self->_connectionType;
    if ((has & 2) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v16 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    v14 = 2654435761 * self->_attachmentSize;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    v4 = 2654435761 * self->_timeFromLastPrewarm;
    if ((has & 0x80) != 0)
      goto LABEL_12;
LABEL_24:
    v5 = 0;
    if ((has & 8) != 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_23:
  v4 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_24;
LABEL_12:
  v5 = 2654435761 * self->_lastPrewarmDuration;
  if ((has & 8) != 0)
  {
LABEL_13:
    v6 = 2654435761 * self->_firstLevelMMCSError;
    goto LABEL_26;
  }
LABEL_25:
  v6 = 0;
LABEL_26:
  v7 = -[NSString hash](self->_firstLevelMMCSErrorDomain, "hash", v14);
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v8 = 2654435761 * self->_secondLevelMMCSError;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_secondLevelMMCSErrorDomain, "hash");
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    v10 = 2654435761 * self->_thirdLevelMMCSError;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_thirdLevelMMCSErrorDomain, "hash");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v12 = 2654435761 * self->_fourthLevelMMCSError;
  else
    v12 = 0;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSString hash](self->_fourthLevelMMCSErrorDomain, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if (*((_QWORD *)a3 + 8))
    -[AWDIMessageAttachmentUpload setGuid:](self, "setGuid:");
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)a3 + 62);
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_32;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  self->_fzError = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  self->_messageError = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x2000) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  self->_tokenError = *((_DWORD *)a3 + 29);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  self->_genericError = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  self->_uploadDuration = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  self->_linkQuality = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  self->_connectionType = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  self->_attachmentSize = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x1000) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  self->_timeFromLastPrewarm = *((_DWORD *)a3 + 28);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_40:
  self->_lastPrewarmDuration = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 62) & 8) != 0)
  {
LABEL_15:
    self->_firstLevelMMCSError = *((_DWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_16:
  if (*((_QWORD *)a3 + 4))
    -[AWDIMessageAttachmentUpload setFirstLevelMMCSErrorDomain:](self, "setFirstLevelMMCSErrorDomain:");
  if ((*((_WORD *)a3 + 62) & 0x400) != 0)
  {
    self->_secondLevelMMCSError = *((_DWORD *)a3 + 21);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)a3 + 11))
    -[AWDIMessageAttachmentUpload setSecondLevelMMCSErrorDomain:](self, "setSecondLevelMMCSErrorDomain:");
  if ((*((_WORD *)a3 + 62) & 0x800) != 0)
  {
    self->_thirdLevelMMCSError = *((_DWORD *)a3 + 24);
    *(_WORD *)&self->_has |= 0x800u;
  }
  if (*((_QWORD *)a3 + 13))
    -[AWDIMessageAttachmentUpload setThirdLevelMMCSErrorDomain:](self, "setThirdLevelMMCSErrorDomain:");
  if ((*((_WORD *)a3 + 62) & 0x10) != 0)
  {
    self->_fourthLevelMMCSError = *((_DWORD *)a3 + 10);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)a3 + 6))
    -[AWDIMessageAttachmentUpload setFourthLevelMMCSErrorDomain:](self, "setFourthLevelMMCSErrorDomain:");
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
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

- (unsigned)tokenError
{
  return self->_tokenError;
}

- (int)genericError
{
  return self->_genericError;
}

- (unsigned)uploadDuration
{
  return self->_uploadDuration;
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

- (unsigned)timeFromLastPrewarm
{
  return self->_timeFromLastPrewarm;
}

- (unsigned)lastPrewarmDuration
{
  return self->_lastPrewarmDuration;
}

- (int)firstLevelMMCSError
{
  return self->_firstLevelMMCSError;
}

- (NSString)firstLevelMMCSErrorDomain
{
  return self->_firstLevelMMCSErrorDomain;
}

- (void)setFirstLevelMMCSErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int)secondLevelMMCSError
{
  return self->_secondLevelMMCSError;
}

- (NSString)secondLevelMMCSErrorDomain
{
  return self->_secondLevelMMCSErrorDomain;
}

- (void)setSecondLevelMMCSErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (int)thirdLevelMMCSError
{
  return self->_thirdLevelMMCSError;
}

- (NSString)thirdLevelMMCSErrorDomain
{
  return self->_thirdLevelMMCSErrorDomain;
}

- (void)setThirdLevelMMCSErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (int)fourthLevelMMCSError
{
  return self->_fourthLevelMMCSError;
}

- (NSString)fourthLevelMMCSErrorDomain
{
  return self->_fourthLevelMMCSErrorDomain;
}

- (void)setFourthLevelMMCSErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
