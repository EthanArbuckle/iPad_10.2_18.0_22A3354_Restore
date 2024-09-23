@implementation NDAVBackgroundSession

- (void)applicationEnteredForeground:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006744;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (NDAVBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11
{
  _BOOL8 v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NDAVBackgroundSession *v25;
  uint64_t v26;
  NSMutableDictionary *identifiersToAVWrappers;
  uint64_t v28;
  NSMutableDictionary *identifiersToThroughputMonitors;
  uint64_t v30;
  NSMutableDictionary *identifiersToTCPConnections;
  uint64_t v32;
  NSMutableDictionary *identifiersToDASActivities;
  NSMapTable *v34;
  NSMapTable *assetDownloadTokensToAssets;
  OS_dispatch_source *delayedWakeTimer;
  objc_super v39;

  v14 = a5;
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v39.receiver = self;
  v39.super_class = (Class)NDAVBackgroundSession;
  v25 = -[NDBackgroundSession initWithConfiguration:bundleID:isSpringBoardApp:downloadDirectory:options:clientProxy:delegate:workQueue:db:](&v39, "initWithConfiguration:bundleID:isSpringBoardApp:downloadDirectory:options:clientProxy:delegate:workQueue:db:", v17, v18, v14, v19, v20, v21, v22, v23, v24);
  if (v25)
  {
    v26 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    identifiersToAVWrappers = v25->_identifiersToAVWrappers;
    v25->_identifiersToAVWrappers = (NSMutableDictionary *)v26;

    v28 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    identifiersToThroughputMonitors = v25->_identifiersToThroughputMonitors;
    v25->_identifiersToThroughputMonitors = (NSMutableDictionary *)v28;

    v30 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    identifiersToTCPConnections = v25->_identifiersToTCPConnections;
    v25->_identifiersToTCPConnections = (NSMutableDictionary *)v30;

    v32 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    identifiersToDASActivities = v25->_identifiersToDASActivities;
    v25->_identifiersToDASActivities = (NSMutableDictionary *)v32;

    v34 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    assetDownloadTokensToAssets = v25->_assetDownloadTokensToAssets;
    v25->_assetDownloadTokensToAssets = v34;

    objc_storeStrong((id *)&v25->_clientConfig, a3);
    delayedWakeTimer = v25->_delayedWakeTimer;
    v25->_delayedWakeTimer = 0;

  }
  return v25;
}

- (void)setupDelayedCompletionWakeTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *delayedWakeTimer;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;

  if (!self->_delayedWakeTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->super._workQueue);
    delayedWakeTimer = self->_delayedWakeTimer;
    self->_delayedWakeTimer = v3;

    v5 = self->_delayedWakeTimer;
    if (v5)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10006F794;
      handler[3] = &unk_1000B23A0;
      handler[4] = self;
      dispatch_source_set_event_handler(v5, handler);
      v6 = self->_delayedWakeTimer;
      v7 = dispatch_time(0, 120000000000);
      dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)self->_delayedWakeTimer);
      v8 = (id)qword_1000C7158;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
        *(_DWORD *)buf = 138412546;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Scheduled delayed wake for session <%@>.<%@>", buf, 0x16u);

      }
    }
  }
}

- (void)cancelDelayedCompletionWakeTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  OS_dispatch_source *delayedWakeTimer;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  if (self->_delayedWakeTimer)
  {
    v3 = (id)qword_1000C7158;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling delayed wake for session <%@>.<%@>", (uint8_t *)&v7, 0x16u);

    }
    dispatch_source_cancel((dispatch_source_t)self->_delayedWakeTimer);
    delayedWakeTimer = self->_delayedWakeTimer;
    self->_delayedWakeTimer = 0;

  }
}

- (void)setupThroughputMonitorForWrapper:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5
{
  id v8;
  unsigned int v9;
  uint64_t v10;
  NDAVThroughputMonitor *v11;
  NSMutableDictionary *identifiersToThroughputMonitors;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "isDiscretionary");
  if (self->super._discretionary)
    v10 = v9 | 2;
  else
    v10 = v9;
  if (self->super._infersDiscretionary
    || -[NDApplication canBeSuspended](self->super._clientApplication, "canBeSuspended"))
  {
    v10 |= 4uLL;
  }
  v11 = -[NDAVThroughputMonitor initWithWrapper:monitoredApplication:priority:options:queue:]([NDAVThroughputMonitor alloc], "initWithWrapper:monitoredApplication:priority:options:queue:", v14, self->super._monitoredApplication, objc_msgSend(v8, "basePriority"), v10, self->super._workQueue);
  identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToThroughputMonitors, "setObject:forKeyedSubscript:", v11, v13);

}

- (void)cancelThroughputMonitorForWrapper:(unint64_t)a3
{
  NSMutableDictionary *identifiersToThroughputMonitors;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToThroughputMonitors, "objectForKeyedSubscript:", v6));

  objc_msgSend(v9, "cancel");
  v7 = self->_identifiersToThroughputMonitors;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v8);

}

