@implementation GKCloudGameSession

- (GKCloudGameSession)initWithContainerName:(id)a3
{
  id v4;
  id v5;
  id v6;
  GKCloudGameSession *v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", v4, CKCurrentUserDefaultName);

  v6 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:zoneID:", CFSTR("Session"), v5);
  v7 = -[GKCloudGameSession initWithRecord:](self, "initWithRecord:", v6);

  return v7;
}

- (GKCloudGameSession)initWithRecord:(id)a3
{
  id v4;
  GKCloudGameSession *v5;
  GKCloudGameSession *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKCloudGameSession;
  v5 = -[GKCloudGameSession init](&v8, "init");
  v6 = v5;
  if (v5)
    -[GKCloudGameSession setRecord:](v5, "setRecord:", v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKCloudGameSession)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  GKCloudGameSession *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSString *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)GKCloudGameSession;
  v6 = -[GKCloudGameSession init](&v30, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKRecord, v5), CFSTR("record"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[GKCloudGameSession setRecord:](v6, "setRecord:", v8);

    v10 = objc_opt_class(NSDictionary, v9);
    v12 = objc_opt_class(NSString, v11);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v12, objc_opt_class(GKCloudPlayer, v13), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("players")));
    -[GKCloudGameSession setPlayersByIdentifier:](v6, "setPlayersByIdentifier:", v16);

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v17), CFSTR("url"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[GKCloudGameSession setUrl:](v6, "setUrl:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](v6, "record"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "creatorUserRecordID"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "recordName"));
    v23 = (void *)v22;
    v24 = CKCurrentUserDefaultName;
    if (v22)
      v24 = (NSString *)v22;
    v25 = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession playerIdentifierForUserRecordName:](GKCloudGameSession, "playerIdentifierForUserRecordName:", v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByIdentifier](v6, "playersByIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v26));
    -[GKCloudGameSession setOwner:](v6, "setOwner:", v28);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("record"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByIdentifier](self, "playersByIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("players"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession url](self, "url"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("url"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKCloudGameSession;
  v3 = -[GKCloudGameSession description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
  v7 = -[GKCloudGameSession maxConnectedPlayers](self, "maxConnectedPlayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByIdentifier](self, "playersByIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession owner](self, "owner"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: recordID = %@, maxConnectedPlayers = %d, playersByIdentifier = %@, owner = %@"), v4, v6, v7, v8, v9));

  return v10;
}

- (BOOL)isOwnedByUser
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordID"));
  v4 = +[GKCloudGameSession isOwnRecordID:](GKCloudGameSession, "isOwnRecordID:", v3);

  return v4;
}

- (NSString)identifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession sessionIdentifierForRecordID:](GKCloudGameSession, "sessionIdentifierForRecordID:", v3));

  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("title"));

}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("title")));

  return (NSString *)v3;
}

- (void)setMaxConnectedPlayers:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("maxConnectedPlayers"));

}

- (int64_t)maxConnectedPlayers
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("maxConnectedPlayers")));
  v4 = objc_msgSend(v3, "integerValue");

  return (int64_t)v4;
}

- (NSData)data
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("data")));

  return (NSData *)v3;
}

- (void)setData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("data"));

}

- (NSDate)lastModifiedDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modificationDate"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "creationDate"));

  }
  return (NSDate *)v6;
}

- (GKCloudPlayer)lastModifiedPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastModifiedUserRecordID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordName"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "creatorUserRecordID"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordName"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession playerIdentifierForUserRecordName:](GKCloudGameSession, "playerIdentifierForUserRecordName:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByIdentifier](self, "playersByIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession sessionCache](GKCloudGameSession, "sessionCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userPlayer"));

  }
  return (GKCloudPlayer *)v12;
}

- (NSString)serverChangeTag
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordChangeTag"));

  return (NSString *)v3;
}

- (void)setPlayerStates:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("playerStates"));

}

+ (id)mutablePlistFromPlayerStatesData:(id)a3 error:(id *)a4
{
  uint64_t v5;

  if (!a3)
    return 0;
  v5 = 200;
  return (id)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a3, 1, &v5, a4));
}

- (id)playerStates
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("playerStates")));

  return v3;
}

- (NSDictionary)playersByEmail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByIdentifier](self, "playersByIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession emailsByCKID](self, "emailsByCKID"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByIdentifier](self, "playersByIdentifier", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByIdentifier](self, "playersByIdentifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return (NSDictionary *)v4;
}

- (NSMutableDictionary)emailsByCKID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v11;
  uint64_t v12;

  v12 = 200;
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emails")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("emails")));
    v11 = 0;
    v8 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v7, 1, &v12, &v11));
    v9 = v11;

    v3 = (id)v8;
  }
  return (NSMutableDictionary *)v3;
}

- (void)setEmailsByCKID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (a3)
  {
    v6 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 200, 0, &v6));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("emails"));

  }
}

- (NSMutableDictionary)nicknamesByIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v11;
  uint64_t v12;

  v12 = 200;
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nicknames")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nicknames")));
    v11 = 0;
    v8 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v7, 1, &v12, &v11));
    v9 = v11;

    v3 = (id)v8;
  }
  return (NSMutableDictionary *)v3;
}

- (void)setNicknamesByIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (a3)
  {
    v6 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 200, 0, &v6));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("nicknames"));

  }
}

- (id)createGKGameSession
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v35;
  id obj;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _BYTE v44[128];

  v3 = objc_alloc_init((Class)GKGameSession);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession sessionIdentifierForRecordID:](GKCloudGameSession, "sessionIdentifierForRecordID:", v5));
  objc_msgSend(v3, "setIdentifier:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession title](self, "title"));
  objc_msgSend(v3, "setTitle:", v7);

  objc_msgSend(v3, "setMaxNumberOfConnectedPlayers:", -[GKCloudGameSession maxConnectedPlayers](self, "maxConnectedPlayers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession lastModifiedDate](self, "lastModifiedDate"));
  objc_msgSend(v3, "setLastModifiedDate:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession lastModifiedPlayer](self, "lastModifiedPlayer"));
  objc_msgSend(v3, "setLastModifiedPlayer:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession serverChangeTag](self, "serverChangeTag"));
  objc_msgSend(v3, "setServerChangeTag:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersForGKGameSession](self, "playersForGKGameSession"));
  objc_msgSend(v3, "setPlayers:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession owner](self, "owner"));
  objc_msgSend(v3, "setOwner:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playerStates](self, "playerStates"));
  v43 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession mutablePlistFromPlayerStatesData:error:](GKCloudGameSession, "mutablePlistFromPlayerStatesData:error:", v13, &v43));
  v35 = v43;
  objc_msgSend(v3, "setPlayerStates:", v14);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession containerName](self, "containerName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession owner](self, "owner"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession lastModifiedPlayer](self, "lastModifiedPlayer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "players"));
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession obfuscatedIdentifierForPlayerIdentifier:containerName:](GKCloudGameSession, "obfuscatedIdentifierForPlayerIdentifier:containerName:", v23, v38));

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playerStates"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v26));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playerStates"));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v24);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playerStates"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        objc_msgSend(v29, "removeObjectForKey:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        LODWORD(v30) = objc_msgSend(v31, "isEqualToString:", v37);

        if ((_DWORD)v30)
          objc_msgSend(v3, "setOwner:", v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        v33 = objc_msgSend(v32, "isEqualToString:", v17);

        if (v33)
          objc_msgSend(v3, "setLastModifiedPlayer:", v22);
        objc_msgSend(v22, "setIdentifier:", v24);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v19);
  }

  return v3;
}

+ (id)obfuscatedIdentifierForPlayerIdentifier:(id)a3 containerName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (objc_msgSend(v7, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "AES128EncryptedVersionOfData:withKey:", v10, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "base64EncodedStringWithOptions:", 0));

  }
  return v9;
}

+ (id)playerIdentifierForObfuscatedIdentifier:(id)a3 containerName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (objc_msgSend(v7, "length"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "AES128DecryptedVersionOfData:withKey:", v10, v7));

    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v11, 4);
  }

  return v9;
}

+ (id)AES128EncryptedVersionOfData:(id)a3 withKey:(id)a4
{
  return _objc_msgSend(a1, "AES128Operation:key:data:", 0, a4, a3);
}

+ (id)AES128DecryptedVersionOfData:(id)a3 withKey:(id)a4
{
  return _objc_msgSend(a1, "AES128Operation:key:data:", 1, a4, a3);
}

+ (id)AES128Operation:(unsigned int)a3 key:(id)a4 data:(id)a5
{
  id v7;
  id v8;
  void *dataOut;
  id v10;
  id v11;
  size_t v13;
  _QWORD iv[2];
  char v15;
  _QWORD key[2];
  char v17;

  key[0] = 0;
  key[1] = 0;
  v17 = 0;
  v7 = a5;
  objc_msgSend(a4, "getCString:maxLength:encoding:", key, 17, 4);
  iv[0] = 0;
  iv[1] = 0;
  v15 = 0;
  v8 = objc_msgSend(v7, "length");
  dataOut = malloc_type_malloc((size_t)v8 + 16, 0x8819663EuLL);
  v13 = 0;
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "bytes");

  if (!CCCrypt(a3, 0, 3u, key, 0x10uLL, iv, v11, (size_t)v8, dataOut, (size_t)v8 + 16, &v13))
    return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:](NSData, "dataWithBytesNoCopy:length:", dataOut, v13));
  free(dataOut);
  return 0;
}

