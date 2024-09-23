@implementation BKSeriesCoverManager

+ (id)sharedInstance
{
  if (qword_1009F4F08 != -1)
    dispatch_once(&qword_1009F4F08, &stru_1008EA4B0);
  return (id)qword_1009F4F00;
}

- (BKSeriesCoverManager)init
{
  BKSeriesCoverManager *v2;
  BKSeriesCoverManager *v3;
  uint64_t v4;
  NSMutableDictionary *assetIDsAndOptionsForBooksInSeriesCache;
  NSDictionary *map;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *sync;
  dispatch_queue_t v11;
  OS_dispatch_queue *notify;
  NSMutableSet *v13;
  NSMutableSet *changedSeriesIDs;
  uint64_t v15;
  NSMapTable *observers;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  BCManagedObjectIDMonitor *v21;
  BCManagedObjectIDMonitor *seriesMonitor;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)BKSeriesCoverManager;
  v2 = -[BKSeriesCoverManager init](&v26, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    assetIDsAndOptionsForBooksInSeriesCache = v3->_assetIDsAndOptionsForBooksInSeriesCache;
    v3->_assetIDsAndOptionsForBooksInSeriesCache = (NSMutableDictionary *)v4;

    map = v3->_map;
    v3->_map = 0;

    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("BCCoverCache.seriesCoverBooksSync", v8);
    sync = v3->_sync;
    v3->_sync = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("BCCoverCache.seriesCoverBooksNotify", v8);
    notify = v3->_notify;
    v3->_notify = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new(NSMutableSet);
    changedSeriesIDs = v3->_changedSeriesIDs;
    v3->_changedSeriesIDs = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    observers = v3->_observers;
    v3->_observers = (NSMapTable *)v15;

    v17 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "persistentStoreCoordinator"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForContainerLibraryAssets](BKLibraryManager, "predicateForContainerLibraryAssets"));
    v21 = (BCManagedObjectIDMonitor *)objc_msgSend(v17, "initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:", 0, v19, CFSTR("BKLibraryAsset"), v20, CFSTR("assetID"), 0, v3);
    seriesMonitor = v3->_seriesMonitor;
    v3->_seriesMonitor = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    objc_msgSend(v23, "addObserver:", v3);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v24, "addObserver:forKeyPath:options:context:", v3, CFSTR("BKShowAllPurchases"), 1, off_1009CA0F8);

  }
  return v3;
}

- (void)addSeriesCoverObserver:(id)a3
{
  id v4;
  NSObject *notify;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notify = self->_notify;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100063D14;
  v7[3] = &unk_1008E7338;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notify, v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *sync;
  objc_super v7;
  _QWORD block[5];

  if (off_1009CA0F8 == a6)
  {
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DAD54;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_async(sync, block);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKSeriesCoverManager;
    -[BKSeriesCoverManager observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSDictionary *map;
  NSMutableSet *changedSeriesIDs;
  NSMapTable *observers;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("BKShowAllPurchases"), off_1009CA0F8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  dispatch_sync((dispatch_queue_t)self->_sync, &stru_1008EA4D0);
  map = self->_map;
  self->_map = 0;

  changedSeriesIDs = self->_changedSeriesIDs;
  self->_changedSeriesIDs = 0;

  observers = self->_observers;
  self->_observers = 0;

  v8.receiver = self;
  v8.super_class = (Class)BKSeriesCoverManager;
  -[BKSeriesCoverManager dealloc](&v8, "dealloc");
}

- (void)invalidateCacheForSeriesId:(id)a3
{
  id v4;
  void *v5;
  NSObject *sync;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    sync = self->_sync;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DAF08;
    v7[3] = &unk_1008E7338;
    v7[4] = self;
    v8 = v4;
    dispatch_async(sync, v7);

  }
}

- (void)_notifyWithChanges:(id)a3
{
  id v4;
  NSObject *sync;
  id v6;
  _QWORD v7[4];
  id v8;
  BKSeriesCoverManager *v9;

  v4 = a3;
  sync = self->_sync;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DAFB0;
  v7[3] = &unk_1008E7338;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(sync, v7);

}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  -[BKSeriesCoverManager _notifyWithChanges:](self, "_notifyWithChanges:", a4);
}

- (void)_rebuild
{
  NSDictionary *map;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  NSMutableDictionary *v10;
  BKSeriesCoverManager *v11;

  map = self->_map;
  if (map)
    v4 = (NSMutableDictionary *)-[NSDictionary mutableCopy](map, "mutableCopy");
  else
    v4 = objc_opt_new(NSMutableDictionary);
  v5 = v4;
  v6 = -[NSMutableSet copy](self->_changedSeriesIDs, "copy");
  -[NSMutableSet removeAllObjects](self->_changedSeriesIDs, "removeAllObjects");
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DB1B4;
    v8[3] = &unk_1008EA4F8;
    v9 = v6;
    v10 = v5;
    v11 = self;
    objc_msgSend(v7, "performBackgroundReadOnlyBlock:", v8);

  }
}

- (void)assetIDsAndOptionsForBooksInSeries:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  BKSeriesCoverManager *v15;
  id v16;
  _QWORD v17[2];
  void (*v18)(_QWORD *);
  void *v19;
  BKSeriesCoverManager *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10004E380;
  v27 = sub_10004E240;
  v28 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v18 = sub_1000DB808;
  v19 = &unk_1008E99E8;
  v20 = self;
  v22 = &v23;
  v8 = v6;
  v21 = v8;
  v9 = v17;
  os_unfair_lock_lock(&self->_accessLock);
  v18(v9);
  os_unfair_lock_unlock(&self->_accessLock);

  if (objc_msgSend((id)v24[5], "count"))
  {
    v10 = objc_retainBlock(v7);
    v11 = v10;
    if (v10)
      (*((void (**)(id, uint64_t))v10 + 2))(v10, v24[5]);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000DB878;
    v13[3] = &unk_1008E8B20;
    v14 = v8;
    v15 = self;
    v16 = v7;
    objc_msgSend(v12, "performBlockOnWorkerQueue:", v13);

    v11 = v14;
  }

  _Block_object_dispose(&v23, 8);
}

- (id)seriesIDContainingBook:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10004E380;
  v15 = sub_10004E240;
  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DBE2C;
  v8[3] = &unk_1008EA520;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performNamed:workerQueueBlockAndWait:", CFSTR("seriesIDContainingBook"), v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)withBooksInSeries:(id)a3 performBlockAsync:(id)a4
{
  id v6;
  id v7;
  NSObject *sync;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DC068;
  block[3] = &unk_1008E8898;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(sync, block);

}

- (void)removeSeriesCoverObserver:(id)a3
{
  id v4;
  NSObject *notify;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notify = self->_notify;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DC354;
  v7[3] = &unk_1008E7338;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notify, v7);

}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  os_unfair_lock_s *p_accessLock;
  _QWORD v4[5];

  p_accessLock = &self->_accessLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DC3D0;
  v4[3] = &unk_1008E72C0;
  v4[4] = self;
  os_unfair_lock_lock(&self->_accessLock);
  sub_1000DC3D0((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_changedSeriesIDs, 0);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_notify, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_assetIDsAndOptionsForBooksInSeriesCache, 0);
}

@end