- (id)restoreTasksFromSqliteDB:(id)a3
{
  NDTaskStorageDB *tasksDB;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  PendingCallback *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  PendingCallback *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  PendingCallback *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  __int128 v47;
  id v48;
  id v49;
  NDTaskStorageDB *obj;
  uint64_t v51;
  id v52;
  NDAVBackgroundSession *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[3];
  _QWORD v60[3];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];

  v48 = a3;
  tasksDB = self->super.tasksDB;
  if (tasksDB)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    tasksDB = (NDTaskStorageDB *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _getAllTasksFromDBForSession:sessionUUID:](tasksDB, "_getAllTasksFromDBForSession:sessionUUID:", v5, v6));

  }
  v49 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v53 = self;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = tasksDB;
  v7 = -[NDTaskStorageDB countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v7)
  {
    v51 = *(_QWORD *)v56;
    *(_QWORD *)&v8 = 138543618;
    v47 = v8;
    do
    {
      v52 = v7;
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v51)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "identifier", v47)));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_destinationURLToUse"));
        v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByDeletingLastPathComponent"));
          v54 = 0;
          v15 = objc_msgSend(v14, "checkResourceIsReachableAndReturnError:", &v54);
          v16 = v54;

          if ((v15 & 1) == 0)
          {
            v17 = (id)qword_1000C7158;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_loggableDescription"));
              *(_DWORD *)buf = 138543874;
              v62 = v18;
              v63 = 2112;
              v64 = v13;
              v65 = 2112;
              v66 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ not restoring task due to unreachable destination folder %@ (%@)", buf, 0x20u);

            }
            objc_msgSend(v10, "setState:", 3);
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:failingURL:](NSURLError, "_web_errorWithDomain:code:failingURL:", NSURLErrorDomain, -3000, 0));
            objc_msgSend(v10, "setError:", v19);

            v20 = [PendingCallback alloc];
            v21 = objc_msgSend(v10, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
            v60[0] = v22;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v60[1] = v23;
            v60[2] = &__NSDictionary0__struct;
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 3));
            v25 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v20, "initWithCallbackType:taskIdentifier:args:", 0, v21, v24);

            -[NDCallbackQueue addPendingCallback:wakeRequirement:](v53->super._callbackQueue, "addPendingCallback:wakeRequirement:", v25, 0);
          }

        }
        if (objc_msgSend(v10, "initializedWithAVAsset") && (uint64_t)objc_msgSend(v10, "state") <= 2)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "AVAssetURL"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetOptionsPlist"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset assetForNSURLSessionWithURL:propertyList:](AVURLAsset, "assetForNSURLSessionWithURL:propertyList:", v26, v27));

          objc_msgSend(v10, "setAVURLAsset:", v28);
          objc_msgSend(v10, "setAVAssetDownloadToken:", objc_msgSend(v28, "downloadToken"));
          if (!v28
            || (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "URL")),
                v30 = v29 == 0,
                v29,
                v30))
          {
            v34 = (id)qword_1000C7158;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_loggableDescription"));
              v45 = objc_msgSend(v10, "AVAssetDownloadToken");
              *(_DWORD *)buf = v47;
              v62 = v44;
              v63 = 2048;
              v64 = v45;
              _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}@ failed to re-instantiate AVURLAsset with token %llu", buf, 0x16u);

            }
            objc_msgSend(v10, "setState:", 3);
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:failingURL:](NSURLError, "_web_errorWithDomain:code:failingURL:", NSURLErrorDomain, -1, 0));
            objc_msgSend(v10, "setError:", v35);

            v36 = [PendingCallback alloc];
            v37 = objc_msgSend(v10, "identifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
            v59[0] = v38;
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v59[1] = v39;
            v59[2] = &__NSDictionary0__struct;
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 3));
            v31 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v36, "initWithCallbackType:taskIdentifier:args:", 0, v37, v40);

            -[NDCallbackQueue addPendingCallback:wakeRequirement:](v53->super._callbackQueue, "addPendingCallback:wakeRequirement:", v31, 0);
          }
          else
          {
            v31 = (id)qword_1000C7158;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_loggableDescription"));
              v33 = objc_msgSend(v10, "AVAssetDownloadToken");
              *(_DWORD *)buf = v47;
              v62 = v32;
              v63 = 2048;
              v64 = v33;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ restored asset with token %llu from sqlite", buf, 0x16u);

            }
          }

        }
        if ((uint64_t)objc_msgSend(v10, "state") <= 2)
        {
          if ((objc_msgSend(v10, "hasStarted") & 1) != 0)
          {
            v41 = (id)qword_1000C7158;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_loggableDescription"));
              *(_DWORD *)buf = 138543362;
              v62 = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ adding to outstanding tasks list", buf, 0xCu);

            }
            -[NDBackgroundSession addOutstandingTaskWithIdentifier:](v53, "addOutstandingTaskWithIdentifier:", objc_msgSend(v11, "unsignedIntegerValue"));
            objc_msgSend(v49, "addObject:", v10);
          }
          else
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "identifier")));
            objc_msgSend(v48, "addObject:", v43);

          }
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v53->super._identifiersToTaskInfo, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = -[NDTaskStorageDB countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    }
    while (v7);
  }

  return v49;
}

- (id)restoreTasksFromArchivedInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006F154;
  v9[3] = &unk_1000B23C8;
  v9[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToAVWrappers, "objectForKeyedSubscript:", a4));
  objc_msgSend(v7, "setCountOfBytesSent:", 0);
  objc_msgSend(v7, "setCountOfBytesReceived:", objc_msgSend(v6, "countOfBytesWritten"));
  objc_msgSend(v7, "setCountOfBytesExpectedToSend:", 0);
  objc_msgSend(v7, "setCountOfBytesExpectedToReceive:", objc_msgSend(v6, "countOfBytesExpectedToWrite"));

}

- (id)avAssetDownloadsDirectory
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  NSObject *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;

  if (!-[NDApplication usesContainerManagerForAVAsset](self->super._clientApplication, "usesContainerManagerForAVAsset"))return (id)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession setupDownloadDirectory](self, "setupDownloadDirectory"));
  v29 = 1;
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID")));
  v4 = (void *)container_create_or_lookup_path_for_current_user(2, objc_msgSend(v3, "UTF8String"), 0, 0, 0, &v29);

  if (!v4)
  {
    v5 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v31 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error getting container path: %llu", buf, 0xCu);
    }
  }
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID")));
  v7 = (void *)container_user_managed_assets_relative_path(objc_msgSend(v6, "UTF8String"), &v29);

  if (!v7)
  {
    v19 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v31 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error getting User managed assets path: %llu", buf, 0xCu);
    }
    return 0;
  }
  if (!v4)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v4, 1, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v7, 1, v8));
  free(v4);
  free(v7);

  if (v9)
  {
    v28 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    v12 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v11, &v28);

    if (v28)
      v13 = 0;
    else
      v13 = v12;
    if (v13 == 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v27 = 0;
      v15 = objc_msgSend(v14, "removeItemAtURL:error:", v9, &v27);
      v16 = v27;

      if ((v15 & 1) == 0)
      {
        v17 = (id)qword_1000C7158;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v25 = objc_msgSend(v16, "code");
          *(_DWORD *)buf = 138412546;
          v31 = (uint64_t)v16;
          v32 = 2048;
          v33 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error removing file at location of asset downloads directory: %@ [%ld]", buf, 0x16u);
        }

      }
    }
    else
    {
      v16 = 0;
      v20 = 0;
      if ((v12 & 1) != 0)
      {
LABEL_25:

        return v9;
      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = v16;
    v22 = objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v26);
    v20 = v26;

    if ((v22 & 1) == 0)
    {
      v23 = (id)qword_1000C7158;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v20, "code");
        *(_DWORD *)buf = 138412546;
        v31 = (uint64_t)v20;
        v32 = 2048;
        v33 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error creating asset downloads directory: %@ [%ld]", buf, 0x16u);
      }

    }
    goto LABEL_25;
  }
  return v9;
}

- (id)downloadDirectoryToUse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingLastPathComponent"));
  else
    v6 = objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession avAssetDownloadsDirectory](self, "avAssetDownloadsDirectory"));
  v7 = (void *)v6;

  return v7;
}

