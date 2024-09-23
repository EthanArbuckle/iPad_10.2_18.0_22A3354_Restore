@implementation FMDAccessoryRegistry

+ (id)defaultStorageLocation
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)FMInternalFileContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_preferencesPathURLForDomain:", CFSTR("com.apple.icloud.findmydeviced.accessories")));

  return v4;
}

- (FMDAccessoryRegistry)initWithSupportDelete:(id)a3
{
  id v4;
  FMDAccessoryRegistry *v5;
  FMDAccessoryRegistry *v6;
  dispatch_queue_t v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_queue_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FMDAccessoryRegistry;
  v5 = -[FMDAccessoryRegistry init](&v24, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDAccessoryRegistry setDataSourceErrorBackoffCount:](v5, "setDataSourceErrorBackoffCount:", 0);
    v7 = dispatch_queue_create("com.apple.icloud.findmydeviced.accessoryqueue", 0);
    -[FMDAccessoryRegistry setAccessoryQueue:](v6, "setAccessoryQueue:", v7);

    v8 = objc_opt_new(NSDictionary);
    -[FMDAccessoryRegistry setAccessoriesByIdentifier:](v6, "setAccessoriesByIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    -[FMDAccessoryRegistry setDelegates:](v6, "setDelegates:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[FMDAccessoryRegistry setDataSources:](v6, "setDataSources:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[FMDAccessoryRegistry setConnectedAccessoryIdentifiers:](v6, "setConnectedAccessoryIdentifiers:", v11);

    v12 = dispatch_queue_create("com.apple.icloud.findmydeviced.delegate", 0);
    -[FMDAccessoryRegistry setDelegateQueue:](v6, "setDelegateQueue:", v12);

    v13 = objc_alloc((Class)FMDataArchiver);
    v15 = objc_msgSend((id)objc_opt_class(v6, v14), "defaultStorageLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v13, "initWithFileURL:", v16);
    -[FMDAccessoryRegistry setDataArchiver:](v6, "setDataArchiver:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry dataArchiver](v6, "dataArchiver"));
    objc_msgSend(v18, "setDataProtectionClass:", 4);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry dataArchiver](v6, "dataArchiver"));
    objc_msgSend(v19, "setBackedUp:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry dataArchiver](v6, "dataArchiver"));
    objc_msgSend(v20, "setCreateDirectories:", 1);

    -[FMDAccessoryRegistry setSupportDelegate:](v6, "setSupportDelegate:", v4);
    -[FMDAccessoryRegistry readAccessoriesFromDisk](v6, "readAccessoriesFromDisk");
    v21 = sub_1000031B8();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      sub_100229A5C(v22);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry dataSourceRetryTimer](self, "dataSourceRetryTimer"));
  objc_msgSend(v3, "cancel");

  -[FMDAccessoryRegistry setDataSourceRetryTimer:](self, "setDataSourceRetryTimer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)FMDAccessoryRegistry;
  -[FMDAccessoryRegistry dealloc](&v4, "dealloc");
}

- (void)registerDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FMDAccessoryRegistry *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry delegateQueue](self, "delegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100060124;
  v7[3] = &unk_1002C13E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)clearAccessoryRegistry
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000601F4;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)updateAccessory:(id)a3 assets:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000603CC;
  v11[3] = &unk_1002C21C8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)updateAccessory:(id)a3 playbackChannels:(id)a4
{
  -[FMDAccessoryRegistry updateAccessory:playbackChannels:completion:](self, "updateAccessory:playbackChannels:completion:", a3, a4, &stru_1002C39B0);
}

