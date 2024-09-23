@implementation MSDComponentProcessor

- (MSDComponentProcessor)initWithQoS:(int64_t)a3
{
  MSDComponentProcessor *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  MSDOperationQueue *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MSDOperationQueue *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MSDOperationQueue *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MSDOperationQueue *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MSDOperationQueue *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MSDOperationQueue *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v40;
  uint8_t buf[4];
  uint64_t v42;

  v40.receiver = self;
  v40.super_class = (Class)MSDComponentProcessor;
  v4 = -[MSDComponentProcessor init](&v40, "init");
  if (v4)
  {
    if (os_variant_has_internal_content("com.apple.mobilestoredemod")
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance")),
          v6 = (uint64_t)objc_msgSend(v5, "concurrentDownloadOperation"),
          v5,
          v6 >= 1))
    {
      v7 = sub_1000604F0();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v42 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Override default number of concurrent download operation: %ld", buf, 0xCu);
      }

    }
    else
    {
      v6 = 2;
    }
    v9 = objc_alloc_init(MSDOperationQueue);
    -[MSDComponentProcessor setDefaultQueue:](v4, "setDefaultQueue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](v4, "defaultQueue"));
    objc_msgSend(v10, "setMaxConcurrentOperationCount:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](v4, "defaultQueue"));
    objc_msgSend(v11, "setQualityOfService:", a3);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](v4, "defaultQueue"));
    objc_msgSend(v12, "setSuspended:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](v4, "defaultQueue"));
    objc_msgSend(v13, "setName:", CFSTR("com.apple.msd.default_queue"));

    v14 = objc_alloc_init(MSDOperationQueue);
    -[MSDComponentProcessor setPrepareQueue:](v4, "setPrepareQueue:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](v4, "prepareQueue"));
    objc_msgSend(v15, "setMaxConcurrentOperationCount:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](v4, "prepareQueue"));
    objc_msgSend(v16, "setQualityOfService:", a3);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](v4, "prepareQueue"));
    objc_msgSend(v17, "setSuspended:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](v4, "prepareQueue"));
    objc_msgSend(v18, "setName:", CFSTR("com.apple.msd.prepare_queue"));

    v19 = objc_alloc_init(MSDOperationQueue);
    -[MSDComponentProcessor setDownloadQueue:](v4, "setDownloadQueue:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](v4, "downloadQueue"));
    objc_msgSend(v20, "setMaxConcurrentOperationCount:", v6);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](v4, "downloadQueue"));
    objc_msgSend(v21, "setQualityOfService:", a3);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](v4, "downloadQueue"));
    objc_msgSend(v22, "setSuspended:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](v4, "downloadQueue"));
    objc_msgSend(v23, "setName:", CFSTR("com.apple.msd.download_queue"));

    v24 = objc_alloc_init(MSDOperationQueue);
    -[MSDComponentProcessor setInstallQueue:](v4, "setInstallQueue:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](v4, "installQueue"));
    objc_msgSend(v25, "setMaxConcurrentOperationCount:", 1);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](v4, "installQueue"));
    objc_msgSend(v26, "setQualityOfService:", a3);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](v4, "installQueue"));
    objc_msgSend(v27, "setSuspended:", 1);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](v4, "installQueue"));
    objc_msgSend(v28, "setName:", CFSTR("com.apple.msd.install_queue"));

    v29 = objc_alloc_init(MSDOperationQueue);
    -[MSDComponentProcessor setParallelInstallQueue:](v4, "setParallelInstallQueue:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](v4, "parallelInstallQueue"));
    objc_msgSend(v30, "setMaxConcurrentOperationCount:", 5);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](v4, "parallelInstallQueue"));
    objc_msgSend(v31, "setQualityOfService:", a3);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](v4, "parallelInstallQueue"));
    objc_msgSend(v32, "setSuspended:", 1);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](v4, "parallelInstallQueue"));
    objc_msgSend(v33, "setName:", CFSTR("com.apple.msd.parallel_install_queue"));

    v34 = objc_alloc_init(MSDOperationQueue);
    -[MSDComponentProcessor setUninstallQueue:](v4, "setUninstallQueue:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](v4, "uninstallQueue"));
    objc_msgSend(v35, "setMaxConcurrentOperationCount:", 1);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](v4, "uninstallQueue"));
    objc_msgSend(v36, "setQualityOfService:", a3);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](v4, "uninstallQueue"));
    objc_msgSend(v37, "setSuspended:", 1);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](v4, "uninstallQueue"));
    objc_msgSend(v38, "setName:", CFSTR("com.apple.msd.uninstall_queue"));

  }
  return v4;
}