- (id)destinationURLToUseForTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationURL"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
    if (v6)
    {

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadConfig"));

      if (!v7)
      {
        v5 = 0;
        goto LABEL_22;
      }
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
    v10 = objc_msgSend(v9, "isFileURL");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
LABEL_21:

      goto LABEL_22;
    }
    if (objc_msgSend(v4, "AVAssetDownloadToken"))
    {
      v12 = objc_msgSend(v4, "AVAssetDownloadToken");
      if (!v12)
        goto LABEL_11;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
      v12 = objc_msgSend(v13, "downloadToken");

      if (!v12)
LABEL_11:
        v12 = (id)arc4random();
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet URLPathAllowedCharacterSet](NSMutableCharacterSet, "URLPathAllowedCharacterSet"));
    v15 = objc_msgSend(v14, "mutableCopy");

    v32 = v15;
    objc_msgSend(v15, "removeCharactersInString:", CFSTR("/"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetTitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAddingPercentEncodingWithAllowedCharacters:", v15));

    if ((unint64_t)objc_msgSend(v17, "length") >= 0xE8)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "substringWithRange:", 0, 231));

      v17 = (void *)v18;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v12));
    v21 = destinationURLFragment(v19, v20);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (v17)
      v22 = CFSTR("_");
    else
      v22 = &stru_1000B42E8;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pathExtension"));
    v26 = objc_msgSend((id)objc_opt_class(AVURLAsset), "performSelector:", "_figFilePathExtensions");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (objc_msgSend(v27, "containsObject:", v25))
      v28 = v25;
    else
      v28 = CFSTR("movpkg");

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@.%@"), v17, v22, v33, v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession avAssetDownloadsDirectory](self, "avAssetDownloadsDirectory"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URLByAppendingPathComponent:isDirectory:", v29, 0));

    v11 = v32;
    goto LABEL_21;
  }
LABEL_22:

  return v5;
}

- (void)applicationNoLongerInForeground:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006EEB0;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)applicationWasQuitFromAppSwitcher:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NDAVBackgroundSession *v9;

  v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006EBC0;
  v7[3] = &unk_1000B23F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NDAVBackgroundSession *v9;

  v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006E8C8;
  v7[3] = &unk_1000B23F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8
{
  (*((void (**)(id, _QWORD))a8 + 2))(a8, 0);
}

- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 pipeHandle:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8
{
  (*((void (**)(id, _QWORD))a8 + 2))(a8, 0);
}

- (BOOL)hasEntitlementToSpecifyDownloadDestinationURL
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v3 = sub_1000131C4(v2, CFSTR("com.apple.private.nsurlsession.media-asset-download.can-specify-destination-url"));

  return v3;
}

- (id)avAssetForURL:(id)a3 downloadToken:(unint64_t)a4
{
  id v6;
  NSMapTable *assetDownloadTokensToAssets;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMapTable *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v6 = a3;
  if (a4)
  {
    assetDownloadTokensToAssets = self->_assetDownloadTokensToAssets;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](assetDownloadTokensToAssets, "objectForKey:", v8));

    if (!v9)
    {
      if (v6)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", v6, 0));
      }
      else
      {
        v15 = AVURLAssetDownloadTokenKey;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
        v16 = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", 0, v11));

      }
      v12 = self->_assetDownloadTokensToAssets;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
      -[NSMapTable setObject:forKey:](v12, "setObject:forKey:", v9, v13);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads
{
  return objc_opt_respondsToSelector(AVAssetDownloadSession, "assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:") & 1;
}

- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15
{
  id v20;
  id v21;
  id v22;
  void (**v23)(id, _QWORD);
  NSObject *v24;
  NSXPCConnection *xpcConn;
  id v26;
  NSObject *v27;
  double v28;
  double v29;
  unsigned int v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  _BOOL8 v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v50;
  NSMutableDictionary *identifiersToAVWrappers;
  void *v52;
  void *v53;
  NSXPCProxyCreating *clientProxy;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  _BOOL4 v60;
  id v61;
  uint64_t v62;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  objc_super v72;
  objc_super v73;
  objc_super v74;
  _OWORD v75[2];
  uint8_t buf[4];
  id v77;
  __int16 v78;
  unint64_t v79;
  __int16 v80;
  unint64_t v81;
  __int16 v82;
  id v83;
  __int16 v84;
  id v85;
  __int16 v86;
  id v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;

  v20 = a4;
  v21 = a5;
  v68 = a6;
  v70 = a7;
  v71 = a8;
  v22 = a9;
  v65 = a10;
  v69 = a12;
  v23 = (void (**)(id, _QWORD))a15;
  v24 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138545410;
    v77 = v69;
    v78 = 2048;
    v79 = a11;
    v80 = 2048;
    v81 = a3;
    v82 = 2112;
    v83 = v20;
    v84 = 2112;
    v85 = v21;
    v86 = 2112;
    v87 = v68;
    v88 = 2112;
    v89 = v70;
    v90 = 2112;
    v91 = v71;
    v92 = 2112;
    v93 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Task <%{public}@>.<%lu> avAssetDownloadTaskWithDownloadToken: %llu, URL: %@, destinationURL: %@, temporaryDestinationURL: %@, assetTitle: %@, assetArtworkData: %@, options: %@", buf, 0x5Cu);
  }
  v66 = v21;
  v64 = (id)objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession downloadDirectoryToUse:](self, "downloadDirectoryToUse:", v21));
  xpcConn = self->super._xpcConn;
  if (xpcConn)
    -[NSXPCConnection auditToken](xpcConn, "auditToken");
  else
    memset(v75, 0, sizeof(v75));
  v26 = objc_retainAutorelease(v64);
  v58 = objc_msgSend(v26, "fileSystemRepresentation");
  if (!sandbox_check_by_audit_token(v75, "file-write-data", SANDBOX_CHECK_POSIX_WRITEABLE | 1u))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate", v58);
    v29 = v28;
    if (v22)
      v61 = objc_msgSend(v22, "mutableCopy");
    else
      v61 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskDownloadConfigurationKey")));
    objc_msgSend(v61, "setObject:forKeyedSubscript:", 0, CFSTR("AVAssetDownloadTaskDownloadConfigurationKey"));
    v67 = v61;

    v30 = !-[NDAVBackgroundSession doesAVAssetDownloadSessionSupportMultipleDownloads](self, "doesAVAssetDownloadSessionSupportMultipleDownloads");
    if (a13 != 5)
      LOBYTE(v30) = 1;
    if ((v30 & 1) != 0)
    {
      v35 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
      v34 = objc_msgSend(v35, "initWithAVAssetDownloadURL:destinationURL:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:downloadConfig:", v20, v66, v70, v71, v67, a11, v69, v32, v33, v62);
    }
    else
    {
      v31 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
      LOBYTE(v59) = a14;
      v34 = objc_msgSend(v31, "initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:destinationURL:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:enableSPIDelegateCallbacks:", v20, v66, v70, v71, v67, a11, v69, v32, v33, v59);
    }
    v36 = v34;

    if (-[NDApplication hasForegroundBackgroundStates](self->super._monitoredApplication, "hasForegroundBackgroundStates"))
    {
      v37 = !self->super._discretionary;
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v36, "setMayBeDemotedToDiscretionary:", v37);
    v74.receiver = self;
    v74.super_class = (Class)NDAVBackgroundSession;
    objc_msgSend(v36, "setDiscretionary:", -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](&v74, "currentDiscretionaryStatus:withOptionalTaskInfo:", 0, v36));
    v73.receiver = self;
    v73.super_class = (Class)NDAVBackgroundSession;
    objc_msgSend(v36, "setBasePriority:", -[NDBackgroundSession priorityForDiscretionaryStatus:](&v73, "priorityForDiscretionaryStatus:", objc_msgSend(v36, "isDiscretionary")));
    objc_msgSend(v36, "setState:", 1);
    objc_msgSend(v36, "setSuspendCount:", 1);
    objc_msgSend(v36, "setCreationTime:", v29);
    objc_msgSend(v36, "setAVAssetDownloadToken:", a3);
    objc_msgSend(v36, "setInitializedWithAVAsset:", a3 != 0);
    if (objc_msgSend(v36, "initializedWithAVAsset"))
    {
      v38 = objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession avAssetForURL:downloadToken:](self, "avAssetForURL:downloadToken:", v20, a3));
      objc_msgSend(v36, "setAVURLAsset:", v38);
    }
    else
    {
      v38 = 0;
    }
    objc_msgSend(v36, "setTemporaryDestinationURL:", v68);
    objc_msgSend(v36, "setAssetTitle:", v70);
    objc_msgSend(v36, "setAssetArtworkData:", v71);
    objc_msgSend(v36, "setAssetOptionsPlist:", v65);
    if (v38 | v62)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession destinationURLToUseForTask:](self, "destinationURLToUseForTask:", v36));
      objc_msgSend(v36, "setDestinationURL:", v39);

      if (v38)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v38, "URL"));
        objc_msgSend(v36, "setAVAssetURL:", v40);

