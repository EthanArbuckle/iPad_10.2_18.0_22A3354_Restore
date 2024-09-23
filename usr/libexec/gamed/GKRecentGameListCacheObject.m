@implementation GKRecentGameListCacheObject

+ (id)entityName
{
  return CFSTR("RecentGameList");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKRecentGameListEntryCacheObject, a2);
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
  objc_super v16;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKRecentGameListCacheObject updateWithServerRepresentation:expirationDate:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKRecentGameListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v13, "UTF8String"), 3413));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v16.receiver = self;
  v16.super_class = (Class)GKRecentGameListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v16, "updateWithServerRepresentation:expirationDate:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("results")));
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v15, &stru_1002C28C8, 1);

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKRecentGameListCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKRecentGameListCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 3424));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject managedObjectContext](self, "managedObjectContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject entries](self, "entries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_gkValuesForKeyPath:", CFSTR("bundleIDs")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameCacheObject gamesForBundleIDs:context:](GKGameCacheObject, "gamesForBundleIDs:context:", v12, v10));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject otherPlayer](self, "otherPlayer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameRecordCacheObject recordsForGames:playerProfile:](GKGameRecordCacheObject, "recordsForGames:playerProfile:", v13, v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_gkMapDictionaryWithKeyPath:", CFSTR("game.bundleID")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject otherPlayer](self, "otherPlayer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "internalRepresentation"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKRecentGameListCacheObject entries](self, "entries"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "array"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000EE818;
  v25[3] = &unk_1002C28F0;
  v26 = v16;
  v27 = v18;
  v21 = v18;
  v22 = v16;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_gkMapWithBlock:", v25));

  return v23;
}

@end