+ (id)sessionCache
{
  if (qword_100317E78 != -1)
    dispatch_once(&qword_100317E78, &stru_1002C0AF0);
  return (id)qword_100317E70;
}

+ (id)cacheQueue
{
  if (qword_100317E88 != -1)
    dispatch_once(&qword_100317E88, &stru_1002C0B10);
  return (id)qword_100317E80;
}

+ (void)sessionForIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("sessionForIdentifier")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userRecordID"));

  if (v10)
  {
    if ((objc_msgSend(v9, "isValid") & 1) == 0)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000A3230;
      v21[3] = &unk_1002BBF58;
      v23 = a1;
      v22 = v8;
      objc_msgSend(v22, "perform:", v21);

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 2, 0));
    objc_msgSend(v8, "setError:", v11);

  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A32F4;
  v16[3] = &unk_1002C0B38;
  v17 = v9;
  v18 = v6;
  v19 = v8;
  v20 = v7;
  v12 = v8;
  v13 = v6;
  v14 = v9;
  v15 = v7;
  objc_msgSend(v12, "notifyOnQueue:block:", &_dispatch_main_q, v16);

}

+ (void)sessionsForContainerName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("sessionsForContainerName")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userRecordID"));

  if (v10)
  {
    if ((objc_msgSend(v9, "isValid") & 1) == 0)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000A3570;
      v21[3] = &unk_1002BBF58;
      v23 = a1;
      v22 = v8;
      objc_msgSend(v22, "perform:", v21);

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 2, 0));
    objc_msgSend(v8, "setError:", v11);

  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A3634;
  v16[3] = &unk_1002C0B38;
  v17 = v9;
  v18 = v6;
  v19 = v8;
  v20 = v7;
  v12 = v8;
  v13 = v6;
  v14 = v9;
  v15 = v7;
  objc_msgSend(v12, "notifyOnQueue:block:", &_dispatch_main_q, v16);

}

+ (void)sessionForShareMetadata:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "rootRecordID"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionIdentifierForRecordID:", v7));

  objc_msgSend(a1, "sessionForIdentifier:handler:", v8, v6);
}

+ (id)friendEmailsByID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "friendEmailsByID"));

  return v3;
}

+ (void)fetchUserRecordIDWithHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", CFSTR("com.apple.socialgaming.sessions")));
  objc_msgSend(v4, "fetchUserRecordIDWithCompletionHandler:", v3);

}

+ (void)updateUserWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  objc_msgSend(v5, "updateUserWithHandler:", v4);

}

+ (void)updateSessionCacheWithHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A3920;
  v12[3] = &unk_1002BBF58;
  v14 = a1;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("updateSessionCacheWithHandler")));
  v13 = v5;
  objc_msgSend(v5, "perform:", v12);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A3B44;
  v8[3] = &unk_1002C0860;
  v10 = v4;
  v11 = a1;
  v9 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "notifyOnMainQueueWithBlock:", v8);

}

+ (void)updateSessionCacheDatabasesWithHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A3CE4;
  v16[3] = &unk_1002BBF58;
  v18 = a1;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("updateSessionCacheDatabasesWithHandler")));
  v17 = v5;
  objc_msgSend(v5, "perform:", v16);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A3DB0;
  v13[3] = &unk_1002BBF58;
  v15 = a1;
  v6 = v5;
  v14 = v6;
  objc_msgSend(v6, "perform:", v13);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A3E7C;
  v9[3] = &unk_1002C0860;
  v11 = v4;
  v12 = a1;
  v10 = v6;
  v7 = v6;
  v8 = v4;
  objc_msgSend(v7, "notifyOnMainQueueWithBlock:", v9);

}

+ (void)updateCacheForZoneID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3FA0;
  block[3] = &unk_1002C0B88;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

+ (void)updateCacheForDatabaseScope:(int64_t)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  int64_t v12;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A42E4;
  block[3] = &unk_1002C0C78;
  v11 = a1;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

+ (void)updateCacheForDatabase:(id)a3 zoneIDs:(id)a4 handler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];

  v53 = a3;
  v8 = a4;
  v57 = a5;
  v59 = a1;
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v8, "count")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v8, "count")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v8, "count")));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v8, "count")));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v95;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v95 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v17);

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v17);

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
    }
    while (v14);
  }
  v49 = v9;
  v55 = v11;

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v12, "count")));
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v22 = v12;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v91;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v91 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)v26);
        v28 = objc_alloc_init((Class)CKFetchRecordZoneChangesOptions);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "tokenForZoneID:", v27));
        objc_msgSend(v28, "setPreviousServerChangeToken:", v29);

        objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, v27);
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
    }
    while (v24);
  }
  v30 = v22;

  v51 = v21;
  v31 = objc_msgSend(objc_alloc((Class)CKFetchRecordZoneChangesOperation), "initWithRecordZoneIDs:optionsByRecordZoneID:", v22, v21);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  objc_msgSend(v31, "setConfiguration:", v32);

  objc_msgSend(v31, "setFetchAllChanges:", 1);
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_1000A5738;
  v83[3] = &unk_1002C0CA0;
  v89 = v59;
  v54 = v53;
  v84 = v54;
  v48 = v47;
  v85 = v48;
  v33 = v61;
  v86 = v33;
  v34 = v10;
  v87 = v34;
  v35 = v49;
  v88 = v35;
  objc_msgSend(v31, "setRecordChangedBlock:", v83);
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_1000A59BC;
  v81[3] = &unk_1002C0CC8;
  v36 = v50;
  v82 = v36;
  objc_msgSend(v31, "setRecordZoneChangeTokensUpdatedBlock:", v81);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1000A59D0;
  v78[3] = &unk_1002C0CF0;
  v37 = v36;
  v79 = v37;
  v38 = v52;
  v80 = v38;
  objc_msgSend(v31, "setRecordZoneFetchCompletionBlock:", v78);
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1000A5A48;
  v75[3] = &unk_1002C0D18;
  v39 = v33;
  v76 = v39;
  v40 = v55;
  v77 = v40;
  objc_msgSend(v31, "setRecordWithIDWasDeletedBlock:", v75);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1000A5AD8;
  v63[3] = &unk_1002C0D68;
  v64 = v30;
  v65 = v35;
  v66 = v34;
  v67 = v40;
  v74 = v59;
  v68 = v48;
  v69 = v54;
  v70 = v39;
  v71 = v37;
  v72 = v38;
  v73 = v57;
  v58 = v57;
  v62 = v38;
  v60 = v37;
  v56 = v39;
  v41 = v54;
  v42 = v48;
  v43 = v40;
  v44 = v34;
  v45 = v35;
  v46 = v30;
  objc_msgSend(v31, "setFetchRecordZoneChangesCompletionBlock:", v63);
  objc_msgSend(v41, "addOperation:", v31);

}

+ (id)allChangedSessionsFromRecordChangedSessions:(id)a3 shareChangedSessions:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v5 = a3;
  v26 = a4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v36;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(obj);
        v28 = v6;
        v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v6);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v30 = v26;
        v8 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v32;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v32 != v10)
                objc_enumerationMutation(v30);
              v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "record"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modificationDate"));

              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "record"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "modificationDate"));

              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
              v19 = objc_msgSend(v17, "isEqualToString:", v18);

              if (v19)
              {
                if (objc_msgSend(v14, "compare:", v16) == (id)-1)
                  v20 = v7;
                else
                  v20 = v12;
                objc_msgSend(v29, "removeObject:", v20);
              }

              v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v9);
        }

        v6 = v28 + 1;
      }
      while ((id)(v28 + 1) != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v27);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v29));
  return v21;
}

+ (void)reportChangesForSessions:(id)a3 shareChangedSessions:(id)a4 removedSessions:(id)a5 zoneID:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "zoneName"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A6510;
  v21[3] = &unk_1002C0D90;
  v25 = v15;
  v26 = a1;
  v22 = v14;
  v23 = v12;
  v24 = v13;
  v17 = v15;
  v18 = v13;
  v19 = v12;
  v20 = v14;
  objc_msgSend(a1, "bundleIDsForContainerName:handler:", v16, v21);

}

