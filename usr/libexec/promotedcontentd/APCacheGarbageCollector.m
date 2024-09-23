@implementation APCacheGarbageCollector

- (APCacheGarbageCollector)initWithCacheStore:(id)a3 expirationDate:(id)a4 timeSincePrevLaunch:(double)a5
{
  id v9;
  id v10;
  APCacheGarbageCollector *v11;
  APCacheGarbageCollector *v12;
  NSOperationQueue *v13;
  NSOperationQueue *operationQueue;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)APCacheGarbageCollector;
  v11 = -[APCacheGarbageCollector init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cacheStore, a3);
    v13 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v12->_operationQueue;
    v12->_operationQueue = v13;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v12->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v12->_operationQueue, "setName:", CFSTR("com.apple.ap.cache-cleaner"));
    -[NSOperationQueue setQualityOfService:](v12->_operationQueue, "setQualityOfService:", 9);
    objc_storeStrong((id *)&v12->_expirationDate, a4);
    v12->_timeSincePrevLaunch = a5;
  }

  return v12;
}

- (void)collect
{
  void *v3;
  void *v4;
  void *v5;
  APCacheStoreCleanupOperation *v6;
  void *v7;
  APCacheStoreCleanupOperation *v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  APCacheStoreCleanupOperation *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  APCacheStoreCleanupOperation *v21;
  id v22;
  id v23;
  id buf;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheGarbageCollector cacheStore](self, "cacheStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorForFilesWithExtension:", 0));

  atomic_store(0, &self->_removedObjectsCount);
  atomic_store(0, &self->_ancientObjectsCount);
  v6 = [APCacheStoreCleanupOperation alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheGarbageCollector expirationDate](self, "expirationDate"));
  v8 = -[APCacheStoreCleanupOperation initWithFilesEnumerator:expirationDate:](v6, "initWithFilesEnumerator:expirationDate:", v5, v7);

  -[APCacheStoreCleanupOperation maxObjectLifetime](v8, "maxObjectLifetime");
  if (v9 <= 0.0)
  {
    v10 = APLogForCategory(33);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Max object lifetime is zero.", (uint8_t *)&buf, 2u);
    }

  }
  -[APCacheStoreCleanupOperation maxObjectLifetime](v8, "maxObjectLifetime");
  -[APCacheGarbageCollector setMaxObjectLifeTimeDays:](self, "setMaxObjectLifeTimeDays:", (uint64_t)(v12 / 86400.0));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100165EC4;
  v26[3] = &unk_100218658;
  v26[4] = self;
  -[APCacheStoreCleanupOperation setRemovalBlock:](v8, "setRemovalBlock:", v26);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100165F08;
  v25[3] = &unk_100218658;
  v25[4] = self;
  -[APCacheStoreCleanupOperation setAncientItemBlock:](v8, "setAncientItemBlock:", v25);
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileStorage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getStorageInfo"));

  }
  else
  {
    v14 = 0;
  }
  objc_initWeak(&buf, self);
  v15 = objc_alloc_init((Class)NSBlockOperation);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100165F4C;
  v20[3] = &unk_10020DF88;
  objc_copyWeak(&v23, &buf);
  v16 = v8;
  v21 = v16;
  v17 = v14;
  v22 = v17;
  objc_msgSend(v15, "addExecutionBlock:", v20);
  -[APCacheGarbageCollector setActiveCleanupOperation:](self, "setActiveCleanupOperation:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheGarbageCollector operationQueue](self, "operationQueue"));
  v27[0] = v16;
  v27[1] = v15;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
  objc_msgSend(v18, "addOperations:waitUntilFinished:", v19, 0);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&buf);

}

- (void)stop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[APCacheGarbageCollector activeCleanupOperation](self, "activeCleanupOperation"));
  objc_msgSend(v2, "cancel");

}

- (void)_handleAncientItem:(id)a3
{
  id v4;
  unsigned int *p_ancientObjectsCount;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;

  v4 = a3;
  p_ancientObjectsCount = &self->_ancientObjectsCount;
  do
    v6 = __ldaxr(p_ancientObjectsCount);
  while (__stlxr(v6 + 1, p_ancientObjectsCount));
  v7 = APLogForCategory(33);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138543618;
    v10 = v4;
    v11 = 2050;
    v12 = -[APCacheGarbageCollector maxObjectLifeTimeDays](self, "maxObjectLifeTimeDays");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Found an item '%{public}@' which is older than %{public}ld days.", (uint8_t *)&v9, 0x16u);
  }

}

