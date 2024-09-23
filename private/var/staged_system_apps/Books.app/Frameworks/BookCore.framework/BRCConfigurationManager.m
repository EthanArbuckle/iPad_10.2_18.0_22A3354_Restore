@implementation BRCConfigurationManager

+ (BRCConfigurationManager)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1144E8;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_311270 != -1)
    dispatch_once(&qword_311270, block);
  return (BRCConfigurationManager *)(id)qword_311278;
}

- (BRCConfigurationManager)init
{
  BRCConfigurationManager *v2;
  BRCConfigurationManager *v3;
  uint64_t v4;
  NSHashTable *observers;
  NSMutableDictionary *v6;
  NSMutableDictionary *data;
  dispatch_queue_global_t global_queue;
  uint64_t v9;
  OS_dispatch_queue *workerQueue;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *updateQueue;
  NSMutableArray *v15;
  NSMutableArray *jsSubscribers;
  void *v17;
  void *v18;
  RCConfigurationManager *v19;
  RCConfigurationManager *remoteConfigurationManager;
  NSCondition *v21;
  NSCondition *cacheLoadedCondition;
  id v23;
  NSUserDefaults *v24;
  NSUserDefaults *userDefaults;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)BRCConfigurationManager;
  v2 = -[BRCConfigurationManager init](&v27, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithWeakObjects](NSHashTable, "hashTableWithWeakObjects"));
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    data = v3->_data;
    v3->_data = v6;

    global_queue = dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    workerQueue = v3->_workerQueue;
    v3->_workerQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.booksremoteconfig", v12);
    updateQueue = v3->_updateQueue;
    v3->_updateQueue = (OS_dispatch_queue *)v13;

    *(_WORD *)&v3->_refreshOnRegister = 1;
    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    jsSubscribers = v3->_jsSubscribers;
    v3->_jsSubscribers = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationConfigurationDirectory](UIApplication, "applicationConfigurationDirectory"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v17));

    v19 = (RCConfigurationManager *)objc_msgSend(objc_alloc((Class)RCConfigurationManager), "initWithContentDirectoryURL:", v18);
    remoteConfigurationManager = v3->_remoteConfigurationManager;
    v3->_remoteConfigurationManager = v19;

    v3->_configurationLoaded = 0;
    v3->_cacheLoaded = 0;
    v21 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    cacheLoadedCondition = v3->_cacheLoadedCondition;
    v3->_cacheLoadedCondition = v21;

    v23 = objc_alloc((Class)NSUserDefaults);
    v24 = (NSUserDefaults *)objc_msgSend(v23, "initWithSuiteName:", BUBooksGroupContainerIdentifier);
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = v24;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v3->_userDefaults, "addObserver:forKeyPath:options:context:", v3, CFSTR("BRCIgnoreCache"), 1, off_30A010);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v3->_userDefaults, "addObserver:forKeyPath:options:context:", v3, CFSTR("BRCDisableABTesting"), 1, off_30A010);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v3->_userDefaults, "addObserver:forKeyPath:options:context:", v3, CFSTR("BRCOverrideSegmentIDs"), 1, off_30A010);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v3->_userDefaults, "addObserver:forKeyPath:options:context:", v3, CFSTR("BRCAdditionalSegmentIDs"), 1, off_30A010);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v3->_userDefaults, "addObserver:forKeyPath:options:context:", v3, CFSTR("BRCServerEnv"), 1, off_30A010);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v3->_userDefaults, "addObserver:forKeyPath:options:context:", v3, CFSTR("BRCConfigSource"), 1, off_30A010);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, CFSTR("BRCIgnoreCache"));
  -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, CFSTR("BRCDisableABTesting"));
  -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, CFSTR("BRCOverrideSegmentIDs"));
  -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, CFSTR("BRCAdditionalSegmentIDs"));
  -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, CFSTR("BRCServerEnv"));
  -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, CFSTR("BRCConfigSource"));
  v3.receiver = self;
  v3.super_class = (Class)BRCConfigurationManager;
  -[BRCConfigurationManager dealloc](&v3, "dealloc");
}

- (BOOL)monitoringEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("BRCEnableMonitoring"));
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  NSString *v5;
  NSString *userID;
  void *v7;
  NSString *v8;
  _QWORD v9[5];

  v8 = self->_userID;
  v5 = (NSString *)objc_msgSend(a3, "copy");
  userID = self->_userID;
  self->_userID = v5;

  if (-[NSString length](self->_userID, "length")
    && !-[NSString isEqualToString:](self->_userID, "isEqualToString:", v8))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_114908;
    v9[3] = &unk_291718;
    v9[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)registerNamespace:(id)a3 withDefaults:(id)a4 forBundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager _namespaceNamed:](self, "_namespaceNamed:", v8));
  objc_msgSend(v11, "setBundleID:", v10);

  v12 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager workerQueue](self, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_114B04;
  block[3] = &unk_28FB98;
  block[4] = self;
  v15 = v8;
  v17 = v15;
  v18 = v11;
  v19 = v9;
  v13 = v9;
  v14 = v11;
  dispatch_sync(v12, block);

  if (-[BRCConfigurationManager refreshOnRegister](self, "refreshOnRegister"))
    -[BRCConfigurationManager refreshNamespace:](self, "refreshNamespace:", v15);

}

