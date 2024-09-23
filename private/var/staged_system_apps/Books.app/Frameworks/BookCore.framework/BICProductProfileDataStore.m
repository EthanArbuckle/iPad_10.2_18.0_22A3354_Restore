@implementation BICProductProfileDataStore

- (BICProductProfileDataStore)initWithCachePath:(id)a3
{
  BICProductProfileDataStore *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *completionQ;
  uint64_t v20;
  BICWorkQueue *workQueue;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)BICProductProfileDataStore;
  v3 = -[BICProductProfileDataStore init](&v23, "init", a3);
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("ProductProfileDataStore", v7);

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("ProductProfileDataStore", v12);

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create("ProductProfileCompletion", v17);
    completionQ = v3->_completionQ;
    v3->_completionQ = (OS_dispatch_queue *)v18;

    v20 = objc_claimAutoreleasedReturnValue(+[BICWorkQueue workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:](BICWorkQueue, "workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:", v8, v13, 16));
    workQueue = v3->_workQueue;
    v3->_workQueue = (BICWorkQueue *)v20;

    -[BICWorkQueue setIdentifier:](v3->_workQueue, "setIdentifier:", CFSTR("ProductProfileDataStore"));
    -[BICWorkQueue setManualCompletion:](v3->_workQueue, "setManualCompletion:", 1);

  }
  return v3;
}

- (signed)storingMedium
{
  return 2;
}

- (BOOL)canStoreDescribedImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "adamID"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "adamID"));
    v6 = objc_msgSend(v5, "integerValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = objc_retainBlock(a4);
  v6 = v5;
  if (v5)
    (*((void (**)(id, id))v5 + 2))(v5, v7);

}

- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithPriority:](BICDescribedImage, "describedImageWithPriority:", 3));
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICProductProfileDataStore workQueue](self, "workQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_FFF3C;
  v8[3] = &unk_2902A0;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "addWorkItemWithPriority:description:block:", v5, CFSTR("ProfileDataStore after all ops"), v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataStoreInformation"));
  if (v11)
  {
    objc_initWeak(&location, self);
    +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationProfileDownloadQueueStart[0], v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICProductProfileDataStore workQueue](self, "workQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10018C;
    v15[3] = &unk_291220;
    objc_copyWeak(&v19, &location);
    v16 = v9;
    v17 = v11;
    v18 = v10;
    objc_msgSend(v12, "addWorkItemWithPriority:description:block:", v16, CFSTR("ProfileDataStore read"), v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = objc_retainBlock(v10);
    v14 = v13;
    if (v13)
      (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);

  }
}

- (id)imageForEntryLocation:(id)a3
{
  return 0;
}

- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5
{
  id v6;
  void (**v7)(id, id, void *);
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = (void (**)(id, id, void *))a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageDescription"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "adamID"));
        objc_msgSend(v12, "setStoredData:", v14);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  v7[2](v7, v6, &__NSArray0__struct);

}

- (int64_t)costFor:(signed __int16)a3
{
  return 0;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, void *))v5 + 2))(v5, &__NSArray0__struct);
    v5 = v6;
  }

}

- (void)_clean:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (BICDataStoringDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->delegate, a3);
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BICWorkQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)completionQ
{
  return self->_completionQ;
}

- (void)setCompletionQ:(id)a3
{
  objc_storeStrong((id *)&self->_completionQ, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQ, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

@end