+ (void)determinePlayerChangesIn:(id)a3 newSession:(id)a4 notifyClients:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *m;
  id v37;
  id v38;
  uint64_t v39;
  void *n;
  void *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *ii;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id obj;
  id obja;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "players"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "players"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

  if (v10 != v12 && (objc_msgSend(v10, "isEqualToSet:", v12) & 1) == 0)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v48 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v75 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v12, "containsObject:", v18) & 1) == 0)
            objc_msgSend(v53, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      }
      while (v15);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v47 = v12;
    v20 = v12;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v71 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(v13, "containsObject:", v25, v47) & 1) == 0)
            objc_msgSend(v19, "addObject:", v25);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      }
      while (v22);
    }

    v50 = v7;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "createGKGameSession"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v49 = v8;
    obj = v8;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v67;
      do
      {
        for (k = 0; k != v28; k = (char *)k + 1)
        {
          if (*(_QWORD *)v67 != v29)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)k);
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v32 = v53;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v63;
            do
            {
              for (m = 0; m != v34; m = (char *)m + 1)
              {
                if (*(_QWORD *)v63 != v35)
                  objc_enumerationMutation(v32);
                objc_msgSend(v31, "session:removedPlayer:", v26, *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)m), v47);
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
            }
            while (v34);
          }

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
      }
      while (v28);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obja = obj;
    v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v59;
      do
      {
        for (n = 0; n != v38; n = (char *)n + 1)
        {
          if (*(_QWORD *)v59 != v39)
            objc_enumerationMutation(obja);
          v41 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)n);
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v42 = v19;
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v54, v78, 16);
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v55;
            do
            {
              for (ii = 0; ii != v44; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v55 != v45)
                  objc_enumerationMutation(v42);
                objc_msgSend(v41, "session:addedPlayer:", v26, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)ii), v47);
              }
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v54, v78, 16);
            }
            while (v44);
          }

        }
        v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
      }
      while (v38);
    }

    v8 = v49;
    v7 = v50;
    v12 = v47;
    v10 = v48;
  }

}

+ (id)localPlayerAlias
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryCredentialForEnvironment:", objc_msgSend(v4, "currentEnvironment")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKCloudGameSession.m", 1041, "+[GKCloudGameSession localPlayerAlias]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerInternal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "transactionGroupWithName:forPlayerID:", v6, v8));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A7354;
  v13[3] = &unk_1002BCCF0;
  v14 = v9;
  v10 = v9;
  objc_msgSend(v10, "performOnManagedObjectContext:", v13);
  objc_msgSend(v10, "waitWithTimeout:", 60.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "result"));

  return v11;
}

+ (id)playerIdentifierForUserRecordName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (objc_msgSend(v4, "isEqualToString:", CKCurrentUserDefaultName))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userRecordID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));

  }
  return v5;
}

+ (void)primaryPlayerWithHandler:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, void *);

  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userPlayer"));

    if (v6)
      v7 = 0;
    else
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 2, 0));
    v8[2](v8, v6, v7);

    v4 = v8;
  }

}

+ (void)updatePlayersForSessions:(id)a3 sharesByRecordID:(id)a4 inDatabase:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v10 = a3;
  v11 = a4;
  v29 = a5;
  v28 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v17), "record"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "share"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordID"));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v20));

          if (!v21)
            objc_msgSend(v12, "addObject:", v20);
        }

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v15);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "userPlayer"));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000A7760;
  v30[3] = &unk_1002C0DB8;
  v31 = v13;
  v32 = v11;
  v33 = v23;
  v34 = v28;
  v35 = a1;
  v24 = v28;
  v25 = v23;
  v26 = v11;
  v27 = v13;
  objc_msgSend(a1, "fetchShareRecordsWithRecordIDs:inDatabase:handler:", v12, v29, v30);

}

- (void)updatePlayersWithIdentities:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  GKCloudGameSession *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v16 = self;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession sessionCache](GKCloudGameSession, "sessionCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userRecordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordName"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudPlayer playerWithIdentity:](GKCloudPlayer, "playerWithIdentity:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11), v16));
        v13 = v12;
        if (v7)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v15 = objc_msgSend(v14, "isEqualToString:", CKCurrentUserDefaultName);

          if (v15)
            objc_msgSend(v13, "setIdentifier:", v7);
        }
        objc_msgSend(v4, "addObject:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  -[GKCloudGameSession setPlayers:](v16, "setPlayers:", v4);
}

- (void)setPlayers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier", (_QWORD)v13));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[GKCloudGameSession setPlayersByIdentifier:](self, "setPlayersByIdentifier:", v5);
}

- (id)players
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByIdentifier](self, "playersByIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return v3;
}

- (id)playersForGKGameSession
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession players](self, "players"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_1002C0DF8));

  if (qword_100317E98 != -1)
    dispatch_once(&qword_100317E98, &stru_1002C0E18);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession emailsByCKID](self, "emailsByCKID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession nicknamesByIdentifier](self, "nicknamesByIdentifier"));
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v9 = objc_alloc_init((Class)GKCloudPlayer);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        objc_msgSend(v9, "setIdentifier:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v11));
        objc_msgSend(v9, "setName:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v13));

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingEmailAddress:](CNContact, "predicateForContactsMatchingEmailAddress:", v14));
        v16 = (void *)qword_100317E90;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
        v34 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
        v29 = 0;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "unifiedContactsMatchingPredicate:keysToFetch:error:", v15, v18, &v29));
        v20 = v29;

        if (objc_msgSend(v19, "count"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v21, 0));
          objc_msgSend(v9, "setName:", v22);

        }
        objc_msgSend(v27, "addObject:", v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  return v27;
}

+ (void)updateCacheForFriendZoneID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[5];
  _QWORD v31[3];
  char v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  v9 = objc_alloc_init((Class)CKFetchRecordZoneChangesOptions);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tokenForZoneID:", v6));
  objc_msgSend(v9, "setPreviousServerChangeToken:", v10);

  v11 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
  v37 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
  v35 = v6;
  v36 = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
  v14 = objc_msgSend(v11, "initWithRecordZoneIDs:optionsByRecordZoneID:", v12, v13);

  objc_msgSend(v14, "setFetchAllChanges:", 1);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1000A197C;
  v33[4] = sub_1000A198C;
  v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "previousServerChangeToken"));
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000A847C;
  v30[3] = &unk_1002C0E38;
  v30[4] = a1;
  objc_msgSend(v14, "setRecordChangedBlock:", v30);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000A8490;
  v29[3] = &unk_1002C0E60;
  v29[4] = v33;
  v29[5] = v31;
  objc_msgSend(v14, "setRecordZoneChangeTokensUpdatedBlock:", v29);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000A84EC;
  v28[3] = &unk_1002C0E88;
  v28[4] = v33;
  v28[5] = v31;
  objc_msgSend(v14, "setRecordZoneFetchCompletionBlock:", v28);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1000A8570;
  v22 = &unk_1002C0EB0;
  v26 = v31;
  v15 = v8;
  v23 = v15;
  v27 = v33;
  v16 = v6;
  v24 = v16;
  v17 = v7;
  v25 = v17;
  objc_msgSend(v14, "setFetchRecordZoneChangesCompletionBlock:", &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "privateDatabase", v19, v20, v21, v22));
  objc_msgSend(v18, "addOperation:", v14);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

}

+ (void)updateFriendsWithRecord:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  _BYTE v47[128];
  _QWORD v48[4];
  _QWORD v49[4];

  v3 = a3;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifiers")));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("names")));
  v40 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("emails")));
  v49[0] = objc_opt_class(NSDictionary, v6);
  v49[1] = objc_opt_class(NSString, v7);
  v49[2] = objc_opt_class(NSData, v8);
  v49[3] = objc_opt_class(NSNumber, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
  v46 = 0;
  v39 = (void *)v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v11, v4, &v46));
  v13 = v46;

  if (v13)
  {
    if (!os_log_GKGeneral)
      v16 = (id)GKOSLoggers(v14);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000B565C();
  }
  v37 = v13;
  v48[0] = objc_opt_class(NSDictionary, v15);
  v48[1] = objc_opt_class(NSString, v17);
  v48[2] = objc_opt_class(NSData, v18);
  v48[3] = objc_opt_class(NSNumber, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 4));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v20));
  v45 = 0;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v21, v5, &v45));
  v22 = v45;

  if (v22)
  {
    if (!os_log_GKGeneral)
      v24 = (id)GKOSLoggers(v23);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000B55FC();
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v36, "count")));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = v36;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v32 = objc_alloc_init((Class)GKCloudPlayer);
        objc_msgSend(v32, "setIdentifier:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v31));
        objc_msgSend(v32, "setName:", v33);

        objc_msgSend(v25, "addObject:", v32);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v28);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  objc_msgSend(v34, "setFriendPlayers:withEmails:", v25, v35);

}

+ (void)updateFriendRecordIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  if (objc_msgSend(v3, "friendRecordNeedsUpdate"))
  {
    v24 = a1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "friendPlayers"));
    v25 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("com.apple.socialgaming.friendplayers"), CKCurrentUserDefaultName);
    v5 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:zoneID:", CFSTR("FriendPlayers"), v25);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
            objc_msgSend(v6, "addObject:", v15);

            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
            if (v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v18);

            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v10);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "friendEmailsByID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, 0));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("identifiers"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("names"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("emails"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "privateDatabase"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000A8D4C;
    v26[3] = &unk_1002C0F28;
    v29 = v24;
    v27 = v5;
    v28 = v3;
    v23 = v5;
    objc_msgSend(v22, "saveRecord:completionHandler:", v23, v26);

  }
}

