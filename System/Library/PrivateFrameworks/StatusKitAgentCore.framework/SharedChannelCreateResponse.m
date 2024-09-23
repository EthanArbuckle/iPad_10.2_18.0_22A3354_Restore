@implementation SharedChannelCreateResponse

- (int)status
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 9)
    return off_24D977598[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTH_EXPIRED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTH_FAILED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BAD_REQUEST")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANNEL_IDENTITY_VALIDATION_FAILED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL_ERROR")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STALE_PUBLISH_REJECTED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RATE_LIMITED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_NONCE")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasChannelIdentity
{
  return self->_channelIdentity != 0;
}

- (void)setRetryIntervalSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_retryIntervalSeconds = a3;
}

- (void)setHasRetryIntervalSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRetryIntervalSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setServerTimestampSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_serverTimestampSeconds = a3;
}

- (void)setHasServerTimestampSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServerTimestampSeconds
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)SharedChannelCreateResponse;
  -[SharedChannelCreateResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedChannelCreateResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t status;
  __CFString *v5;
  ChannelIdentity *channelIdentity;
  void *v7;
  char has;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    status = self->_status;
    if (status >= 9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24D977598[status];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("status"));

  }
  channelIdentity = self->_channelIdentity;
  if (channelIdentity)
  {
    -[ChannelIdentity dictionaryRepresentation](channelIdentity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("channel_identity"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retryIntervalSeconds);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("retry_interval_seconds"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_serverTimestampSeconds);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("server_timestamp_seconds"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelCreateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_channelIdentity)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[7] = self->_status;
    *((_BYTE *)v4 + 32) |= 4u;
  }
  if (self->_channelIdentity)
  {
    v6 = v4;
    objc_msgSend(v4, "setChannelIdentity:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_retryIntervalSeconds;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_serverTimestampSeconds;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_status;
    *(_BYTE *)(v5 + 32) |= 4u;
  }
  v7 = -[ChannelIdentity copyWithZone:](self->_channelIdentity, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_retryIntervalSeconds;
    *(_BYTE *)(v6 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_serverTimestampSeconds;
    *(_BYTE *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  ChannelIdentity *channelIdentity;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_status != *((_DWORD *)v4 + 7))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  channelIdentity = self->_channelIdentity;
  if ((unint64_t)channelIdentity | *((_QWORD *)v4 + 2))
  {
    if (!-[ChannelIdentity isEqual:](channelIdentity, "isEqual:"))
    {
LABEL_19:
      v7 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_retryIntervalSeconds != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_serverTimestampSeconds != *((_QWORD *)v4 + 1))
      goto LABEL_19;
    v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_status;
  else
    v3 = 0;
  v4 = -[ChannelIdentity hash](self->_channelIdentity, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_retryIntervalSeconds;
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
  v6 = 2654435761u * self->_serverTimestampSeconds;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  ChannelIdentity *channelIdentity;
  uint64_t v7;
  char v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if ((v4[8] & 4) != 0)
  {
    self->_status = v4[7];
    *(_BYTE *)&self->_has |= 4u;
  }
  channelIdentity = self->_channelIdentity;
  v7 = *((_QWORD *)v5 + 2);
  if (channelIdentity)
  {
    if (!v7)
      goto LABEL_9;
    v9 = v5;
    -[ChannelIdentity mergeFrom:](channelIdentity, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    v9 = v5;
    -[SharedChannelCreateResponse setChannelIdentity:](self, "setChannelIdentity:");
  }
  v5 = v9;
LABEL_9:
  v8 = *((_BYTE *)v5 + 32);
  if ((v8 & 2) != 0)
  {
    self->_retryIntervalSeconds = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v8 = *((_BYTE *)v5 + 32);
  }
  if ((v8 & 1) != 0)
  {
    self->_serverTimestampSeconds = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (ChannelIdentity)channelIdentity
{
  return self->_channelIdentity;
}

- (void)setChannelIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_channelIdentity, a3);
}

- (unsigned)retryIntervalSeconds
{
  return self->_retryIntervalSeconds;
}

- (unint64_t)serverTimestampSeconds
{
  return self->_serverTimestampSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelIdentity, 0);
}

@end
