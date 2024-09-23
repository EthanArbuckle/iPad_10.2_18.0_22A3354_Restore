@implementation _JSAStoreHTTPReqestOfflineCache

+ (id)sharedOfflineCache
{
  if (qword_B9FB8 != -1)
    dispatch_once(&qword_B9FB8, &stru_9E678);
  return (id)qword_B9FB0;
}

- (_JSAStoreHTTPReqestOfflineCache)init
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _JSAStoreHTTPReqestOfflineCache *v9;
  _JSAStoreHTTPReqestOfflineCache *v10;
  dispatch_qos_class_t v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *accessQueue;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *cache;
  uint64_t v21;
  uint64_t v22;
  _JSAStoreHTTPReqestOfflineCache *result;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  objc_super v29;
  uint8_t buf[16];

  v3 = JSASignpost();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_generate(v4);

  v6 = JSASignpost();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Load offline cache", ", buf, 2u);
  }

  v29.receiver = self;
  v29.super_class = (Class)_JSAStoreHTTPReqestOfflineCache;
  v9 = -[_JSAStoreHTTPReqestOfflineCache init](&v29, "init");
  v10 = v9;
  if (!v9)
    goto LABEL_18;
  v9->_postLaunchCacheCount = -1;
  if (+[JSAOfflineCache generateCache](JSAOfflineCache, "generateCache")
    || +[JSAOfflineCache runFromCache](JSAOfflineCache, "runFromCache"))
  {
    if (+[JSAOfflineCache generateCache](JSAOfflineCache, "generateCache"))
      v11 = QOS_CLASS_USER_INTERACTIVE;
    else
      v11 = QOS_CLASS_USER_INITIATED;
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, v11, 0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("JSAStoreHTTPRequest.access", v15);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v16;

  }
  if (+[JSAOfflineCache runFromCache](JSAOfflineCache, "runFromCache"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cacheFileCandidatesForHTTPPreLaunch](JSAOfflineCache, "cacheFileCandidatesForHTTPPreLaunch"));
    v19 = objc_claimAutoreleasedReturnValue(-[_JSAStoreHTTPReqestOfflineCache _loadCacheFromCandidatePaths:](v10, "_loadCacheFromCandidatePaths:", v18));
    cache = v10->_cache;
    v10->_cache = (NSMutableDictionary *)v19;

    if (!v10->_cache)
    {
      v21 = BUReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/JSApp/JSApp/API/Requests/JSAStoreHTTPRequest.m", 103, "-[_JSAStoreHTTPReqestOfflineCache init]", "NO", CFSTR("No HTTP cache file found: %@"));
      v22 = BUCrashBreakpoint(v21);
      result = (_JSAStoreHTTPReqestOfflineCache *)BUIsRunningTests(v22);
      if ((result & 1) == 0)
      {
        __break(1u);
        return result;
      }
      BUCrashFinalThrow(CFSTR("No HTTP cache file found: %@"));
    }
    goto LABEL_17;
  }
  if (+[JSAOfflineCache generateCache](JSAOfflineCache, "generateCache"))
  {
    v24 = objc_opt_new(NSMutableDictionary);
    v25 = v10->_cache;
    v10->_cache = v24;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v10, "_saveOfflineCache:", UIApplicationDidEnterBackgroundNotification, 0);
LABEL_17:

  }
LABEL_18:
  v26 = JSASignpost();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v28, OS_SIGNPOST_INTERVAL_END, v5, "Load offline cache", ", buf, 2u);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_JSAStoreHTTPReqestOfflineCache;
  -[_JSAStoreHTTPReqestOfflineCache dealloc](&v4, "dealloc");
}

