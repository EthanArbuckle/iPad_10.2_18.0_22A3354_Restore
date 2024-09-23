@implementation FRAppCacheSnapshotter

- (void)snapshotWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = FRURLForNewsAppCachesDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100071AD4;
  v9[3] = &unk_1000DE988;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[FRAppCacheSnapshotter snapshotURLForCachesURL:](self, "snapshotURLForCachesURL:", v6));
  v11 = v4;
  v7 = v4;
  v8 = v10;
  -[FRAppCacheSnapshotter copyURL:toURL:completionHandler:](self, "copyURL:toURL:completionHandler:", v6, v8, v9);

}

- (void)removeExistingSnapshotWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t, _QWORD);

  v6 = (void (**)(id, uint64_t, _QWORD))a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppCacheSnapshotter snapshotURL](self, "snapshotURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v5, "fc_quicklyClearDirectory:callbackQueue:completion:", v4, &_dispatch_main_q, 0);

  if (v6)
    v6[2](v6, 1, 0);

}

- (void)prepareToRestoreSnapshotAndKillApp
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = FRURLForNewsAppCachesDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppCacheSnapshotter snapshotURLForCachesURL:](self, "snapshotURLForCachesURL:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppCacheSnapshotter tempRestoreURL](self, "tempRestoreURL"));
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100071E04;
  v13[3] = &unk_1000DE9B0;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "fc_quicklyClearDirectory:callbackQueue:completion:", v6, &_dispatch_main_q, v13);

  dispatch_group_enter(v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100071E0C;
  v11[3] = &unk_1000DE9B0;
  v12 = v9;
  v10 = v9;
  -[FRAppCacheSnapshotter copyURL:toURL:completionHandler:](self, "copyURL:toURL:completionHandler:", v5, v6, v11);
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, &stru_1000DE9D0);

}

- (void)finalizeRestoreOfCachesDirectory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v3 = FRURLForNewsAppCachesDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppCacheSnapshotter tempRestoreURL](self, "tempRestoreURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v6, "fc_quicklyClearDirectory:callbackQueue:completion:", v4, &_dispatch_main_q, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = 0;
  v8 = objc_msgSend(v7, "moveItemAtURL:toURL:error:", v5, v4, &v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    v10 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
      sub_1000845A8((uint64_t)v9, v10);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("FRAppCacheSnapshotterShouldRestoreOldCacheSnapshotDefaultsKey"));
  objc_msgSend(v11, "synchronize");

}

- (BOOL)snapshotPreparedAndWaitingForRestoration
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("FRAppCacheSnapshotterShouldRestoreOldCacheSnapshotDefaultsKey"));

  return v3;
}

- (NSDate)existingSnapshotCreationDate
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppCacheSnapshotter snapshotURL](self, "snapshotURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppCacheSnapshotter creationDateOFURL:](self, "creationDateOFURL:", v3));

  return (NSDate *)v4;
}

- (void)copyURL:(id)a3 toURL:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  global_queue = dispatch_get_global_queue(2, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000720F8;
  block[3] = &unk_1000DC8A8;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v11, block);

}

- (id)snapshotURL
{
  id v3;
  void *v4;
  void *v5;

  v3 = FRURLForNewsAppCachesDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppCacheSnapshotter snapshotURLForCachesURL:](self, "snapshotURLForCachesURL:", v4));

  return v5;
}

- (id)tempRestoreURL
{
  id v3;
  void *v4;
  void *v5;

  v3 = FRURLForNewsAppCachesDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppCacheSnapshotter URLWithSuffix:baseURL:](self, "URLWithSuffix:baseURL:", CFSTR("TempRestore"), v4));

  return v5;
}

- (id)URLWithSuffix:(id)a3 baseURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "URLByDeletingLastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v7, v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", v8));
  return v9;
}

- (id)snapshotURLForCachesURL:(id)a3
{
  return -[FRAppCacheSnapshotter URLWithSuffix:baseURL:](self, "URLWithSuffix:baseURL:", CFSTR("CacheSnapshot"), a3);
}

- (id)creationDateOFURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));

  v9 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesOfItemAtPath:error:", v5, &v9));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileModificationDate"));
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingSnapshotCreationDate, 0);
}

@end
