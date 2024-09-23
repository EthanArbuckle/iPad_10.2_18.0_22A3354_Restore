@implementation AWDITesterTestShare

- (void)dealloc
{
  objc_super v3;

  -[AWDITesterTestShare setShareMethod:](self, "setShareMethod:", 0);
  -[AWDITesterTestShare setShareOption:](self, "setShareOption:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestShare;
  -[AWDITesterTestShare dealloc](&v3, sel_dealloc);
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

- (BOOL)hasShareMethod
{
  return self->_shareMethod != 0;
}

- (BOOL)hasShareOption
{
  return self->_shareOption != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestShare;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDITesterTestShare description](&v3, sel_description), -[AWDITesterTestShare dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *shareMethod;
  NSString *shareOption;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  shareMethod = self->_shareMethod;
  if (shareMethod)
    objc_msgSend(v3, "setObject:forKey:", shareMethod, CFSTR("shareMethod"));
  shareOption = self->_shareOption;
  if (shareOption)
    objc_msgSend(v3, "setObject:forKey:", shareOption, CFSTR("shareOption"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterTestShareReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_shareMethod)
    PBDataWriterWriteStringField();
  if (self->_shareOption)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_shareMethod)
    objc_msgSend(a3, "setShareMethod:");
  if (self->_shareOption)
    objc_msgSend(a3, "setShareOption:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_shareMethod, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_shareOption, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *shareMethod;
  NSString *shareOption;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    shareMethod = self->_shareMethod;
    if (!((unint64_t)shareMethod | *((_QWORD *)a3 + 2))
      || (v5 = -[NSString isEqual:](shareMethod, "isEqual:")) != 0)
    {
      shareOption = self->_shareOption;
      if ((unint64_t)shareOption | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NSString isEqual:](shareOption, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_shareMethod, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_shareOption, "hash");
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDITesterTestShare setShareMethod:](self, "setShareMethod:");
  if (*((_QWORD *)a3 + 3))
    -[AWDITesterTestShare setShareOption:](self, "setShareOption:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)shareMethod
{
  return self->_shareMethod;
}

- (void)setShareMethod:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)shareOption
{
  return self->_shareOption;
}

- (void)setShareOption:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
