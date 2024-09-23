@implementation _TUIResourceLoaderOfflineCache

+ (id)sharedOfflineCache
{
  if (qword_2CB540 != -1)
    dispatch_once(&qword_2CB540, &stru_2402A8);
  return (id)qword_2CB538;
}

- (_TUIResourceLoaderOfflineCache)init
{
  _TUIResourceLoaderOfflineCache *v2;
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  unsigned int runFromOfflineCache;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *cache;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSURLCache *v21;
  NSURLCache *urlCache;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v30[4];
  _TUIResourceLoaderOfflineCache *v31;
  uint8_t buf[16];
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)_TUIResourceLoaderOfflineCache;
  v2 = -[_TUIResourceLoaderOfflineCache init](&v33, "init");
  if (!v2)
    return v2;
  v3 = TUISignpostDefault();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_make_with_pointer(v4, v2);

  v6 = TUISignpostDefault();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Load offline cache", (const char *)&unk_23007A, buf, 2u);
  }

  v2->_postLaunchCacheCount = -1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUIOfflineCache provider](TUIOfflineCache, "provider"));
  v2->_generateOfflineCache = objc_msgSend(v9, "generateCache");
  runFromOfflineCache = objc_msgSend(v9, "runFromCache");
  v2->_runFromOfflineCache = runFromOfflineCache;
  if (v2->_generateOfflineCache || runFromOfflineCache != 0)
  {
    v12 = dispatch_queue_create("TUIResourceLoader.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v12;

    runFromOfflineCache = v2->_runFromOfflineCache;
  }
  if (runFromOfflineCache)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cacheFileCandidatesForPreLaunch"));
    v15 = objc_claimAutoreleasedReturnValue(-[_TUIResourceLoaderOfflineCache _loadCacheFromCandidatePaths:](v2, "_loadCacheFromCandidatePaths:", v14));
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v15;

    if (v2->_cache)
    {
      v17 = (objc_class *)objc_opt_class(v2);
      v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-OfflineCache"), v19));

      v21 = (NSURLCache *)objc_msgSend(objc_alloc((Class)NSURLCache), "initWithMemoryCapacity:diskCapacity:diskPath:", 79155201, 0, v20);
      urlCache = v2->_urlCache;
      v2->_urlCache = v21;

      -[NSURLCache removeAllCachedResponses](v2->_urlCache, "removeAllCachedResponses");
      v23 = v2->_cache;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_8B330;
      v30[3] = &unk_2402D0;
      v31 = v2;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v23, "enumerateKeysAndObjectsUsingBlock:", v30);

    }
  }
  else
  {
    if (!v2->_generateOfflineCache)
      goto LABEL_16;
    v24 = objc_opt_new(NSMutableDictionary);
    v25 = v2->_cache;
    v2->_cache = v24;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, "_saveOfflineCache:", UIApplicationDidEnterBackgroundNotification, 0);
  }

LABEL_16:
  v26 = TUISignpostDefault();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v28, OS_SIGNPOST_INTERVAL_END, v5, "Load offline cache", (const char *)&unk_23007A, buf, 2u);
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_TUIResourceLoaderOfflineCache;
  -[_TUIResourceLoaderOfflineCache dealloc](&v4, "dealloc");
}

- (NSURLCache)urlCache
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_8B4CC;
  v10 = sub_8B4DC;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8B4E4;
  v5[3] = &unk_23EAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURLCache *)v3;
}