- (void)updateAccessory:(id)a3 playbackChannels:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060778;
  block[3] = &unk_1002C3A00;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)addDataSources:(id)a3
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
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060A24;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  dispatch_async(v5, block);

  -[FMDAccessoryRegistry reloadData](self, "reloadData");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)addDataSource:(id)a3
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
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060B64;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  dispatch_async(v5, block);

  -[FMDAccessoryRegistry reloadData](self, "reloadData");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)reloadData
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100060C64;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  int v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v16.receiver = self;
  v16.super_class = (Class)FMDAccessoryRegistry;
  if (-[FMDAccessoryRegistry respondsToSelector:](&v16, "respondsToSelector:"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry registeredDelegates](self, "registeredDelegates"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v5 |= objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), a3);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];

  v19.receiver = self;
  v19.super_class = (Class)FMDAccessoryRegistry;
  v5 = -[FMDAccessoryRegistry methodSignatureForSelector:](&v19, "methodSignatureForSelector:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry registeredDelegates](self, "registeredDelegates"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v6 = 0;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v12, a3) & 1) != 0)
          {
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "methodSignatureForSelector:", a3));

            v6 = (void *)v13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry registeredDelegates](self, "registeredDelegates"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v7 = 138412290;
    v14 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        if ((objc_opt_respondsToSelector(v11, objc_msgSend(v4, "selector", v14)) & 1) != 0)
        {
          v12 = sub_1000031B8();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry forwardInvocation to delegate %@", buf, 0xCu);
          }

          objc_msgSend(v4, "invokeWithTarget:", v11);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

}

- (id)registeredDelegates
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10006119C;
  v11 = sub_1000611AC;
  v12 = &__NSArray0__struct;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry delegateQueue](self, "delegateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000611B4;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)accessories:(id)a3
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
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000612F0;
  block[3] = &unk_1002C1CF8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)computeAccessoryRegistry
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  id v19;
  NSObject *v20;
  double v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  FMDAccessoryRegistry *v31;
  _QWORD v32[4];
  id v33;
  id location;
  _QWORD v35[4];
  NSObject *v36;
  FMDAccessoryRegistry *v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  id v45;
  uint8_t buf[8];
  _QWORD v47[4];
  id v48;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v5 = objc_msgSend(v4, "unlockState");

  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 == (id)1)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry skipping computeAccessoryRegistry before first unlock", buf, 2u);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry computeAccessoryRegistry", buf, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry dataSourceRetryTimer](self, "dataSourceRetryTimer"));
    objc_msgSend(v9, "cancel");

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = objc_msgSend(objc_alloc((Class)FMSynchronizer), "initWithDescription:andTimeout:", CFSTR("FMDAccessoryRegistryAllAccessories"), 5.0);
    *(_QWORD *)buf = 0;
    v47[0] = buf;
    v47[1] = 0x3032000000;
    v47[2] = sub_10006119C;
    v47[3] = sub_1000611AC;
    v48 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry dataSources](self, "dataSources"));
    v14 = objc_msgSend(v13, "count");

    v45 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry dataSources](self, "dataSources"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100061814;
    v35[3] = &unk_1002C3A78;
    v7 = v10;
    v36 = v7;
    v37 = self;
    v16 = v11;
    v38 = v16;
    v40 = &v42;
    v17 = v12;
    v39 = v17;
    v41 = buf;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v35);

    objc_msgSend(v17, "wait");
    if (objc_msgSend(v17, "timeoutOccurred") && v43[3] || *(_QWORD *)(v47[0] + 40))
    {
      v18 = pow(5.0, (double)-[FMDAccessoryRegistry dataSourceErrorBackoffCount](self, "dataSourceErrorBackoffCount"));
      -[FMDAccessoryRegistry setDataSourceErrorBackoffCount:](self, "setDataSourceErrorBackoffCount:", (char *)-[FMDAccessoryRegistry dataSourceErrorBackoffCount](self, "dataSourceErrorBackoffCount") + 1);
      v19 = sub_1000031B8();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = v18 + 5.0;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100229B94((uint64_t)v47, v20, v22, v21);

      objc_initWeak(&location, self);
      v23 = objc_alloc((Class)FMDispatchTimer);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100061A18;
      v32[3] = &unk_1002C1378;
      objc_copyWeak(&v33, &location);
      v25 = objc_msgSend(v23, "initWithQueue:timeout:completion:", v24, v32, v21);

      -[FMDAccessoryRegistry setDataSourceRetryTimer:](self, "setDataSourceRetryTimer:", v25);
      objc_msgSend(v25, "start");

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    else
    {
      -[FMDAccessoryRegistry setDataSourceErrorBackoffCount:](self, "setDataSourceErrorBackoffCount:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoriesByIdentifier](self, "accessoriesByIdentifier"));
      v27 = objc_msgSend(v26, "copy");

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100061A98;
      v29[3] = &unk_1002C3AA0;
      v30 = v16;
      v31 = self;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v29);

    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100061AF8;
    v28[3] = &unk_1002C3AC8;
    v28[4] = self;
    -[NSObject enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v28);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(buf, 8);

  }
}

