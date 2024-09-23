@implementation BKCoverCacheURLSchemeHandler

- (BKCoverCacheURLSchemeHandler)init
{
  BKCoverCacheURLSchemeHandler *v2;
  BKCoverCacheURLSchemeHandler *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *scheduleQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *completionQueue;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *concurrentTasks;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BKCoverCacheURLSchemeHandler;
  v2 = -[BKCoverCacheURLSchemeHandler init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);

    v8 = dispatch_queue_create("BKCoverCacheURLSchemeHandler.schedule", v7);
    scheduleQueue = v3->_scheduleQueue;
    v3->_scheduleQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("BKCoverCacheURLSchemeHandler.completion", v7);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_semaphore_create(16);
    concurrentTasks = v3->_concurrentTasks;
    v3->_concurrentTasks = (OS_dispatch_semaphore *)v12;

  }
  return v3;
}

+ (id)urlStringForAssetID:(id)a3 dataSourceID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[0] = a3;
  v11[1] = a4;
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR("#item#")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("datasource://assetID-"), "stringByAppendingString:", v8));

  return v9;
}

- (void)fetchCoverForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("datasource://assetID-")))
    -[BKCoverCacheURLSchemeHandler _fetchCoverForDataSourceURL:completion:](self, "_fetchCoverForDataSourceURL:completion:", v7, v6);

}

- (void)_fetchCoverForDataSourceURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  BKCoverCacheURLSchemeHandler *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("datasource://assetID-"), &stru_10091C438));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("#item#")));

  if (objc_msgSend(v9, "count"))
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
  else
    v10 = 0;
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataSourceWithIdentifier:", v11));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100160B98;
  v20[3] = &unk_1008EC6C8;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v22 = v10;
  v23 = self;
  v24 = v11;
  v26 = v6;
  v27 = v7;
  v25 = v13;
  v14 = v6;
  v15 = v13;
  v16 = v7;
  v17 = v11;
  v18 = v10;
  v19 = v21;
  objc_msgSend(v19, "performBackgroundReadOnlyBlock:", v20);

}

- (BOOL)canFetchCoverForURL:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("datasource://assetID-"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentTasks, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_scheduleQueue, 0);
}

@end
