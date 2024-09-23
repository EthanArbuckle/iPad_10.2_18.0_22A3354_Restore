@implementation AWDIMessageCloudKitSyncFailed

- (void)dealloc
{
  objc_super v3;

  -[AWDIMessageCloudKitSyncFailed setSyncType:](self, "setSyncType:", 0);
  -[AWDIMessageCloudKitSyncFailed setTopLevelErrorDomain:](self, "setTopLevelErrorDomain:", 0);
  -[AWDIMessageCloudKitSyncFailed setNestedErrorDomain:](self, "setNestedErrorDomain:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitSyncFailed;
  -[AWDIMessageCloudKitSyncFailed dealloc](&v3, sel_dealloc);
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

- (BOOL)hasSyncType
{
  return self->_syncType != 0;
}

- (BOOL)hasTopLevelErrorDomain
{
  return self->_topLevelErrorDomain != 0;
}

- (void)setTopLevelErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_topLevelErrorCode = a3;
}

- (void)setHasTopLevelErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTopLevelErrorCode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasNestedErrorDomain
{
  return self->_nestedErrorDomain != 0;
}

- (void)setNestedErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nestedErrorCode = a3;
}

- (void)setHasNestedErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNestedErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitSyncFailed;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMessageCloudKitSyncFailed description](&v3, sel_description), -[AWDIMessageCloudKitSyncFailed dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *syncType;
  NSString *topLevelErrorDomain;
  NSString *nestedErrorDomain;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  syncType = self->_syncType;
  if (syncType)
    objc_msgSend(v3, "setObject:forKey:", syncType, CFSTR("syncType"));
  topLevelErrorDomain = self->_topLevelErrorDomain;
  if (topLevelErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", topLevelErrorDomain, CFSTR("topLevelErrorDomain"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_topLevelErrorCode), CFSTR("topLevelErrorCode"));
  nestedErrorDomain = self->_nestedErrorDomain;
  if (nestedErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", nestedErrorDomain, CFSTR("nestedErrorDomain"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_nestedErrorCode), CFSTR("nestedErrorCode"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageCloudKitSyncFailedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_syncType)
    PBDataWriterWriteStringField();
  if (self->_topLevelErrorDomain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_nestedErrorDomain)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 1u;
  }
  if (self->_syncType)
    objc_msgSend(a3, "setSyncType:");
  if (self->_topLevelErrorDomain)
    objc_msgSend(a3, "setTopLevelErrorDomain:");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_topLevelErrorCode;
    *((_BYTE *)a3 + 56) |= 8u;
  }
  if (self->_nestedErrorDomain)
    objc_msgSend(a3, "setNestedErrorDomain:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_nestedErrorCode;
    *((_BYTE *)a3 + 56) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_linkQuality;
    *((_BYTE *)a3 + 56) |= 2u;
  }
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
    *(_BYTE *)(v5 + 56) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_syncType, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_topLevelErrorDomain, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_topLevelErrorCode;
    *(_BYTE *)(v6 + 56) |= 8u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_nestedErrorDomain, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_nestedErrorCode;
    *(_BYTE *)(v6 + 56) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_linkQuality;
    *(_BYTE *)(v6 + 56) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *syncType;
  NSString *topLevelErrorDomain;
  char has;
  NSString *nestedErrorDomain;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_28;
    }
    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
LABEL_28:
      LOBYTE(v5) = 0;
      return v5;
    }
    syncType = self->_syncType;
    if (!((unint64_t)syncType | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](syncType, "isEqual:")) != 0)
    {
      topLevelErrorDomain = self->_topLevelErrorDomain;
      if (!((unint64_t)topLevelErrorDomain | *((_QWORD *)a3 + 6))
        || (v5 = -[NSString isEqual:](topLevelErrorDomain, "isEqual:")) != 0)
      {
        has = (char)self->_has;
        if ((has & 8) != 0)
        {
          if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_topLevelErrorCode != *((_DWORD *)a3 + 10))
            goto LABEL_28;
        }
        else if ((*((_BYTE *)a3 + 56) & 8) != 0)
        {
          goto LABEL_28;
        }
        nestedErrorDomain = self->_nestedErrorDomain;
        if ((unint64_t)nestedErrorDomain | *((_QWORD *)a3 + 3))
        {
          v5 = -[NSString isEqual:](nestedErrorDomain, "isEqual:");
          if (!v5)
            return v5;
          has = (char)self->_has;
        }
        if ((has & 4) != 0)
        {
          if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_nestedErrorCode != *((_DWORD *)a3 + 5))
            goto LABEL_28;
        }
        else if ((*((_BYTE *)a3 + 56) & 4) != 0)
        {
          goto LABEL_28;
        }
        LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 2) == 0;
        if ((has & 2) != 0)
        {
          if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_linkQuality != *((_DWORD *)a3 + 4))
            goto LABEL_28;
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
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_syncType, "hash");
  v5 = -[NSString hash](self->_topLevelErrorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v6 = 2654435761 * self->_topLevelErrorCode;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_nestedErrorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v8 = 2654435761 * self->_nestedErrorCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
LABEL_11:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_9:
  v9 = 2654435761 * self->_linkQuality;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 56) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDIMessageCloudKitSyncFailed setSyncType:](self, "setSyncType:");
  if (*((_QWORD *)a3 + 6))
    -[AWDIMessageCloudKitSyncFailed setTopLevelErrorDomain:](self, "setTopLevelErrorDomain:");
  if ((*((_BYTE *)a3 + 56) & 8) != 0)
  {
    self->_topLevelErrorCode = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDIMessageCloudKitSyncFailed setNestedErrorDomain:](self, "setNestedErrorDomain:");
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 4) != 0)
  {
    self->_nestedErrorCode = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_linkQuality = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)syncType
{
  return self->_syncType;
}

- (void)setSyncType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)topLevelErrorDomain
{
  return self->_topLevelErrorDomain;
}

- (void)setTopLevelErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int)topLevelErrorCode
{
  return self->_topLevelErrorCode;
}

- (NSString)nestedErrorDomain
{
  return self->_nestedErrorDomain;
}

- (void)setNestedErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)nestedErrorCode
{
  return self->_nestedErrorCode;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

@end
