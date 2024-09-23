@implementation FRFlintEmbedConfigurationManager

- (id)operationForConfigurationManager:(id)a3 resourceManager:(id)a4
{
  id v6;
  id v7;
  FREmbedConfigurationOperation *v8;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[FREmbedConfigurationOperation initWithAppConfigManager:andResourceManager:]([FREmbedConfigurationOperation alloc], "initWithAppConfigManager:andResourceManager:", v6, v7);
  -[FREmbedConfigurationOperation setRelativePriority:](v8, "setRelativePriority:", 1);
  -[FREmbedConfigurationOperation setQualityOfService:](v8, "setQualityOfService:", 25);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A770;
  v10[3] = &unk_1000DD9D8;
  objc_copyWeak(&v11, &location);
  -[FREmbedConfigurationOperation setEmbedFetchCompletionBlock:](v8, "setEmbedFetchCompletionBlock:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

- (FRFlintEmbedConfigurationManager)initWithConfigurationManager:(id)a3 resourceManager:(id)a4
{
  id v7;
  id v8;
  FRFlintEmbedConfigurationManager *v9;
  FRFlintEmbedConfigurationManager *v10;
  NFUnfairLock *v11;
  NFUnfairLock *lock;
  _QWORD v14[4];
  FRFlintEmbedConfigurationManager *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FRFlintEmbedConfigurationManager;
  v9 = -[FRFlintEmbedConfigurationManager init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_resourceManager, a4);
    v11 = (NFUnfairLock *)objc_msgSend(objc_alloc((Class)NFUnfairLock), "initWithOptions:", 1);
    lock = v10->_lock;
    v10->_lock = v11;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001875C;
    v14[3] = &unk_1000D9758;
    v15 = v10;
    +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", v14);

  }
  return v10;
}

- (void)fetchEmbedConfigurationWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  id v18;
  _QWORD v19[6];
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  FRFlintEmbedConfigurationManager *v34;
  __int16 v35;
  void *v36;

  v4 = (void (**)(_QWORD))a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100018674;
  v31 = sub_10001855C;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100018674;
  v25 = sub_10001855C;
  v26 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintEmbedConfigurationManager lock](self, "lock"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000055E0;
  v20[3] = &unk_1000DD960;
  v20[4] = self;
  v20[5] = &v27;
  v20[6] = &v21;
  objc_msgSend(v5, "performWithLockSync:", v20);

  if (v28[5])
  {
    v4[2](v4);
  }
  else
  {
    if (!v22[5])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintEmbedConfigurationManager appConfigurationManager](self, "appConfigurationManager"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintEmbedConfigurationManager resourceManager](self, "resourceManager"));
      v8 = objc_claimAutoreleasedReturnValue(-[FRFlintEmbedConfigurationManager operationForConfigurationManager:resourceManager:](self, "operationForConfigurationManager:resourceManager:", v6, v7));
      v9 = (void *)v22[5];
      v22[5] = v8;

      v10 = FCDefaultLog;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintEmbedConfigurationManager operation](self, "operation"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shortOperationDescription"));
        *(_DWORD *)buf = 134218242;
        v34 = self;
        v35 = 2114;
        v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "embed configuration manager=%p will fetch embed configuration with operation %{public}@", buf, 0x16u);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue fc_sharedConcurrentQueue](NSOperationQueue, "fc_sharedConcurrentQueue"));
      objc_msgSend(v13, "addOperation:", v22[5]);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintEmbedConfigurationManager lock](self, "lock"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001876C;
      v19[3] = &unk_1000DBFB0;
      v19[4] = self;
      v19[5] = &v21;
      objc_msgSend(v14, "performWithLockSync:", v19);

    }
    objc_initWeak((id *)buf, self);
    v15 = (void *)v22[5];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005C6C;
    v16[3] = &unk_1000DD988;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v4;
    objc_msgSend(v15, "addCompletionHandler:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (void)setOperation:(id)a3
{
  objc_storeStrong((id *)&self->_operation, a3);
}

- (FCFlintResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (FREmbedConfigurationOperation)operation
{
  return self->_operation;
}

- (FRFlintEmbedConfiguration)loadedConfiguration
{
  return self->_loadedConfiguration;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (id)embedForType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100018674;
  v16 = sub_10001855C;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFlintEmbedConfigurationManager lock](self, "lock"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005EB98;
  v9[3] = &unk_1000DD310;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performWithLockSync:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)loadEmbedDataWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005EC68;
  v5[3] = &unk_1000DD9B0;
  v6 = a3;
  v4 = v6;
  -[FRFlintEmbedConfigurationManager fetchEmbedConfigurationWithCompletion:](self, "fetchEmbedConfigurationWithCompletion:", v5);

}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_loadedConfiguration, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end