LABEL_31:
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "destinationURL"));
        v44 = v43 == 0;

        if (!v44)
        {
          v45 = -[NDAVBackgroundSession newAVAssetDownloadSessionWrapperForTaskInfo:](self, "newAVAssetDownloadSessionWrapperForTaskInfo:", v36);
          v60 = v45 != 0;
          v46 = (id)qword_1000C7158;
          v47 = v46;
          if (v45)
          {
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_loggableDescription"));
              *(_DWORD *)buf = 138543874;
              v77 = v48;
              v78 = 2112;
              v79 = (unint64_t)v45;
              v80 = 2048;
              v81 = a3;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ new AVAssetDownloadSession %@ with token %llu", buf, 0x20u);

            }
            identifiersToTaskInfo = self->super._identifiersToTaskInfo;
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a11));
            -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTaskInfo, "setObject:forKeyedSubscript:", v36, v50);

            identifiersToAVWrappers = self->_identifiersToAVWrappers;
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a11));
            -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToAVWrappers, "setObject:forKeyedSubscript:", v45, v52);

            -[NSObject setTaskIdentifier:](v45, "setTaskIdentifier:", a11);
            -[NDAVBackgroundSession setupThroughputMonitorForWrapper:taskInfo:identifier:](self, "setupThroughputMonitorForWrapper:taskInfo:identifier:", v45, v36, a11);
            v72.receiver = self;
            v72.super_class = (Class)NDAVBackgroundSession;
            -[NDBackgroundSession addOutstandingTaskWithIdentifier:](&v72, "addOutstandingTaskWithIdentifier:", a11);
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a11));
            -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v53, 14, 1);

            clientProxy = self->super._clientProxy;
            v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "destinationURL"));
            -[NSXPCProxyCreating backgroundAVAssetDownloadTask:willDownloadToURL:](clientProxy, "backgroundAVAssetDownloadTask:willDownloadToURL:", a11, v47);
          }
          else if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_loggableDescription"));
            *(_DWORD *)buf = 138543362;
            v77 = v57;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@ failed to instantiate AVAssetDownloadSession", buf, 0xCu);

          }
LABEL_42:

          ((void (**)(id, _BOOL4))v23)[2](v23, v60);
          goto LABEL_43;
        }
LABEL_36:
        v45 = (id)qword_1000C7158;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_loggableDescription"));
          *(_DWORD *)buf = 138543618;
          v77 = v56;
          v78 = 2048;
          v79 = a3;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}@ failed to instantiate AVAsset, token %llu", buf, 0x16u);

        }
        v60 = 0;
        goto LABEL_42;
      }
      if (v62)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v62, "_asset"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "URL"));
        objc_msgSend(v36, "setAVAssetURL:", v42);

      }
    }
    if (objc_msgSend(v36, "initializedWithAVAsset") && !v62)
      goto LABEL_36;
    goto LABEL_31;
  }
  v27 = (id)qword_1000C7158;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID", v58));
    *(_DWORD *)buf = 138544130;
    v77 = v69;
    v78 = 2048;
    v79 = a11;
    v80 = 2112;
    v81 = (unint64_t)v55;
    v82 = 2112;
    v83 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Task <%{public}@>.<%lu> for client %@ does not have write access to destination directory %@", buf, 0x2Au);

  }
  v23[2](v23, 0);
  v67 = v22;
LABEL_43:

}

- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12
{
  void (**v18)(id, BOOL);
  NSObject *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;
  objc_super v45;
  objc_super v46;
  uint64_t v47;
  void *v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;

  v37 = a4;
  v40 = a5;
  v41 = a6;
  v42 = a7;
  v38 = a8;
  v39 = a9;
  v43 = a11;
  v18 = (void (**)(id, BOOL))a12;
  v19 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544898;
    v50 = v43;
    v51 = 2048;
    v52 = a10;
    v53 = 2048;
    v54 = a3;
    v55 = 2112;
    v56 = v37;
    v57 = 2112;
    v58 = v40;
    v59 = 2112;
    v60 = v41;
    v61 = 2112;
    v62 = v42;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Task <%{public}@>.<%lu> avAggregateAssetDownloadTaskWithDownloadToken: %llu, serializedMediaSelections: %@, assetTitle: %@, assetArtworkData: %@, options: %@", buf, 0x48u);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v21 = v20;
  v22 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
  v25 = objc_msgSend(v22, "initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:", v39, v40, v41, v42, a10, v43, v23, v24);

  if (-[NDApplication hasForegroundBackgroundStates](self->super._monitoredApplication, "hasForegroundBackgroundStates"))
  {
    v26 = !self->super._discretionary;
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v25, "setMayBeDemotedToDiscretionary:", v26);
  v46.receiver = self;
  v46.super_class = (Class)NDAVBackgroundSession;
  objc_msgSend(v25, "setDiscretionary:", -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](&v46, "currentDiscretionaryStatus:withOptionalTaskInfo:", 0, v25));
  v45.receiver = self;
  v45.super_class = (Class)NDAVBackgroundSession;
  objc_msgSend(v25, "setBasePriority:", -[NDBackgroundSession priorityForDiscretionaryStatus:](&v45, "priorityForDiscretionaryStatus:", objc_msgSend(v25, "isDiscretionary")));
  objc_msgSend(v25, "setState:", 1);
  objc_msgSend(v25, "setSuspendCount:", 1);
  objc_msgSend(v25, "setCreationTime:", v21);
  objc_msgSend(v25, "setInitializedWithAVAsset:", 1);
  objc_msgSend(v25, "setAVAssetDownloadToken:", a3);
  v47 = AVURLAssetDownloadTokenKey;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v48 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", 0, v28));

  objc_msgSend(v25, "setAVURLAsset:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "URL"));
  objc_msgSend(v25, "setAVAssetURL:", v30);

  objc_msgSend(v25, "setAssetOptionsPlist:", v38);
  v31 = (id)qword_1000C7158;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_loggableDescription"));
    *(_DWORD *)buf = 138543618;
    v50 = v32;
    v51 = 2112;
    v52 = (unint64_t)v29;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ new AVAggregateAssetDownloadTask asset: %@", buf, 0x16u);

  }
  if (v29)
  {
    identifiersToTaskInfo = self->super._identifiersToTaskInfo;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a10));
    -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTaskInfo, "setObject:forKeyedSubscript:", v25, v34);

    v44.receiver = self;
    v44.super_class = (Class)NDAVBackgroundSession;
    -[NDBackgroundSession addOutstandingTaskWithIdentifier:](&v44, "addOutstandingTaskWithIdentifier:", a10);
    v35 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a10));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v35, 14, 1);
  }
  else
  {
    v35 = (id)qword_1000C7158;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v50 = v36;
      v51 = 2048;
      v52 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@ failed to instantiate AVAsset, token %llu", buf, 0x16u);

    }
  }

  v18[2](v18, v29 != 0);
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3
{
  NSMutableDictionary *identifiersToTaskInfo;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v6));

  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    v12 = 138543362;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelTaskWithIdentifier", (uint8_t *)&v12, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_URLToUse"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -999, v10));

  -[NDAVBackgroundSession cancelAVDownloadAndFailTaskWithIdentifier:withError:](self, "cancelAVDownloadAndFailTaskWithIdentifier:withError:", a3, v11);
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4
{
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  -[NDAVBackgroundSession cancelTaskWithIdentifier:](self, "cancelTaskWithIdentifier:", a3);
  v6[2](v6, 0);

}

- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  NSMutableDictionary *identifiersToThroughputMonitors;
  void *v8;
  void *v9;
  objc_super v10;

  -[NDAVBackgroundSession setPriority:forTCPConnectionWithTaskIdentifier:](self, "setPriority:forTCPConnectionWithTaskIdentifier:");
  v10.receiver = self;
  v10.super_class = (Class)NDAVBackgroundSession;
  -[NDBackgroundSession setPriority:forTaskWithIdentifier:](&v10, "setPriority:forTaskWithIdentifier:", a3, a4);
  identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToThroughputMonitors, "objectForKeyedSubscript:", v8));

  objc_msgSend(v9, "setBasePriority:", a3);
}

- (void)cancelAVDownloadAndFailTaskWithIdentifier:(unint64_t)a3 withError:(id)a4
{
  id v6;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v8;
  void *v9;
  NSMutableDictionary *identifiersToAVWrappers;
  void *v11;
  void *v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;
  unint64_t v18;

  v6 = a4;
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v8));

  objc_msgSend(v9, "setResumedAndWaitingForEarliestBeginDate:", 0);
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToAVWrappers, "objectForKeyedSubscript:", v11));

  objc_msgSend(v12, "cancel");
  -[NDAVBackgroundSession cancelTCPConnectionForTask:withError:](self, "cancelTCPConnectionForTask:withError:", a3, v6);
  global_queue = dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E83C;
  block[3] = &unk_1000B2418;
  v17 = v6;
  v18 = a3;
  block[4] = self;
  v15 = v6;
  dispatch_async(v14, block);

}

- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5
{
  NSObject *workQueue;
  _QWORD v6[6];

  workQueue = self->super._workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006E804;
  v6[3] = &unk_1000B2440;
  v6[4] = self;
  v6[5] = a4;
  dispatch_async(workQueue, v6);
}

- (BOOL)retryTask:(id)a3 originalError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *identifiersToAVWrappers;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMapTable *assetDownloadTokensToAssets;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  unsigned int v37;
  double v38;
  char *v39;
  double v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  int v47;
  id v48;
  __int16 v49;
  double v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
    v47 = 138543362;
    v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ retrying AVAssetDownloadTask", (uint8_t *)&v47, 0xCu);

  }
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "identifier")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToAVWrappers, "objectForKeyedSubscript:", v11));

  if (v12)
  {
    v13 = self->_identifiersToAVWrappers;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "identifier")));
    -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

  }
  -[NDBackgroundSession updateTaskInfoBasedOnCurrentDiscretionaryStatus:](self, "updateTaskInfoBasedOnCurrentDiscretionaryStatus:", v6);
  objc_msgSend(v6, "setRetryError:", v7);
  if (!v7)
    goto LABEL_20;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  if (-[NSObject isEqualToString:](v15, "isEqualToString:", AVFoundationErrorDomain))
  {
    v16 = objc_msgSend(v7, "code") == (id)-11819;

    if (!v16)
      goto LABEL_13;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AVAssetURL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetOptionsPlist"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset assetForNSURLSessionWithURL:propertyList:](AVURLAsset, "assetForNSURLSessionWithURL:propertyList:", v17, v18));
    objc_msgSend(v6, "setAVURLAsset:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AVURLAsset"));
    objc_msgSend(v6, "setAVAssetDownloadToken:", objc_msgSend(v20, "downloadToken"));

    if (objc_msgSend(v6, "AVAssetDownloadToken"))
    {
      assetDownloadTokensToAssets = self->_assetDownloadTokensToAssets;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AVURLAsset"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "AVAssetDownloadToken")));
      -[NSMapTable setObject:forKey:](assetDownloadTokensToAssets, "setObject:forKey:", v22, v23);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "identifier")));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v24, 14, 1);

    v15 = (id)qword_1000C7158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
      v26 = objc_msgSend(v7, "code");
      v27 = objc_msgSend(v6, "retryCount");
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "options"));
      v47 = 138544386;
      v48 = v25;
      v49 = 2112;
      v50 = *(double *)&v7;
      v51 = 2048;
      v52 = v26;
      v53 = 2048;
      v54 = v27;
      v55 = 2112;
      v56 = v28;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ recreated asset after error %@ [%ld] retry count %lu options = %@", (uint8_t *)&v47, 0x34u);

    }
  }

LABEL_13:
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  v30 = objc_msgSend(v29, "isEqualToString:", AVFoundationErrorDomain);

  if (!v30)
  {
LABEL_20:
    v35 = 0;
    goto LABEL_21;
  }
  v31 = objc_msgSend(v7, "code");
  if (v31 == (id)-11903 || v31 == (id)-11900)
    goto LABEL_16;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", NSUnderlyingErrorKey));

  if (objc_msgSend(v34, "code") != (id)-12540)
  {
    v35 = 0;
LABEL_19:

    goto LABEL_21;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "domain"));
  v35 = objc_msgSend(v46, "isEqualToString:", NSOSStatusErrorDomain);

  if (v35)
  {
LABEL_16:
    v32 = (id)qword_1000C7158;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
      v47 = 138543362;
      v48 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ removing destination file for AVAssetDownloadTask in order to retry", (uint8_t *)&v47, 0xCu);

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_destinationURLToUse"));
    +[NDFileUtilities removeItemAtURL:](NDFileUtilities, "removeItemAtURL:", v34);
    v35 = 1;
    goto LABEL_19;
  }