+ (void)getFriendPlayersWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("getFriendPlayersWithHandler")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  if ((objc_msgSend(v6, "isValid") & 1) == 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A904C;
    v14[3] = &unk_1002BBF58;
    v16 = a1;
    v15 = v5;
    objc_msgSend(v15, "perform:", v14);

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A9110;
  v10[3] = &unk_1002BC3D0;
  v12 = v5;
  v13 = v4;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  v9 = v4;
  objc_msgSend(v7, "notifyOnQueue:block:", &_dispatch_main_q, v10);

}

+ (id)allowedCharacterSet
{
  if (qword_100317EA8 != -1)
    dispatch_once(&qword_100317EA8, &stru_1002C0F48);
  return (id)qword_100317EA0;
}

+ (id)sessionIdentifierForRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allowedCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ownerName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playerIdentifierForUserRecordName:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v5));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@%@%@"), v7, CFSTR(" * "), v10, CFSTR(" * "), v14));
  return v15;
}

+ (id)recordIDForSessionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSString *v15;
  id v16;
  id v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" * ")));
  if (objc_msgSend(v4, "count") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByRemovingPercentEncoding"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByRemovingPercentEncoding"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 2));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByRemovingPercentEncoding"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userRecordID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordName"));
    v14 = -[NSString isEqualToString:](v10, "isEqualToString:", v13);

    if (v14)
    {
      v15 = CKCurrentUserDefaultName;

      v10 = v15;
    }
    v16 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", v8, v10);
    v17 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", v6, v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)isOwnRecordID:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "zoneID"));
  LOBYTE(a1) = objc_msgSend(a1, "isOwnZoneID:", v4);

  return (char)a1;
}

+ (BOOL)isOwnZoneID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ownerName"));
  if ((objc_msgSend(v5, "isEqualToString:", CKCurrentUserDefaultName) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ownerName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userRecordID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordName"));
    v6 = objc_msgSend(v7, "isEqualToString:", v10);

  }
  return v6;
}

+ (id)privateDatabase
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", CFSTR("com.apple.socialgaming.sessions")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "privateCloudDatabase"));

  return v3;
}

+ (id)sharedDatabase
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", CFSTR("com.apple.socialgaming.sessions")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sharedCloudDatabase"));

  return v3;
}

+ (id)databaseForSession:(id)a3
{
  void *v4;

  if ((objc_msgSend(a3, "isOwnedByUser") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "privateDatabase"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedDatabase"));
  return v4;
}

+ (id)databaseForZoneID:(id)a3
{
  void *v4;

  if ((objc_msgSend(a1, "isOwnZoneID:", a3) & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "privateDatabase"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedDatabase"));
  return v4;
}

+ (BOOL)isCloudDriveEnabledForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __CFBundle *v12;
  __CFBundle *v13;
  CFStringRef Identifier;
  void *v15;
  void *v16;
  unsigned int v17;
  BOOL v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = (void *)TCCAccessCopyInformation(kTCCServiceUbiquity);
  if (!objc_msgSend(v4, "count"))
  {

    v4 = &__NSArray0__struct;
  }
  v5 = (void *)TCCAccessCopyInformation(kTCCServiceLiverpool);
  if (!objc_msgSend(v5, "count"))
  {

    v5 = &__NSArray0__struct;
  }
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v20 = v5;
    v21 = v4;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v12 = (__CFBundle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kTCCInfoBundle, v20, v21, (_QWORD)v22));
        v13 = v12;
        if (v12)
        {
          Identifier = CFBundleGetIdentifier(v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue(Identifier);
          if (objc_msgSend(v15, "isEqualToString:", v3))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kTCCInfoGranted));
            v17 = objc_msgSend(v16, "BOOLValue");

            if (!v17)
            {

              v18 = 0;
              goto LABEL_18;
            }
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
        continue;
      break;
    }
    v18 = 1;
LABEL_18:
    v5 = v20;
    v4 = v21;
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

+ (void)createSessionWithContainerName:(id)a3 title:(id)a4 maxConnectedPlayers:(int64_t)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  GKCloudGameSession *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  GKCloudGameSession *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  GKCloudGameSession *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  _UNKNOWN **v56;
  void *v57;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("createSession")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession sessionCache](GKCloudGameSession, "sessionCache"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userRecordID"));

  if (v14)
  {
    v41 = v11;
    v43 = v9;
    v15 = -[GKCloudGameSession initWithContainerName:]([GKCloudGameSession alloc], "initWithContainerName:", v9);
    v42 = v10;
    -[GKCloudGameSession setTitle:](v15, "setTitle:", v10);
    -[GKCloudGameSession setMaxConnectedPlayers:](v15, "setMaxConnectedPlayers:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userPlayer"));
    -[GKCloudGameSession setOwner:](v15, "setOwner:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession owner](v15, "owner"));
    v57 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
    -[GKCloudGameSession setPlayers:](v15, "setPlayers:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession owner](v15, "owner"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession owner](v15, "owner"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession owner](v15, "owner"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v22, v24));
      -[GKCloudGameSession setNicknamesByIdentifier:](v15, "setNicknamesByIdentifier:", v25);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession owner](v15, "owner"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
    v55 = v27;
    v56 = &off_1002DC620;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
    v54 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v28, 200, 0, &v54));
    v40 = v54;

    -[GKCloudGameSession setPlayerStates:](v15, "setPlayerStates:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "primaryEmailAddress"));

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession owner](v15, "owner"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v31, v33, 0));
    -[GKCloudGameSession setEmailsByCKID:](v15, "setEmailsByCKID:", v34);

    objc_msgSend(v12, "setResult:", v15);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000A9F88;
    v49[3] = &unk_1002BCDE0;
    v9 = v43;
    v53 = a1;
    v50 = v15;
    v51 = v43;
    v52 = v12;
    v35 = v15;
    objc_msgSend(v52, "perform:", v49);

    v11 = v41;
    v10 = v42;
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 2, 0));
    objc_msgSend(v12, "setError:", v36);

  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000AA358;
  v45[3] = &unk_1002BB568;
  v46 = v12;
  v47 = v13;
  v48 = v11;
  v37 = v11;
  v38 = v13;
  v39 = v12;
  objc_msgSend(v39, "notifyOnQueue:block:", &_dispatch_main_q, v45);

}

+ (void)removeSessionWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000AA584;
  v15[3] = &unk_1002C0B60;
  v18 = a1;
  v16 = v6;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("removeSessionWithIdentifier")));
  v17 = v8;
  v9 = v6;
  objc_msgSend(v8, "perform:", v15);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000AAA2C;
  v12[3] = &unk_1002BB450;
  v13 = v8;
  v14 = v7;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v10, "notifyOnQueue:block:", &_dispatch_main_q, v12);

}

- (NSString)containerName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));

  return (NSString *)v5;
}

+ (void)bundleIDsForContainerName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("bundleIDsForContainerName")));
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIDsForContainerName:", v6));
      objc_msgSend(v8, "setResult:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "result"));
      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", v6));
        v13 = v12;
        if (v12)
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_1000AACF0;
          v19[3] = &unk_1002BF3C0;
          v24 = a1;
          v20 = v12;
          v21 = v6;
          v22 = v9;
          v23 = v8;
          objc_msgSend(v23, "perform:", v19);

          v14 = v20;
        }
        else
        {
          v25 = v6;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
          objc_msgSend(v8, "setResult:", v14);
        }

      }
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000AAF30;
    v16[3] = &unk_1002BB450;
    v17 = v8;
    v18 = v7;
    v15 = v8;
    objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v16);

  }
}

- (void)saveData:(id)a3 changeTag:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  GKCloudGameSession *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  GKCloudGameSession *v29;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("saveData")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordChangeTag"));
  v22 = v9;
  if ((id)v13 == v9)
  {

    goto LABEL_5;
  }
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordChangeTag"));
  v17 = objc_msgSend(v9, "isEqualToString:", v16);

  if ((v17 & 1) != 0)
  {
LABEL_5:
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000AB1C4;
    v27[3] = &unk_1002BB4A0;
    v28 = v11;
    v29 = self;
    v30 = v8;
    objc_msgSend(v28, "perform:", v27);

    goto LABEL_6;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession data](self, "data"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("data"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 3, 0));
  objc_msgSend(v11, "setError:", v19);

LABEL_6:
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000AB544;
  v23[3] = &unk_1002BC3D0;
  v25 = self;
  v26 = v10;
  v24 = v11;
  v20 = v11;
  v21 = v10;
  objc_msgSend(v20, "notifyOnQueue:block:", &_dispatch_main_q, v23);

}