- (id)allAccessories
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10006119C;
  v11 = sub_1000611AC;
  v12 = &__NSArray0__struct;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061BF0;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)supportsAccessory:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
  v6 = objc_msgSend(v5, "isValid");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry supportDelegate](self, "supportDelegate"));
    if ((objc_opt_respondsToSelector(v7, "supportsAccessory:") & 1) != 0)
      v8 = objc_msgSend(v7, "supportsAccessory:", v4);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)accessoryForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_10006119C;
    v15 = sub_1000611AC;
    v16 = &__NSDictionary0__struct;
    v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100061E0C;
    v10[3] = &unk_1002C11C0;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_sync(v5, v10);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v12[5], "objectForKeyedSubscript:", v4));
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100229C10(v8);

    v6 = 0;
  }

  return v6;
}

- (BOOL)addAccessoryIfSupported:(id)a3 previouslyPaired:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  int v12;
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = -[FMDAccessoryRegistry supportsAccessory:](self, "supportsAccessory:", v6);
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry accessory supported %@", (uint8_t *)&v12, 0xCu);
    }

    -[FMDAccessoryRegistry _addAccessory:previouslyPaired:](self, "_addAccessory:previouslyPaired:", v6, v4);
  }
  else
  {
    if (v10)
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry accessory not supported %@", (uint8_t *)&v12, 0xCu);
    }

  }
  return v7;
}

- (void)_addAccessory:(id)a3 previouslyPaired:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  FMDAccessoryRegistry *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoriesByIdentifier](self, "accessoriesByIdentifier"));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  v12 = sub_1000031B8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v6;
    v21 = 1024;
    v22 = v11 == 0;
    v23 = 1024;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry addAccessory %@ New? %i %i", buf, 0x18u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryIdentifier"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v14);

  -[FMDAccessoryRegistry setAccessoriesByIdentifier:](self, "setAccessoriesByIdentifier:", v9);
  -[FMDAccessoryRegistry saveAccessoriesToDisk](self, "saveAccessoriesToDisk");
  if (!v11 && !v4)
  {
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100062168;
    block[3] = &unk_1002C21C8;
    objc_copyWeak(&v18, (id *)buf);
    v16 = v6;
    v17 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_removeAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  FMDAccessoryRegistry *v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
  if (v6)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry removing accessory %@", buf, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoriesByIdentifier](self, "accessoriesByIdentifier"));
    v10 = objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "removeObjectForKey:", v6);
    -[FMDAccessoryRegistry setAccessoriesByIdentifier:](self, "setAccessoriesByIdentifier:", v10);
    -[FMDAccessoryRegistry saveAccessoriesToDisk](self, "saveAccessoriesToDisk");
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100062354;
    block[3] = &unk_1002C21C8;
    objc_copyWeak(&v14, (id *)buf);
    v12 = v4;
    v13 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_updateAccessory:(id)a3 previouslyPaired:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  FMDAccessoryRegistry *v26;
  id v27;
  char v28;
  BOOL v29;
  BOOL v30;
  uint8_t buf[4];
  void *v32;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryIdentifier"));
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "isValid") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoriesByIdentifier](self, "accessoriesByIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

    objc_msgSend(v6, "updateWithAccessory:", v11);
    if (v11)
      v12 = objc_msgSend(v6, "isEqual:", v11) ^ 1;
    else
      v12 = 0;
    if (-[FMDAccessoryRegistry addAccessoryIfSupported:previouslyPaired:](self, "addAccessoryIfSupported:previouslyPaired:", v6, v4))
    {
      v14 = sub_1000031B8();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry updateAccessory %@", buf, 0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry connectedAccessoryIdentifiers](self, "connectedAccessoryIdentifiers"));
      if (objc_msgSend(v16, "containsObject:", v9))
        v17 = objc_msgSend(v6, "connectionState") != (id)1;
      else
        v17 = 0;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry connectedAccessoryIdentifiers](self, "connectedAccessoryIdentifiers"));
      v19 = (objc_msgSend(v18, "containsObject:", v9) & 1) == 0
         && objc_msgSend(v6, "connectionState") == (id)1;

      v20 = objc_msgSend(v6, "connectionState");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry connectedAccessoryIdentifiers](self, "connectedAccessoryIdentifiers"));
      v22 = v21;
      if (v20 == (id)1)
        objc_msgSend(v21, "addObject:", v9);
      else
        objc_msgSend(v21, "removeObject:", v9);

      objc_initWeak((id *)buf, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100062664;
      v24[3] = &unk_1002C3AF0;
      objc_copyWeak(&v27, (id *)buf);
      v28 = v12;
      v23 = v6;
      v29 = v17;
      v30 = v19;
      v25 = v23;
      v26 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v13 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100229C50();
  }

}

