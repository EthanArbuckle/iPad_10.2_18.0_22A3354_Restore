@implementation AWDBltDelayAckFromSecondaryDevice

- (void)dealloc
{
  objc_super v3;

  -[AWDBltDelayAckFromSecondaryDevice setUniqueid:](self, "setUniqueid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDBltDelayAckFromSecondaryDevice;
  -[AWDBltDelayAckFromSecondaryDevice dealloc](&v3, sel_dealloc);
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

- (BOOL)hasUniqueid
{
  return self->_uniqueid != 0;
}

- (void)setDelayMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_delayMs = a3;
}

- (void)setHasDelayMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDelayMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setOrigSendConnectionType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_origSendConnectionType = a3;
}

- (void)setHasOrigSendConnectionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOrigSendConnectionType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTimedout:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_timedout = a3;
}

- (void)setHasTimedout:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimedout
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDBltDelayAckFromSecondaryDevice;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDBltDelayAckFromSecondaryDevice description](&v3, sel_description), -[AWDBltDelayAckFromSecondaryDevice dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *uniqueid;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  uniqueid = self->_uniqueid;
  if (uniqueid)
    objc_msgSend(v3, "setObject:forKey:", uniqueid, CFSTR("uniqueid"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_delayMs), CFSTR("delayMs"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
LABEL_13:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_origSendConnectionType), CFSTR("origSendConnectionType"));
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        return v3;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 0x10) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_timedout), CFSTR("timedout"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBltDelayAckFromSecondaryDeviceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_uniqueid)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return;
LABEL_13:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 1u;
  }
  if (self->_uniqueid)
    objc_msgSend(a3, "setUniqueid:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_delayMs;
    *((_BYTE *)a3 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_BYTE *)a3 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return;
    goto LABEL_9;
  }
LABEL_13:
  *((_DWORD *)a3 + 6) = self->_origSendConnectionType;
  *((_BYTE *)a3 + 44) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return;
LABEL_9:
  *((_BYTE *)a3 + 40) = self->_timedout;
  *((_BYTE *)a3 + 44) |= 0x10u;
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
    *(_BYTE *)(v5 + 44) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_uniqueid, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_delayMs;
    *(_BYTE *)(v6 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
LABEL_11:
      *(_DWORD *)(v6 + 24) = self->_origSendConnectionType;
      *(_BYTE *)(v6 + 44) |= 8u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        return (id)v6;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 16) = self->_connectionType;
  *(_BYTE *)(v6 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *(_BYTE *)(v6 + 40) = self->_timedout;
    *(_BYTE *)(v6 + 44) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *uniqueid;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_27;
    }
    uniqueid = self->_uniqueid;
    if ((unint64_t)uniqueid | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](uniqueid, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_delayMs != *((_DWORD *)a3 + 5))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_27;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_27;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_origSendConnectionType != *((_DWORD *)a3 + 6))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 44) & 8) != 0)
    {
      goto LABEL_27;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 0x10) == 0;
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x10) == 0)
      {
LABEL_27:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_timedout)
      {
        if (!*((_BYTE *)a3 + 40))
          goto LABEL_27;
      }
      else if (*((_BYTE *)a3 + 40))
      {
        goto LABEL_27;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_uniqueid, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_delayMs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_connectionType;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_origSendConnectionType;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761 * self->_timedout;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDBltDelayAckFromSecondaryDevice setUniqueid:](self, "setUniqueid:");
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 4) != 0)
  {
    self->_delayMs = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      return;
    goto LABEL_9;
  }
LABEL_13:
  self->_origSendConnectionType = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 44) & 0x10) == 0)
    return;
LABEL_9:
  self->_timedout = *((_BYTE *)a3 + 40);
  *(_BYTE *)&self->_has |= 0x10u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)uniqueid
{
  return self->_uniqueid;
}

- (void)setUniqueid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)delayMs
{
  return self->_delayMs;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)origSendConnectionType
{
  return self->_origSendConnectionType;
}

- (BOOL)timedout
{
  return self->_timedout;
}

@end
