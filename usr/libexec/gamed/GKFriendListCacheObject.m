@implementation GKFriendListCacheObject

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKFriendListEntryCacheObject, a2);
}

+ (id)entityName
{
  return CFSTR("FriendList");
}

- (id)playerIDs
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendListCacheObject playerIDs]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKFriendListCacheObject playerIDs]", objc_msgSend(v8, "UTF8String"), 2416));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject entries](self, "entries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_gkValuesForKeyPath:", CFSTR("playerID")));

  return v11;
}

+ (id)cacheFriendList:(id)a3 withTimeToLive:(double)a4 forProfile:(id)a5 managedObjectContext:(id)a6 commonFriends:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  dispatch_queue_t current_queue;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  GKFriendListCacheObject *v22;
  id v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  _QWORD v32[4];
  id v33;

  v7 = a7;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  current_queue = dispatch_get_current_queue();
  v15 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v15, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKFriendListCacheObject cacheFriendList:withTimeToLive:forProfile:managedObjectContext:commonFriends:]", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v17, "+[GKFriendListCacheObject cacheFriendList:withTimeToLive:forProfile:managedObjectContext:commonFriends:]", objc_msgSend(v19, "UTF8String"), 2426));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v20);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
  v22 = -[GKCacheObject initWithManagedObjectContext:]([GKFriendListCacheObject alloc], "initWithManagedObjectContext:", v13);
  objc_msgSend(v12, "setFriendList:", v22);
  -[GKFriendListCacheObject setExpirationDate:](v22, "setExpirationDate:", v21);
  -[GKFriendListCacheObject setCommon:](v22, "setCommon:", v7);
  -[GKFriendListCacheObject setPlayer:](v22, "setPlayer:", v12);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000E8F40;
  v32[3] = &unk_1002C27F8;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v11, "count")));
  v33 = v23;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](v22, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v11, v32, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject player](v22, "player"));
  v25 = objc_msgSend(v24, "isLocalPlayer");

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](v22, "playerIDs"));
    +[GKPlayerProfileCacheObject setFamiliarPlayerIDs:familiarity:](GKPlayerProfileCacheObject, "setFamiliarPlayerIDs:familiarity:", v26, 2);

  }
  v27 = objc_msgSend(v23, "copy");
  -[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:](v22, "populateFriendNamesFromServerRepresentationDictionary:", v27);

  v29 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v30 = (id)GKOSLoggers(v28);
    v29 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    sub_1000F6B88();

  return v22;
}

- (void)populateFriendNamesFromServerRepresentationDictionary:(id)a3
{
  dispatch_queue_t current_queue;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a3;
  current_queue = dispatch_get_current_queue();
  v5 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:]", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v7, "-[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:]", objc_msgSend(v9, "UTF8String"), 2481));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }

  if (objc_msgSend(v14, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject managedObjectContext](self, "managedObjectContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfilesWithPlayerIDs:inManagedObjectContext:", v11, v12));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000E92F4;
    v15[3] = &unk_1002C2820;
    v16 = v14;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

  }
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendListCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKFriendListCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 2555));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject entries](self, "entries"));
  v11 = objc_msgSend(v10, "count");

  v36 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v11);
  v12 = objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject managedObjectContext](self, "managedObjectContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfilesWithPlayerIDs:inManagedObjectContext:", v13, v12));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkDistinctValuesForKeyPath:", CFSTR("lastPlayedGame")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allObjects"));
  v34 = (void *)v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject gamesForBundleIDs:context:](GKGameCacheObject, "gamesForBundleIDs:context:", v15, v12));

  v31 = v16;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_gkMapDictionaryWithKeyPath:", CFSTR("bundleID")));
  v33 = v14;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID")));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject entries](self, "entries"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v38;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v22), "playerID"));
        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v23));
          if (objc_msgSend(v24, "familiarity") == 2)
          {
            v25 = objc_msgSend(objc_alloc((Class)GKFriendPlayerInternal), "initWithCacheObject:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastPlayedGame"));

            if (v26)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastPlayedGame"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v27));

              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "internalRepresentation"));
              objc_msgSend(v25, "setLastPlayedGame:", v29);

            }
            objc_msgSend(v36, "addObject:", v25);

          }
        }

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v20);
  }

  return v36;
}

- (NSArray)filterableFriends
{
  GKFriendListCacheObject *v2;
  _QWORD *v3;
  Class isa;
  uint64_t v5;

  v2 = self;
  v3 = sub_1001612EC();

  type metadata accessor for GKFilterableFriend();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5);
  return (NSArray *)isa;
}

@end