- (void)saveWithHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, void *);
  void *v17;
  GKCloudGameSession *v18;
  id v19;
  void *v20;

  v4 = a3;
  v5 = objc_alloc((Class)CKModifyRecordsOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v20 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v8 = objc_msgSend(v5, "initWithRecordsToSave:recordIDsToDelete:", v7, 0);

  v10 = objc_msgSend((id)objc_opt_class(self, v9), "cloudKitOperationConfigurationForSocialGamingSessionsContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v8, "setConfiguration:", v11);

  objc_msgSend(v8, "setSavePolicy:", 0);
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000AB7B0;
  v17 = &unk_1002C1038;
  v18 = self;
  v19 = v4;
  v12 = v4;
  objc_msgSend(v8, "setModifyRecordsCompletionBlock:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession databaseForSession:](GKCloudGameSession, "databaseForSession:", self, v14, v15, v16, v17, v18));
  objc_msgSend(v13, "addOperation:", v8);

}

+ (void)createZoneWithName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", v7, CKCurrentUserDefaultName);
  v9 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneName:", v7);

  objc_msgSend(v9, "setZoneID:", v8);
  v10 = objc_alloc((Class)CKModifyRecordZonesOperation);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v9));
  v12 = objc_msgSend(v10, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v11, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  objc_msgSend(v12, "setConfiguration:", v13);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000AB9FC;
  v16[3] = &unk_1002C1060;
  v17 = v6;
  v14 = v6;
  objc_msgSend(v12, "setModifyRecordZonesCompletionBlock:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "privateDatabase"));
  objc_msgSend(v15, "addOperation:", v12);

}

+ (void)getZoneNamesWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000ABB38;
  v13[3] = &unk_1002BBB70;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("getShareURLWithHandler")));
  v14 = v4;
  objc_msgSend(v4, "perform:", v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000ABC64;
  v11[3] = &unk_1002BBB70;
  v5 = v4;
  v12 = v5;
  objc_msgSend(v5, "perform:", v11);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ABD90;
  v8[3] = &unk_1002BB450;
  v9 = v5;
  v10 = v3;
  v6 = v5;
  v7 = v3;
  objc_msgSend(v6, "notifyOnQueue:block:", &_dispatch_main_q, v8);

}

+ (void)subscribeToAllDBwithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("subscribeToAllDBWithHandler")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionCache"));
  if (objc_msgSend(v6, "isValid") && (objc_msgSend(v6, "userHasSubscription") & 1) == 0)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000AC030;
    v18[3] = &unk_1002BBF58;
    v20 = a1;
    v7 = v5;
    v19 = v7;
    objc_msgSend(v7, "perform:", v18);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000AC12C;
    v15[3] = &unk_1002BBF58;
    v17 = a1;
    v16 = v7;
    objc_msgSend(v16, "perform:", v15);

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000AC228;
  v11[3] = &unk_1002BB568;
  v12 = v5;
  v13 = v6;
  v14 = v4;
  v8 = v4;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v11);

}

+ (id)cloudKitOperationConfigurationForContainer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)CKOperationConfiguration);
  objc_msgSend(v4, "setContainer:", v3);

  objc_msgSend(v4, "setDiscretionaryNetworkBehavior:", 0);
  objc_msgSend(v4, "setAutomaticallyRetryNetworkFailures:", 0);
  objc_msgSend(v4, "setQualityOfService:", 17);
  return v4;
}

+ (id)cloudKitOperationConfigurationForSocialGamingSessionsContainer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC394;
  block[3] = &unk_1002C10A8;
  block[4] = a1;
  if (qword_100317EB8 != -1)
    dispatch_once(&qword_100317EB8, block);
  return (id)qword_100317EB0;
}

- (void)getShareURLWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("getShareURLWithHandler")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession url](self, "url"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession url](self, "url"));
    objc_msgSend(v5, "setResult:", v7);

  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000AC534;
    v13[3] = &unk_1002BB590;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v14, "perform:", v13);

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AC92C;
  v10[3] = &unk_1002BB568;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v9, "notifyOnQueue:block:", &_dispatch_main_q, v10);

}

- (void)setupShareWithRecordID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)CKShare);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v10 = objc_msgSend(v8, "initWithRootRecord:shareID:", v9, v7);

  objc_msgSend(v10, "setPublicPermission:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_SHARE_INVITE_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_SHARE_INVITE_TITLE"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CKShareTitleKey);

  v12 = GKGameCenterUIFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathForResource:ofType:", CFSTR("GKNotificationCenter@2x"), CFSTR("png")));

  if (!v14)
  {
    v15 = GKGameCenterUIFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathForResource:ofType:", CFSTR("GKNotificationCenter"), CFSTR("png")));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v14));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CKShareThumbnailImageDataKey);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000ACBA4;
  v19[3] = &unk_1002C10F8;
  v20 = v6;
  v18 = v6;
  -[GKCloudGameSession saveShare:isNewShare:handler:](self, "saveShare:isNewShare:handler:", v10, 1, v19);

}

- (void)saveShare:(id)a3 isNewShare:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[2];

  v8 = a3;
  v9 = a5;
  if (a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
    v26[0] = v10;
    v26[1] = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));

  }
  else
  {
    v25 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  }
  v12 = objc_msgSend(objc_alloc((Class)CKModifyRecordsOperation), "initWithRecordsToSave:recordIDsToDelete:", v11, 0);
  v14 = objc_msgSend((id)objc_opt_class(self, v13), "cloudKitOperationConfigurationForSocialGamingSessionsContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v12, "setConfiguration:", v15);

  objc_msgSend(v12, "setSavePolicy:", 1);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1000ACD64;
  v22 = &unk_1002C1120;
  v23 = v8;
  v24 = v9;
  v16 = v8;
  v17 = v9;
  objc_msgSend(v12, "setModifyRecordsCompletionBlock:", &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession privateDatabase](GKCloudGameSession, "privateDatabase", v19, v20, v21, v22));
  objc_msgSend(v18, "addOperation:", v12);

}

- (void)fetchShareRecordWithRecordID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v13 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession privateDatabase](GKCloudGameSession, "privateDatabase"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000AD01C;
    v10[3] = &unk_1002C1148;
    v12 = v7;
    v11 = v5;
    +[GKCloudGameSession fetchShareRecordsWithRecordIDs:inDatabase:handler:](GKCloudGameSession, "fetchShareRecordsWithRecordIDs:inDatabase:handler:", v8, v9, v10);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

+ (void)fetchShareRecordsWithRecordIDs:(id)a3 inDatabase:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v12, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)CKFetchRecordsOperation), "initWithRecordIDs:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
    objc_msgSend(v10, "setConfiguration:", v11);

    objc_msgSend(v10, "setFetchRecordsCompletionBlock:", v9);
    objc_msgSend(v8, "addOperation:", v10);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

+ (void)fetchShareMetadataForURL:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKCloudGameSession.m", 1971, "+[GKCloudGameSession fetchShareMetadataForURL:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AD2D8;
  v17[3] = &unk_1002C0B60;
  v18 = v6;
  v20 = a1;
  v10 = v9;
  v19 = v10;
  v11 = v6;
  objc_msgSend(v10, "perform:", v17);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000AD4FC;
  v14[3] = &unk_1002BB450;
  v15 = v10;
  v16 = v7;
  v12 = v10;
  v13 = v7;
  objc_msgSend(v12, "notifyOnMainQueueWithBlock:", v14);

}

+ (void)saveInformationForPrimaryUserForSessionWithShareMetadata:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000AD6E8;
  v23[3] = &unk_1002BBF58;
  v25 = a1;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("saveInformationForPrimaryUserForSessionWithShareMetadata")));
  v24 = v8;
  objc_msgSend(v8, "perform:", v23);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000AD7B8;
  v19[3] = &unk_1002C0B60;
  v22 = a1;
  v9 = v6;
  v20 = v9;
  v10 = v8;
  v21 = v10;
  objc_msgSend(v10, "perform:", v19);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000AD890;
  v14[3] = &unk_1002BE650;
  v15 = v10;
  v16 = v9;
  v17 = v7;
  v18 = a1;
  v11 = v7;
  v12 = v9;
  v13 = v10;
  objc_msgSend(v13, "notifyOnQueue:block:", &_dispatch_main_q, v14);

}

+ (void)acceptShareURL:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "acceptShareURL %@", buf, 0xCu);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000ADDD8;
  v12[3] = &unk_1002C11C0;
  v13 = v8;
  v14 = a1;
  v11 = v8;
  objc_msgSend(a1, "fetchShareMetadataForURL:handler:", v6, v12);

}

+ (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void (*v23)(uint64_t, void *);
  void ***v24;
  void **v25;
  void **v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void **v30;
  void (**v31)(_QWORD, _QWORD);
  void **v32;
  void **v33;
  uint8_t buf[4];
  id v35;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "handle CloudKit share metadata - %@", buf, 0xCu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v11, "recordMessageInviteProcessingTimestamp");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "share"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordID"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKInviteURLManager sharedManager](GKInviteURLManager, "sharedManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "acceptingInProgressRecordIDs"));

  v16 = objc_msgSend(v15, "containsObject:", v13);
  if ((_DWORD)v16)
  {
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers(v16);
    v18 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Already processing same share metadata, returning.", buf, 2u);
    }
    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    objc_msgSend(v15, "addObject:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneName"));

    LODWORD(v19) = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.legacygaming.invites"));
    v21 = objc_msgSend(v6, "participantStatus") != (id)2;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("acceptShareWithShareMetadata")));
    if ((_DWORD)v19)
    {
      v33 = _NSConcreteStackBlock;
      v23 = sub_1000AE1C0;
      v24 = &v33;
    }
    else
    {
      v32 = _NSConcreteStackBlock;
      v23 = sub_1000AE29C;
      v24 = &v32;
    }
    v24[1] = (void **)3221225472;
    v24[2] = (void **)v23;
    v24[3] = (void **)&unk_1002C11E8;
    v24[6] = (void **)a1;
    v24[4] = (void **)v6;
    *((_BYTE *)v24 + 56) = v21;
    v25 = v22;
    v24[5] = v25;
    objc_msgSend(v25, "perform:", v24);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000AE378;
    v27[3] = &unk_1002BFCC0;
    v28 = v15;
    v29 = v13;
    v30 = v25;
    v31 = v8;
    v26 = v25;
    objc_msgSend(v26, "notifyOnMainQueueWithBlock:", v27);

  }
}

