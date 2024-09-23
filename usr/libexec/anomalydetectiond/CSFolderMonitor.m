@implementation CSFolderMonitor

- (CSFolderMonitor)initWithFolder:(id)a3 fileExtension:(id)a4 queue:(id)a5 postfix:(id)a6 andAction:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CSFolderMonitor *v17;
  CSFolderMonitor *v18;
  NSURL *v19;
  NSURL *folderURL;
  id v21;
  id action;
  dispatch_group_t v23;
  OS_dispatch_group *scanGroup;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CSFolderMonitor;
  v17 = -[CSFolderMonitor init](&v26, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_actionQueue, a5);
    v19 = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v12, 1);
    folderURL = v18->_folderURL;
    v18->_folderURL = v19;

    objc_storeStrong((id *)&v18->_extension, a4);
    v21 = objc_retainBlock(v16);
    action = v18->_action;
    v18->_action = v21;

    v23 = dispatch_group_create();
    scanGroup = v18->_scanGroup;
    v18->_scanGroup = (OS_dispatch_group *)v23;

    objc_storeStrong((id *)&v18->_postfix, a6);
  }

  return v18;
}

- (BOOL)scan:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  id obj;
  void *v23;
  _QWORD block[4];
  id v25;
  void *v26;
  CSFolderMonitor *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _BYTE v43[128];

  v4 = objc_claimAutoreleasedReturnValue(-[CSFolderMonitor scanGroup](self, "scanGroup"));
  dispatch_group_enter(v4);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10001A96C;
  v37 = sub_10001A97C;
  v38 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSFolderMonitor folderURL](self, "folderURL"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001A984;
  v32[3] = &unk_100346F60;
  v32[4] = &v33;
  v32[5] = &v39;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 5, v32));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSFolderMonitor extension](self, "extension"));
        if (objc_msgSend(v11, "isEqualToString:", &stru_100366D80))
        {

        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathExtension"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSFolderMonitor extension](self, "extension"));
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if (!v14)
            continue;
        }
        v15 = objc_claimAutoreleasedReturnValue(-[CSFolderMonitor scanGroup](self, "scanGroup"));
        v16 = objc_claimAutoreleasedReturnValue(-[CSFolderMonitor actionQueue](self, "actionQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001A9D4;
        block[3] = &unk_100346F88;
        v25 = v23;
        v26 = v10;
        v27 = self;
        dispatch_group_async(v15, v16, block);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
    }
    while (v7);
  }

  v17 = objc_claimAutoreleasedReturnValue(-[CSFolderMonitor scanGroup](self, "scanGroup"));
  dispatch_group_leave(v17);

  v18 = objc_claimAutoreleasedReturnValue(-[CSFolderMonitor scanGroup](self, "scanGroup"));
  dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

  v19 = *((unsigned __int8 *)v40 + 24);
  if (a3 && *((_BYTE *)v40 + 24))
    *a3 = objc_retainAutorelease((id)v34[5]);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v19 == 0;
}

- (void)setupRecurringScanningWithConfiguration:(id)a3 runNow:(BOOL)a4
{
  id v6;
  xpc_object_t v7;
  NSFileProtectionType v8;
  NSFileProtectionType v9;
  NSFileProtectionType v10;
  NSObject *v11;
  void *v12;
  const char **v13;
  int v14;
  void *v15;

  v6 = a3;
  v7 = xpc_dictionary_create(0, 0, 0);
  if (!a4)
    xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, (int64_t)objc_msgSend(v6, "periodInSeconds"));
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_ALLOW_BATTERY, (BOOL)objc_msgSend(v6, "allowBattery"));
  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, (int64_t)objc_msgSend(v6, "periodInSeconds"));
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  v8 = (NSFileProtectionType)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtectionType"));

  if (v8 == NSFileProtectionCompleteUnlessOpen)
  {
    v13 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_B;
LABEL_14:
    xpc_dictionary_set_BOOL(v7, *v13, 1);
    goto LABEL_15;
  }
  v9 = (NSFileProtectionType)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtectionType"));

  if (v9 == NSFileProtectionCompleteUntilFirstUserAuthentication)
  {
    v13 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_C;
    goto LABEL_14;
  }
  v10 = (NSFileProtectionType)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtectionType"));

  if (v10 == NSFileProtectionComplete)
  {
    v13 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_A;
    goto LABEL_14;
  }
  if (qword_100387440 != -1)
    dispatch_once(&qword_100387440, &stru_100346FD0);
  v11 = (id)qword_100387448;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtectionType"));
    v14 = 138412290;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unsuported file protection type setting up recurring scan %@", (uint8_t *)&v14, 0xCu);

  }
LABEL_15:
  -[CSFolderMonitor registerForFolderMonitorActivityWithCriteria:](self, "registerForFolderMonitorActivityWithCriteria:", v7);

}

- (void)registerForFolderMonitorActivity
{
  -[CSFolderMonitor registerForFolderMonitorActivityWithCriteria:](self, "registerForFolderMonitorActivityWithCriteria:", XPC_ACTIVITY_CHECK_IN);
}

- (void)registerForFolderMonitorActivityWithCriteria:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  _QWORD handler[4];
  id v16;
  id v17;
  id v18;
  id location;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSFolderMonitor postfix](self, "postfix"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSFolderMonitor extension](self, "extension"));
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSFolderMonitor extension](self, "extension"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("."), "stringByAppendingString:", v3));
  }
  else
  {
    v9 = &stru_100366D80;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.anomalydetectiond.CSFolderMonitor%@%@"), v6, v9));
  if (v8)
  {

  }
  objc_initWeak(&location, self);
  v11 = objc_retainAutorelease(v10);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001B298;
  handler[3] = &unk_100346FB0;
  v13 = v5;
  v16 = v13;
  v14 = v11;
  v17 = v14;
  objc_copyWeak(&v18, &location);
  xpc_activity_register(v12, v13, handler);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)stopRecurringScanning
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CSFolderMonitor folderURL](self, "folderURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSFolderMonitor extension](self, "extension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.anomalydetectiond.CSFolderMonitor.%@.%@"), v3, v4));

  v7 = objc_retainAutorelease(v5);
  xpc_activity_unregister((const char *)objc_msgSend(v7, "UTF8String"));

}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (NSString)extension
{
  return self->_extension;
}

- (id)action
{
  return self->_action;
}

- (OS_dispatch_queue)actionQueue
{
  return self->_actionQueue;
}

- (OS_dispatch_group)scanGroup
{
  return self->_scanGroup;
}

- (NSString)postfix
{
  return self->_postfix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postfix, 0);
  objc_storeStrong((id *)&self->_scanGroup, 0);
  objc_storeStrong((id *)&self->_actionQueue, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end