- (void)postConnectionStatusChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.FindMy.accesoriesConnectionStateChanged"), 0, 0, 1u);
}

- (void)forceUpdateAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000628D4;
  block[3] = &unk_1002C13E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_forceUpdateAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isValid") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoriesByIdentifier](self, "accessoriesByIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

    objc_msgSend(v4, "updateWithAccessory:", v9);
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry : force updating accessory: %@", (uint8_t *)&v13, 0xCu);
    }

    -[FMDAccessoryRegistry accessoryDidUpdate:](self, "accessoryDidUpdate:", v4);
  }
  else
  {
    v12 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100229C50();
  }

}

- (void)updateAccessory:(id)a3
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
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062B20;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeAccessory:(id)a3
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
  v5 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062C3C;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)refetchBauuids:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "refetchBauuid", buf, 2u);
  }

  v6 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062D2C;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)readAccessoriesFromDisk
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006319C;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)saveAccessoriesToDisk
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoryQueue](self, "accessoryQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoriesByIdentifier](self, "accessoriesByIdentifier"));
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry saveAccessoriesToDisk %@", (uint8_t *)&v12, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry dataArchiver](self, "dataArchiver"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoriesByIdentifier](self, "accessoriesByIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "saveDictionary:", v8));

  if (v9)
  {
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100228A90();

  }
}

- (void)availabilitydidChangeFor:(id)a3 status:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  _QWORD block[5];
  id v26;
  char v27;
  uint8_t buf[4];
  id v29;

  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = a3;
  v11 = sub_1000530AC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "availabilitydidChangeFor status = %@", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("components")));
  v9[2](v9, 0);

  v14 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistry accessoriesByIdentifier](self, "accessoriesByIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v14));

  if (v16)
  {
    v18 = objc_opt_class(FMDExtAccessory, v17);
    if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
    {
      v19 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("statusUpdateTime")));
      if (v21)
      {
        v22 = objc_opt_class(NSDate, v20);
        if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
        {
          v23 = sub_1000530AC();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            sub_100229D10();

          objc_msgSend(v19, "setLastStatusUpdateTime:", v21);
        }
      }
      if (objc_msgSend(v19, "updateComponnentsAvailability:", v13))
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100063734;
        block[3] = &unk_1002C3B40;
        v27 = 1;
        block[4] = self;
        v26 = v19;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }
  }

}

- (FMDAccessoryRegistrySupportDelegate)supportDelegate
{
  return (FMDAccessoryRegistrySupportDelegate *)objc_loadWeakRetained((id *)&self->_supportDelegate);
}

- (void)setSupportDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_supportDelegate, a3);
}

- (NSDictionary)accessoriesByIdentifier
{
  return self->_accessoriesByIdentifier;
}

- (void)setAccessoriesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesByIdentifier, a3);
}

- (OS_dispatch_queue)accessoryQueue
{
  return self->_accessoryQueue;
}

- (void)setAccessoryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryQueue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (NSMutableArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_dataSources, a3);
}

- (NSMutableSet)connectedAccessoryIdentifiers
{
  return self->_connectedAccessoryIdentifiers;
}

- (void)setConnectedAccessoryIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_connectedAccessoryIdentifiers, a3);
}

- (unint64_t)dataSourceErrorBackoffCount
{
  return self->_dataSourceErrorBackoffCount;
}

- (void)setDataSourceErrorBackoffCount:(unint64_t)a3
{
  self->_dataSourceErrorBackoffCount = a3;
}

- (FMDispatchTimer)dataSourceRetryTimer
{
  return self->_dataSourceRetryTimer;
}

- (void)setDataSourceRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceRetryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceRetryTimer, 0);
  objc_storeStrong((id *)&self->_connectedAccessoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_accessoryQueue, 0);
  objc_storeStrong((id *)&self->_accessoriesByIdentifier, 0);
  objc_destroyWeak((id *)&self->_supportDelegate);
}

@end
