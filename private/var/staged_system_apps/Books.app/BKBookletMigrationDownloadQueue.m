@implementation BKBookletMigrationDownloadQueue

- (void)setObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100063D68;
  v5[3] = &unk_1008E7338;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_100063D68((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

}

- (BKBookletMigrationDownloadQueue)initWithStore:(id)a3
{
  id v5;
  BKBookletMigrationDownloadQueue *v6;
  BKBookletMigrationDownloadQueue *v7;
  NSMutableArray *v8;
  NSMutableArray *pendingItems;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workQueue;
  BKBookletMigrationDownloadQueueObserver *observer;
  id v17;
  BUCoalescingCallBlock *v18;
  BUCoalescingCallBlock *coalescingProcessNextBatch;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id location;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BKBookletMigrationDownloadQueue;
  v6 = -[BKBookletMigrationDownloadQueue init](&v27, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingItems = v7->_pendingItems;
    v7->_pendingItems = v8;

    v7->_accessLock._os_unfair_lock_opaque = 0;
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);

    v14 = dispatch_queue_create("BKBookletMigrationDownloadQueue.workQueue", v13);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v14;

    observer = v7->_observer;
    v7->_observer = 0;

    objc_initWeak(&location, v7);
    v17 = objc_alloc((Class)BUCoalescingCallBlock);
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_10011D7EC;
    v24 = &unk_1008E8718;
    objc_copyWeak(&v25, &location);
    v18 = (BUCoalescingCallBlock *)objc_msgSend(v17, "initWithNotifyBlock:blockDescription:", &v21, CFSTR("BKBookletMigrationDownloadQueue.processNextBatch"));
    coalescingProcessNextBatch = v7->_coalescingProcessNextBatch;
    v7->_coalescingProcessNextBatch = v18;

    -[BUCoalescingCallBlock setCoalescingDelay:](v7->_coalescingProcessNextBatch, "setCoalescingDelay:", 60.0, v21, v22, v23, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v7;
}

- (unint64_t)_batchSize
{
  return 5;
}

- (BKBookletMigrationDownloadQueueObserver)observer
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  BKBookletMigrationDownloadQueue *v9;
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
  v14 = sub_10004E428;
  v15 = sub_10004E288;
  v16 = 0;
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_10011D928;
  v8 = &unk_1008E75B8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_accessLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (BKBookletMigrationDownloadQueueObserver *)v4;
}

- (void)enqueueDownloads:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  BKBookletMigrationDownloadQueue *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  __int128 *p_buf;
  uint8_t v37[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint8_t v43[128];
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v28 = self;
  v3 = a3;
  v6 = BKBookletMigrationLog(v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "enqueueDownloads: storeIDs: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v3)
    v8 = v3;
  else
    v8 = &__NSArray0__struct;
  v29 = v8;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v29));
  v10 = objc_msgSend(v9, "mutableCopy");

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3032000000;
  v46 = sub_10004E428;
  v47 = sub_10004E288;
  v48 = &__NSArray0__struct;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationDownloadQueue store](v28, "store"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10011DCEC;
  v34[3] = &unk_1008EB848;
  v12 = v10;
  v35 = v12;
  p_buf = &buf;
  objc_msgSend(v11, "migrationItemsWithStoreIDStrings:completion:", v12, v34);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storeIDString", v28));
        v21 = BKBookletMigrationLog(v18, v19, v20);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v17, "migrationState")));
          *(_DWORD *)v37 = 141558530;
          v38 = 1752392040;
          v39 = 2112;
          v40 = v18;
          v41 = 2114;
          v42 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "enqueueDownloads: Skipping existing item - storeID: %{mask.hash}@, state: %{public}@", v37, 0x20u);

        }
        objc_msgSend(v12, "removeObject:", v18);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v12, "count"))
  {
    -[BKBookletMigrationDownloadQueue _setMigrationState:forStoreIDStrings:logPrefix:](v28, "_setMigrationState:forStoreIDStrings:logPrefix:", 100, v12, CFSTR("enqueueDownloads"));
  }
  else
  {
    v26 = BKBookletMigrationLog(0, v24, v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "enqueueDownloads: Nothing to enqueue", v37, 2u);
    }

  }
  _Block_object_dispose(&buf, 8);

}

