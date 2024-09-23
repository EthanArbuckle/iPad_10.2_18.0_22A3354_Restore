@implementation GKExpiringCacheObject

+ (id)fetchSortDescriptors
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("timeStamp"), 0));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKExpiringCacheObject expirationDate](self, "expirationDate"));
  v3 = v2 != 0;

  return v3;
}

- (void)invalidate
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKExpiringCacheObject invalidate]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKExpiringCacheObject invalidate]", objc_msgSend(v8, "UTF8String"), 613));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  -[GKExpiringCacheObject setExpirationDate:](self, "setExpirationDate:", 0);
}

- (void)expire
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKExpiringCacheObject expire]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKExpiringCacheObject expire]", objc_msgSend(v8, "UTF8String"), 619));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  if (-[GKExpiringCacheObject isValid](self, "isValid"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -1.0));
    -[GKExpiringCacheObject setExpirationDate:](self, "setExpirationDate:", v10);

    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v11);
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
      sub_1000F6794();
  }
}

- (BOOL)expired
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  BOOL v12;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKExpiringCacheObject expired]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKExpiringCacheObject expired]", objc_msgSend(v8, "UTF8String"), 628));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  if (!-[GKExpiringCacheObject isValid](self, "isValid"))
    return 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKExpiringCacheObject expirationDate](self, "expirationDate"));
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = v11 <= 0.0;

  return v12;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](self, "updateWithServerRepresentation:expirationDate:", v4, v5);

}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F67F4();
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "-[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v15, "UTF8String"), 646));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v18.receiver = self;
  v18.super_class = (Class)GKExpiringCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v18, "updateWithServerRepresentation:", v6);
  if (!v8)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[GKExpiringCacheObject expirationDate](self, "expirationDate"));
    if (!v8)
      v8 = v17;
  }
  -[GKExpiringCacheObject setTimeStamp:](self, "setTimeStamp:", v17);
  -[GKExpiringCacheObject setExpirationDate:](self, "setExpirationDate:", v8);

}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKExpiringCacheObject;
  -[GKExpiringCacheObject awakeFromInsert](&v4, "awakeFromInsert");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKExpiringCacheObject setTimeStamp:](self, "setTimeStamp:", v3);

}

+ (void)expireObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6820();
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "+[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]", objc_msgSend(v15, "UTF8String"), 666));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectsMatchingPredicate:context:", v6, v8));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v21), "expire");
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v19);
  }

}

+ (void)invalidateObjectsMatchingPredicate:(id)a3 context:(id)a4
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
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKExpiringCacheObject invalidateObjectsMatchingPredicate:context:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "+[GKExpiringCacheObject invalidateObjectsMatchingPredicate:context:]", objc_msgSend(v13, "UTF8String"), 675));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectsMatchingPredicate:context:", v6, v7));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "setExpirationDate:", 0);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

}

@end