LABEL_21:
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain"));

  v38 = 1.0;
  if (((v37 | v35) & 1) == 0)
  {
    v39 = (char *)objc_msgSend(v6, "retryCount", 1.0);
    objc_msgSend(v6, "setRetryCount:", v39 + 1);
    v38 = exp2((double)(unint64_t)v39);
  }
  v40 = fmin(v38, 1800.0);
  v41 = (id)qword_1000C7158;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
    v47 = 138543618;
    v48 = v42;
    v49 = 2048;
    v50 = v40;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ will retry after %f seconds", (uint8_t *)&v47, 0x16u);

  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](NDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v43, "performCallbackAfterNetworkChangedEvent:identifier:delay:", self, objc_msgSend(v6, "identifier"), (uint64_t)v40);

  return 1;
}

- (void)taskShouldSuspend:(unint64_t)a3
{
  NSMutableDictionary *identifiersToTaskInfo;
  void *v6;
  NSMutableDictionary *identifiersToAVWrappers;
  void *v8;
  void *v9;
  NSMutableDictionary *identifiersToThroughputMonitors;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *identifiersToDASActivities;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v24 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v24, "taskKind") == (id)3 || objc_msgSend(v24, "taskKind") == (id)5)
  {
    identifiersToAVWrappers = self->_identifiersToAVWrappers;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToAVWrappers, "objectForKeyedSubscript:", v8));

    identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToThroughputMonitors, "objectForKeyedSubscript:", v11));

    objc_msgSend(v9, "suspend");
    objc_msgSend(v12, "wrapperWillSuspend");
    if ((objc_msgSend(v24, "resumedAndWaitingForEarliestBeginDate") & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession secondaryID](self, "secondaryID"));
      sub_100019980(2, v13, v14, v15, v16, v24, 0, 0, 0, objc_msgSend(v24, "isDiscretionary"), 0, 0, 0, 0);

    }
    objc_msgSend(v24, "setResumedAndWaitingForEarliestBeginDate:", 0);
    identifiersToDASActivities = self->_identifiersToDASActivities;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToDASActivities, "objectForKeyedSubscript:", v18));

    if (v19)
    {
      v20 = self->_identifiersToDASActivities;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", 0, v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](_DASScheduler, "sharedScheduler"));
      objc_msgSend(v22, "activityCanceled:", v19);

    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v23, 11, 1);

}

- (void)taskShouldResume:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSMutableDictionary *identifiersToAVWrappers;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  NDAVBackgroundSession *v14;
  id v15;
  id v16;
  unint64_t v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->super._identifiersToTaskInfo, "objectForKeyedSubscript:", v5));
  if (objc_msgSend(v6, "taskKind") == (id)3 || objc_msgSend(v6, "taskKind") == (id)5)
  {
    identifiersToAVWrappers = self->_identifiersToAVWrappers;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToAVWrappers, "objectForKeyedSubscript:", v8));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006D4D4;
    v12[3] = &unk_1000B2508;
    v13 = v6;
    v14 = self;
    v17 = a3;
    v15 = v9;
    v16 = v5;
    v10 = v9;
    -[NDBackgroundSession handleEarliestBeginDateForTaskWithIdentifier:completionHandler:](self, "handleEarliestBeginDateForTaskWithIdentifier:completionHandler:", a3, v12);

  }
  if ((objc_msgSend(v6, "hasStarted") & 1) == 0
    && (objc_msgSend(v6, "isDiscretionary") & 1) == 0)
  {
    objc_msgSend(v6, "setStartedUserInitiated:", 1);
  }
  objc_msgSend(v6, "setHasStarted:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v11, 14, 1);

}

- (int64_t)adjustedTCPConnectionPriorityForTaskPriority:(int64_t)a3
{
  NDApplication *monitoredApplication;

  monitoredApplication = self->super._monitoredApplication;
  if (!monitoredApplication || -[NDApplication isForeground](monitoredApplication, "isForeground"))
  {
    if (a3 > 399)
    {
      if (a3 > 499)
      {
        if (a3 != 500)
        {
          if (a3 == 600)
            return a3;
LABEL_12:
          if (a3 == 650)
            return 650;
          return 300;
        }
        return 500;
      }
      if (a3 == 400)
        return a3;
LABEL_25:
      if (a3 != 450)
        return 300;
      return 450;
    }
    if (a3 > 299)
    {
      if (a3 == 300)
        return a3;
LABEL_28:
      if (a3 != 350)
        return 300;
      return 350;
    }
    goto LABEL_20;
  }
  if (a3 <= 399)
  {
    if (a3 > 299)
    {
      if (a3 == 300)
        return 350;
      goto LABEL_28;
    }
LABEL_20:
    if (a3 == 100)
      return a3;
    if (a3 == 200)
      return 200;
    return 300;
  }
  if (a3 <= 499)
  {
    if (a3 == 400)
      return 450;
    goto LABEL_25;
  }
  if (a3 == 500)
    return 500;
  if (a3 != 600)
    goto LABEL_12;
  return 650;
}

- (id)newAVAssetDownloadSessionWrapperForTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NDAVAssetDownloadSessionWrapper *v7;
  void *v8;
  void *v9;
  void *v10;
  NSURLSessionConfiguration *clientConfig;
  void *v12;
  void *v13;
  NDAVAssetDownloadSessionWrapper *v14;
  NDAVAssetDownloadSessionWrapper *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v20;
  NDAVAssetDownloadSessionWrapper *v21;
  NSURLSessionConfiguration *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
  if (v5)
  {

LABEL_4:
    v7 = [NDAVAssetDownloadSessionWrapper alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_destinationURLToUse"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
    clientConfig = self->_clientConfig;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_AVAssetDownloadSessionOptions:config:asset:", v10, clientConfig, v12));
    v14 = -[NDAVAssetDownloadSessionWrapper initWithURLAsset:destinationURL:options:delegate:queue:](v7, "initWithURLAsset:destinationURL:options:delegate:queue:", v8, v9, v13, self, self->super._workQueue);
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadConfig"));

  if (v6)
    goto LABEL_4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_URLToUse"));

  if (!v20)
  {
    v15 = 0;
    goto LABEL_9;
  }
  v21 = [NDAVAssetDownloadSessionWrapper alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_URLToUse"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_destinationURLToUse"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
  v22 = self->_clientConfig;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AVURLAsset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_AVAssetDownloadSessionOptions:config:asset:", v10, v22, v12));
  v14 = -[NDAVAssetDownloadSessionWrapper initWithURL:destinationURL:options:delegate:queue:](v21, "initWithURL:destinationURL:options:delegate:queue:", v8, v9, v13, self, self->super._workQueue);
LABEL_5:
  v15 = v14;

  if (v15)
  {
    v16 = -[NDAVAssetDownloadSessionWrapper downloadToken](v15, "downloadToken");
    v17 = (id)qword_1000C7158;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_loggableDescription"));
      v23 = 138543618;
      v24 = v18;
      v25 = 2048;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ created AVAssetDownloadSession with token %llu", (uint8_t *)&v23, 0x16u);

    }
    -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didReceiveDownloadToken:](self->super._clientProxy, "backgroundAVAssetDownloadTask:didReceiveDownloadToken:", objc_msgSend(v4, "identifier"), v16);
  }
LABEL_9:

  return v15;
}