- (id)valueForKey:(id)a3 fromNamespace:(id)a4
{
  return -[BRCConfigurationManager valueForKey:fromNamespace:source:](self, "valueForKey:fromNamespace:source:", a3, a4, 0);
}

- (id)valueForKey:(id)a3 fromNamespace:(id)a4 source:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

  if (v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager _valueForKey:fromNamespaceData:source:](self, "_valueForKey:fromNamespaceData:source:", v8, v11, a5));
  else
    v12 = 0;

  return v12;
}

- (void)subscribe:(id)a3 toKeys:(id)a4 inNamespace:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v14 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager updateQueue](self, "updateQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_115028;
  v19[3] = &unk_291740;
  objc_copyWeak(&v24, &location);
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v11;
  v16 = v13;
  v17 = v10;
  v18 = v12;
  dispatch_async(v14, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)refreshNamespace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  const __CFString *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager userID](self, "userID"));

  if (v5)
  {
    v14 = CFSTR("namespace");
    v15 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    -[BRCConfigurationManager _executeMonitorWithMessage:data:](self, "_executeMonitorWithMessage:data:", CFSTR("refresh requested"), v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v4));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager userID](self, "userID"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_115328;
    v11[3] = &unk_291790;
    v11[4] = self;
    v12 = v4;
    v13 = v8;
    v10 = v8;
    objc_msgSend(v10, "settingsWithUserID:completion:", v9, v11);

  }
}

- (void)resetForJavascript
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager updateQueue](self, "updateQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_115960;
  v4[3] = &unk_28CC18;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)namespaceInfo
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_115A48;
  v7[3] = &unk_291718;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)allLogicalValuesFromNamespace:(id)a3 allowsOnlyDefaultSource:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "systemDefaults"));
  v10 = objc_msgSend(v9, "copy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  v12 = objc_msgSend(v11, "copy");

  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));
    objc_msgSend(v13, "addEntriesFromDictionary:", v12);
    v14 = objc_msgSend(v13, "copy");

  }
  else if (v4)
  {
    v14 = v10;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)waitForCachedConfigurationLoaded:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v23;
  double v24;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager cacheLoadedCondition](self, "cacheLoadedCondition"));
  objc_msgSend(v6, "lock");

  if (!-[BRCConfigurationManager cacheLoaded](self, "cacheLoaded"))
  {
    v7 = BRCConfigLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 134217984;
      v24 = a3;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "waitForCachedConfigurationLoaded: Waiting for cacheLoaded. timeout: %f", (uint8_t *)&v23, 0xCu);
    }

  }
  if (!-[BRCConfigurationManager cacheLoaded](self, "cacheLoaded"))
  {
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager cacheLoadedCondition](self, "cacheLoadedCondition"));
      v10 = objc_msgSend(v9, "waitUntilDate:", v5);

    }
    while (!-[BRCConfigurationManager cacheLoaded](self, "cacheLoaded") && (v10 & 1) != 0);
  }
  v11 = -[BRCConfigurationManager cacheLoaded](self, "cacheLoaded");
  if (!v11)
  {
    v12 = BRCConfigLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1B79A4(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager cacheLoadedCondition](self, "cacheLoadedCondition"));
  objc_msgSend(v21, "unlock");

  return v11;
}

