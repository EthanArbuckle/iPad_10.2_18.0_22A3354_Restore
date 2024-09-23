@implementation AWDFaceTimeCallAcceptReceived

- (void)dealloc
{
  objc_super v3;

  -[AWDFaceTimeCallAcceptReceived setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallAcceptReceived;
  -[AWDFaceTimeCallAcceptReceived dealloc](&v3, sel_dealloc);
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
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

- (void)setIsVideo:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsVideo
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setOnLockScreen:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_onLockScreen = a3;
}

- (void)setHasOnLockScreen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOnLockScreen
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallAcceptReceived;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDFaceTimeCallAcceptReceived description](&v3, sel_description), -[AWDFaceTimeCallAcceptReceived dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guid;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isVideo), CFSTR("isVideo"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_6;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 4) != 0)
LABEL_6:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_onLockScreen), CFSTR("onLockScreen"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFaceTimeCallAcceptReceivedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_guid)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        return;
LABEL_9:
      PBDataWriterWriteUint32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_9;
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        return;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 6) = self->_isVideo;
  *((_BYTE *)a3 + 32) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_6:
  *((_DWORD *)a3 + 7) = self->_onLockScreen;
  *((_BYTE *)a3 + 32) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 24) = self->_isVideo;
    *(_BYTE *)(v5 + 32) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 8) = self->_timestamp;
  *(_BYTE *)(v5 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 28) = self->_onLockScreen;
    *(_BYTE *)(v5 + 32) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *guid;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_18;
      }
      else if ((*((_BYTE *)a3 + 32) & 1) != 0)
      {
LABEL_18:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_isVideo != *((_DWORD *)a3 + 6))
          goto LABEL_18;
      }
      else if ((*((_BYTE *)a3 + 32) & 2) != 0)
      {
        goto LABEL_18;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 4) == 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_onLockScreen != *((_DWORD *)a3 + 7))
          goto LABEL_18;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_guid, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_isVideo;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_onLockScreen;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 2))
    -[AWDFaceTimeCallAcceptReceived setGuid:](self, "setGuid:");
  v5 = *((_BYTE *)a3 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        return;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_isVideo = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 32) & 4) == 0)
    return;
LABEL_6:
  self->_onLockScreen = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 4u;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)isVideo
{
  return self->_isVideo;
}

- (unsigned)onLockScreen
{
  return self->_onLockScreen;
}

@end
