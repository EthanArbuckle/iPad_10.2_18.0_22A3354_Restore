@implementation AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta setServiceName:](self, "setServiceName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta;
  -[AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta dealloc](&v3, sel_dealloc);
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

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (void)setActiveParticipantBucket:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_activeParticipantBucket = a3;
}

- (void)setHasActiveParticipantBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActiveParticipantBucket
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTimeDelta:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeDelta = a3;
}

- (void)setHasTimeDelta:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeDelta
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta description](&v3, sel_description), -[AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *serviceName;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v3, "setObject:forKey:", serviceName, CFSTR("serviceName"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_activeParticipantBucket), CFSTR("activeParticipantBucket"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timeDelta), CFSTR("timeDelta"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDeltaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_serviceName)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 2u;
  }
  if (self->_serviceName)
    objc_msgSend(a3, "setServiceName:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_activeParticipantBucket;
    *((_BYTE *)a3 + 40) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timeDelta;
    *((_BYTE *)a3 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 2u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_activeParticipantBucket;
    *(_BYTE *)(v6 + 40) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_timeDelta;
    *(_BYTE *)(v6 + 40) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *serviceName;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    serviceName = self->_serviceName;
    if ((unint64_t)serviceName | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](serviceName, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_activeParticipantBucket != *((_DWORD *)a3 + 6))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 1) == 0;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timeDelta != *((_QWORD *)a3 + 1))
        goto LABEL_19;
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

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_serviceName, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_activeParticipantBucket;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_timeDelta;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 40) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta setServiceName:](self, "setServiceName:");
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 4) != 0)
  {
    self->_activeParticipantBucket = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_timeDelta = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)activeParticipantBucket
{
  return self->_activeParticipantBucket;
}

- (int64_t)timeDelta
{
  return self->_timeDelta;
}

@end
