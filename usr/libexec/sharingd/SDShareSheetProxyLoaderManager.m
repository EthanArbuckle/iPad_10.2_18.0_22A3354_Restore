@implementation SDShareSheetProxyLoaderManager

- (SDShareSheetProxyLoaderManager)initWithSessionIdentifier:(id)a3
{
  id v4;
  SDShareSheetProxyLoaderManager *v5;
  NSString *v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  NSMutableArray *loaders;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *loadingQueue;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *publishingQueue;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SDShareSheetProxyLoaderManager;
  v5 = -[SDShareSheetProxyLoaderManager init](&v19, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    loaders = v5->_loaders;
    v5->_loaders = (NSMutableArray *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.sharingd.sharesheet.proxyLoaderManager.loadingQueue", v11);
    loadingQueue = v5->_loadingQueue;
    v5->_loadingQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("com.apple.sharingd.sharesheet.proxyLoaderManager.publishingQueue", v15);
    publishingQueue = v5->_publishingQueue;
    v5->_publishingQueue = (OS_dispatch_queue *)v16;

  }
  return v5;
}

- (void)loadProxySection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  SDShareSheetProxyLoader *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  SDShareSheetProxyLoader *v15;
  _QWORD v16[4];
  SDShareSheetProxyLoader *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  SDShareSheetProxyLoader *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderManager _existingLoaderForSectionType:](self, "_existingLoaderForSectionType:", objc_msgSend(v4, "type")));
  if (v5)
  {
    v6 = share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cancelling existing loader with same type:%@", buf, 0xCu);
    }

    objc_msgSend(v5, "cancel");
  }
  v8 = -[SDShareSheetProxyLoader initWithProxySection:]([SDShareSheetProxyLoader alloc], "initWithProxySection:", v4);
  -[SDShareSheetProxyLoader setDelegate:](v8, "setDelegate:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderManager loaders](self, "loaders"));
  objc_msgSend(v9, "addObject:", v8);

  v10 = objc_msgSend(v4, "initialBatchSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v12 = objc_msgSend(v11, "asynchronousProxyLoadingEnabled");

  v13 = share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v20 = v10;
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "new proxy loader with initial batch size:%ld %@", buf, 0x16u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10016B910;
  v16[3] = &unk_100716108;
  v17 = v8;
  v18 = v10;
  v15 = v8;
  -[SDShareSheetProxyLoaderManager _scheduleLoadingBlock:synchronously:](self, "_scheduleLoadingBlock:synchronously:", v16, (v10 != 0) & ~v12);

}

- (id)_existingLoaderForSectionType:(int64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderManager loaders](self, "loaders", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "proxySection"));
        v11 = objc_msgSend(v10, "type");

        if (v11 == (id)a3)
        {
          v12 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)_scheduleLoadingBlock:(id)a3 synchronously:(BOOL)a4
{
  NSObject *loadingQueue;

  loadingQueue = self->_loadingQueue;
  if (a4)
    dispatch_sync(loadingQueue, a3);
  else
    dispatch_async(loadingQueue, a3);
}

- (void)_didFinishLoadingLoader:(id)a3 cancelled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;

  v4 = a4;
  v6 = a3;
  v7 = share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromBOOL(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v18 = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "did finish loading all proxies from loader:%@ cancelled:%@", (uint8_t *)&v18, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderManager loaders](self, "loaders"));
  v12 = objc_msgSend(v11, "indexOfObject:", v6);

  v13 = share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10016BF48((uint64_t)v6, v15);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "remove proxy loader%@", (uint8_t *)&v18, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderManager loaders](self, "loaders"));
    objc_msgSend(v16, "removeObject:", v6);

    v15 = objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderManager delegate](self, "delegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "proxySection"));
    -[NSObject proxyLoaderManagerDidFinishLoadingProxySection:cancelled:](v15, "proxyLoaderManagerDidFinishLoadingProxySection:cancelled:", v17, v4);

  }
}

- (void)proxyLoader:(id)a3 didLoadProxiesWithResult:(id)a4
{
  id v6;
  id v7;
  NSObject *publishingQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SDShareSheetProxyLoaderManager *v14;

  v6 = a3;
  v7 = a4;
  publishingQueue = self->_publishingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016BCDC;
  block[3] = &unk_100715138;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(publishingQueue, block);

}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (SDShareSheetProxyLoaderManagerDelegate)delegate
{
  return (SDShareSheetProxyLoaderManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)loaders
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLoaders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (void)setLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loadingQueue, a3);
}

- (OS_dispatch_queue)publishingQueue
{
  return self->_publishingQueue;
}

- (void)setPublishingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_publishingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishingQueue, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_loaders, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
