@implementation GKFriendRequestListCacheObject

+ (id)entityName
{
  return CFSTR("FriendRequestList");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKFriendRequestListEntryCacheObject, a2);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t current_queue;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendRequestListCacheObject updateWithServerRepresentation:expirationDate:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKFriendRequestListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v13, "UTF8String"), 2916));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject managedObjectContext](self, "managedObjectContext"));
  v32.receiver = self;
  v32.super_class = (Class)GKFriendRequestListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v32, "updateWithServerRepresentation:expirationDate:", v6, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("results")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject entries](self, "entries"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID")));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000EBC40;
  v30[3] = &unk_1002C27F8;
  v19 = v18;
  v31 = v19;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v16, v30, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject player](self, "player"));
  v22 = objc_msgSend(v21, "isLocalPlayer");

  if (v22)
    +[GKPlayerProfileCacheObject setFamiliarPlayerIDs:familiarity:](GKPlayerProfileCacheObject, "setFamiliarPlayerIDs:familiarity:", v20, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID")));
  -[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:](self, "populateFriendNamesFromServerRepresentationDictionary:", v23);
  v24 = objc_alloc((Class)NSFetchRequest);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[GKFriendRequestListEntryCacheObject entityName](GKFriendRequestListEntryCacheObject, "entityName"));
  v26 = objc_msgSend(v24, "initWithEntityName:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("wasViewed == NO")));
  objc_msgSend(v26, "setPredicate:", v27);

  v28 = objc_msgSend(v15, "countForFetchRequest:error:", v26, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[GKBadgeController sharedController](GKBadgeController, "sharedController"));
  objc_msgSend(v29, "setBadgeCount:forBundleID:badgeType:", v28, GKGameCenterIdentifier, 1);

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
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendRequestListCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKFriendRequestListCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 2955));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject entries](self, "entries"));
  v11 = objc_msgSend(v10, "count");

  v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v11);
  v12 = objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject managedObjectContext](self, "managedObjectContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListCacheObject playerIDs](self, "playerIDs"));
  v29 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfilesWithPlayerIDs:inManagedObjectContext:", v13, v12));

  v28 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID")));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListCacheObject entries](self, "entries"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "playerID"));
        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v22));
          if (objc_msgSend(v23, "familiarity") == 3)
          {
            v24 = objc_msgSend(objc_alloc((Class)GKFriendRequestInternal), "initWithCacheObject:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "date"));
            objc_msgSend(v24, "setDate:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "message"));
            objc_msgSend(v24, "setMessage:", v26);

            objc_msgSend(v30, "addObject:", v24);
          }

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v18);
  }

  return v30;
}

@end
