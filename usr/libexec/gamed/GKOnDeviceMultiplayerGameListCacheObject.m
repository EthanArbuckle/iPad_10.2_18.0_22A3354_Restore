@implementation GKOnDeviceMultiplayerGameListCacheObject

- (id)bundleIDs
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  int v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKOnDeviceMultiplayerGameListCacheObject entries](self, "entries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_gkMapWithBlock:", &stru_1002C2970));

  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v5);
  v7 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found cachedBundleIDs: %@", (uint8_t *)&v9, 0xCu);
  }
  return v4;
}

- (id)multiplayerGames
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKOnDeviceMultiplayerGameListCacheObject entries](self, "entries"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "array"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000EEFE8;
  v8[3] = &unk_1002C2998;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return v6;
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
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKOnDeviceMultiplayerGameListCacheObject updateWithServerRepresentation:expirationDate:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKOnDeviceMultiplayerGameListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v13, "UTF8String"), 3545));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v16.receiver = self;
  v16.super_class = (Class)GKOnDeviceMultiplayerGameListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v16, "updateWithServerRepresentation:expirationDate:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("game-features")));
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v15, &stru_1002C29B8, 1);

}

+ (id)entityName
{
  return CFSTR("GKOnDeviceMultiplayerGameList");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKOnDeviceMultiplayerGameListEntryCacheObject, a2);
}

@end
