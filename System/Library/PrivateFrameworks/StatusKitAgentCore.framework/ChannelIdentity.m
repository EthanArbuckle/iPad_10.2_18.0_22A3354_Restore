@implementation ChannelIdentity

- (BOOL)hasChannelTopic
{
  return self->_channelTopic != 0;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (BOOL)hasChannelToken
{
  return self->_channelToken != 0;
}

- (int)channelOwnershipType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_channelOwnershipType;
  else
    return 0;
}

- (void)setChannelOwnershipType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelOwnershipType = a3;
}

- (void)setHasChannelOwnershipType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelOwnershipType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)channelOwnershipTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("SELF_USER_OWNERSHIP");
  if (a3 == 1)
  {
    v3 = CFSTR("SHARED_OWNERSHIP");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsChannelOwnershipType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SELF_USER_OWNERSHIP")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_OWNERSHIP"));

  return v4;
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
  v8.super_class = (Class)ChannelIdentity;
  -[ChannelIdentity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChannelIdentity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *channelTopic;
  NSData *channelId;
  NSData *channelToken;
  int channelOwnershipType;
  __CFString *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  channelTopic = self->_channelTopic;
  if (channelTopic)
    objc_msgSend(v3, "setObject:forKey:", channelTopic, CFSTR("channel_topic"));
  channelId = self->_channelId;
  if (channelId)
    objc_msgSend(v4, "setObject:forKey:", channelId, CFSTR("channel_id"));
  channelToken = self->_channelToken;
  if (channelToken)
    objc_msgSend(v4, "setObject:forKey:", channelToken, CFSTR("channel_token"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    channelOwnershipType = self->_channelOwnershipType;
    if (channelOwnershipType)
    {
      if (channelOwnershipType == 1)
      {
        v9 = CFSTR("SHARED_OWNERSHIP");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_channelOwnershipType);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = CFSTR("SELF_USER_OWNERSHIP");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("channel_ownership_type"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_channelTopic)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_channelId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_channelToken)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_channelTopic)
  {
    objc_msgSend(v4, "setChannelTopic:");
    v4 = v5;
  }
  if (self->_channelId)
  {
    objc_msgSend(v5, "setChannelId:");
    v4 = v5;
  }
  if (self->_channelToken)
  {
    objc_msgSend(v5, "setChannelToken:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_channelOwnershipType;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_channelTopic, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSData copyWithZone:](self->_channelId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSData copyWithZone:](self->_channelToken, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_channelOwnershipType;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *channelTopic;
  NSData *channelId;
  NSData *channelToken;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  channelTopic = self->_channelTopic;
  if ((unint64_t)channelTopic | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](channelTopic, "isEqual:"))
      goto LABEL_12;
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](channelId, "isEqual:"))
      goto LABEL_12;
  }
  channelToken = self->_channelToken;
  if ((unint64_t)channelToken | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](channelToken, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_channelOwnershipType == *((_DWORD *)v4 + 4))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_channelTopic, "hash");
  v4 = -[NSData hash](self->_channelId, "hash");
  v5 = -[NSData hash](self->_channelToken, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_channelOwnershipType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[ChannelIdentity setChannelTopic:](self, "setChannelTopic:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ChannelIdentity setChannelId:](self, "setChannelId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ChannelIdentity setChannelToken:](self, "setChannelToken:");
    v4 = v5;
  }
  if ((v4[10] & 1) != 0)
  {
    self->_channelOwnershipType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)channelTopic
{
  return self->_channelTopic;
}

- (void)setChannelTopic:(id)a3
{
  objc_storeStrong((id *)&self->_channelTopic, a3);
}

- (NSData)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_channelId, a3);
}

- (NSData)channelToken
{
  return self->_channelToken;
}

- (void)setChannelToken:(id)a3
{
  objc_storeStrong((id *)&self->_channelToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelTopic, 0);
  objc_storeStrong((id *)&self->_channelToken, 0);
  objc_storeStrong((id *)&self->_channelId, 0);
}

@end
