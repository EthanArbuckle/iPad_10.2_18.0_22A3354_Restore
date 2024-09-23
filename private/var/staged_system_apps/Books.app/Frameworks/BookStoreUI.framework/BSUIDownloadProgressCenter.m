@implementation BSUIDownloadProgressCenter

- (BSUIDownloadProgressCenter)init
{
  BSUIDownloadProgressCenter *v2;
  uint64_t v3;
  NSMapTable *instanceMap;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQ;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BSUIDownloadProgressCenter;
  v2 = -[BSUIDownloadProgressCenter init](&v15, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    instanceMap = v2->_instanceMap;
    v2->_instanceMap = (NSMapTable *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("BSUIDownloadProgressCenter.access", v6);
    accessQ = v2->_accessQ;
    v2->_accessQ = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
    objc_msgSend(v9, "addObserver:", v2);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "_audiobookDownloadStatusNotification:", CFSTR("BSUIAudioBookDownloadStatusNotification"), 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "_ubiquityDownloadStatusNotification:", CFSTR("BSUIUbiquityDownloadStatusNotification"), 0);

    v12 = BCBookDownloadLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_2388F4(v13);

  }
  return v2;
}

- (id)dynamicProgressForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQ;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_27DAC;
  v26 = sub_27DBC;
  v27 = 0;
  accessQ = self->_accessQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_27DC4;
  block[3] = &unk_2E4E38;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v9;
  v19 = v8;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_sync(accessQ, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *accessQ;
  void *v11;
  id v12;
  id obj;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v12 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v8);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = sub_27DAC;
        v19 = sub_27DBC;
        v20 = 0;
        accessQ = self->_accessQ;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_28114;
        block[3] = &unk_2E4258;
        block[5] = v9;
        block[6] = &v15;
        block[4] = self;
        dispatch_sync(accessQ, block);
        if (v16[5])
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "percentComplete"));
          objc_msgSend((id)v16[5], "setProgress:", v11);

        }
        _Block_object_dispose(&v15, 8);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  -[BSUIDownloadProgressCenter downloadQueue:downloadStatesDidChange:](self, "downloadQueue:downloadStatesDidChange:", a3, a4, a5);
}

- (void)_audiobookDownloadStatusNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *accessQ;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[24];

  v4 = a3;
  v5 = objc_opt_class(BSUIAudioBookDownloadProgress);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BSUIAudioBookDownloadProgressKey")));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_27DAC;
    v23 = sub_27DBC;
    v24 = 0;
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_283D0;
    block[3] = &unk_2E4258;
    v18 = &v19;
    block[4] = self;
    v11 = v9;
    v17 = v11;
    dispatch_sync(accessQ, block);
    if (v20[5])
    {
      v12 = BCBookDownloadLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "progress"));
        sub_238934(v14, (uint64_t)v25, v13);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "progress"));
      objc_msgSend((id)v20[5], "setProgress:", v15);

    }
    _Block_object_dispose(&v19, 8);

  }
}

- (void)_ubiquityDownloadStatusNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *accessQ;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[24];

  v4 = a3;
  v5 = objc_opt_class(BSUIUbiquityDownloadProgress);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BSUIUbiquityDownloadProgressKey")));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_27DAC;
    v23 = sub_27DBC;
    v24 = 0;
    accessQ = self->_accessQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_28618;
    block[3] = &unk_2E4258;
    v18 = &v19;
    block[4] = self;
    v11 = v9;
    v17 = v11;
    dispatch_sync(accessQ, block);
    if (v20[5])
    {
      v12 = BCBookDownloadLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "progress"));
        sub_23897C(v14, (uint64_t)v25, v13);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "progress"));
      objc_msgSend((id)v20[5], "setProgress:", v15);

    }
    _Block_object_dispose(&v19, 8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQ, 0);
  objc_storeStrong((id *)&self->_instanceMap, 0);
}

@end
