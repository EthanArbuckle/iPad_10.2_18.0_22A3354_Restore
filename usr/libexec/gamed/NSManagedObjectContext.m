@implementation NSManagedObjectContext

- (void)_gkSafeSave
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17[6];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[NSManagedObjectContext(GKAdditions) _gkSafeSave]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/NSManagedObjectContext+GKAdditions.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[NSManagedObjectContext(GKAdditions) _gkSafeSave]", objc_msgSend(v8, "UTF8String"), 32));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v17[0] = 0;
  v10 = -[NSManagedObjectContext save:](self, "save:", v17);
  v11 = v17[0];
  v12 = v11;
  v13 = os_log_GKGeneral;
  if ((v10 & 1) != 0)
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v11);
    v15 = os_log_GKCache;
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
      sub_100124068((uint64_t)self, v15);
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      v16 = (id)GKOSLoggers(v11);
      v13 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1001240DC((uint64_t)self, (uint64_t)v12, v13);
    -[NSManagedObjectContext rollback](self, "rollback");
  }

}

- (void)_gkDeleteObjects:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(NSArray, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
      || (v8 = objc_opt_class(NSSet, v7), (objc_opt_isKindOfClass(v5, v8) & 1) != 0)
      || (v10 = objc_opt_class(NSOrderedSet, v9), (objc_opt_isKindOfClass(v5, v10) & 1) != 0))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            -[NSManagedObjectContext deleteObject:](self, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), (_QWORD)v16);
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
    else
    {
      +[NSException raise:format:](NSException, "raise:format:", CFSTR("GKInvalidParameter"), CFSTR("objects parameter must be of kind NSSet, NSOrderedSet or NSArray"));
    }
  }

}

- (void)_gkClearAllEntriesOfEntity:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", v4);

  v6 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v5);
  v22 = 0;
  v7 = -[NSManagedObjectContext executeRequest:error:](self, "executeRequest:error:", v6, &v22);
  v8 = v22;
  v9 = v8;
  if (v8)
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v8);
    v11 = os_log_GKError;
    v12 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
    if (v12)
      sub_100124160(v11, v13, v14, v15, v16, v17, v18, v19);
    v20 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v21 = (id)GKOSLoggers(v12);
      v20 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Clear entries error: %@", buf, 0xCu);
    }
  }

}

- (unint64_t)_gkCountObjectsFromRequest:(id)a3
{
  unint64_t v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  void *v21;

  v19 = 0;
  v3 = -[NSManagedObjectContext countForFetchRequest:error:](self, "countForFetchRequest:error:", a3, &v19);
  v4 = v19;
  v5 = v4;
  if (v4)
  {
    if (!os_log_GKGeneral)
      v6 = (id)GKOSLoggers(v4);
    v7 = os_log_GKError;
    v8 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
    if (v8)
      sub_100124194(v7, v9, v10, v11, v12, v13, v14, v15);
    v16 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v17 = (id)GKOSLoggers(v8);
      v16 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Count for objects: %@", buf, 0xCu);
    }
  }

  return v3;
}

@end
