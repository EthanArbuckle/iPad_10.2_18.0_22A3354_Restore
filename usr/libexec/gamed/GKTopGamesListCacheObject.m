@implementation GKTopGamesListCacheObject

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
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTopGamesListCacheObject updateWithServerRepresentation:expirationDate:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKTopGamesListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v13, "UTF8String"), 3478));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v16.receiver = self;
  v16.super_class = (Class)GKTopGamesListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v16, "updateWithServerRepresentation:expirationDate:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("results")));
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v15, &stru_1002C2930, 1);

}

+ (id)entityName
{
  return CFSTR("TopGamesList");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKTopGamesListEntryCacheObject, a2);
}

@end
