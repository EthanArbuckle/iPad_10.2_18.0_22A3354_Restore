@implementation ChannelActivityActivationResponse

- (int)status
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 9)
    return off_24D978170[a3];
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
  *(_BYTE *)&self->_has |= 2u;
  self->_serverTimestampSeconds = a3;
}

- (void)setHasServerTimestampSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerTimestampSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearParticipantPayloads
{
  -[NSMutableArray removeAllObjects](self->_participantPayloads, "removeAllObjects");
}

- (void)addParticipantPayload:(id)a3
{
  id v4;
  NSMutableArray *participantPayloads;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  participantPayloads = self->_participantPayloads;
  v8 = v4;
  if (!participantPayloads)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_participantPayloads;
    self->_participantPayloads = v6;

    v4 = v8;
    participantPayloads = self->_participantPayloads;
  }
  -[NSMutableArray addObject:](participantPayloads, "addObject:", v4);

}

- (unint64_t)participantPayloadsCount
{
  return -[NSMutableArray count](self->_participantPayloads, "count");
}

- (id)participantPayloadAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_participantPayloads, "objectAtIndex:", a3);
}

+ (Class)participantPayloadType
{
  return (Class)objc_opt_class();
}

- (void)setResponseMessageIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_responseMessageIndex = a3;
}

- (void)setHasResponseMessageIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResponseMessageIndex
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTotalResponseMessages:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_totalResponseMessages = a3;
}

- (void)setHasTotalResponseMessages:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTotalResponseMessages
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setActivationExpirySeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activationExpirySeconds = a3;
}

- (void)setHasActivationExpirySeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivationExpirySeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRetryIntervalSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_retryIntervalSeconds = a3;
}

- (void)setHasRetryIntervalSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRetryIntervalSeconds
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)ChannelActivityActivationResponse;
  -[ChannelActivityActivationResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChannelActivityActivationResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    status = self->_status;
    if (status >= 9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24D978170[status];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("status"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_serverTimestampSeconds);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("server_timestamp_seconds"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_version);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("version"));

  }
  if (-[NSMutableArray count](self->_participantPayloads, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_participantPayloads, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_participantPayloads;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("participant_payload"));
  }
  v17 = (char)self->_has;
  if ((v17 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_responseMessageIndex);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("response_message_index"));

    v17 = (char)self->_has;
    if ((v17 & 0x40) == 0)
    {
LABEL_23:
      if ((v17 & 1) == 0)
        goto LABEL_24;
LABEL_29:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_activationExpirySeconds);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("activation_expiry_seconds"));

      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        return v3;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalResponseMessages);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("total_response_messages"));

  v17 = (char)self->_has;
  if ((v17 & 1) != 0)
    goto LABEL_29;
LABEL_24:
  if ((v17 & 0x10) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retryIntervalSeconds);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("retry_interval_seconds"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityActivationResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_uuid)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint64Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_participantPayloads;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = (char)self->_has;
    if ((v11 & 0x40) == 0)
    {
LABEL_18:
      if ((v11 & 1) == 0)
        goto LABEL_19;
LABEL_24:
      PBDataWriterWriteUint64Field();
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  v11 = (char)self->_has;
  if ((v11 & 1) != 0)
    goto LABEL_24;
LABEL_19:
  if ((v11 & 0x10) != 0)
LABEL_20:
    PBDataWriterWriteUint32Field();
LABEL_21:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  _DWORD *v11;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v4[12] = self->_status;
    *((_BYTE *)v4 + 64) |= 0x20u;
  }
  v11 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_serverTimestampSeconds;
    *((_BYTE *)v4 + 64) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_version;
    *((_BYTE *)v4 + 64) |= 4u;
  }
  if (-[ChannelActivityActivationResponse participantPayloadsCount](self, "participantPayloadsCount"))
  {
    objc_msgSend(v11, "clearParticipantPayloads");
    v6 = -[ChannelActivityActivationResponse participantPayloadsCount](self, "participantPayloadsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[ChannelActivityActivationResponse participantPayloadAtIndex:](self, "participantPayloadAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addParticipantPayload:", v9);

      }
    }
  }
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    v11[10] = self->_responseMessageIndex;
    *((_BYTE *)v11 + 64) |= 8u;
    v10 = (char)self->_has;
    if ((v10 & 0x40) == 0)
    {
LABEL_15:
      if ((v10 & 1) == 0)
        goto LABEL_16;
LABEL_21:
      *((_QWORD *)v11 + 1) = self->_activationExpirySeconds;
      *((_BYTE *)v11 + 64) |= 1u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_15;
  }
  v11[13] = self->_totalResponseMessages;
  *((_BYTE *)v11 + 64) |= 0x40u;
  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
    goto LABEL_21;
