@implementation JSAProfileBagManager

+ (id)getInstance
{
  return +[JSAProfileBagManager sharedInstance](JSAProfileBagManager, "sharedInstance");
}

- (JSAProfileBagManager)init
{
  JSAProfileBagManager *v2;
  void *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *updateQueue;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *keyEntries;
  uint64_t v14;
  BUBag *bag;
  NSObject *v16;
  os_unfair_lock_s *v17;
  _QWORD block[4];
  os_unfair_lock_s *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)JSAProfileBagManager;
  v2 = -[JSAProfileBagManager init](&v21, "init");
  if (v2)
  {
    if (+[JSAOfflineCache generateCache](JSAOfflineCache, "generateCache"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_saveOfflineCache:", UIApplicationDidEnterBackgroundNotification, 0);

    }
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("JSAProfileBagManager.updateQueue", v7);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v8;

    v2->_lock._os_unfair_lock_opaque = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "_bagDidUpdate:", AMSBagChangedNotification, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBagKeysDictionary](BUBag, "defaultBagKeysDictionary"));
    v12 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
    keyEntries = v2->_keyEntries;
    v2->_keyEntries = v12;

    v14 = objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
    bag = v2->_bag;
    v2->_bag = (BUBag *)v14;

    v16 = v2->_updateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10148;
    block[3] = &unk_9DCA8;
    v17 = v2;
    v20 = v17;
    dispatch_async(v16, block);
    sub_101A0(v17);

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
  v4.super_class = (Class)JSAProfileBagManager;
  -[JSAProfileBagManager dealloc](&v4, "dealloc");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10434;
  block[3] = &unk_9E1B8;
  block[4] = a1;
  if (qword_B9FA0 != -1)
    dispatch_once(&qword_B9FA0, block);
  return (id)qword_B9FA8;
}

- (NSDictionary)values
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  JSAProfileBagManager *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10544;
  v15 = sub_10554;
  v16 = 0;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_1055C;
  v8 = &unk_9E0D8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSDictionary *)v4;
}

- (void)updateValues
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "JSAProfileBagManager: updateValues", v5, 2u);
  }

  sub_101A0((os_unfair_lock_s *)self);
}

- (void)resetValuesCache
{
  void *v3;
  void *v4;
  NSObject *updateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  JSAProfileBagManager *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentStorefront"));

  updateQueue = self->_updateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10684;
  block[3] = &unk_9DCF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(updateQueue, block);

}

- (id)cachedValueForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v4;
  _QWORD *v5;
  id v6;
  _QWORD v8[2];
  void (*v9)(_QWORD *);
  void *v10;
  JSAProfileBagManager *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10544;
  v18 = sub_10554;
  v19 = 0;
  p_lock = &self->_lock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = sub_10BE0;
  v10 = &unk_9E3E8;
  v13 = &v14;
  v11 = self;
  v4 = a3;
  v12 = v4;
  v5 = v8;
  os_unfair_lock_lock(p_lock);
  v9(v5);
  os_unfair_lock_unlock(p_lock);

  v6 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v6;
}

- (void)addKeyEntries:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  JSAProfileBagManager *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v10 = sub_10D5C;
  v11 = &unk_9E410;
  v12 = self;
  v4 = a3;
  v13 = v4;
  v14 = &v15;
  v5 = v9;
  os_unfair_lock_lock(&self->_lock);
  v10((uint64_t)v5);
  os_unfair_lock_unlock(&self->_lock);

  if (*((_BYTE *)v16 + 24))
  {
    v6 = JSALog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "JSAProfileBagManager: scheduling to update values as new keys are registered", v8, 2u);
    }

    sub_101A0((os_unfair_lock_s *)self);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)registerOnBagChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  JSManagedValue *v7;
  JSManagedValue *bagChangeHandler;
  int v9;
  const char *v10;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446210;
    v10 = "-[JSAProfileBagManager registerOnBagChange:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  v7 = (JSManagedValue *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v4));
  bagChangeHandler = self->_bagChangeHandler;
  self->_bagChangeHandler = v7;

}

- (void)unregisterOnBagChange
{
  JSManagedValue *bagChangeHandler;

  bagChangeHandler = self->_bagChangeHandler;
  self->_bagChangeHandler = 0;

}

- (void)_bagDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *updateQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "JSAProfileBagManager: _bagDidUpdate", buf, 2u);
  }

  updateQueue = self->_updateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1110C;
  block[3] = &unk_9DCA8;
  block[4] = self;
  dispatch_sync(updateQueue, block);
  sub_101A0((os_unfair_lock_s *)self);
}