+ (void)handleSessionShareMetadata:(id)a3 needsAccept:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("acceptShareWithShareMetadata")));
  v11 = v10;
  if (v6)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000AE540;
    v20[3] = &unk_1002C0B60;
    v21 = v10;
    v23 = a1;
    v22 = v8;
    objc_msgSend(v21, "perform:", v20);

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("launch"));
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000AE8BC;
  v15[3] = &unk_1002BE650;
  v16 = v11;
  v17 = v8;
  v18 = v9;
  v19 = a1;
  v12 = v9;
  v13 = v8;
  v14 = v11;
  objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v15);

}

+ (void)handleLegacyShareMetadata:(id)a3 needsAccept:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void (*v11)(uint64_t, void *);
  void ***v12;
  void **v13;
  void **v14;
  void **v15;
  id v16;
  _QWORD v17[4];
  void **v18;
  id v19;
  void **v20;
  void **v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("acceptShareWithShareMetadata")));
  if (v6)
  {
    v21 = _NSConcreteStackBlock;
    v11 = sub_1000AEC2C;
    v12 = &v21;
  }
  else
  {
    v20 = _NSConcreteStackBlock;
    v11 = sub_1000AEE20;
    v12 = &v20;
  }
  v12[1] = (void **)3221225472;
  v12[2] = (void **)v11;
  v12[3] = (void **)&unk_1002C0B60;
  v13 = (void **)v8;
  v12[4] = v13;
  v12[6] = (void **)a1;
  v14 = v10;
  v12[5] = v14;
  objc_msgSend(v14, "perform:", v12);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AF11C;
  v17[3] = &unk_1002BB450;
  v18 = v14;
  v19 = v9;
  v15 = v14;
  v16 = v9;
  objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v17);

}

+ (void)showAcceptAlertWithHandler:(id)a3
{
  void (**v3)(id, BOOL);
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  CFOptionFlags v8;

  v3 = (void (**)(id, BOOL))a3;
  if (v3)
  {
    v8 = 0;
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_INVITE_ALERT_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_INVITE_ALERT_TITLE"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_INVITE_ALERT_BODY](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_INVITE_ALERT_BODY"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_INVITE_ALERT_YES_BUTTON](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_INVITE_ALERT_YES_BUTTON"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_INVITE_ALERT_NO_BUTTON](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_INVITE_ALERT_NO_BUTTON"));
    CFUserNotificationDisplayAlert(120.0, 1uLL, 0, 0, 0, v4, v5, v6, v7, 0, &v8);

    v3[2](v3, v8 == 0);
  }

}

+ (void)acceptShareMetadata:(id)a3 retryCount:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  int v24;
  id v25;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc((Class)CKAcceptSharesOperation);
  v25 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v12 = objc_msgSend(v10, "initWithShareMetadatas:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  objc_msgSend(v12, "setConfiguration:", v13);

  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_1000AF3D0;
  v20 = &unk_1002C1280;
  v22 = v9;
  v23 = a1;
  v21 = v8;
  v24 = a4;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "setAcceptSharesCompletionBlock:", &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", CFSTR("com.apple.socialgaming.sessions"), v17, v18, v19, v20));
  objc_msgSend(v16, "addOperation:", v12);

}

+ (void)launchOrOpenAppStoreForBundleID:(id)a3
{
  id v4;

  v4 = a3;
  if (GKApplicationWithIdentifierIsInstalled(v4))
    GKLaunchApplicationWithIdentifier(v4, 0);
  else
    objc_msgSend(a1, "openStoreForBundleID:", v4);

}

+ (void)openStoreForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("openStoreForBundleID")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v5, 0));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000AF8CC;
    v12[3] = &unk_1002BB4A0;
    v13 = v6;
    v14 = v3;
    v7 = v4;
    v15 = v7;
    v8 = v6;
    objc_msgSend(v7, "perform:", v12);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000AFA20;
    v10[3] = &unk_1002BBBD8;
    v11 = v7;
    v9 = v7;
    objc_msgSend(v9, "notifyOnMainQueueWithBlock:", v10);

  }
}

- (void)deleteShareWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  GKCloudGameSession *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("deleteShareWithHandler")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession record](self, "record"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "share"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordID"));

  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000AFC04;
    v14[3] = &unk_1002BB4A0;
    v15 = v8;
    v16 = v5;
    v17 = self;
    objc_msgSend(v16, "perform:", v14);

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000AFD68;
  v11[3] = &unk_1002BB450;
  v12 = v5;
  v13 = v4;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v9, "notifyOnQueue:block:", &_dispatch_main_q, v11);

}

- (void)removePlayers:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("removePlayers")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession sessionCache](GKCloudGameSession, "sessionCache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userRecordID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));

  if (objc_msgSend(v6, "containsObject:", v11))
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000AFF94;
    v23[3] = &unk_1002BB590;
    v23[4] = self;
    v12 = &v24;
    v24 = v8;
    objc_msgSend(v24, "perform:", v23);
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000B00A8;
    v19[3] = &unk_1002BC3A8;
    v19[4] = self;
    v12 = &v20;
    v13 = v8;
    v20 = v13;
    v21 = v6;
    v22 = v11;
    objc_msgSend(v13, "perform:", v19);

  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B0634;
  v16[3] = &unk_1002BB450;
  v17 = v8;
  v18 = v7;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v14, "notifyOnQueue:block:", &_dispatch_main_q, v16);

}

+ (void)reportPlayerStateChangesToClients:(id)a3 forUpdatedSession:(id)a4 oldSession:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];

  v45 = a3;
  v8 = a4;
  v9 = a5;
  v47 = v8;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerStates"));
  v44 = v9;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerStates"));
  v43 = (void *)v10;
  if (v10)
  {
    v65 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mutablePlistFromPlayerStatesData:error:", v10, &v65));
    v13 = v65;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  v14 = 0;
  if (!v13 && v11)
  {
    v64 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mutablePlistFromPlayerStatesData:error:", v11, &v64));
    v13 = v64;
  }
  v41 = v13;
  v42 = (void *)v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "createGKGameSession"));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v16 = v12;
  v50 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v50)
  {
    v48 = v16;
    v49 = *(_QWORD *)v61;
    v46 = v14;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v49)
          objc_enumerationMutation(v16);
        v18 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v18));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
        v21 = objc_msgSend(v20, "integerValue");

        if (v21 != (id)2)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v18));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 0));
          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v18));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
            v26 = (uint64_t)objc_msgSend(v25, "integerValue");

            v16 = v48;
          }
          else
          {
            v26 = -1;
          }

          if ((id)v26 != v21)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "playersForGKGameSession"));
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v28 = v27;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
            obj = v28;
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v57;
LABEL_19:
              v32 = 0;
              while (1)
              {
                if (*(_QWORD *)v57 != v31)
                  objc_enumerationMutation(obj);
                v33 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v32);
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));
                v35 = objc_msgSend(v34, "isEqualToString:", v18);

                if ((v35 & 1) != 0)
                  break;
                if (v30 == (id)++v32)
                {
                  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
                  if (v30)
                    goto LABEL_19;
                  v28 = obj;
                  v14 = v46;
                  v16 = v48;
                  goto LABEL_35;
                }
              }
              v28 = v33;

              v14 = v46;
              v16 = v48;
              if (!v28)
                goto LABEL_36;
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v36 = v45;
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
              if (v37)
              {
                v38 = v37;
                v39 = *(_QWORD *)v53;
                do
                {
                  for (j = 0; j != v38; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v53 != v39)
                      objc_enumerationMutation(v36);
                    objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j), "session:player:didChangeConnectionState:", v15, v28, v21);
                  }
                  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
                }
                while (v38);
              }

            }
LABEL_35:

LABEL_36:
          }
        }
      }
      v50 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v50);
  }

}

- (NSArray)connectedPlayerIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  char *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playersByIdentifier](self, "playersByIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playerStates](self, "playerStates"));
  v23 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession mutablePlistFromPlayerStatesData:error:](GKCloudGameSession, "mutablePlistFromPlayerStatesData:error:", v5, &v23));
  v7 = v23;

  if (!v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
          v16 = (char *)objc_msgSend(v15, "integerValue");

          if ((unint64_t)(v16 - 1) <= 1)
            objc_msgSend(v4, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    v6 = v18;
  }

  return (NSArray *)v4;
}