LABEL_16:
  if ((v10 & 0x10) != 0)
  {
LABEL_17:
    v11[11] = self->_retryIntervalSeconds;
    *((_BYTE *)v11 + 64) |= 0x10u;
  }
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_status;
    *(_BYTE *)(v5 + 64) |= 0x20u;
  }
  v7 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_serverTimestampSeconds;
    *(_BYTE *)(v6 + 64) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_version;
    *(_BYTE *)(v6 + 64) |= 4u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_participantPayloads;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v6, "addParticipantPayload:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_responseMessageIndex;
    *(_BYTE *)(v6 + 64) |= 8u;
    v16 = (char)self->_has;
    if ((v16 & 0x40) == 0)
    {
LABEL_16:
      if ((v16 & 1) == 0)
        goto LABEL_17;
LABEL_22:
      *(_QWORD *)(v6 + 8) = self->_activationExpirySeconds;
      *(_BYTE *)(v6 + 64) |= 1u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        return (id)v6;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_16;
  }
  *(_DWORD *)(v6 + 52) = self->_totalResponseMessages;
  *(_BYTE *)(v6 + 64) |= 0x40u;
  v16 = (char)self->_has;
  if ((v16 & 1) != 0)
    goto LABEL_22;
LABEL_17:
  if ((v16 & 0x10) != 0)
  {
LABEL_18:
    *(_DWORD *)(v6 + 44) = self->_retryIntervalSeconds;
    *(_BYTE *)(v6 + 64) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSData *uuid;
  NSMutableArray *participantPayloads;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 12))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_42;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_42;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_serverTimestampSeconds != *((_QWORD *)v4 + 2))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_version != *((_QWORD *)v4 + 3))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_42;
  }
  participantPayloads = self->_participantPayloads;
  if ((unint64_t)participantPayloads | *((_QWORD *)v4 + 4))
  {
    if (-[NSMutableArray isEqual:](participantPayloads, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_23;
    }
LABEL_42:
    v8 = 0;
    goto LABEL_43;
  }
LABEL_23:
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_responseMessageIndex != *((_DWORD *)v4 + 10))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x40) == 0 || self->_totalResponseMessages != *((_DWORD *)v4 + 13))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_activationExpirySeconds != *((_QWORD *)v4 + 1))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_42;
  }
  v8 = (*((_BYTE *)v4 + 64) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_retryIntervalSeconds != *((_DWORD *)v4 + 11))
      goto LABEL_42;
    v8 = 1;
  }
LABEL_43:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v3 = 2654435761 * self->_status;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761u * self->_serverTimestampSeconds;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v6 = 2654435761u * self->_version;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  v7 = -[NSMutableArray hash](self->_participantPayloads, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v8 = 2654435761 * self->_responseMessageIndex;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_11:
      v9 = 2654435761 * self->_totalResponseMessages;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_12;
LABEL_16:
      v10 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_13;
LABEL_17:
      v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_11;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_16;
LABEL_12:
  v10 = 2654435761u * self->_activationExpirySeconds;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_17;
LABEL_13:
  v11 = 2654435761 * self->_retryIntervalSeconds;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[16] & 0x20) != 0)
  {
    self->_status = v4[12];
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 7))
    -[ChannelActivityActivationResponse setUuid:](self, "setUuid:");
  v6 = *((_BYTE *)v5 + 64);
  if ((v6 & 2) != 0)
  {
    self->_serverTimestampSeconds = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v5 + 64);
  }
  if ((v6 & 4) != 0)
  {
    self->_version = *((_QWORD *)v5 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v5 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[ChannelActivityActivationResponse addParticipantPayload:](self, "addParticipantPayload:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v5 + 64);
  if ((v12 & 8) != 0)
  {
    self->_responseMessageIndex = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 8u;
    v12 = *((_BYTE *)v5 + 64);
    if ((v12 & 0x40) == 0)
    {
LABEL_18:
      if ((v12 & 1) == 0)
        goto LABEL_19;
LABEL_24:
      self->_activationExpirySeconds = *((_QWORD *)v5 + 1);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v5 + 64) & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v5 + 64) & 0x40) == 0)
  {
    goto LABEL_18;
  }
  self->_totalResponseMessages = *((_DWORD *)v5 + 13);
  *(_BYTE *)&self->_has |= 0x40u;
  v12 = *((_BYTE *)v5 + 64);
  if ((v12 & 1) != 0)
    goto LABEL_24;
LABEL_19:
  if ((v12 & 0x10) != 0)
  {
LABEL_20:
    self->_retryIntervalSeconds = *((_DWORD *)v5 + 11);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_21:

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

- (NSMutableArray)participantPayloads
{
  return self->_participantPayloads;
}

- (void)setParticipantPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_participantPayloads, a3);
}

- (unsigned)responseMessageIndex
{
  return self->_responseMessageIndex;
}

- (unsigned)totalResponseMessages
{
  return self->_totalResponseMessages;
}

- (unint64_t)activationExpirySeconds
{
  return self->_activationExpirySeconds;
}

- (unsigned)retryIntervalSeconds
{
  return self->_retryIntervalSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_participantPayloads, 0);
}

@end
