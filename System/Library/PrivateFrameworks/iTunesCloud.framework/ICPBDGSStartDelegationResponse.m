@implementation ICPBDGSStartDelegationResponse

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICPBDGSStartDelegationResponse;
  -[ICPBDGSStartDelegationResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPBDGSStartDelegationResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *playerAnisetteMID;
  NSData *playerDeviceGUID;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString *playerUserAgent;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  playerAnisetteMID = self->_playerAnisetteMID;
  if (playerAnisetteMID)
    objc_msgSend(v3, "setObject:forKey:", playerAnisetteMID, CFSTR("playerAnisetteMID"));
  playerDeviceGUID = self->_playerDeviceGUID;
  if (playerDeviceGUID)
    objc_msgSend(v4, "setObject:forKey:", playerDeviceGUID, CFSTR("playerDeviceGUID"));
  if (-[NSMutableArray count](self->_playerInfoContextTokens, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_playerInfoContextTokens, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_playerInfoContextTokens;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("playerInfoContextToken"));
  }
  playerUserAgent = self->_playerUserAgent;
  if (playerUserAgent)
    objc_msgSend(v4, "setObject:forKey:", playerUserAgent, CFSTR("playerUserAgent"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICPBDGSStartDelegationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_playerAnisetteMID)
    PBDataWriterWriteDataField();
  if (self->_playerDeviceGUID)
    PBDataWriterWriteDataField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_playerInfoContextTokens;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_playerUserAgent)
    PBDataWriterWriteStringField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_playerAnisetteMID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_playerDeviceGUID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_playerInfoContextTokens;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v19);
        -[ICPBDGSStartDelegationResponse addPlayerInfoContextToken:]((uint64_t)v5, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_playerUserAgent, "copyWithZone:", a3);
  v17 = (void *)v5[4];
  v5[4] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *playerAnisetteMID;
  NSData *playerDeviceGUID;
  NSMutableArray *playerInfoContextTokens;
  NSString *playerUserAgent;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((playerAnisetteMID = self->_playerAnisetteMID, !((unint64_t)playerAnisetteMID | v4[1]))
     || -[NSData isEqual:](playerAnisetteMID, "isEqual:"))
    && ((playerDeviceGUID = self->_playerDeviceGUID, !((unint64_t)playerDeviceGUID | v4[2]))
     || -[NSData isEqual:](playerDeviceGUID, "isEqual:"))
    && ((playerInfoContextTokens = self->_playerInfoContextTokens, !((unint64_t)playerInfoContextTokens | v4[3]))
     || -[NSMutableArray isEqual:](playerInfoContextTokens, "isEqual:")))
  {
    playerUserAgent = self->_playerUserAgent;
    if ((unint64_t)playerUserAgent | v4[4])
      v9 = -[NSString isEqual:](playerUserAgent, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_playerAnisetteMID, "hash");
  v4 = -[NSData hash](self->_playerDeviceGUID, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_playerInfoContextTokens, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_playerUserAgent, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerUserAgent, 0);
  objc_storeStrong((id *)&self->_playerInfoContextTokens, 0);
  objc_storeStrong((id *)&self->_playerDeviceGUID, 0);
  objc_storeStrong((id *)&self->_playerAnisetteMID, 0);
}

- (void)addPlayerInfoContextToken:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

@end
