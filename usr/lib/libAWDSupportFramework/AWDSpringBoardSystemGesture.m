@implementation AWDSpringBoardSystemGesture

- (void)dealloc
{
  objc_super v3;

  -[AWDSpringBoardSystemGesture setType:](self, "setType:", 0);
  -[AWDSpringBoardSystemGesture setUserInfo:](self, "setUserInfo:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSystemGesture;
  -[AWDSpringBoardSystemGesture dealloc](&v3, sel_dealloc);
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

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSystemGesture;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSpringBoardSystemGesture description](&v3, sel_description), -[AWDSpringBoardSystemGesture dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *type;
  NSString *userInfo;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("type"));
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v3, "setObject:forKey:", userInfo, CFSTR("userInfo"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardSystemGestureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_type)
    PBDataWriterWriteStringField();
  if (self->_userInfo)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_type)
    objc_msgSend(a3, "setType:");
  if (self->_userInfo)
    objc_msgSend(a3, "setUserInfo:");
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

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *type;
  NSString *userInfo;

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
    type = self->_type;
    if (!((unint64_t)type | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](type, "isEqual:")) != 0)
    {
      userInfo = self->_userInfo;
      if ((unint64_t)userInfo | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NSString isEqual:](userInfo, "isEqual:");
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
  v4 = -[NSString hash](self->_type, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_userInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDSpringBoardSystemGesture setType:](self, "setType:");
  if (*((_QWORD *)a3 + 3))
    -[AWDSpringBoardSystemGesture setUserInfo:](self, "setUserInfo:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
