@implementation GKCachingUtils

+ (id)compatiblePlatforms:(id)a3 platformLookup:(id)a4 moc:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  GamePlatform *v17;
  void *v18;
  GamePlatform *v19;
  void *v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v7 = a4;
  v23 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("platforms")));
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc_init((Class)NSMutableSet);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "length", v22))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v15));

            if (!v16)
            {
              v17 = [GamePlatform alloc];
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[GamePlatform entity](GamePlatform, "entity"));
              v19 = -[GamePlatform initWithEntity:insertIntoManagedObjectContext:](v17, "initWithEntity:insertIntoManagedObjectContext:", v18, v23);

              -[GamePlatform setName:](v19, "setName:", v15);
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v15);

            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v15));
            objc_msgSend(v9, "addObject:", v20);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    v8 = v22;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)constructCompatiblePlatforms:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils existingGamePlatforms:](GKCachingUtils, "existingGamePlatforms:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils compatiblePlatforms:platformLookup:moc:](GKCachingUtils, "compatiblePlatforms:platformLookup:moc:", v6, v7, v5));

  return v8;
}

+ (id)constructSupportedTransports:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils existingSupportedTransports:](GKCachingUtils, "existingSupportedTransports:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils supportedTransports:transportLookup:moc:](GKCachingUtils, "supportedTransports:transportLookup:moc:", v6, v7, v5));

  return v8;
}

+ (void)ensureGameInGamesPlayed:(id)a3 playerID:(id)a4 bundleID:(id)a5 gameDescriptor:(id)a6 updateWidget:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  GameSummary *v29;
  void *v30;
  _BOOL4 v31;
  GameSummary *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  _BOOL4 v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;

  v7 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!os_log_GKGeneral)
    v16 = (id)GKOSLoggers(v14);
  v17 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v50 = v12;
    v51 = 2112;
    v52 = v13;
    v53 = 2112;
    v54 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Attempting to add game to games played: %@, %@, %@", buf, 0x20u);
  }
  if (v12 && v13 && v15)
  {
    v42 = v7;
    v43 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils ensureGamesPlayedList:playerID:](GKCachingUtils, "ensureGamesPlayedList:playerID:", v11, v12));
    v19 = objc_opt_new(NSMutableDictionary);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v41 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "entries"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bundleID"));

          if (v26)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bundleID"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v25, v27);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v22);
    }

    v28 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v13));
    if (v28)
    {
      v29 = (GameSummary *)v28;
      v30 = v41;
      objc_msgSend(v41, "removeEntriesObject:", v28);
      v11 = v43;
      v31 = v42;
    }
    else
    {
      v32 = [GameSummary alloc];
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[GameSummary entity](GameSummary, "entity"));
      v11 = v43;
      v29 = -[GameSummary initWithEntity:insertIntoManagedObjectContext:](v32, "initWithEntity:insertIntoManagedObjectContext:", v33, v43);

      v31 = v42;
      v30 = v41;
    }
    objc_msgSend(v30, "insertObject:inEntriesAtIndex:", v29, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[GKCachingUtils constructCompatiblePlatforms:moc:](GKCachingUtils, "constructCompatiblePlatforms:moc:", v15, v11));
    -[GameSummary setCompatiblePlatforms:](v29, "setCompatiblePlatforms:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("adam-id")));
    -[GameSummary setAdamID:](v29, "setAdamID:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("bundle-id")));
    -[GameSummary setBundleID:](v29, "setBundleID:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("is-arcade-game")));
    -[GameSummary setIsArcade:](v29, "setIsArcade:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[GameSummary setPlayedAt:](v29, "setPlayedAt:", v38);

    if (v31)
    {
      v39 = objc_msgSend(objc_alloc((Class)CHSTimelineController), "initForAvocadoIdentifier:inBundleIdentifier:", CFSTR("ContinuePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"));
      v40 = objc_msgSend(v39, "reloadTimelineWithReason:", &stru_1002CE2A8);

    }
    +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", &stru_1002C4C30);

  }
}

+ (id)ensureGamesPlayedList:(id)a3 playerID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  GamesPlayedSummaryList *v9;
  GamesPlayedSummaryList *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GamesPlayedSummaryList _gkFetchRequest](GamesPlayedSummaryList, "_gkFetchRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("playerID == %@"), v6));
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = (GamesPlayedSummaryList *)objc_claimAutoreleasedReturnValue(+[NSManagedObject _gkRetrieveCleanEntry:request:](NSManagedObject, "_gkRetrieveCleanEntry:request:", v5, v7));
  if (!v9)
  {
    v10 = [GamesPlayedSummaryList alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GamesPlayedSummaryList entity](GamesPlayedSummaryList, "entity"));
    v9 = -[GamesPlayedSummaryList initWithEntity:insertIntoManagedObjectContext:](v10, "initWithEntity:insertIntoManagedObjectContext:", v11, v5);

    -[GamesPlayedSummaryList setPlayerID:](v9, "setPlayerID:", v6);
  }

  return v9;
}

+ (id)existingGamePlatforms:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GamePlatform _gkFetchRequest](GamePlatform, "_gkFetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v5, 0));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
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
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)existingSupportedTransports:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKSupportedTransportVersionCacheObject _gkFetchRequest](GKSupportedTransportVersionCacheObject, "_gkFetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v5, 0));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "version"));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)supportedTransports:(id)a3 transportLookup:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  GKSupportedTransportVersionCacheObject *v16;
  void *v17;
  GKSupportedTransportVersionCacheObject *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("supported-transports")));
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v9, "count")));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v9;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v16 = [GKSupportedTransportVersionCacheObject alloc];
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKSupportedTransportVersionCacheObject entity](GKSupportedTransportVersionCacheObject, "entity"));
          v18 = -[GKSupportedTransportVersionCacheObject initWithEntity:insertIntoManagedObjectContext:](v16, "initWithEntity:insertIntoManagedObjectContext:", v17, v8);

          -[GKSupportedTransportVersionCacheObject setVersion:](v18, "setVersion:", v15);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v15));
          objc_msgSend(v10, "addObject:", v19);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
