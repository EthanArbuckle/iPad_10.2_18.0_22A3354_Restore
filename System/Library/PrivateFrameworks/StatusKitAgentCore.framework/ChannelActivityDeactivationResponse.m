@implementation ChannelActivityDeactivationResponse

- (int)status
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 9)
    return off_24D9780E8[a3];
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

- (BOOL)hasUuid
{
  return self->_uuid != 0;
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

- (void)setVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRetryIntervalSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_retryIntervalSeconds = a3;
}

- (void)setHasRetryIntervalSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRetryIntervalSeconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)ChannelActivityDeactivationResponse;
  -[ChannelActivityDeactivationResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChannelActivityDeactivationResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *uuid;
  char has;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    status = self->_status;
    if (status >= 9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24D9780E8[status];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("status"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_10;
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_version);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("version"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_serverTimestampSeconds);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("server_timestamp_seconds"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retryIntervalSeconds);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("retry_interval_seconds"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityDeactivationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_uuid)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field();
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[7] = self->_status;
    *((_BYTE *)v4 + 40) |= 8u;
  }
  if (self->_uuid)
  {
    v6 = v4;
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *((_QWORD *)v4 + 2) = self->_version;
    *((_BYTE *)v4 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_QWORD *)v4 + 1) = self->_serverTimestampSeconds;
  *((_BYTE *)v4 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    v4[6] = self->_retryIntervalSeconds;
    *((_BYTE *)v4 + 40) |= 4u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_status;
    *(_BYTE *)(v5 + 40) |= 8u;
  }
  v7 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *(_QWORD *)(v6 + 16) = self->_version;
    *(_BYTE *)(v6 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v6;
    goto LABEL_6;
  }
  *(_QWORD *)(v6 + 8) = self->_serverTimestampSeconds;
  *(_BYTE *)(v6 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_retryIntervalSeconds;
    *(_BYTE *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSData *uuid;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_status != *((_DWORD *)v4 + 7))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_24;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
    {
LABEL_24:
      v7 = 0;
      goto LABEL_25;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_serverTimestampSeconds != *((_QWORD *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_version != *((_QWORD *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_24;
  }
  v7 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_retryIntervalSeconds != *((_DWORD *)v4 + 6))
      goto LABEL_24;
    v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = 2654435761 * self->_status;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761u * self->_serverTimestampSeconds;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761u * self->_version;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_7:
  v7 = 2654435761 * self->_retryIntervalSeconds;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    self->_status = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[ChannelActivityDeactivationResponse setUuid:](self, "setUuid:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0)
      goto LABEL_7;
LABEL_11:
    self->_version = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 40) & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  self->_serverTimestampSeconds = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v5 & 4) != 0)
  {
LABEL_8:
    self->_retryIntervalSeconds = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_9:

}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unint64_t)serverTimestampSeconds
{
  return self->_serverTimestampSeconds;
}

- (unint64_t)version
{
  return self->_version;
}

- (unsigned)retryIntervalSeconds
{
  return self->_retryIntervalSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