- (id)_loadCacheFromCandidatePaths:(id)a3
{
  id v3;
  uint64_t v4;
  _UNKNOWN **v5;
  _UNKNOWN **v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSSet *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id obj;
  uint64_t v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];

  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v47;
    v5 = &JSGlobalContextSetUnhandledRejectionCallback_ptr;
    v6 = &JSGlobalContextSetUnhandledRejectionCallback_ptr;
    v40 = *(_QWORD *)v47;
    while (2)
    {
      v7 = 0;
      v41 = v3;
      do
      {
        if (*(_QWORD *)v47 != v4)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[86], "defaultManager"));
        v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

        if (v10)
        {
          v11 = v6[79];
          v45 = 0;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataWithContentsOfFile:options:error:", v8, 0, &v45));
          v14 = v45;
          if (v12)
          {
            v43 = objc_opt_class(v6[79], v13);
            v16 = objc_opt_class(NSArray, v15);
            v18 = objc_opt_class(NSString, v17);
            v20 = objc_opt_class(NSNumber, v19);
            v22 = objc_opt_class(NSDictionary, v21);
            v24 = objc_opt_class(NSMutableDictionary, v23);
            v39 = objc_opt_class(NSURL, v25);
            v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v43, v16, v18, v20, v22, v24, v39, objc_opt_class(NSNull, v26), 0);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            v30 = objc_opt_class(NSMutableDictionary, v29);
            v44 = v14;
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v28, v12, &v44));
            v32 = v44;

            v33 = BUDynamicCast(v30, v31);
            v3 = (id)objc_claimAutoreleasedReturnValue(v33);

            v34 = JSALog();
            v35 = objc_claimAutoreleasedReturnValue(v34);
            v36 = v35;
            if (v3)
            {
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v51 = v8;
                _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Using offline cache from %{public}@", buf, 0xCu);
              }

              goto LABEL_22;
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v51 = v8;
              v52 = 2114;
              v53 = v32;
              _os_log_error_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Could not unarchive cache at %@ (error): %{public}@", buf, 0x16u);
            }

            v4 = v40;
            v5 = &JSGlobalContextSetUnhandledRejectionCallback_ptr;
            v6 = &JSGlobalContextSetUnhandledRejectionCallback_ptr;
          }
          else
          {
            v37 = JSALog();
            v28 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v51 = v8;
              _os_log_error_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "Could not read cache file from disk: %{public}@", buf, 0xCu);
            }
            v32 = v14;
          }
          v3 = v41;

        }
        v7 = (char *)v7 + 1;
      }
      while (v3 != v7);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_22:

  return v3;
}

- (void)incrementPostLaunchCacheCount
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13B78;
  block[3] = &unk_9DCA8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_aq_loadPostLaunchCaches
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _QWORD v30[4];
  id v31;
  void *v32;
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cacheDirCandidatesForHTTPPostLaunch](JSAOfflineCache, "cacheDirCandidatesForHTTPPostLaunch"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_13E94;
  v30[3] = &unk_9E6A0;
  v5 = v3;
  v31 = v5;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v30);
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v6));
    if (v7)
    {
      v8 = (void *)v7;
      v29 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v7, &v29));
      v22 = v29;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingSelector:", "compare:"));

      if (!v10)
      {
        v11 = JSALog();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_72038();

      }
      v23 = v5;
      v24 = v4;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v18, "hasSuffix:", CFSTR(".plist")))
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v18));
              v32 = v19;
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[_JSAStoreHTTPReqestOfflineCache _loadCacheFromCandidatePaths:](self, "_loadCacheFromCandidatePaths:", v20));

              if (v21)
                -[NSMutableDictionary addEntriesFromDictionary:](self->_cache, "addEntriesFromDictionary:", v21);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v15);
      }

      v5 = v23;
      v4 = v24;
    }
  }

}

- (void)setResponse:(id)a3 forKey:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (+[JSAOfflineCache generateCache](JSAOfflineCache, "generateCache"))
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13F88;
    block[3] = &unk_9E208;
    block[4] = self;
    v10 = v6;
    v11 = v8;
    dispatch_sync(accessQueue, block);

  }
}

