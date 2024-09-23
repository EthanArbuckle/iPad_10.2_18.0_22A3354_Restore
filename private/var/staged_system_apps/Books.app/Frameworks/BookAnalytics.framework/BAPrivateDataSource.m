@implementation BAPrivateDataSource

- (BAPrivateDataSource)init
{
  BAPrivateDataSource *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BAPrivateDataSource;
  v2 = -[BAPrivateDataSource init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("BAPrivateDataSource.workQueue", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_BCCloudSecureUserDataManagerChanged:", BCCloudSecureUserDataManagerChanged, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, BCCloudSecureUserDataManagerChanged, 0);

  v4.receiver = self;
  v4.super_class = (Class)BAPrivateDataSource;
  -[BAPrivateDataSource dealloc](&v4, "dealloc");
}

- (void)_BCCloudSecureUserDataManagerChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[BAPrivateDataSource workQueue](self, "workQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5848;
  block[3] = &unk_265EB0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)fetchPrivateData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAPrivateDataSource workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5EF0;
  v7[3] = &unk_265F28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)fetchPrivateDataForKey:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BDSSecureManager sharedManager](BDSSecureManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userDataManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6234;
  v11[3] = &unk_265F78;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "userDatumForKey:completion:", v10, v11);

}

- (id)generatePrivateData
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];

  v2 = BAPrivateAllKeys();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 138412546;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("userPrivateSeed"), v19, (_QWORD)v20) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("contentPrivateSeed")) & 1) != 0)
        {
          v12 = BAGenerateSeed();
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));

        }
        v15 = BALog();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v19;
          v25 = v11;
          v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "generatePrivateData: key: %@ value: %@", buf, 0x16u);
        }

        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

  v17 = objc_msgSend(v4, "copy");
  return v17;
}

- (void)syncPrivateData:(id)a3 toCloudWithCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BAPrivateDataSource *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAPrivateDataSource workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6828;
  block[3] = &unk_266018;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BAPrivateDataSourceDelegate)delegate
{
  return (BAPrivateDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
