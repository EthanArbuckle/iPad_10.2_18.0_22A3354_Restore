@implementation FTContentPrefetchManager

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v2 = FCURLForLegacyWidgetReferralItems();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v4, "removeItemAtURL:error:", v3, 0);

}

- (FTContentPrefetchManager)init
{
  FTContentPrefetchManager *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  FCAssetManager *v8;
  FCAssetManager *assetManager;
  FCAssetManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FTContentPrefetchManager;
  v2 = -[FTContentPrefetchManager init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)FCAssetManager);
    v4 = FCURLForContainerizedUserAccountCachesDirectory(1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability"));
    v8 = (FCAssetManager *)objc_msgSend(v3, "initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:networkReachability:", CFSTR("widget-assets"), v6, 0, 0, 0, 0, v7);

    assetManager = v2->_assetManager;
    v2->_assetManager = v8;
    v10 = v8;

    -[FCAssetManager enableFlushingWithFlushingThreshold:](v10, "enableFlushingWithFlushingThreshold:", 1);
  }
  return v2;
}

- (void)prefetchContentForHeadlines:(id)a3 withQualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSMutableDictionary *v25;
  id v26;
  id v28;
  _QWORD block[5];
  NSMutableDictionary *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  void *v35;
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;

  v6 = a3;
  v28 = a5;
  v7 = PrefetchLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v43 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "prefetching content for %zd headlines", buf, 0xCu);
  }

  v9 = objc_opt_new(NSMutableDictionary);
  v10 = dispatch_group_create();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "flintDocumentURL"));
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[FTContentPrefetchManager assetManager](self, "assetManager"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetHandleForCKAssetURL:lifetimeHint:", v17, 0));

          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v19, v17);
          dispatch_group_enter(v10);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10000FEE4;
          v33[3] = &unk_1000C6D90;
          v34 = v19;
          v35 = v16;
          v36 = v10;
          v20 = v19;
          v21 = objc_msgSend(v20, "downloadIfNeededWithCompletion:", v33);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v13);
  }
  v22 = v11;

  v23 = FCDispatchQueueForQualityOfService(a4);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FFE8;
  block[3] = &unk_1000C6DE0;
  v31 = v9;
  v32 = v28;
  block[4] = self;
  v25 = v9;
  v26 = v28;
  dispatch_group_notify(v10, v24, block);

}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end