- (id)responseForKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  JSAStoreHTTPResponse *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSSet *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  JSAStoreHTTPResponse *v45;
  id v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[4];
  JSAStoreHTTPResponse *v54;
  _JSAStoreHTTPReqestOfflineCache *v55;
  id v56;
  id v57;
  id v58;
  _QWORD block[5];
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v4 = a3;
  if (+[JSAOfflineCache runFromCache](JSAOfflineCache, "runFromCache"))
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = sub_143B0;
    v66 = sub_143C0;
    v67 = 0;
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_143C8;
    block[3] = &unk_9E3E8;
    v61 = &v62;
    block[4] = self;
    v6 = v4;
    v60 = v6;
    dispatch_sync(accessQueue, block);
    v8 = objc_opt_class(JSAStoreHTTPResponse, v7);
    v9 = BUDynamicCast(v8, v63[5]);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v12 = (JSAStoreHTTPResponse *)v10;
    if (!v63[5] || v10)
      goto LABEL_21;
    v13 = objc_opt_class(NSData, v11);
    v14 = BUDynamicCast(v13, v63[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v17 = v15;
    if (v15)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bu_gzipInflate"));

      v20 = objc_opt_class(NSDictionary, v19);
      v58 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v18, 0, &v58));
      v22 = v58;
      v23 = BUDynamicCast(v20, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

      if (v24)
      {
        v26 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v52 = objc_opt_class(NSArray, v25);
      v51 = objc_opt_class(NSString, v29);
      v31 = objc_opt_class(NSNumber, v30);
      v33 = objc_opt_class(NSDictionary, v32);
      v35 = objc_opt_class(NSMutableDictionary, v34);
      v37 = objc_opt_class(NSURL, v36);
      v39 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v52, v51, v31, v33, v35, v37, objc_opt_class(NSNull, v38), 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      v42 = objc_opt_class(NSDictionary, v41);
      v57 = 0;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v40, v18, &v57));
      v26 = v57;
      v44 = BUDynamicCast(v42, v43);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v44);

      if (v24)
        goto LABEL_11;
      v47 = JSALog();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        sub_720DC();

    }
    else
    {
      v27 = objc_opt_class(NSDictionary, v16);
      v28 = BUDynamicCast(v27, v63[5]);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v28);
      if (v24)
      {
        v18 = 0;
LABEL_12:
        v45 = -[JSAStoreHTTPResponse initWithDictionary:]([JSAStoreHTTPResponse alloc], "initWithDictionary:", v24);
LABEL_20:
        v49 = self->_accessQueue;
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_14404;
        v53[3] = &unk_9E208;
        v12 = v45;
        v54 = v12;
        v55 = self;
        v56 = v6;
        dispatch_sync(v49, v53);

LABEL_21:
        _Block_object_dispose(&v62, 8);

        goto LABEL_22;
      }
      v46 = JSALog();
      v22 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_7209C(v22);
      v18 = 0;
    }

    v24 = 0;
    v45 = 0;
    goto LABEL_20;
  }
  v12 = 0;
LABEL_22:

  return v12;
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
  block[2] = sub_144A0;
  block[3] = &unk_9E2F8;
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
  block[2] = sub_146C4;
  block[3] = &unk_9DCA8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_aq_saveOfflineCache
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cachePath](JSAOfflineCache, "cachePath"));
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  if (-[NSMutableDictionary count](self->_cache, "count"))
  {
    v5 = sub_144AC((id *)&self->super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v20 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v20));
    v8 = v20;

  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  if (self->_postLaunchCacheCount < 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cacheFileCandidatesForHTTPPreLaunch](JSAOfflineCache, "cacheFileCandidatesForHTTPPreLaunch"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cacheDirCandidatesForHTTPPostLaunch](JSAOfflineCache, "cacheDirCandidatesForHTTPPostLaunch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02ld.plist"), self->_postLaunchCacheCount));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v12));

    }
    else
    {
      v13 = 0;
    }
  }

  if (!v7 || !v13)
  {
    v18 = JSALog();
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_72210();
    v15 = v8;
    goto LABEL_17;
  }
  v19 = v8;
  v14 = objc_msgSend(v7, "writeToFile:options:error:", v13, 1, &v19);
  v15 = v19;

  if ((v14 & 1) == 0)
  {
    v16 = JSALog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_721AC();
LABEL_17:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