- (void)setValue:(id)a3 forKey:(id)a4 forNamespace:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BRCNamespaceData *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v16 = a5;
  self->_configurationLoaded = 1;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
  v11 = (BRCNamespaceData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v16));

  if (!v11)
  {
    v11 = objc_alloc_init(BRCNamespaceData);
    -[BRCNamespaceData setNamespaceIdentifier:](v11, "setNamespaceIdentifier:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v16);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData configuration](v11, "configuration"));
  v14 = objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v8);
  v15 = objc_msgSend(v14, "copy");
  -[BRCNamespaceData setConfiguration:](v11, "setConfiguration:", v15);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;

  if (off_30A010 == a6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data", a3, a4, a5));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_116094;
    v15[3] = &unk_291718;
    v15[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);

    v8 = BRCConfigLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("BRCOverrideSegmentIDs")));
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "RemoteConfigInfo: Override SegmentIDs = %@", buf, 0xCu);

    }
    v11 = BRCConfigLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("BRCAdditionalSegmentIDs")));
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "RemoteConfigInfo: Additional SegmentIDs = %@", buf, 0xCu);

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BRCConfigurationManager;
    -[BRCConfigurationManager observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_updateNamespace:(id)a3 systemDefaults:(id)a4 configuration:(id)a5 treatmentIDs:(id)a6 segmentIDs:(id)a7 segmentSetIDs:(id)a8 reason:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  BRCConfigurationManager *v35;
  id v36[2];
  id location;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  objc_initWeak(&location, self);
  v21 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager updateQueue](self, "updateQueue"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_116280;
  v28[3] = &unk_2917B8;
  objc_copyWeak(v36, &location);
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v19;
  v33 = v20;
  v34 = v18;
  v35 = self;
  v36[1] = (id)a9;
  v22 = v18;
  v23 = v20;
  v24 = v19;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  dispatch_async(v21, v28);

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
}

- (id)_valueForKey:(id)a3 fromNamespaceData:(id)a4 source:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BRCConfigValue *v18;
  _QWORD v20[3];
  _QWORD v21[3];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  switch(a5)
  {
    case 2uLL:
LABEL_5:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "systemDefaults"));
LABEL_7:
      v14 = v13;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKeyPath:", v8));

      goto LABEL_9;
    case 1uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
      goto LABEL_7;
    case 0uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKeyPath:", v8));

      if (v12)
        goto LABEL_9;
      goto LABEL_5;
  }
  v12 = 0;
LABEL_9:
  v20[0] = CFSTR("namespace");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "namespaceIdentifier"));
  v21[0] = v15;
  v21[1] = v8;
  v20[1] = CFSTR("key");
  v20[2] = CFSTR("value");
  v16 = v12;
  if (!v12)
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
  -[BRCConfigurationManager _executeMonitorWithMessage:data:](self, "_executeMonitorWithMessage:data:", CFSTR("default queried"), v17);

  if (!v12)
  v18 = -[BRCConfigValue initWithObject:]([BRCConfigValue alloc], "initWithObject:", v12);

  return v18;
}

- (id)_namespaceNamed:(id)a3
{
  id v4;
  void *v5;
  BRCNamespaceData *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
  v6 = (BRCNamespaceData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
  {
    v6 = objc_alloc_init(BRCNamespaceData);
    -[BRCNamespaceData setNamespaceIdentifier:](v6, "setNamespaceIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
    objc_msgSend(v7, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (void)_clearSubscribers
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager updateQueue](self, "updateQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_116BE4;
  v4[3] = &unk_28CC18;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_executeMonitorWithMessage:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager monitorCallback](self, "monitorCallback"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager jsBridge](self, "jsBridge"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RemoteConfigMonitor: %@, data = %@"), v6, v7));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager jsBridge](self, "jsBridge"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager monitorCallback](self, "monitorCallback"));
      v21 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      objc_msgSend(v12, "enqueueValueCall:arguments:file:line:", v13, v14, CFSTR("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/RemoteConfig/BRCConfigurationManager.m"), 538);

    }
  }
  if (-[BRCConfigurationManager monitoringEnabled](self, "monitoringEnabled"))
  {
    v15 = BRCConfigLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "RemoteConfigMonitor: %@, data = %@", buf, 0x16u);
    }

  }
}

+ (id)getInstance
{
  return +[BRCConfigurationManager sharedInstance](BRCConfigurationManager, "sharedInstance");
}

- (id)rawValueForKey:(id)a3 fromNamespace:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager valueForKey:fromNamespace:](self, "valueForKey:fromNamespace:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  return v5;
}

- (id)subscribeToKeys:(id)a3 inNamespace:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

  objc_initWeak(&location, self);
  v13 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager updateQueue](self, "updateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_117050;
  block[3] = &unk_28BD80;
  objc_copyWeak(&v27, &location);
  v14 = v12;
  v26 = v14;
  dispatch_sync(v13, block);

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_11709C;
  v23[4] = sub_1170AC;
  v15 = v10;
  v24 = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1170B4;
  v20[3] = &unk_291820;
  v20[4] = self;
  v22 = v23;
  v16 = v14;
  v21 = v16;
  -[BRCConfigurationManager subscribe:toKeys:inNamespace:callback:](self, "subscribe:toKeys:inNamespace:callback:", v16, v8, v9, v20);
  v17 = v21;
  v18 = v16;

  _Block_object_dispose(v23, 8);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v18;
}

