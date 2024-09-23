@implementation ChannelPublishPayload

- (void)setPublishInitiateTimestampMillis:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_publishInitiateTimestampMillis = a3;
}

- (void)setHasPublishInitiateTimestampMillis:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPublishInitiateTimestampMillis
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasChannelIdentity
{
  return self->_channelIdentity != 0;
}

- (BOOL)hasPublishPayload
{
  return self->_publishPayload != 0;
}

- (void)setPublishPayloadExpiryTtlMillis:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_publishPayloadExpiryTtlMillis = a3;
}

- (void)setHasPublishPayloadExpiryTtlMillis:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPublishPayloadExpiryTtlMillis
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)pushPriority
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_pushPriority;
  else
    return 0;
}

- (void)setPushPriority:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_pushPriority = a3;
}

- (void)setHasPushPriority:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPushPriority
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)pushPriorityAsString:(int)a3
{
  if (a3 < 3)
    return off_24D9777A0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPushPriority:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NORMAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIGH")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPendingPublishHint:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_pendingPublishHint = a3;
}

- (void)setHasPendingPublishHint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPendingPublishHint
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setScheduledPublishHint:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_scheduledPublishHint = a3;
}

- (void)setHasScheduledPublishHint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScheduledPublishHint
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRetryCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_retryCount = a3;
}

- (void)setHasRetryCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRetryCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasAdopter
{
  return self->_adopter != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ChannelPublishPayload;
  -[ChannelPublishPayload description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChannelPublishPayload dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  ChannelIdentity *channelIdentity;
  void *v6;
  NSData *publishPayload;
  char has;
  void *v9;
  NSString *adopter;
  void *v12;
  uint64_t pushPriority;
  __CFString *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_publishInitiateTimestampMillis);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("publish_initiate_timestamp_millis"));

  }
  channelIdentity = self->_channelIdentity;
  if (channelIdentity)
  {
    -[ChannelIdentity dictionaryRepresentation](channelIdentity, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("channel_identity"));

  }
  publishPayload = self->_publishPayload;
  if (publishPayload)
    objc_msgSend(v3, "setObject:forKey:", publishPayload, CFSTR("publish_payload"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_publishPayloadExpiryTtlMillis);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("publish_payload_expiry_ttl_millis"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  pushPriority = self->_pushPriority;
  if (pushPriority >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_pushPriority);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_24D9777A0[pushPriority];
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("push_priority"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pendingPublishHint);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("pending_publish_hint"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_scheduledPublishHint);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("scheduled_publish_hint"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retryCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("retry_count"));

  }
LABEL_13:
  adopter = self->_adopter;
  if (adopter)
    objc_msgSend(v3, "setObject:forKey:", adopter, CFSTR("adopter"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelPublishPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_channelIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_publishPayload)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_13:
  if (self->_adopter)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_publishInitiateTimestampMillis;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  v6 = v4;
  if (self->_channelIdentity)
  {
    objc_msgSend(v4, "setChannelIdentity:");
    v4 = v6;
  }
  if (self->_publishPayload)
  {
    objc_msgSend(v6, "setPublishPayload:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_publishPayloadExpiryTtlMillis;
    *((_BYTE *)v4 + 60) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 12) = self->_pushPriority;
  *((_BYTE *)v4 + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)v4 + 56) = self->_pendingPublishHint;
  *((_BYTE *)v4 + 60) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_19:
  *((_BYTE *)v4 + 57) = self->_scheduledPublishHint;
  *((_BYTE *)v4 + 60) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 13) = self->_retryCount;
    *((_BYTE *)v4 + 60) |= 8u;
  }
LABEL_13:
  if (self->_adopter)
  {
    objc_msgSend(v6, "setAdopter:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char has;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_publishInitiateTimestampMillis;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v7 = -[ChannelIdentity copyWithZone:](self->_channelIdentity, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  v9 = -[NSData copyWithZone:](self->_publishPayload, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_publishPayloadExpiryTtlMillis;
    *(_BYTE *)(v6 + 60) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 48) = self->_pushPriority;
  *(_BYTE *)(v6 + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_13:
    *(_BYTE *)(v6 + 57) = self->_scheduledPublishHint;
    *(_BYTE *)(v6 + 60) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  *(_BYTE *)(v6 + 56) = self->_pendingPublishHint;
  *(_BYTE *)(v6 + 60) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 52) = self->_retryCount;
    *(_BYTE *)(v6 + 60) |= 8u;
  }