- (id)_loadCacheFromCandidatePaths:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  _UNKNOWN **v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint64_t v29;
  id v30;
  id obj;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];

  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v35;
    v6 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    v29 = *(_QWORD *)v35;
    while (2)
    {
      v7 = 0;
      v30 = v4;
      do
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[201], "defaultManager"));
        v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

        if (v10)
        {
          v33 = 0;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v8, 0, &v33));
          v12 = v33;
          if (v11)
          {
            v13 = objc_opt_class(NSDictionary);
            v14 = objc_opt_class(NSString);
            v15 = objc_opt_class(NSMutableData);
            v16 = objc_opt_class(NSCachedURLResponse);
            v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(NSURL), 0);
            v18 = objc_claimAutoreleasedReturnValue(v17);
            v19 = objc_opt_class(NSMutableDictionary);
            v32 = v12;
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v18, v11, &v32));
            v21 = v32;

            v22 = TUIDynamicCast(v19, v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

            v24 = TUIInstallBundleLog();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            v26 = v25;
            if (v23)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v39 = v8;
                _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Using offline cache for TUI from %{public}@", buf, 0xCu);
              }

              goto LABEL_22;
            }
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v39 = v8;
              v40 = 2114;
              v41 = v21;
              _os_log_error_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "Could not unarchive cache at %@ (error): %{public}@", buf, 0x16u);
            }

            v4 = v30;
            v6 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
            v5 = v29;
          }
          else
          {
            v27 = TUIInstallBundleLog();
            v18 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v39 = v8;
              _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Could not read cache file from disk: %{public}@", buf, 0xCu);
            }
            v21 = v12;
          }

        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v4)
        continue;
      break;
    }
  }
  v23 = 0;
LABEL_22:

  return v23;
}

- (void)incrementPostLaunchCacheCount
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8B8C8;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_aq_loadPostLaunchCaches
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _QWORD v32[4];
  id v33;
  void *v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUIOfflineCache provider](TUIOfflineCache, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheDirCandidatesForPostLaunch"));

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_8BC20;
  v32[3] = &unk_2402F8;
  v6 = v3;
  v33 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v32);
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v7));
    if (v8)
    {
      v9 = (void *)v8;
      v31 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v8, &v31));
      v23 = v31;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingSelector:", "compare:"));

      if (!v11)
      {
        v12 = TUIInstallBundleLog();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_17DA88();

      }
      v24 = v6;
      v25 = v5;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v19, "hasSuffix:", CFSTR(".plist")))
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v19));
              v34 = v20;
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIResourceLoaderOfflineCache _loadCacheFromCandidatePaths:](self, "_loadCacheFromCandidatePaths:", v21));

              if (v22)
              {
                -[NSMutableDictionary addEntriesFromDictionary:](self->_cache, "addEntriesFromDictionary:", v22);
                v26[0] = _NSConcreteStackBlock;
                v26[1] = 3221225472;
                v26[2] = sub_8BC58;
                v26[3] = &unk_2402D0;
                v26[4] = self;
                objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v26);
              }

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v16);
      }

      v6 = v24;
      v5 = v25;
    }
  }

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (self->_generateOfflineCache)
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8BD90;
    block[3] = &unk_23E2C8;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(accessQueue, block);

  }
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_8B4CC;
  v17 = sub_8B4DC;
  v18 = 0;
  if (self->_runFromOfflineCache)
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8BE94;
    block[3] = &unk_23E848;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(accessQueue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8BF4C;
  block[3] = &unk_23E580;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)_saveOfflineCache:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8BFB0;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_aq_saveOfflineCache
{
  void *v3;
  NSMutableDictionary *cache;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUIOfflineCache provider](TUIOfflineCache, "provider"));
  if (-[NSMutableDictionary count](self->_cache, "count"))
  {
    cache = self->_cache;
    v18 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", cache, 1, &v18));
    v6 = v18;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  if (self->_postLaunchCacheCount < 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheFileCandidatesForPreLaunch"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheDirCandidatesForPostLaunch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02ld.plist"), self->_postLaunchCacheCount));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v10));

    }
    else
    {
      v11 = 0;
    }
  }

  if (!v5 || !v11)
  {
    v16 = TUIInstallBundleLog();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_17DB50();
    v13 = v6;
    goto LABEL_17;
  }
  v17 = v6;
  v12 = objc_msgSend(v5, "writeToFile:options:error:", v11, 1, &v17);
  v13 = v17;

  if ((v12 & 1) == 0)
  {
    v14 = TUIInstallBundleLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_17DAEC();
LABEL_17:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCache, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