- (void)unsubscribe:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager updateQueue](self, "updateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_117388;
  block[3] = &unk_28BD80;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setValue:(id)a3 forKey:(id)a4 inNamespace:(id)a5 source:(unint64_t)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (-[BRCConfigurationManager monitoringEnabled](self, "monitoringEnabled"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
    objc_msgSend(v9, "setOverrideObject:forKey:", v10, v8);

  }
}

- (void)enableMonitoring:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[BRCConfigurationManager monitoringEnabled](self, "monitoringEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager jsBridge](self, "jsBridge"));

    if (v4)
    {
      -[BRCConfigurationManager setMonitorCallback:](self, "setMonitorCallback:", v5);
      -[BRCConfigurationManager _executeMonitorWithMessage:data:](self, "_executeMonitorWithMessage:data:", CFSTR("monitoring callback set."), 0);
    }
  }

}

- (void)disableMonitoring
{
  -[BRCConfigurationManager _executeMonitorWithMessage:data:](self, "_executeMonitorWithMessage:data:", CFSTR("monitoring callback cleared."), 0);
  -[BRCConfigurationManager setMonitorCallback:](self, "setMonitorCallback:", 0);
}

- (void)clearNamespace:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (-[BRCConfigurationManager monitoringEnabled](self, "monitoringEnabled"))
  {
    objc_initWeak(&location, self);
    v5 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager updateQueue](self, "updateQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1175D0;
    block[3] = &unk_28BD80;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)dump:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager data](self, "data"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "systemDefaults"));
    -[BRCConfigurationManager _executeMonitorWithMessage:data:](self, "_executeMonitorWithMessage:data:", CFSTR("system defaults"), v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    -[BRCConfigurationManager _executeMonitorWithMessage:data:](self, "_executeMonitorWithMessage:data:", CFSTR("configured defaults"), v7);

  }
}

- (id)_readFromCacheForNamespace:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager _cacheURLFromNamespace:](self, "_cacheURLFromNamespace:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v6));
  if (v7)
  {
    v14 = 0;
    v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(BRCNamespaceData), v7, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v14;
    if (v10)
    {
      v11 = BRCConfigLog();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1B7A0C();

    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }

  return v9;
}

- (void)_saveToCacheNamespaceData:(id)a3 withNamespace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setNamespaceIdentifier:", v6);
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v17));

  v9 = v17;
  if (!v8)
  {
    v10 = BRCConfigLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B7ACC();

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BRCConfigurationManager _cacheURLFromNamespace:](self, "_cacheURLFromNamespace:", v6));
  v16 = v9;
  objc_msgSend(v8, "writeToURL:options:error:", v12, 1, &v16);
  v13 = v16;

  if (v13)
  {
    v14 = BRCConfigLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1B7A6C();

  }
}

- (id)_cacheURLFromNamespace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v11));
  v6 = v11;

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v3, 0));
  }
  else
  {
    v8 = BRCConfigLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1B7B2C();

    v7 = 0;
  }

  return v7;
}

- (id)jsBridge
{
  return objc_loadWeakRetained(&self->_jsBridge);
}

- (void)setJsBridge:(id)a3
{
  objc_storeWeak(&self->_jsBridge, a3);
}

- (BOOL)configurationLoaded
{
  return self->_configurationLoaded;
}

- (JSValue)monitorCallback
{
  return (JSValue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMonitorCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)data
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (RCConfigurationManager)remoteConfigurationManager
{
  return (RCConfigurationManager *)objc_getProperty(self, a2, 72, 1);
}

- (OS_dispatch_queue)workerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWorkerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OS_dispatch_queue)updateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUpdateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)refreshOnRegister
{
  return self->_refreshOnRegister;
}

- (void)setRefreshOnRegister:(BOOL)a3
{
  self->_refreshOnRegister = a3;
}

- (BOOL)alwaysNotifyOnSubscribe
{
  return self->_alwaysNotifyOnSubscribe;
}

- (void)setAlwaysNotifyOnSubscribe:(BOOL)a3
{
  self->_alwaysNotifyOnSubscribe = a3;
}

- (NSMutableArray)jsSubscribers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setJsSubscribers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)cacheLoaded
{
  return self->_cacheLoaded;
}

- (void)setCacheLoaded:(BOOL)a3
{
  self->_cacheLoaded = a3;
}

- (NSCondition)cacheLoadedCondition
{
  return self->_cacheLoadedCondition;
}

- (void)setCacheLoadedCondition:(id)a3
{
  objc_storeStrong((id *)&self->_cacheLoadedCondition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheLoadedCondition, 0);
  objc_storeStrong((id *)&self->_jsSubscribers, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_remoteConfigurationManager, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_monitorCallback, 0);
  objc_destroyWeak(&self->_jsBridge);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