- (void)_removeItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheGarbageCollector cacheStore](self, "cacheStore"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001662A8;
  v7[3] = &unk_100213F40;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "executeBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_removeItemInBlockForKey:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  unsigned int *p_removedObjectsCount;
  unsigned int v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  uint8_t v22[24];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheGarbageCollector cacheStore](self, "cacheStore"));
  v6 = objc_msgSend(v5, "isObjectAliveForKey:", v4);

  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheGarbageCollector cacheStore](self, "cacheStore"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v4));

    v10 = (unint64_t)-[NSObject garbageCollect](v8, "garbageCollect");
    if ((v10 & 0x8000000000000000) != 0)
    {
      v17 = APLogForCategory(33);
      v13 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v22 = 138543362;
        *(_QWORD *)&v22[4] = v4;
        v18 = "Failed to garbage collect object '%{public}@'.";
        v19 = v13;
        v20 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, v22, 0xCu);
      }
    }
    else
    {
      v11 = v10;
      v12 = APLogForCategory(33);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v14)
        {
          *(_DWORD *)v22 = 138543362;
          *(_QWORD *)&v22[4] = v4;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Successfully garbage collected object '%{public}@'.", v22, 0xCu);
        }

        p_removedObjectsCount = &self->_removedObjectsCount;
        do
          v16 = __ldaxr(p_removedObjectsCount);
        while (__stlxr(v16 + v11, p_removedObjectsCount));
        goto LABEL_17;
      }
      if (v14)
      {
        *(_DWORD *)v22 = 138543362;
        *(_QWORD *)&v22[4] = v4;
        v18 = "Skipped a GC candidate '%{public}@' because it can be in use or has related object.";
        v19 = v13;
        v20 = OS_LOG_TYPE_INFO;
        goto LABEL_15;
      }
    }

LABEL_17:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheGarbageCollector cacheStore](self, "cacheStore", *(_OWORD *)v22));
    objc_msgSend(v21, "evictObjectFromMemoryCacheForKey:", v4);

    goto LABEL_18;
  }
  v7 = APLogForCategory(33);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v22 = 138543362;
    *(_QWORD *)&v22[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Skipping a GC candidate '%{public}@' because it can be in use.", v22, 0xCu);
  }
LABEL_18:

}

- (void)_reportStatisticsForDuration:(double)a3 storageInfo:(id)a4 cancelled:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  unsigned int v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[8];
  _QWORD v25[8];

  v5 = a5;
  v8 = a4;
  v9 = +[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall");
  if (v8 && v9)
  {
    if (objc_msgSend(v8, "allocatedSize"))
    {
      v10 = (float)(unint64_t)objc_msgSend(v8, "totalSize");
      v11 = 1.0 - (float)(v10 / (float)(unint64_t)objc_msgSend(v8, "allocatedSize"));
    }
    else
    {
      v11 = 0.0;
    }
    -[APCacheGarbageCollector timeSincePrevLaunch](self, "timeSincePrevLaunch", CFSTR("Interval"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v25[0] = v12;
    v24[1] = CFSTR("Duration");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v25[1] = v13;
    v24[2] = CFSTR("Cancelled");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    v25[2] = v14;
    v24[3] = CFSTR("TotalFiles");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "filesCount")));
    v25[3] = v15;
    v24[4] = CFSTR("TotalSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "totalSize")));
    v25[4] = v16;
    v24[5] = CFSTR("Fragmentation");
    *(float *)&v17 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
    v25[5] = v18;
    v24[6] = CFSTR("RemovedFiles");
    v19 = atomic_load(&self->_removedObjectsCount);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v19));
    v25[6] = v20;
    v24[7] = CFSTR("AncientFiles");
    v21 = atomic_load(&self->_ancientObjectsCount);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v21));
    v25[7] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 8));

    +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("gc"), v23);
  }

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (APPersistentCachedStoreTransactionalProtocol)cacheStore
{
  return self->_cacheStore;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSString)objectKind
{
  return self->_objectKind;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (int64_t)maxObjectLifeTimeDays
{
  return self->_maxObjectLifeTimeDays;
}

- (void)setMaxObjectLifeTimeDays:(int64_t)a3
{
  self->_maxObjectLifeTimeDays = a3;
}

- (NSOperation)activeCleanupOperation
{
  return (NSOperation *)objc_loadWeakRetained((id *)&self->_activeCleanupOperation);
}

- (void)setActiveCleanupOperation:(id)a3
{
  objc_storeWeak((id *)&self->_activeCleanupOperation, a3);
}

- (double)timeSincePrevLaunch
{
  return self->_timeSincePrevLaunch;
}

- (void)setTimeSincePrevLaunch:(double)a3
{
  self->_timeSincePrevLaunch = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeCleanupOperation);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_objectKind, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_cacheStore, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
