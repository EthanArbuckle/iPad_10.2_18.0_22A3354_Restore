@implementation PDSProtoBatchRegisterResp

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (void)clearUserPushTokenRegResponses
{
  -[NSMutableArray removeAllObjects](self->_userPushTokenRegResponses, "removeAllObjects");
}

- (void)addUserPushTokenRegResponses:(id)a3
{
  id v4;
  NSMutableArray *userPushTokenRegResponses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userPushTokenRegResponses = self->_userPushTokenRegResponses;
  v8 = v4;
  if (!userPushTokenRegResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_userPushTokenRegResponses;
    self->_userPushTokenRegResponses = v6;

    v4 = v8;
    userPushTokenRegResponses = self->_userPushTokenRegResponses;
  }
  -[NSMutableArray addObject:](userPushTokenRegResponses, "addObject:", v4);

}

- (unint64_t)userPushTokenRegResponsesCount
{
  return -[NSMutableArray count](self->_userPushTokenRegResponses, "count");
}

- (id)userPushTokenRegResponsesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_userPushTokenRegResponses, "objectAtIndex:", a3);
}

+ (Class)userPushTokenRegResponsesType
{
  return (Class)objc_opt_class();
}

- (void)setResponseTtl:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_responseTtl = a3;
}

- (void)setHasResponseTtl:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseTtl
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRetryInterval:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_retryInterval = a3;
}

- (void)setHasRetryInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRetryInterval
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setServerTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_serverTimestamp = a3;
}

- (void)setHasServerTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServerTimestamp
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
  v8.super_class = (Class)PDSProtoBatchRegisterResp;
  -[PDSProtoBatchRegisterResp description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSProtoBatchRegisterResp dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *message;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char has;
  void *v14;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("status"));

  message = self->_message;
  if (message)
    objc_msgSend(v3, "setObject:forKey:", message, CFSTR("message"));
  if (-[NSMutableArray count](self->_userPushTokenRegResponses, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_userPushTokenRegResponses, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_userPushTokenRegResponses;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("user_push_token_reg_responses"));
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_14;
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_retryInterval, (_QWORD)v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("retry_interval"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_responseTtl);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("response_ttl"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_18;
LABEL_14:
  if ((has & 4) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_serverTimestamp, (_QWORD)v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("server_timestamp"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoBatchRegisterRespReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_message)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_userPushTokenRegResponses;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_12;
LABEL_16:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_16;
LABEL_12:
  if ((has & 4) != 0)
LABEL_13:
    PBDataWriterWriteInt64Field();
LABEL_14:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  _DWORD *v9;

  v9 = a3;
  v9[10] = self->_status;
  if (self->_message)
    objc_msgSend(v9, "setMessage:");
  if (-[PDSProtoBatchRegisterResp userPushTokenRegResponsesCount](self, "userPushTokenRegResponsesCount"))
  {
    objc_msgSend(v9, "clearUserPushTokenRegResponses");
    v4 = -[PDSProtoBatchRegisterResp userPushTokenRegResponsesCount](self, "userPushTokenRegResponsesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PDSProtoBatchRegisterResp userPushTokenRegResponsesAtIndex:](self, "userPushTokenRegResponsesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addUserPushTokenRegResponses:", v7);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
LABEL_13:
    *((_QWORD *)v9 + 2) = self->_retryInterval;
    *((_BYTE *)v9 + 56) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_QWORD *)v9 + 1) = self->_responseTtl;
  *((_BYTE *)v9 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    *((_QWORD *)v9 + 3) = self->_serverTimestamp;
    *((_BYTE *)v9 + 56) |= 4u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char has;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_status;
  v6 = -[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_userPushTokenRegResponses;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v5, "addUserPushTokenRegResponses:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_10;
LABEL_14:
    *(_QWORD *)(v5 + 16) = self->_retryInterval;
    *(_BYTE *)(v5 + 56) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_11;
  }
  *(_QWORD *)(v5 + 8) = self->_responseTtl;
  *(_BYTE *)(v5 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    *(_QWORD *)(v5 + 24) = self->_serverTimestamp;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *message;
  NSMutableArray *userPushTokenRegResponses;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if (self->_status != *((_DWORD *)v4 + 10))
    goto LABEL_21;
  message = self->_message;
  if ((unint64_t)message | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](message, "isEqual:"))
      goto LABEL_21;
  }
  userPushTokenRegResponses = self->_userPushTokenRegResponses;
  if ((unint64_t)userPushTokenRegResponses | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](userPushTokenRegResponses, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_responseTtl != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_retryInterval != *((_QWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_21;
  }
  v7 = (*((_BYTE *)v4 + 56) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_serverTimestamp != *((_QWORD *)v4 + 3))
      goto LABEL_21;
    v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  uint64_t status;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  status = self->_status;
  v4 = -[NSString hash](self->_message, "hash");
  v5 = -[NSMutableArray hash](self->_userPushTokenRegResponses, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v8 = 0;
    return v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * status);
  }
  v6 = 2654435761 * self->_responseTtl;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v7 = 2654435761 * self->_retryInterval;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v8 = 2654435761 * self->_serverTimestamp;
  return v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * status);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_status = *((_DWORD *)v4 + 10);
  if (*((_QWORD *)v4 + 4))
    -[PDSProtoBatchRegisterResp setMessage:](self, "setMessage:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[PDSProtoBatchRegisterResp addUserPushTokenRegResponses:](self, "addUserPushTokenRegResponses:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 56);
  if ((v10 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0)
      goto LABEL_12;
LABEL_16:
    self->_retryInterval = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 56) & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  self->_responseTtl = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v10 = *((_BYTE *)v4 + 56);
  if ((v10 & 2) != 0)
    goto LABEL_16;
LABEL_12:
  if ((v10 & 4) != 0)
  {
LABEL_13:
    self->_serverTimestamp = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_14:

}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSMutableArray)userPushTokenRegResponses
{
  return self->_userPushTokenRegResponses;
}

- (void)setUserPushTokenRegResponses:(id)a3
{
  objc_storeStrong((id *)&self->_userPushTokenRegResponses, a3);
}

- (int64_t)responseTtl
{
  return self->_responseTtl;
}

- (int64_t)retryInterval
{
  return self->_retryInterval;
}

- (int64_t)serverTimestamp
{
  return self->_serverTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPushTokenRegResponses, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