- (void)tempEmailFixForPlayerID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession emailsByCKID](self, "emailsByCKID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primaryEmailAddress"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v11);

    -[GKCloudGameSession setEmailsByCKID:](self, "setEmailsByCKID:", v4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession nicknamesByIdentifier](self, "nicknamesByIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession localPlayerAlias](GKCloudGameSession, "localPlayerAlias"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v11);

    -[GKCloudGameSession setNicknamesByIdentifier:](self, "setNicknamesByIdentifier:", v8);
  }

}

- (void)saveConnectionState:(int64_t)a3 forPlayerWithID:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  int64_t v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  GKCloudGameSession *v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  int64_t v32;
  id obj;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v8 = a4;
  v9 = a5;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = sub_1000A197C;
  v44 = sub_1000A198C;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1000A197C;
  v38 = sub_1000A198C;
  v39 = (id)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playerStates](self, "playerStates"));
  v10 = v35[5];
  if (v10)
  {
    v11 = v41;
    obj = v41[5];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession mutablePlistFromPlayerStatesData:error:](GKCloudGameSession, "mutablePlistFromPlayerStatesData:error:", v10, &obj));
    objc_storeStrong(v11 + 5, obj);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("saveConnectionStateForSession")));
  objc_msgSend(v13, "setError:", v41[5]);
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));
  v15 = (void *)v14;
  if (a3 == 2 && !v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession connectedPlayerIDs](self, "connectedPlayerIDs"));
    v17 = objc_msgSend(v16, "count");
    v18 = -[GKCloudGameSession maxConnectedPlayers](self, "maxConnectedPlayers");

    if (v17 != (id)v18)
      goto LABEL_9;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 7, 0));
    objc_msgSend(v13, "setError:", v15);
  }

LABEL_9:
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));

  if (!v19)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000B1080;
    v25[3] = &unk_1002C1310;
    v26 = v12;
    v30 = &v34;
    v31 = &v40;
    v32 = a3;
    v27 = v8;
    v28 = self;
    v29 = v13;
    objc_msgSend(v29, "perform:", v25);

  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000B137C;
  v22[3] = &unk_1002BB450;
  v20 = v9;
  v24 = v20;
  v21 = v13;
  v23 = v21;
  objc_msgSend(v21, "notifyOnMainQueueWithBlock:", v22);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

}

+ (id)packFakeRealTimeBulletinWithZoneData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  uint64_t v75;
  void *v76;
  const __CFString *v77;
  void *v79;
  uint64_t v80;
  BOOL v81;
  uint8_t buf[24];

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "packFakeRealTimeBulletinWithZoneData: %@", buf, 0xCu);
  }
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primaryCredentialForEnvironment:", objc_msgSend(v9, "currentEnvironment")));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_1002DB700, GKPushCommandKey);
  v79 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playerInternal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerID"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("i"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("session-token")));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("session-token")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("s"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("s"));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playerID")));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playerID")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("I"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("I"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("self-push-token")));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("self-push-token")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("P"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("P"));
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("self-nat-type")));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("self-nat-type")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("N"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("N"));
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("self-nat-ip")));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("self-nat-ip")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("A"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("A"));
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("self-blob")));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("self-blob")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("B"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("B"));
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("blob-type")));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("blob-type")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("g"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("g"));
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("self-nat-type")));
  v28 = objc_msgSend(v27, "integerValue");

  *(_QWORD *)buf = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_1002CE2A8, "dataUsingEncoding:", 4));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)objc_msgSend(v29, "length") + 2));
  objc_msgSend(v30, "appendBytes:length:", buf, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchType")));
  v32 = objc_msgSend(v31, "integerValue");

  v81 = v32 == (id)1;
  objc_msgSend(v30, "appendBytes:length:", &v81, 1);
  objc_msgSend(v30, "appendData:", v29);
  objc_msgSend(v30, "appendBytes:length:", &unk_100232928, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inviteVersion")));
  v34 = objc_msgSend(v33, "unsignedIntValue");

  v80 = v34;
  objc_msgSend(v30, "appendBytes:length:", &v80, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "base64EncodedStringWithOptions:", 0));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v35, CFSTR("s"), 0));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("g")));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("g")));
    objc_msgSend(v36, "setObject:forKey:", v38, CFSTR("g"));

  }
  else
  {
    objc_msgSend(v36, "setObject:forKey:", &stru_1002CE2A8, CFSTR("g"));
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("a")));

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("a")));
    objc_msgSend(v36, "setObject:forKey:", v40, CFSTR("a"));

  }
  else
  {
    objc_msgSend(v36, "setObject:forKey:", &stru_1002CE2A8, CFSTR("a"));
  }
  v41 = GKTransportPseudonymKey;
  v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKTransportPseudonymKey));
  v43 = (void *)v42;
  if (v42)
    v44 = (const __CFString *)v42;
  else
    v44 = &stru_1002CE2A8;
  objc_msgSend(v36, "setObject:forKey:", v44, v41);

  v45 = GKInviteSessionIDKey;
  v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKInviteSessionIDKey));
  v47 = (void *)v46;
  if (v46)
    v48 = (const __CFString *)v46;
  else
    v48 = &stru_1002CE2A8;
  objc_msgSend(v36, "setObject:forKey:", v48, v45);

  v49 = GKSuggestedTransportVersionPushShortKey;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKSuggestedTransportVersionPushShortKey));
  if (v50)
  {
    objc_msgSend(v36, "setObject:forKey:", v50, v49);
  }
  else
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
    objc_msgSend(v36, "setObject:forKey:", v51, v49);

  }
  v52 = GKInviteArchivedParticipantInfoKey;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKInviteArchivedParticipantInfoKey));

  if (v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v52));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchiveObjectWithData:](NSKeyedUnarchiver, "unarchiveObjectWithData:", v54));

    v56 = GKInviteGameParticipantsKey;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", GKInviteGameParticipantsKey));

    if (v57)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v56));
      objc_msgSend(v36, "setObject:forKey:", v58, v56);

    }
    v59 = GKInviteLobbyParticipantsKey;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", GKInviteLobbyParticipantsKey));

    if (v60)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v59));
      objc_msgSend(v36, "setObject:forKey:", v61, v59);

    }
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("x"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle-id")));
  v64 = (void *)v63;
  if (v63)
    v65 = (const __CFString *)v63;
  else
    v65 = &stru_1002CE2A8;
  objc_msgSend(v62, "setObject:forKey:", v65, CFSTR("i"));

  v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle-version")));
  v67 = (void *)v66;
  if (v66)
    v68 = (const __CFString *)v66;
  else
    v68 = &stru_1002CE2A8;
  objc_msgSend(v62, "setObject:forKey:", v68, CFSTR("v"));

  v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("short-bundle-version")));
  v70 = (void *)v69;
  if (v69)
    v71 = (const __CFString *)v69;
  else
    v71 = &stru_1002CE2A8;
  objc_msgSend(v62, "setObject:forKey:", v71, CFSTR("V"));

  v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adam-id")));
  v73 = (void *)v72;
  if (v72)
    v74 = (const __CFString *)v72;
  else
    v74 = &stru_1002CE2A8;
  objc_msgSend(v62, "setObject:forKey:", v74, CFSTR("a"));

  v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p")));
  v76 = (void *)v75;
  if (v75)
    v77 = (const __CFString *)v75;
  else
    v77 = &stru_1002CE2A8;
  objc_msgSend(v62, "setObject:forKey:", v77, CFSTR("p"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v62, CFSTR("d"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, GKInviteIsFromMessageKey);

  return v7;
}

+ (id)packFakeTurnBasedBulletinWithZoneData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryCredentialForEnvironment:", objc_msgSend(v6, "currentEnvironment")));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1002DB718, GKPushCommandKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerInternal"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerID"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("i"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("m"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("t"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("session-id")));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("session-id")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("s"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("s"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("playerID")));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("playerID")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("I"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_1002CE2A8, CFSTR("I"));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundle-id")));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundle-id")));
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("i"));

  }
  else
  {
    objc_msgSend(v15, "setObject:forKey:", &stru_1002CE2A8, CFSTR("i"));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundle-version")));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundle-version")));
    objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("v"));

  }
  else
  {
    objc_msgSend(v15, "setObject:forKey:", &stru_1002CE2A8, CFSTR("v"));
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("short-bundle-version")));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("short-bundle-version")));
    objc_msgSend(v15, "setObject:forKey:", v21, CFSTR("V"));

  }
  else
  {
    objc_msgSend(v15, "setObject:forKey:", &stru_1002CE2A8, CFSTR("V"));
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adam-id")));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adam-id")));
    objc_msgSend(v15, "setObject:forKey:", v23, CFSTR("a"));

  }
  else
  {
    objc_msgSend(v15, "setObject:forKey:", &stru_1002CE2A8, CFSTR("a"));
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("d"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, GKInviteIsFromMessageKey);

  return v4;
}