- (BOOL)ensureAVAssetDownloadSessionWrapperForTaskIdentifier:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->super._identifiersToTaskInfo, "objectForKeyedSubscript:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToAVWrappers, "objectForKey:", v5));

  if (v7)
  {
    v8 = 1;
  }
  else
  {
    v9 = -[NDAVBackgroundSession newAVAssetDownloadSessionWrapperForTaskInfo:](self, "newAVAssetDownloadSessionWrapperForTaskInfo:", v6);
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "downloadToken");
      objc_msgSend(v6, "setAVAssetDownloadToken:", v11);
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
        v18 = 138543618;
        v19 = v13;
        v20 = 2048;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ created AVAssetDownloadSession with token %llu", (uint8_t *)&v18, 0x16u);

      }
      -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didReceiveDownloadToken:](self->super._clientProxy, "backgroundAVAssetDownloadTask:didReceiveDownloadToken:", a3, v11);
      objc_msgSend(v10, "setTaskIdentifier:", a3);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identifiersToAVWrappers, "setObject:forKeyedSubscript:", v10, v5);
      v8 = 1;
      v14 = v10;
    }
    else
    {
      v15 = (id)qword_1000C7158;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
        v18 = 138543362;
        v19 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@ couldn't create AVAssetDownloadSession; returning an error",
          (uint8_t *)&v18,
          0xCu);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError errorWithDomain:code:userInfo:](NSURLError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1, 0));
      -[NDAVBackgroundSession taskWithIdentifier:didCompleteWithError:](self, "taskWithIdentifier:didCompleteWithError:", a3, v14);
      v8 = 0;
    }

  }
  return v8;
}

- (void)startAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unint64_t v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->super._identifiersToTaskInfo, "objectForKeyedSubscript:", v5));
  v7 = v6;
  if (v6
    && objc_msgSend(v6, "state") != (id)3
    && -[NDAVBackgroundSession ensureAVAssetDownloadSessionWrapperForTaskIdentifier:](self, "ensureAVAssetDownloadSessionWrapperForTaskIdentifier:", a3))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToAVWrappers, "objectForKeyedSubscript:", v5));
    v9 = (id)qword_1000C7158;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2112;
      v18 = v8;
      v19 = 2048;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ startAVAssetDownloadSessionWithTaskIdentifier wrapper: %@ taskIdentifier: %lu", buf, 0x20u);

    }
    objc_msgSend(v8, "resume");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession secondaryID](self, "secondaryID"));
    sub_100019980(1, v11, v12, v13, v14, v7, 0, 0, 0, objc_msgSend(v7, "isDiscretionary"), 0, 0, 0, 0);

  }
}

- (void)stopAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3
{
  NSMutableDictionary *identifiersToAVWrappers;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSURLError errorWithDomain:code:userInfo:](NSURLError, "errorWithDomain:code:userInfo:", CFSTR("_nsurlsessiondErrorDomain"), 5, 0));
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToAVWrappers, "objectForKeyedSubscript:", v6));

  objc_msgSend(v7, "cancelAndDeliverError:", v8);
}

- (void)resetStorageWithReply:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3
{
  NSMutableDictionary *identifiersToAVWrappers;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  objc_super v10;

  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToAVWrappers, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v8 = self->_identifiersToAVWrappers;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)NDAVBackgroundSession;
  -[NDBackgroundSession clientAcknowledgedTerminalCallbackForTask:](&v10, "clientAcknowledgedTerminalCallbackForTask:", a3);

}

- (void)cancelTCPConnectionForTask:(unint64_t)a3 withError:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->super._identifiersToTaskInfo, "objectForKeyedSubscript:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTCPConnections, "objectForKeyedSubscript:", v5));
  if (v7)
  {
    v8 = (id)qword_1000C7158;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
      v14 = 138543362;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ canceling tcp_connection", (uint8_t *)&v14, 0xCu);

    }
    tcp_connection_cancel(v7);
    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToTCPConnections, "removeObjectForKey:", v5);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToDASActivities, "objectForKeyedSubscript:", v5));
  if (v10)
  {
    v11 = (id)qword_1000C7158;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ completing _DASActivity %@", (uint8_t *)&v14, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](_DASScheduler, "sharedScheduler"));
    objc_msgSend(v13, "activityCompleted:", v10);

    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToDASActivities, "removeObjectForKey:", v5);
  }

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  PendingCallback *v13;
  void *v14;
  void *v15;
  PendingCallback *v16;
  _QWORD v17[2];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->super._tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = (id)qword_1000C7158;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2112;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ finished downloading to %@", buf, 0x16u);

  }
  v13 = [PendingCallback alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v8));
  v17[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
  v16 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v13, "initWithCallbackType:taskIdentifier:args:", 1, v10, v15);

  -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->super._callbackQueue, "addPendingCallback:wakeRequirement:", v16, 0);
}