- (void)process:(id)a3
{
  id v4;
  MSDComponentProcessor *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activateStagedOperations"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[MSDComponentProcessor _dispatchOperationForExecution:](v5, "_dispatchOperationForExecution:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)resume
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MSDComponentProcessor *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](obj, "defaultQueue"));
  objc_msgSend(v2, "setSuspended:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](obj, "prepareQueue"));
  objc_msgSend(v3, "setSuspended:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](obj, "downloadQueue"));
  objc_msgSend(v4, "setSuspended:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](obj, "installQueue"));
  objc_msgSend(v5, "setSuspended:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](obj, "parallelInstallQueue"));
  objc_msgSend(v6, "setSuspended:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](obj, "uninstallQueue"));
  objc_msgSend(v7, "setSuspended:", 0);

  objc_sync_exit(obj);
}

- (void)suspend
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MSDComponentProcessor *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](obj, "defaultQueue"));
  objc_msgSend(v2, "setSuspended:", 1);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](obj, "prepareQueue"));
  objc_msgSend(v3, "setSuspended:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](obj, "downloadQueue"));
  objc_msgSend(v4, "setSuspended:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](obj, "installQueue"));
  objc_msgSend(v5, "setSuspended:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](obj, "parallelInstallQueue"));
  objc_msgSend(v6, "setSuspended:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](obj, "uninstallQueue"));
  objc_msgSend(v7, "setSuspended:", 1);

  objc_sync_exit(obj);
}

- (void)cancel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MSDComponentProcessor *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](obj, "defaultQueue"));
  objc_msgSend(v2, "cancelAllOperations");

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](obj, "prepareQueue"));
  objc_msgSend(v3, "cancelAllOperations");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](obj, "downloadQueue"));
  objc_msgSend(v4, "cancelAllOperations");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](obj, "installQueue"));
  objc_msgSend(v5, "cancelAllOperations");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](obj, "parallelInstallQueue"));
  objc_msgSend(v6, "cancelAllOperations");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](obj, "uninstallQueue"));
  objc_msgSend(v7, "cancelAllOperations");

  objc_sync_exit(obj);
}

- (void)_dispatchOperationForExecution:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor _queueForOperation:](self, "_queueForOperation:", v4));
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000C3B70((uint64_t)v4, v5, v7);

  objc_msgSend(v5, "addOperation:", v4);
}

- (id)_queueForOperation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  switch((unint64_t)objc_msgSend(v4, "type"))
  {
    case 1uLL:
      v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](self, "prepareQueue"));
      break;
    case 2uLL:
      v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](self, "downloadQueue"));
      break;
    case 3uLL:
      if (objc_msgSend(v4, "runInstallInParallel"))
        v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](self, "parallelInstallQueue"));
      else
        v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](self, "installQueue"));
      break;
    case 4uLL:
      v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](self, "uninstallQueue"));
      break;
    default:
      v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](self, "defaultQueue"));
      break;
  }
  v6 = (void *)v5;

  return v6;
}

- (MSDOperationQueue)defaultQueue
{
  return self->_defaultQueue;
}

- (void)setDefaultQueue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultQueue, a3);
}

- (MSDOperationQueue)prepareQueue
{
  return self->_prepareQueue;
}

- (void)setPrepareQueue:(id)a3
{
  objc_storeStrong((id *)&self->_prepareQueue, a3);
}

- (MSDOperationQueue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_downloadQueue, a3);
}

- (MSDOperationQueue)installQueue
{
  return self->_installQueue;
}

- (void)setInstallQueue:(id)a3
{
  objc_storeStrong((id *)&self->_installQueue, a3);
}

- (MSDOperationQueue)parallelInstallQueue
{
  return self->_parallelInstallQueue;
}

- (void)setParallelInstallQueue:(id)a3
{
  objc_storeStrong((id *)&self->_parallelInstallQueue, a3);
}

- (MSDOperationQueue)uninstallQueue
{
  return self->_uninstallQueue;
}

- (void)setUninstallQueue:(id)a3
{
  objc_storeStrong((id *)&self->_uninstallQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uninstallQueue, 0);
  objc_storeStrong((id *)&self->_parallelInstallQueue, 0);
  objc_storeStrong((id *)&self->_installQueue, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_prepareQueue, 0);
  objc_storeStrong((id *)&self->_defaultQueue, 0);
}

@end
