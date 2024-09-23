@implementation AWDCompanionSyncFullSyncDuration

- (void)dealloc
{
  objc_super v3;

  -[AWDCompanionSyncFullSyncDuration setService:](self, "setService:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncFullSyncDuration;
  -[AWDCompanionSyncFullSyncDuration dealloc](&v3, sel_dealloc);
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

- (void)setIsMaster:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isMaster = a3;
}

- (void)setHasIsMaster:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsMaster
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSyncDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_syncDuration = a3;
}

- (void)setHasSyncDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSyncDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncFullSyncDuration;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCompanionSyncFullSyncDuration description](&v3, sel_description), -[AWDCompanionSyncFullSyncDuration dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *service;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isMaster), CFSTR("is_master"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_syncDuration), CFSTR("sync_duration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCompanionSyncFullSyncDurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_service)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 2u;
  }
  if (self->_service)
    objc_msgSend(a3, "setService:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)a3 + 32) = self->_isMaster;
    *((_BYTE *)a3 + 36) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_syncDuration;
    *((_BYTE *)a3 + 36) |= 1u;
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
    *(_BYTE *)(v5 + 36) |= 2u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v6 + 32) = self->_isMaster;
    *(_BYTE *)(v6 + 36) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_syncDuration;
    *(_BYTE *)(v6 + 36) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *service;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
    goto LABEL_22;
  }
  service = self->_service;
  if ((unint64_t)service | *((_QWORD *)a3 + 3))
  {
    v5 = -[NSString isEqual:](service, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  if ((has & 4) == 0)
  {
    if ((*((_BYTE *)a3 + 36) & 4) != 0)
      goto LABEL_22;
    goto LABEL_18;
  }
  if ((*((_BYTE *)a3 + 36) & 4) == 0)
    goto LABEL_22;
  if (self->_isMaster)
  {
    if (!*((_BYTE *)a3 + 32))
      goto LABEL_22;
    goto LABEL_18;
  }
  if (*((_BYTE *)a3 + 32))
  {
LABEL_22:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_syncDuration != *((_QWORD *)a3 + 1))
      goto LABEL_22;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_service, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_isMaster;
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
  v6 = 2654435761u * self->_syncDuration;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDCompanionSyncFullSyncDuration setService:](self, "setService:");
  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 4) != 0)
  {
    self->_isMaster = *((_BYTE *)a3 + 32);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 36);
  }
  if ((v5 & 1) != 0)
  {
    self->_syncDuration = *((_QWORD *)a3 + 1);
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
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)isMaster
{
  return self->_isMaster;
}

- (unint64_t)syncDuration
{
  return self->_syncDuration;
}

@end
