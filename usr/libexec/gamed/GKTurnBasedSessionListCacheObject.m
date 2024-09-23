@implementation GKTurnBasedSessionListCacheObject

+ (id)entityName
{
  return CFSTR("TurnBasedSessionList");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKTurnBasedSessionEntryCacheObject, a2);
}

- (id)sessionIDs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject entries](self, "entries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_gkValuesForKeyPath:", CFSTR("sessionID")));

  return v3;
}

- (id)sessions
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
  void *v12;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionListCacheObject sessions]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKTurnBasedSessionListCacheObject sessions]", objc_msgSend(v8, "UTF8String"), 4223));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject sessionIDs](self, "sessionIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject managedObjectContext](self, "managedObjectContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:](GKTurnBasedSessionCacheObject, "sessionsWithSessionIDs:inContext:", v10, v11));

  return v12;
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
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionListCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKTurnBasedSessionListCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 4230));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject sessions](self, "sessions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "internalRepresentation"));
        objc_msgSend(v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v11;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  objc_super v41;
  _BYTE v42[128];

  v6 = a3;
  v33 = a4;
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedSessionListCacheObject updateWithServerRepresentation:expirationDate:]", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v10, "-[GKTurnBasedSessionListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v12, "UTF8String"), 4243));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v41.receiver = self;
  v41.super_class = (Class)GKTurnBasedSessionListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v41, "updateWithServerRepresentation:expirationDate:", v6, v33);
  v14 = objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject managedObjectContext](self, "managedObjectContext"));
  v32 = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("sessions")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v15, "count")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedSessionListCacheObject entries](self, "entries"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_gkMapDictionaryWithKeyPath:", CFSTR("sessionID")));

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000F2F90;
  v38[3] = &unk_1002C2768;
  v19 = v16;
  v39 = v19;
  v20 = v18;
  v40 = v20;
  v30 = v15;
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v15, v38, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allKeys"));
  v31 = (void *)v14;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:](GKTurnBasedSessionCacheObject, "sessionsWithSessionIDs:inContext:", v21, v14));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sessionID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v28));
        objc_msgSend(v27, "updateWithServerRepresentation:", v29);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v24);
  }

}

+ (void)expireListsForSessionID:(id)a3 context:(id)a4
{
  id v5;
  dispatch_queue_t current_queue;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  current_queue = dispatch_get_current_queue();
  v7 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v7, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKTurnBasedSessionListCacheObject expireListsForSessionID:context:]", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v9, "+[GKTurnBasedSessionListCacheObject expireListsForSessionID:context:]", objc_msgSend(v11, "UTF8String"), 4280));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("sessionID = %@"), v15));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheObject objectsMatchingPredicate:context:](GKTurnBasedSessionEntryCacheObject, "objectsMatchingPredicate:context:", v13, v5));

  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &stru_1002C2A48);
}

@end