LABEL_9:
  v12 = -[NSString copyWithZone:](self->_adopter, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ChannelIdentity *channelIdentity;
  NSData *publishPayload;
  NSString *adopter;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_publishInitiateTimestampMillis != *((_QWORD *)v4 + 1))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_44;
  }
  channelIdentity = self->_channelIdentity;
  if ((unint64_t)channelIdentity | *((_QWORD *)v4 + 4)
    && !-[ChannelIdentity isEqual:](channelIdentity, "isEqual:"))
  {
    goto LABEL_44;
  }
  publishPayload = self->_publishPayload;
  if ((unint64_t)publishPayload | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](publishPayload, "isEqual:"))
      goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_publishPayloadExpiryTtlMillis != *((_QWORD *)v4 + 2))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_pushPriority != *((_DWORD *)v4 + 12))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0)
      goto LABEL_44;
    if (self->_pendingPublishHint)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_44;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_44;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
    {
      if (self->_scheduledPublishHint)
      {
        if (!*((_BYTE *)v4 + 57))
          goto LABEL_44;
        goto LABEL_37;
      }
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_37;
    }
LABEL_44:
    v8 = 0;
    goto LABEL_45;
  }
  if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
    goto LABEL_44;
LABEL_37:
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_retryCount != *((_DWORD *)v4 + 13))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_44;
  }
  adopter = self->_adopter;
  if ((unint64_t)adopter | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](adopter, "isEqual:");
  else
    v8 = 1;
LABEL_45:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_publishInitiateTimestampMillis;
  else
    v3 = 0;
  v4 = -[ChannelIdentity hash](self->_channelIdentity, "hash");
  v5 = -[NSData hash](self->_publishPayload, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761u * self->_publishPayloadExpiryTtlMillis;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_pushPriority;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_pendingPublishHint;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_8;
LABEL_13:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_14:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_adopter, "hash");
  }
LABEL_12:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_8:
  v9 = 2654435761 * self->_scheduledPublishHint;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_9:
  v10 = 2654435761 * self->_retryCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_adopter, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  ChannelIdentity *channelIdentity;
  uint64_t v7;
  char v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_publishInitiateTimestampMillis = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  channelIdentity = self->_channelIdentity;
  v7 = *((_QWORD *)v5 + 4);
  v9 = v5;
  if (channelIdentity)
  {
    if (!v7)
      goto LABEL_9;
    -[ChannelIdentity mergeFrom:](channelIdentity, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[ChannelPublishPayload setChannelIdentity:](self, "setChannelIdentity:");
  }
  v5 = v9;
LABEL_9:
  if (*((_QWORD *)v5 + 5))
  {
    -[ChannelPublishPayload setPublishPayload:](self, "setPublishPayload:");
    v5 = v9;
  }
  v8 = *((_BYTE *)v5 + 60);
  if ((v8 & 2) != 0)
  {
    self->_publishPayloadExpiryTtlMillis = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v8 = *((_BYTE *)v5 + 60);
    if ((v8 & 4) == 0)
    {
LABEL_13:
      if ((v8 & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v5 + 60) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_pushPriority = *((_DWORD *)v5 + 12);
  *(_BYTE *)&self->_has |= 4u;
  v8 = *((_BYTE *)v5 + 60);
  if ((v8 & 0x10) == 0)
  {
LABEL_14:
    if ((v8 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  self->_pendingPublishHint = *((_BYTE *)v5 + 56);
  *(_BYTE *)&self->_has |= 0x10u;
  v8 = *((_BYTE *)v5 + 60);
  if ((v8 & 0x20) == 0)
  {
LABEL_15:
    if ((v8 & 8) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_23:
  self->_scheduledPublishHint = *((_BYTE *)v5 + 57);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v5 + 60) & 8) != 0)
  {
LABEL_16:
    self->_retryCount = *((_DWORD *)v5 + 13);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_17:
  if (*((_QWORD *)v5 + 3))
  {
    -[ChannelPublishPayload setAdopter:](self, "setAdopter:");
    v5 = v9;
  }

}

- (unint64_t)publishInitiateTimestampMillis
{
  return self->_publishInitiateTimestampMillis;
}

- (ChannelIdentity)channelIdentity
{
  return self->_channelIdentity;
}

- (void)setChannelIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_channelIdentity, a3);
}

- (NSData)publishPayload
{
  return self->_publishPayload;
}

- (void)setPublishPayload:(id)a3
{
  objc_storeStrong((id *)&self->_publishPayload, a3);
}

- (unint64_t)publishPayloadExpiryTtlMillis
{
  return self->_publishPayloadExpiryTtlMillis;
}

- (BOOL)pendingPublishHint
{
  return self->_pendingPublishHint;
}

- (BOOL)scheduledPublishHint
{
  return self->_scheduledPublishHint;
}

- (unsigned)retryCount
{
  return self->_retryCount;
}

- (NSString)adopter
{
  return self->_adopter;
}

- (void)setAdopter:(id)a3
{
  objc_storeStrong((id *)&self->_adopter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishPayload, 0);
  objc_storeStrong((id *)&self->_channelIdentity, 0);
  objc_storeStrong((id *)&self->_adopter, 0);
}

@end
