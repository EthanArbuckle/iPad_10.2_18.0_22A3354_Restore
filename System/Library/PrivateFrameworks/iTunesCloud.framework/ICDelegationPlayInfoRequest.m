@implementation ICDelegationPlayInfoRequest

- (NSString)playerDeviceGUID
{
  if (self->_playerDeviceGUID)
    return self->_playerDeviceGUID;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSArray)tokenRequests
{
  if (self->_tokenRequests)
    return self->_tokenRequests;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)playerUserAgent
{
  if (self->_playerUserAgent)
    return self->_playerUserAgent;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSMutableDictionary)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSData length](self->_playerAnisetteMID, "length"))
  {
    -[NSData base64EncodedStringWithOptions:](self->_playerAnisetteMID, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("player-mid"));

  }
  if (-[NSString length](self->_playerDeviceGUID, "length"))
    objc_msgSend(v3, "setObject:forKey:", self->_playerDeviceGUID, CFSTR("player-guid"));
  if (-[NSString length](self->_playerUserAgent, "length"))
    objc_msgSend(v3, "setObject:forKey:", self->_playerUserAgent, CFSTR("player-user-agent"));
  if (self->_tokenRequests)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_tokenRequests, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_tokenRequests;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "propertyListRepresentation", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("enqueuers"));
  }
  return (NSMutableDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSData copyWithZone:](self->_playerAnisetteMID, "copyWithZone:", a3);
    v7 = (void *)v5[3];
    v5[3] = v6;

    v8 = -[NSString copyWithZone:](self->_playerDeviceGUID, "copyWithZone:", a3);
    v9 = (void *)v5[1];
    v5[1] = v8;

    v10 = -[NSString copyWithZone:](self->_playerUserAgent, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    v12 = -[NSArray copyWithZone:](self->_tokenRequests, "copyWithZone:", a3);
    v13 = (void *)v5[2];
    v5[2] = v12;

  }
  return v5;
}

- (NSData)playerAnisetteMID
{
  return self->_playerAnisetteMID;
}

- (void)setPlayerAnisetteMID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPlayerDeviceGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setPlayerUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTokenRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerUserAgent, 0);
  objc_storeStrong((id *)&self->_playerAnisetteMID, 0);
  objc_storeStrong((id *)&self->_tokenRequests, 0);
  objc_storeStrong((id *)&self->_playerDeviceGUID, 0);
}

@end
