@implementation GKInternalRepresentation

+ (id)internalRepresentationForCacheObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithCacheObject:", v4);

  return v5;
}

- (id)initWithCacheObject:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  GKInternalRepresentation *v12;
  GKInternalRepresentation *v13;
  objc_super v15;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKInternalRepresentation(Cache) initWithCacheObject:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKInternalRepresentation(Cache) initWithCacheObject:]", objc_msgSend(v10, "UTF8String"), 35));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v15.receiver = self;
  v15.super_class = (Class)GKInternalRepresentation;
  v12 = -[GKInternalRepresentation init](&v15, "init");
  v13 = v12;
  if (v12)
    -[GKInternalRepresentation updateWithCacheObject:](v12, "updateWithCacheObject:", v4);

  return v13;
}

- (void)updateWithCacheObject:(id)a3
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v25 = a3;
  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKInternalRepresentation(Cache) updateWithCacheObject:]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKInternalRepresentation(Cache) updateWithCacheObject:]", objc_msgSend(v8, "UTF8String"), 46));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v11 = objc_msgSend((id)objc_opt_class(self, v10), "secureCodedPropertyKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v18));
        if ((objc_msgSend(v19, "isMemberOfClass:", objc_opt_class(NSSet, v20)) & 1) != 0)
          v22 = 0;
        else
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKey:", v18));
        v23 = objc_opt_class(NSNull, v21);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
        {
          if (!v22)
            goto LABEL_15;
          -[GKInternalRepresentation setValue:forKey:](self, "setValue:forKey:", v22, v18);
        }

LABEL_15:
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

}

@end