+ (id)valuesFromOfflineCache
{
  id v2;
  id v3;
  uint64_t v4;
  _UNKNOWN **v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSSet *v24;
  NSObject *v25;
  void *v26;
  _UNKNOWN **v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id result;
  id v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *obj;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];

  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cacheFileCandidatesForBag](JSAOfflineCache, "cacheFileCandidatesForBag"));
  v2 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v44;
    v5 = &JSGlobalContextSetUnhandledRejectionCallback_ptr;
    while (2)
    {
      v6 = 0;
      v39 = v3;
      do
      {
        if (*(_QWORD *)v44 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[86], "defaultManager"));
        v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

        if (v9)
        {
          v42 = 0;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v7, 0, &v42));
          v12 = v42;
          if (v10)
          {
            v13 = v4;
            v14 = objc_opt_class(NSDictionary, v11);
            v16 = objc_opt_class(NSString, v15);
            v18 = objc_opt_class(NSNumber, v17);
            v20 = objc_opt_class(NSURL, v19);
            v22 = objc_opt_class(NSArray, v21);
            v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v16, v18, v20, v22, objc_opt_class(NSNull, v23), 0);
            v25 = objc_claimAutoreleasedReturnValue(v24);
            v41 = v12;
            v26 = v10;
            v27 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v25, v10, &v41));
            v28 = v41;

            v29 = JSALog();
            v30 = objc_claimAutoreleasedReturnValue(v29);
            v31 = v30;
            if (v27)
            {
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v48 = v7;
                _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Using offline cache for bag from %{public}@", buf, 0xCu);
              }

              goto LABEL_25;
            }
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v48 = v7;
              v49 = 2114;
              v50 = v28;
              _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, "Could not unarchive bag cache at %{public}@ (error): %{public}@", buf, 0x16u);
            }

            v5 = &JSGlobalContextSetUnhandledRejectionCallback_ptr;
            v3 = v39;
            v10 = v26;
            v4 = v13;
          }
          else
          {
            v32 = JSALog();
            v25 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v48 = v7;
              _os_log_error_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Could not read bag cache file from disk: %{public}@", buf, 0xCu);
            }
            v28 = v12;
          }

        }
        v6 = (char *)v6 + 1;
      }
      while (v3 != v6);
      v3 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v3)
        continue;
      break;
    }
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cacheFileCandidatesForBag](JSAOfflineCache, "cacheFileCandidatesForBag"));
  BUReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/JSApp/JSApp/API/Bag/JSAProfileBagManager.m", 275, "+[JSAProfileBagManager valuesFromOfflineCache]", "NO", CFSTR("No bag cache file found: %@"));

  v34 = BUCrashBreakpoint(v33);
  result = (id)BUIsRunningTests(v34);
  if ((result & 1) != 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cacheFileCandidatesForBag](JSAOfflineCache, "cacheFileCandidatesForBag", v37));
    BUCrashFinalThrow(CFSTR("No bag cache file found: %@"));

    v36 = JSALog();
    obj = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      sub_71EB8(obj);
    v27 = &off_A5AC0;
LABEL_25:

    return v27;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_saveOfflineCache:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSDictionary *values;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Saving bag to offline cache", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cachePath](JSAOfflineCache, "cachePath"));
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  values = self->_values;
  v19 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", values, 1, &v19));
  v10 = v19;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[JSAOfflineCache cacheFileCandidatesForBag](JSAOfflineCache, "cacheFileCandidatesForBag"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));

  if (!v9 || !v12)
  {
    v17 = JSALog();
    v16 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_71F58();
    v14 = v10;
    goto LABEL_11;
  }
  v18 = v10;
  v13 = objc_msgSend(v9, "writeToFile:options:error:", v12, 1, &v18);
  v14 = v18;

  if ((v13 & 1) == 0)
  {
    v15 = JSALog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_71EF8();
LABEL_11:

  }
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (BUBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (JSManagedValue)bagChangeHandler
{
  return self->_bagChangeHandler;
}

- (void)setBagChangeHandler:(id)a3
{
  objc_storeStrong((id *)&self->_bagChangeHandler, a3);
}

- (NSMutableDictionary)keyEntries
{
  return self->_keyEntries;
}

- (void)setKeyEntries:(id)a3
{
  objc_storeStrong((id *)&self->_keyEntries, a3);
}

- (NSString)lastBagStorefront
{
  return self->_lastBagStorefront;
}

- (void)setLastBagStorefront:(id)a3
{
  objc_storeStrong((id *)&self->_lastBagStorefront, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBagStorefront, 0);
  objc_storeStrong((id *)&self->_keyEntries, 0);
  objc_storeStrong((id *)&self->_bagChangeHandler, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