- (void)reloadFromStore
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  BKBookletMigrationDownloadQueue *v16;
  uint8_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[6];
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = BKBookletMigrationLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "reloadFromStore", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = sub_10004E428;
  v28 = sub_10004E288;
  v29 = &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationDownloadQueue store](self, "store"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10011DFC4;
  v23[3] = &unk_1008EB870;
  v23[4] = buf;
  v23[5] = 100;
  objc_msgSend(v5, "migrationItemsWithState:completion:", 100, v23);

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v14 = sub_10011E080;
  v15 = &unk_1008E8A80;
  v16 = self;
  v17 = buf;
  v18 = &v19;
  v6 = v13;
  os_unfair_lock_lock(&self->_accessLock);
  v14((uint64_t)v6);
  os_unfair_lock_unlock(&self->_accessLock);

  if (*((_BYTE *)v20 + 24))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationDownloadQueue coalescingProcessNextBatch](self, "coalescingProcessNextBatch"));
    objc_msgSend(v9, "signalWithCompletion:", &stru_1008EB890);

  }
  else
  {
    v10 = BKBookletMigrationLog(v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "reloadFromStore: Pending queue is empty", v12, 2u);
    }

    -[BKBookletMigrationDownloadQueue _notifyDidBecomeEmpty](self, "_notifyDidBecomeEmpty");
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(buf, 8);

}

- (BOOL)_hasPendingItems
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v3;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  BKBookletMigrationDownloadQueue *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v6 = sub_10011E1CC;
  v7 = &unk_1008E75B8;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock(p_accessLock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  LOBYTE(p_accessLock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_accessLock;
}

- (void)_processNextBatchWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint8_t v11[16];
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  BKBookletMigrationDownloadQueue *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10004E428;
  v21 = sub_10004E288;
  v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_10011E3A4;
  v14 = &unk_1008E76D0;
  v15 = self;
  v16 = &v17;
  v5 = v12;
  os_unfair_lock_lock(&self->_accessLock);
  v13((uint64_t)v5);
  os_unfair_lock_unlock(&self->_accessLock);

  if (objc_msgSend((id)v18[5], "count"))
  {
    -[BKBookletMigrationDownloadQueue _triggerDownloads:](self, "_triggerDownloads:", v18[5]);
  }
  else
  {
    v7 = BKBookletMigrationLog(0, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_processNextBatchWithCompletion: Pending queue is empty", v11, 2u);
    }

    -[BKBookletMigrationDownloadQueue _notifyDidBecomeEmpty](self, "_notifyDidBecomeEmpty");
  }
  v9 = objc_retainBlock(v4);
  v10 = v9;
  if (v9)
    (*((void (**)(id))v9 + 2))(v9);

  _Block_object_dispose(&v17, 8);
}

- (void)_triggerDownloads:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *workQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  BKBookletMigrationDownloadQueue *v17;
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;

  v4 = a3;
  v6 = BKBookletMigrationLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_triggerDownloads: %@", buf, 0xCu);
  }

  v8 = dispatch_group_create();
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  v10 = objc_msgSend(v9, "mutableCopy");

  if (objc_msgSend(v4, "count"))
  {
    dispatch_group_enter(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10011E660;
    v19[3] = &unk_1008E8B98;
    v20 = v8;
    v21 = v10;
    v22 = v11;
    v12 = v11;
    objc_msgSend(v12, "fetchLibraryAssetsFromStoreIDs:handler:", v4, v19);

  }
  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011EC60;
  v15[3] = &unk_1008EA728;
  v16 = v10;
  v17 = self;
  v14 = v10;
  objc_copyWeak(&v18, (id *)buf);
  dispatch_group_notify(v8, workQueue, v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak((id *)buf);
}

- (void)_notifyDidBecomeEmpty
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationDownloadQueue observer](self, "observer"));
  objc_msgSend(v2, "bookletMigrationDownloadQueueDidBecomeEmpty");

}

- (void)_setMigrationState:(int64_t)a3 forStoreIDStrings:(id)a4 logPrefix:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationDownloadQueue store](self, "store"));
  v20 = 0;
  v11 = objc_msgSend(v10, "setMigrationState:forStoreIDStrings:error:", a3, v8, &v20);
  v12 = v20;

  v15 = BKBookletMigrationLog(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (!v11)
  {
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    *(_DWORD *)buf = 138544130;
    v22 = v9;
    v23 = 2114;
    v24 = v19;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Error setting migrationState to %{public}@, storeIDs: %@, error: %@", buf, 0x2Au);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v8, "count");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    *(_DWORD *)buf = 138544130;
    v22 = v9;
    v23 = 2048;
    v24 = v18;
    v25 = 2114;
    v26 = v19;
    v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated migrationState of %lu items to %{public}@, storeIDs: %@", buf, 0x2Au);
LABEL_4:

  }
LABEL_6:

}

- (BKBookletMigrationStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSMutableArray)pendingItems
{
  return self->_pendingItems;
}

- (void)setPendingItems:(id)a3
{
  objc_storeStrong((id *)&self->_pendingItems, a3);
}

- (BUCoalescingCallBlock)coalescingProcessNextBatch
{
  return self->_coalescingProcessNextBatch;
}

- (void)setCoalescingProcessNextBatch:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingProcessNextBatch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingProcessNextBatch, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
