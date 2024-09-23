@implementation AWDEventKitSyncIsNotifiableEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDEventKitSyncIsNotifiableEvent setReason:](self, "setReason:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDEventKitSyncIsNotifiableEvent;
  -[AWDEventKitSyncIsNotifiableEvent dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDeltaTransitTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deltaTransitTime = a3;
}

- (void)setHasDeltaTransitTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeltaTransitTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeltaProcessingTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deltaProcessingTime = a3;
}

- (void)setHasDeltaProcessingTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeltaProcessingTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWillTriggerNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_willTriggerNotification = a3;
}

- (void)setHasWillTriggerNotification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWillTriggerNotification
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDEventKitSyncIsNotifiableEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDEventKitSyncIsNotifiableEvent description](&v3, sel_description), -[AWDEventKitSyncIsNotifiableEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *reason;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_deltaTransitTime), CFSTR("deltaTransitTime"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_deltaProcessingTime), CFSTR("deltaProcessingTime"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_willTriggerNotification), CFSTR("willTriggerNotification"));
LABEL_6:
  reason = self->_reason;
  if (reason)
    objc_msgSend(v3, "setObject:forKey:", reason, CFSTR("reason"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDEventKitSyncIsNotifiableEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:
  if (self->_reason)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  NSString *reason;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = self->_deltaTransitTime;
  *((_BYTE *)a3 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  *((_QWORD *)a3 + 1) = self->_deltaProcessingTime;
  *((_BYTE *)a3 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_BYTE *)a3 + 40) = self->_willTriggerNotification;
    *((_BYTE *)a3 + 44) |= 8u;
  }
LABEL_6:
  reason = self->_reason;
  if (reason)
    objc_msgSend(a3, "setReason:", reason);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 8) = self->_deltaProcessingTime;
      *(_BYTE *)(v5 + 44) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_deltaTransitTime;
  *(_BYTE *)(v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 40) = self->_willTriggerNotification;
    *(_BYTE *)(v5 + 44) |= 8u;
  }
LABEL_6:

  v6[4] = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *reason;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_21;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_deltaTransitTime != *((_QWORD *)a3 + 2))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_21;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_deltaProcessingTime != *((_QWORD *)a3 + 1))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_21;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) != 0)
      {
        if (self->_willTriggerNotification)
        {
          if (!*((_BYTE *)a3 + 40))
            goto LABEL_21;
          goto LABEL_27;
        }
        if (!*((_BYTE *)a3 + 40))
        {
LABEL_27:
          reason = self->_reason;
          if ((unint64_t)reason | *((_QWORD *)a3 + 4))
            LOBYTE(v5) = -[NSString isEqual:](reason, "isEqual:");
          else
            LOBYTE(v5) = 1;
          return v5;
        }
      }
    }
    else if ((*((_BYTE *)a3 + 44) & 8) == 0)
    {
      goto LABEL_27;
    }
LABEL_21:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_deltaTransitTime;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ -[NSString hash](self->_reason, "hash");
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761u * self->_deltaProcessingTime;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_willTriggerNotification;
  return v3 ^ v2 ^ v4 ^ v5 ^ -[NSString hash](self->_reason, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 44);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_deltaTransitTime = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  self->_deltaProcessingTime = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 44) & 8) != 0)
  {
LABEL_5:
    self->_willTriggerNotification = *((_BYTE *)a3 + 40);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  if (*((_QWORD *)a3 + 4))
    -[AWDEventKitSyncIsNotifiableEvent setReason:](self, "setReason:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)deltaTransitTime
{
  return self->_deltaTransitTime;
}

- (unint64_t)deltaProcessingTime
{
  return self->_deltaProcessingTime;
}

- (BOOL)willTriggerNotification
{
  return self->_willTriggerNotification;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
