@implementation APPersistentCache

- (APPersistentCache)initWithCacheSize:(int64_t)a3
{
  APPersistentCache *v4;
  uint64_t v5;
  APPersistentCachedStoreTransactionalProtocol *persistentCacheStore;
  dispatch_queue_t v7;
  OS_dispatch_queue *gcSchedulerQueue;
  void *v9;
  double v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)APPersistentCache;
  v4 = -[APPersistentCache init](&v13, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[APPersistentCachedStore createWithTotalCostLimit:](APPersistentCachedStore, "createWithTotalCostLimit:", a3));
    persistentCacheStore = v4->_persistentCacheStore;
    v4->_persistentCacheStore = (APPersistentCachedStoreTransactionalProtocol *)v5;

    +[APPersistentCacheStoreProvider assignPersistentCacheStore:](APPersistentCacheStoreProvider, "assignPersistentCacheStore:", v4->_persistentCacheStore);
    v7 = dispatch_queue_create("com.apple.ap.cache-gc-scheduler", 0);
    gcSchedulerQueue = v4->_gcSchedulerQueue;
    v4->_gcSchedulerQueue = (OS_dispatch_queue *)v7;

    v4->_cacheObjectTTL = 172800.0;
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[APInternalCacheSettings settings](APInternalCacheSettings, "settings"));
      objc_msgSend(v9, "diagnosticsIntervalValue");
      v11 = v10;

      if (v11 > 0.0)
        -[APPersistentCachedStoreTransactionalProtocol enableDiagnosticsWithInterval:](v4->_persistentCacheStore, "enableDiagnosticsWithInterval:", v11);
    }
  }
  return v4;
}

- (void)start
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APPersistentCache _getLastGCDate](self, "_getLastGCDate"));
  v4 = APLogForCategory(33);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Last garbage collection was performed on %{public}@.", (uint8_t *)&v6, 0xCu);
  }

  -[APPersistentCache _setupNotifyListener](self, "_setupNotifyListener");
}

- (void)startGCWithCompletionHandler:(id)a3
{
  -[APPersistentCache _performGCWithCompletionHandler:](self, "_performGCWithCompletionHandler:", a3);
}

- (void)stopGC
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[APPersistentCache garbageCollector](self, "garbageCollector"));
  objc_msgSend(v2, "stop");

}

- (void)_setupNotifyListener
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[APTestingRig sharedInstance](APTestingRig, "sharedInstance"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10016E6BC;
    v7[3] = &unk_100218A20;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "subscribeForMessage:handler:", CFSTR("cache-startgc-all"), v7);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APTestingRig sharedInstance](APTestingRig, "sharedInstance"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10016E804;
    v5[3] = &unk_100218A20;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "subscribeForMessage:handler:", CFSTR("cache-dump"), v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_performGCWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  double v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[APPersistentCache cacheObjectTTL](self, "cacheObjectTTL");
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", -v6));

  -[APPersistentCache _performGC:completionHandler:](self, "_performGC:completionHandler:", v7, v4);
}

- (void)_performGC:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  APCacheGarbageCollector *v16;
  void *v17;
  APCacheGarbageCollector *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = APLogForCategory(33);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Started garbage collection.", buf, 2u);
  }

  v10 = APLogForCategory(33);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Started garbage collection. Cut off date is: %{public}@.", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPersistentCache _getLastGCDate](self, "_getLastGCDate"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v13, "timeIntervalSinceDate:", v12);
    v15 = v14;

  }
  else
  {
    v15 = -1.0;
  }
  v16 = [APCacheGarbageCollector alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APPersistentCache persistentCacheStore](self, "persistentCacheStore"));
  v18 = -[APCacheGarbageCollector initWithCacheStore:expirationDate:timeSincePrevLaunch:](v16, "initWithCacheStore:expirationDate:timeSincePrevLaunch:", v17, v6, v15);
  -[APPersistentCache setGarbageCollector:](self, "setGarbageCollector:", v18);

  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v24, (id *)buf);
  v19 = v7;
  v23 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[APPersistentCache garbageCollector](self, "garbageCollector", _NSConcreteStackBlock, 3221225472, sub_10016EC24, &unk_100218A70));
  objc_msgSend(v20, "setCompletionHandler:", &v22);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APPersistentCache garbageCollector](self, "garbageCollector"));
  objc_msgSend(v21, "collect");

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