- (void)taskWithIdentifier:(unint64_t)a3 didCompleteWithError:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  PendingCallback *v19;
  void *v20;
  void *v21;
  void *v22;
  PendingCallback *v23;
  PendingCallback *v24;
  void *v25;
  void *v26;
  void *v27;
  PendingCallback *v28;
  unsigned int v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  objc_super v42;
  objc_super v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  int v47;
  _QWORD v48[3];
  _QWORD v49[2];

  v41 = a4;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->super._identifiersToTaskInfo, "objectForKeyedSubscript:"));
  if (v6)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientErrorForError:](self, "clientErrorForError:", v41));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToAVWrappers, "objectForKeyedSubscript:", v40));
    v38 = v7;
    if (v7)
      v8 = objc_msgSend(v7, "countOfBytesWritten");
    else
      v8 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession secondaryID](self, "secondaryID"));
    sub_100019980(3, v9, v10, v11, v12, v6, 0, (uint64_t)v8, 0, objc_msgSend(v6, "isDiscretionary"), 0, 1, 0, v41);

    objc_msgSend(v6, "setState:", 3);
    objc_msgSend(v6, "setError:", v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v13, 14, 1);

    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToAVWrappers, "removeObjectForKey:", v40);
    objc_msgSend(v6, "setAVURLAsset:", 0);
    if (sub_10001B108((_BOOL8)v41))
      v14 = -[NDApplication canBeSuspended](self->super._clientApplication, "canBeSuspended");
    else
      v14 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_destinationURLToUse"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
    v18 = objc_msgSend(v15, "fileExistsAtPath:", v17);

    if (v18)
    {
      v19 = [PendingCallback alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_destinationURLToUse"));
      v49[0] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v49[1] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 2));
      v23 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v19, "initWithCallbackType:taskIdentifier:args:", 1, a3, v22);

      -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->super._callbackQueue, "addPendingCallback:wakeRequirement:", v23, 0);
    }
    v24 = [PendingCallback alloc];
    v25 = v39;
    if (!v39)
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v48[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v48[1] = v26;
    v48[2] = &__NSDictionary0__struct;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
    v28 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v24, "initWithCallbackType:taskIdentifier:args:", 0, a3, v27);

    if (!v39)
    -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->super._callbackQueue, "addPendingCallback:wakeRequirement:", v28, 0);
    v43.receiver = self;
    v43.super_class = (Class)NDAVBackgroundSession;
    -[NDBackgroundSession removeOutstandingTaskWithIdentifier:](&v43, "removeOutstandingTaskWithIdentifier:", a3);
    -[NDAVBackgroundSession cancelThroughputMonitorForWrapper:](self, "cancelThroughputMonitorForWrapper:", a3);
    v42.receiver = self;
    v42.super_class = (Class)NDAVBackgroundSession;
    v29 = -[NDBackgroundSession finalizeTaskCompletionWithSuppressedWake:](&v42, "finalizeTaskCompletionWithSuppressedWake:", v14);
    v30 = (id)qword_1000C7158;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
      v32 = (void *)v31;
      if (v29)
        v33 = 89;
      else
        v33 = 78;
      *(_DWORD *)buf = 138543618;
      v45 = v31;
      v46 = 1024;
      v47 = v33;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ completion woke client: %c", buf, 0x12u);

    }
    if ((v29 & 1) != 0 || -[NDBackgroundSession clientIsActive](self, "clientIsActive"))
    {
      v34 = (id)qword_1000C7158;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
        *(_DWORD *)buf = 138543362;
        v45 = (uint64_t)v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ completion woke client or client is active - not requesting delayed wake", buf, 0xCu);

      }
      -[NDAVBackgroundSession cancelDelayedCompletionWakeTimer](self, "cancelDelayedCompletionWakeTimer");
    }
    else
    {
      v36 = (id)qword_1000C7158;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
        *(_DWORD *)buf = 138543362;
        v45 = (uint64_t)v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ completion did not wake client and client is not active - requesting delayed wake", buf, 0xCu);

      }
      -[NDAVBackgroundSession setupDelayedCompletionWakeTimer](self, "setupDelayedCompletionWakeTimer");
    }
    -[NDAVBackgroundSession cancelTCPConnectionForTask:withError:](self, "cancelTCPConnectionForTask:withError:", a3, v41);

  }
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didUpdateProgressWithLastBytesWritten:(unint64_t)a4 totalBytesWritten:(unint64_t)a5 totalBytesExpectedToWrite:(unint64_t)a6
{
  id v10;
  NSMutableDictionary *identifiersToThroughputMonitors;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = objc_msgSend(v14, "taskIdentifier");
  if (a4)
  {
    identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToThroughputMonitors, "objectForKeyedSubscript:", v12));

    objc_msgSend(v13, "wrapperTransferredData:", a4);
  }
  -[NSXPCProxyCreating backgroundAVAssetDownloadTaskDidUpdateProgress:totalBytesWritten:totalBytesExpectedToWrite:](self->super._clientProxy, "backgroundAVAssetDownloadTaskDidUpdateProgress:totalBytesWritten:totalBytesExpectedToWrite:", v10, a5, a6);

}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 willDownloadVariants:(id)a4
{
  id v6;
  id v7;
  PendingCallback *v8;
  void *v9;
  PendingCallback *v10;
  id v11;

  v6 = a4;
  v7 = objc_msgSend(a3, "taskIdentifier");
  v8 = [PendingCallback alloc];
  if (v6)
  {
    v11 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }
  else
  {
    v9 = &__NSArray0__struct;
  }
  v10 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v8, "initWithCallbackType:taskIdentifier:args:", 11, v7, v9);
  if (v6)

  -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->super._callbackQueue, "addPendingCallback:wakeRequirement:", v10, 0);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:](self->super._clientProxy, "backgroundAVAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:", objc_msgSend(v16, "taskIdentifier"), v12, v13, v14, v15);

}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didFinishDownloadForMediaSelectionPropertyList:](self->super._clientProxy, "backgroundAVAssetDownloadTask:didFinishDownloadForMediaSelectionPropertyList:", objc_msgSend(v7, "taskIdentifier"), v6);

}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didResolveMediaSelectionPropertyList:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v9;
  void *v10;
  void *v11;
  PendingCallback *v12;
  void *v13;
  PendingCallback *v14;
  id v15;

  v6 = a4;
  v7 = objc_msgSend(a3, "taskIdentifier");
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v9));

  objc_msgSend(v10, "setResolvedMediaSelectionPlist:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v11, 14, 1);

  v12 = [PendingCallback alloc];
  if (v6)
  {
    v15 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }
  else
  {
    v13 = &__NSArray0__struct;
  }
  v14 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v12, "initWithCallbackType:taskIdentifier:args:", 8, v7, v13);
  if (v6)

  -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->super._callbackQueue, "addPendingCallback:wakeRequirement:", v14, 0);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "taskIdentifier");
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v10));

  objc_msgSend(v11, "setCountOfBytesReceived:", objc_msgSend(v6, "countOfBytesWritten"));
  objc_msgSend(v11, "setCountOfBytesExpectedToReceive:", objc_msgSend(v6, "countOfBytesExpectedToWrite"));
  v12 = (id)qword_1000C7158;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_loggableDescription"));
    *(_DWORD *)buf = 138543874;
    v19 = v13;
    v20 = 2112;
    v21 = v7;
    v22 = 2048;
    v23 = objc_msgSend(v7, "code");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ AVAssetDownloadSession did complete with error %@ [%ld]", buf, 0x20u);

  }
  if (sub_10001AEC8((_BOOL8)v7))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession secondaryID](self, "secondaryID"));
    sub_100019980(3, v14, v15, v16, v17, v11, 0, (uint64_t)objc_msgSend(v6, "countOfBytesWritten"), 0, objc_msgSend(v11, "isDiscretionary"), 0, 1, 1, v7);

    -[NDBackgroundSession finalizeTaskCompletionWithSuppressedWake:](self, "finalizeTaskCompletionWithSuppressedWake:", 1);
    -[NDAVBackgroundSession cancelThroughputMonitorForWrapper:](self, "cancelThroughputMonitorForWrapper:", v8);
    -[NDAVBackgroundSession cancelTCPConnectionForTask:withError:](self, "cancelTCPConnectionForTask:withError:", v8, v7);
    -[NDAVBackgroundSession retryTask:originalError:](self, "retryTask:originalError:", v11, v7);
  }
  else
  {
    -[NDAVBackgroundSession taskWithIdentifier:didCompleteWithError:](self, "taskWithIdentifier:didCompleteWithError:", v8, v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedWakeTimer, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_storeStrong((id *)&self->_assetDownloadTokensToAssets, 0);
  objc_storeStrong((id *)&self->_identifiersToDASActivities, 0);
  objc_storeStrong((id *)&self->_identifiersToTCPConnections, 0);
  objc_storeStrong((id *)&self->_identifiersToThroughputMonitors, 0);
  objc_storeStrong((id *)&self->_identifiersToAVWrappers, 0);
}

@end