+ (void)generateAndStoreInviteBulletinForRecord:(id)a3 database:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKInviteURLManager sharedManager](GKInviteURLManager, "sharedManager"));
  v8 = objc_msgSend(v7, "isRecordEqualToMostRecentInviteShare:", v5);

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("connectionData")));

    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKCloudGameSession.m", 2767, "+[GKCloudGameSession generateAndStoreInviteBulletinForRecord:database:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v12));

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000B23A8;
      v17[3] = &unk_1002BB590;
      v18 = v5;
      v19 = v6;
      objc_msgSend(v13, "perform:", v17);
      objc_msgSend(v13, "notifyOnMainQueueWithBlock:", &stru_1002C1358);

    }
    else
    {
      if (!os_log_GKGeneral)
        v16 = (id)GKOSLoggers(v11);
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR))
        sub_1000B5900();
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v9);
    v15 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR))
      sub_1000B5960(v15, v5);
  }

}

+ (id)msgServiceQueue
{
  if (qword_100317EC8 != -1)
    dispatch_once(&qword_100317EC8, &stru_1002C1378);
  return (id)qword_100317EC0;
}

+ (void)getAssociatedAccountsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(a1, v5), "msgServiceQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B29C0;
  block[3] = &unk_1002BB540;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, block);

}

+ (void)saveInviteRecord:(id)a3 database:(id)a4 retryCount:(int)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  int v36;
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_alloc((Class)CKModifyRecordsOperation);
  v37 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
  v15 = objc_msgSend(v13, "initWithRecordsToSave:recordIDsToDelete:", v14, 0);

  v17 = objc_msgSend((id)objc_opt_class(a1, v16), "cloudKitOperationConfigurationForSocialGamingSessionsContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v15, "setConfiguration:", v18);

  objc_msgSend(v15, "setSavePolicy:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKCloudGameSession.m", 2866, "+[GKCloudGameSession saveInviteRecord:database:retryCount:completionHandler:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v19));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000B2D44;
  v29[3] = &unk_1002C1440;
  v21 = v15;
  v30 = v21;
  v22 = v20;
  v31 = v22;
  v23 = v10;
  v32 = v23;
  v24 = v11;
  v33 = v24;
  v35 = a1;
  v36 = a5;
  v25 = v12;
  v34 = v25;
  objc_msgSend(v22, "perform:", v29);
  if (v25)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000B33E8;
    v26[3] = &unk_1002BB450;
    v28 = v25;
    v27 = v22;
    objc_msgSend(v27, "notifyOnMainQueueWithBlock:", v26);

  }
}

+ (BOOL)shouldRetryForError:(id)a3 andRetryCount:(int)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  BOOL v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _OWORD v20[4];
  _BYTE v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v7 = objc_msgSend(v6, "isEqualToString:", CKErrorDomain);

  v8 = 0;
  if (a4 >= 1 && v7)
  {
    v9 = objc_msgSend(v5, "code");
    if (v9 == (id)2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

      memset(v20, 0, sizeof(v20));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allValues", 0));
      if (objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v20, v21, 16)
        && ((v15 = (void *)**((_QWORD **)&v20[0] + 1), v16 = objc_msgSend(**((id **)&v20[0] + 1), "code"), v16 == (id)23)
         || (v16 = objc_msgSend(v15, "code"), v16 == (id)7)))
      {
        if (!os_log_GKGeneral)
          v17 = (id)GKOSLoggers(v16);
        v18 = os_log_GKMatch;
        v8 = 1;
        if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v15;
          v24 = 1024;
          v25 = a4;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "should retry for partialError: %@. retryCount: %d", buf, 0x12u);
        }
      }
      else
      {
        v8 = 0;
      }

    }
    else if (v9 == (id)23 || v9 == (id)7)
    {
      if (!os_log_GKGeneral)
        v10 = (id)GKOSLoggers(v9);
      v11 = os_log_GKMatch;
      v8 = 1;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v5;
        v24 = 1024;
        v25 = a4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "should retry for error: %@. retryCount: %d", buf, 0x12u);
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (id)formattedContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (IMStringIsEmail())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v4));
  }
  else
  {
    if (!IMStringIsPhoneNumber(v3))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      goto LABEL_7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](NSCharacterSet, "punctuationCharacterSet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByRemovingCharactersFromSet:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet symbolCharacterSet](NSCharacterSet, "symbolCharacterSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByRemovingCharactersFromSet:", v7));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByRemovingWhitespace"));

  }
LABEL_7:

  return v5;
}

+ (id)lastSevenDigits:(id)a3
{
  id v3;
  char *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length") == (id)7)
    v4 = 0;
  else
    v4 = (char *)objc_msgSend(v3, "length") - 7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v4));

  return v5;
}

+ (void)searchAndSaveIdentityForRecord:(id)a3 database:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  id v34;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GK-InviteMessage: begin searchAndSaveIdentityForRecord", buf, 2u);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "primaryCredentialForEnvironment:", objc_msgSend(v15, "currentEnvironment")));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "playerInternal"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "playerID"));

  if (v18)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000B3A24;
    v29[3] = &unk_1002C1468;
    v30 = v8;
    v34 = a1;
    v31 = v18;
    v32 = v9;
    v33 = v11;
    +[GKCloudGameSession getAssociatedAccountsWithCompletionHandler:](GKCloudGameSession, "getAssociatedAccountsWithCompletionHandler:", v29);

  }
  else if (v11)
  {
    if (!os_log_GKGeneral)
      v20 = (id)GKOSLoggers(v19);
    v21 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR))
      sub_1000B5B84(v21, v22, v23, v24, v25, v26, v27, v28);
    ((void (**)(_QWORD, id, _QWORD))v11)[2](v11, v8, 0);
  }

}

+ (void)deleteInviteRecordWithRecordID:(id)a3 fromDatabase:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  if (v5)
  {
    v6 = a4;
    v7 = objc_alloc((Class)CKModifyRecordsOperation);
    v12 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v9 = objc_msgSend(v7, "initWithRecordsToSave:recordIDsToDelete:", 0, v8);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B4434;
    v10[3] = &unk_1002C1490;
    v11 = v5;
    objc_msgSend(v9, "setModifyRecordsCompletionBlock:", v10);
    objc_msgSend(v6, "addOperation:", v9);

  }
}

+ (void)updateBadgeCountsForContainerName:(id)a3
{
  objc_msgSend(a1, "updateBadgeCountsForContainerName:useCacheDirectly:", a3, 0);
}

+ (void)updateBadgeCountsForContainerName:(id)a3 useCacheDirectly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKCloudGameSession updateBadgeCountsForContainerName", buf, 2u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B4610;
  v11[3] = &unk_1002BBEE0;
  v12 = v7;
  v10 = v7;
  objc_msgSend(a1, "badgeCountForContainerName:useCacheDirectly:handler:", v10, v4, v11);

}

+ (void)badgeCountForContainerName:(id)a3 useCacheDirectly:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v8 = a3;
  v9 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B48C0;
  v17[3] = &unk_1002C11E8;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("badgeCountForContainerName")));
  v21 = a4;
  v19 = v8;
  v20 = a1;
  v18 = v10;
  v11 = v8;
  objc_msgSend(v10, "perform:", v17);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B4BB0;
  v14[3] = &unk_1002BB758;
  v15 = v10;
  v16 = v9;
  v12 = v9;
  v13 = v10;
  objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v14);

}

- (void)setBadged:(BOOL)a3 forPlayerIDs:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  GKCloudGameSession *v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  BOOL v28;
  id obj;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v8 = a4;
  v9 = a5;
  v36 = 0;
  v37 = (id *)&v36;
  v38 = 0x3032000000;
  v39 = sub_1000A197C;
  v40 = sub_1000A198C;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1000A197C;
  v34 = sub_1000A198C;
  v35 = (id)objc_claimAutoreleasedReturnValue(-[GKCloudGameSession playerStates](self, "playerStates"));
  v10 = v31[5];
  if (v10)
  {
    v11 = v37;
    obj = v37[5];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession mutablePlistFromPlayerStatesData:error:](GKCloudGameSession, "mutablePlistFromPlayerStatesData:error:", v10, &obj));
    objc_storeStrong(v11 + 5, obj);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("saveBadgeStateForSession")));
  objc_msgSend(v13, "setError:", v37[5]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));

  if (!v14)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000B5028;
    v21[3] = &unk_1002C1508;
    v22 = v8;
    v28 = a3;
    v26 = &v30;
    v27 = &v36;
    v23 = v12;
    v24 = self;
    v25 = v13;
    objc_msgSend(v25, "perform:", v21);

  }
  v15 = &_dispatch_main_q;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000B5434;
  v18[3] = &unk_1002BB450;
  v16 = v9;
  v20 = v16;
  v17 = v13;
  v19 = v17;
  objc_msgSend(v17, "notifyOnQueue:block:", &_dispatch_main_q, v18);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (NSDictionary)playersByIdentifier
{
  return self->_playersByIdentifier;
}

- (void)setPlayersByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_playersByIdentifier, a3);
}

- (GKCloudPlayer)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong((id *)&self->_owner, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_playersByIdentifier, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