- (id)_getLastGCDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[APPersistentCacheSettings settings](APPersistentCacheSettings, "settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastGarbageCollected"));

  return v3;
}

- (void)_setLastGCDate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[APPersistentCacheSettings settings](APPersistentCacheSettings, "settings"));
  objc_msgSend(v4, "setLastGarbageCollected:", v3);

}

- (id)_dumpCache
{
  void *v2;
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  APPersistentCache *v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  BOOL v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  __CFString *v37;
  uint64_t v38;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v45;
  id v46;
  FILE *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  v4 = NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("cache-dump.json")));
  v8 = APLogForCategory(32);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138739971;
    v55 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Started cache dump into '%{sensitive}@'", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPersistentCache persistentCacheStore](self, "persistentCacheStore"));
  v11 = objc_opt_respondsToSelector(v10, "enumerateIDsWithExtension:");

  if ((v11 & 1) != 0)
  {
    v43 = v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPersistentCache persistentCacheStore](self, "persistentCacheStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "performSelector:withObject:", "enumerateIDsWithExtension:", CFSTR("b")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v42 = v6;
    objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

    v41 = v7;
    v40 = objc_retainAutorelease(v7);
    v47 = fopen((const char *)objc_msgSend(v40, "UTF8String"), "w");
    fputs("[\n", v47);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v15 = v13;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = self;
      v19 = 1;
      v20 = *(_QWORD *)v50;
      v45 = *(_QWORD *)v50;
      do
      {
        v21 = 0;
        v46 = v17;
        do
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v15);
          v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v21);
          if ((v19 & 1) == 0)
            fputs(",\n", v47);
          v23 = objc_autoreleasePoolPush();
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[APPersistentCache persistentCacheStore](v18, "persistentCacheStore"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v22));

          if ((objc_opt_respondsToSelector(v25, "toJSONObject") & 1) != 0)
          {
            v26 = v15;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "performSelector:", "toJSONObject"));
            if (v27)
            {
              v48 = 0;
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v27, 15, &v48));
              v29 = v48;
              v30 = v29;
              if (v28)
                v31 = v29 == 0;
              else
                v31 = 0;
              if (v31)
              {
                v33 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v28, 4);
              }
              else
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
                v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\"error\": \"Failed dataWithJSONObject with ID %@: %@ \"}\n"), v32, v30));

              }
              v18 = self;
            }
            else
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
              v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\"error\": \"Failed toJSONObject with ID %@\"}\n"), v30));
            }

            v34 = objc_retainAutorelease(v33);
            fputs((const char *)objc_msgSend(v34, "UTF8String"), v47);

            v15 = v26;
            v20 = v45;
            v17 = v46;
          }

          objc_autoreleasePoolPop(v23);
          v19 = 0;
          v21 = (char *)v21 + 1;
        }
        while (v17 != v21);
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        v19 = 0;
      }
      while (v17);
    }

    fputs("\n]", v47);
    fclose(v47);
    v35 = APLogForCategory(32);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      v55 = v40;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Completed cache dump into '%{sensitive}@'", buf, 0xCu);
    }

    v37 = (__CFString *)v40;
    v6 = v42;
    v3 = v43;
    v7 = v41;
  }
  else
  {
    v38 = APLogForCategory(32);
    v15 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Cache dump failed, something went wrong.", buf, 2u);
    }
    v37 = CFSTR("Cache dump failed, something went wrong.");
  }

  return v37;
}

- (APPersistentCachedStoreTransactionalProtocol)persistentCacheStore
{
  return self->_persistentCacheStore;
}

- (OS_dispatch_queue)gcSchedulerQueue
{
  return self->_gcSchedulerQueue;
}

- (APCacheGarbageCollector)garbageCollector
{
  return self->_garbageCollector;
}

- (void)setGarbageCollector:(id)a3
{
  objc_storeStrong((id *)&self->_garbageCollector, a3);
}

- (double)cacheObjectTTL
{
  return self->_cacheObjectTTL;
}

- (void)setCacheObjectTTL:(double)a3
{
  self->_cacheObjectTTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_garbageCollector, 0);
  objc_storeStrong((id *)&self->_gcSchedulerQueue, 0);
  objc_storeStrong((id *)&self->_persistentCacheStore, 0);
}

@end
