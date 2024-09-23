@implementation ChannelDeferredPublishInfo

- (BOOL)hasChannelIdentity
{
  return self->_channelIdentity != 0;
}

- (void)clearChannelProvisionOffGridPacketInfos
{
  -[NSMutableArray removeAllObjects](self->_channelProvisionOffGridPacketInfos, "removeAllObjects");
}

- (void)addChannelProvisionOffGridPacketInfo:(id)a3
{
  id v4;
  NSMutableArray *channelProvisionOffGridPacketInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  channelProvisionOffGridPacketInfos = self->_channelProvisionOffGridPacketInfos;
  v8 = v4;
  if (!channelProvisionOffGridPacketInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_channelProvisionOffGridPacketInfos;
    self->_channelProvisionOffGridPacketInfos = v6;

    v4 = v8;
    channelProvisionOffGridPacketInfos = self->_channelProvisionOffGridPacketInfos;
  }
  -[NSMutableArray addObject:](channelProvisionOffGridPacketInfos, "addObject:", v4);

}

- (unint64_t)channelProvisionOffGridPacketInfosCount
{
  return -[NSMutableArray count](self->_channelProvisionOffGridPacketInfos, "count");
}

- (id)channelProvisionOffGridPacketInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_channelProvisionOffGridPacketInfos, "objectAtIndex:", a3);
}

+ (Class)channelProvisionOffGridPacketInfoType
{
  return (Class)objc_opt_class();
}

- (int)pushPriority
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_pushPriority;
  else
    return 0;
}

- (void)setPushPriority:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pushPriority = a3;
}

- (void)setHasPushPriority:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPushPriority
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)pushPriorityAsString:(int)a3
{
  if (a3 < 3)
    return off_24D977AD0[a3];
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

- (void)setRetryCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_retryCount = a3;
}

- (void)setHasRetryCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRetryCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)ChannelDeferredPublishInfo;
  -[ChannelDeferredPublishInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChannelDeferredPublishInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ChannelIdentity *channelIdentity;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char has;
  uint64_t pushPriority;
  __CFString *v15;
  void *v16;
  NSString *adopter;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  channelIdentity = self->_channelIdentity;
  if (channelIdentity)
  {
    -[ChannelIdentity dictionaryRepresentation](channelIdentity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("channel_identity"));

  }
  if (-[NSMutableArray count](self->_channelProvisionOffGridPacketInfos, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_channelProvisionOffGridPacketInfos, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_channelProvisionOffGridPacketInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("channel_provision_off_grid_packet_info"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    pushPriority = self->_pushPriority;
    if (pushPriority >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_pushPriority);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_24D977AD0[pushPriority];
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("push_priority"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retryCount);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("retry_count"));

  }
  adopter = self->_adopter;
  if (adopter)
    objc_msgSend(v3, "setObject:forKey:", adopter, CFSTR("adopter"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelDeferredPublishInfoReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_channelIdentity)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_channelProvisionOffGridPacketInfos;
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
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_adopter)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  void *v9;
  id v10;

  v10 = a3;
  if (self->_channelIdentity)
    objc_msgSend(v10, "setChannelIdentity:");
  if (-[ChannelDeferredPublishInfo channelProvisionOffGridPacketInfosCount](self, "channelProvisionOffGridPacketInfosCount"))
  {
    objc_msgSend(v10, "clearChannelProvisionOffGridPacketInfos");
    v4 = -[ChannelDeferredPublishInfo channelProvisionOffGridPacketInfosCount](self, "channelProvisionOffGridPacketInfosCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ChannelDeferredPublishInfo channelProvisionOffGridPacketInfoAtIndex:](self, "channelProvisionOffGridPacketInfoAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addChannelProvisionOffGridPacketInfo:", v7);

      }
    }
  }
  has = (char)self->_has;
  v9 = v10;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v10 + 8) = self->_pushPriority;
    *((_BYTE *)v10 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 9) = self->_retryCount;
    *((_BYTE *)v10 + 40) |= 2u;
  }
  if (self->_adopter)
  {
    objc_msgSend(v10, "setAdopter:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char has;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ChannelIdentity copyWithZone:](self->_channelIdentity, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_channelProvisionOffGridPacketInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addChannelProvisionOffGridPacketInfo:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_pushPriority;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_retryCount;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v15 = -[NSString copyWithZone:](self->_adopter, "copyWithZone:", a3, (_QWORD)v18);
  v16 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v15;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ChannelIdentity *channelIdentity;
  NSMutableArray *channelProvisionOffGridPacketInfos;
  NSString *adopter;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  channelIdentity = self->_channelIdentity;
  if ((unint64_t)channelIdentity | *((_QWORD *)v4 + 2))
  {
    if (!-[ChannelIdentity isEqual:](channelIdentity, "isEqual:"))
      goto LABEL_18;
  }
  channelProvisionOffGridPacketInfos = self->_channelProvisionOffGridPacketInfos;
  if ((unint64_t)channelProvisionOffGridPacketInfos | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](channelProvisionOffGridPacketInfos, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_pushPriority != *((_DWORD *)v4 + 8))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_retryCount != *((_DWORD *)v4 + 9))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_18;
  }
  adopter = self->_adopter;
  if ((unint64_t)adopter | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](adopter, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[ChannelIdentity hash](self->_channelIdentity, "hash");
  v4 = -[NSMutableArray hash](self->_channelProvisionOffGridPacketInfos, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_pushPriority;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_adopter, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_retryCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_adopter, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ChannelIdentity *channelIdentity;
  uint64_t v6;
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
  channelIdentity = self->_channelIdentity;
  v6 = *((_QWORD *)v4 + 2);
  if (channelIdentity)
  {
    if (v6)
      -[ChannelIdentity mergeFrom:](channelIdentity, "mergeFrom:");
  }
  else if (v6)
  {
    -[ChannelDeferredPublishInfo setChannelIdentity:](self, "setChannelIdentity:");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 3);
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
        -[ChannelDeferredPublishInfo addChannelProvisionOffGridPacketInfo:](self, "addChannelProvisionOffGridPacketInfo:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v4 + 40);
  if ((v12 & 1) != 0)
  {
    self->_pushPriority = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v12 = *((_BYTE *)v4 + 40);
  }
  if ((v12 & 2) != 0)
  {
    self->_retryCount = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
    -[ChannelDeferredPublishInfo setAdopter:](self, "setAdopter:");

}

- (ChannelIdentity)channelIdentity
{
  return self->_channelIdentity;
}

- (void)setChannelIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_channelIdentity, a3);
}

- (NSMutableArray)channelProvisionOffGridPacketInfos
{
  return self->_channelProvisionOffGridPacketInfos;
}

- (void)setChannelProvisionOffGridPacketInfos:(id)a3
{
  objc_storeStrong((id *)&self->_channelProvisionOffGridPacketInfos, a3);
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
  objc_storeStrong((id *)&self->_channelProvisionOffGridPacketInfos, 0);
  objc_storeStrong((id *)&self->_channelIdentity, 0);
  objc_storeStrong((id *)&self->_adopter, 0);
}

@end
