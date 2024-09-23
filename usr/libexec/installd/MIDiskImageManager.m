@implementation MIDiskImageManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E0E4;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DF38 != -1)
    dispatch_once(&qword_10009DF38, block);
  return (id)qword_10009DF30;
}

- (void)_initializeMountInfoFromStorage
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD block[5];
  id v18;
  id v19;

  v3 = sub_10000E344();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v4, &v19));
  v6 = v19;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DiskImageMountPaths")));
    objc_opt_class(NSArray);
    v9 = v8;
    if ((objc_opt_isKindOfClass(v9) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10)
    {
      objc_opt_class(NSString);
      if (sub_100011190(v10))
      {
        v13 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000E3A8;
        block[3] = &unk_100084F18;
        block[4] = self;
        v10 = v10;
        v18 = v10;
        dispatch_sync(v13, block);

LABEL_19:
        goto LABEL_20;
      }
    }
    v14 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_19;
    v15 = CFSTR("Mount paths key was not set in storage plist or was not an array of strings; found: %@");
LABEL_18:
    MOLogWrite(v14, 3, "-[MIDiskImageManager _initializeMountInfoFromStorage]", v15);
    goto LABEL_19;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  if (objc_msgSend(v11, "isEqualToString:", NSCocoaErrorDomain))
  {
    v12 = objc_msgSend(v7, "code");

    if (v12 == (id)260)
      goto LABEL_20;
  }
  else
  {

  }
  v16 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v15 = CFSTR("Failed to read %@ : %@");
    v14 = v16;
    goto LABEL_18;
  }
LABEL_20:
  if (!self->_mountInfo)
    -[MIDiskImageManager resetMountPaths](self, "resetMountPaths");

}

- (MIDiskImageManager)init
{
  MIDiskImageManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *lsRegisterQueue;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *mountInfoAccessQueue;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MIDiskImageManager;
  v2 = -[MIDiskImageManager init](&v16, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.MobileInstallation.MIDiskImageManager.internal", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.MobileInstallation.DiskImageManager.lsregister", v8);
    lsRegisterQueue = v2->_lsRegisterQueue;
    v2->_lsRegisterQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.MobileInstallation.MIDiskImageManager.mountInfo", v12);
    mountInfoAccessQueue = v2->_mountInfoAccessQueue;
    v2->_mountInfoAccessQueue = (OS_dispatch_queue *)v13;

    -[MIDiskImageManager _initializeMountInfoFromStorage](v2, "_initializeMountInfoFromStorage");
  }
  return v2;
}

- (void)resetMountPaths
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E50C;
  block[3] = &unk_100084C30;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_onQueue_saveMountPaths
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  id v16;
  const __CFString *v17;
  void *v18;

  v3 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfo](self, "mountInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

  v6 = sub_10000E344();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (objc_msgSend(v5, "count"))
  {
    v17 = CFSTR("DiskImageMountPaths");
    v18 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v15 = 0;
    v9 = objc_msgSend(v8, "MI_writeToURL:format:options:error:", v7, 200, 268435457, &v15);
    v10 = v15;
    if ((v9 & 1) == 0)
    {
      v11 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
        MOLogWrite(v11, 3, "-[MIDiskImageManager _onQueue_saveMountPaths]", CFSTR("Failed to write known image mount paths to %@ : %@"));

      }
    }

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
    v16 = 0;
    v13 = objc_msgSend(v12, "removeItemAtURL:error:", v7, &v16);
    v10 = v16;

    if ((v13 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
      MOLogWrite(qword_10009E048, 3, "-[MIDiskImageManager _onQueue_saveMountPaths]", CFSTR("Failed to remove saved image mounts file: %@"));
  }

}

- (id)_mountInfoForPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", a3, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_bundleIDMapForAppsInDirectory:", v3));

  return v5;
}

- (void)_onQueue_configureMountInfoForPaths:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_opt_new(NSMutableDictionary);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("Applications"), (_QWORD)v15));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager _mountInfoForPath:](self, "_mountInfoForPath:", v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[MIDiskImageManager setMountInfo:](self, "setMountInfo:", v6);
}

- (BOOL)_isKnownPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EBB8;
  block[3] = &unk_100084F40;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_addMountPath:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ECD4;
  block[3] = &unk_100084F68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (BOOL)_removeMountPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EE04;
  block[3] = &unk_100084F40;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_setPendingMountPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF20;
  block[3] = &unk_100084F18;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_clearPendingMountPath
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF98;
  block[3] = &unk_100084C30;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (BOOL)URLIsOnKnownImageMount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  BOOL v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", v4, 0, 1, 0));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v8 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F0F4;
    block[3] = &unk_100084F40;
    block[4] = self;
    v13 = v7;
    v14 = &v15;
    v9 = v7;
    dispatch_sync(v8, block);

    v10 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSSet)diskMountPaths
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
  v10 = sub_10000F330;
  v11 = sub_10000F340;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F348;
  v6[3] = &unk_100084F90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (id)diskImageAppInfoForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = sub_10000F330;
  v16 = sub_10000F340;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F4CC;
  block[3] = &unk_100084F40;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)bundleIDIsOnKnownImageMount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F6A4;
  block[3] = &unk_100084F40;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (NSSet)diskImageAppBundleIDs
{
  NSMutableSet *v3;
  NSObject *v4;
  NSMutableSet *v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  MIDiskImageManager *v12;
  NSMutableSet *v13;

  v3 = objc_opt_new(NSMutableSet);
  v4 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager mountInfoAccessQueue](self, "mountInfoAccessQueue"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10000F83C;
  v11 = &unk_100084F18;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(v4, &v8);

  v6 = -[NSMutableSet copy](v5, "copy", v8, v9, v10, v11, v12);
  return (NSSet *)v6;
}

- (id)_onQueue_scanApps:(id)a3 returnMapInfo:(id *)a4
{
  id v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  id v14;
  NSMutableDictionary *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  NSMutableDictionary *v23;
  id v24;
  NSMutableDictionary *v25;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = objc_opt_new(NSMutableDictionary);
  v9 = objc_opt_new(NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "standardInfoMapInfoPlistKeys"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000FAD0;
  v22[3] = &unk_100085030;
  v13 = v8;
  v23 = v13;
  v14 = v11;
  v24 = v14;
  v15 = v9;
  v25 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v6, 1, v22));

  if (v16)
  {
    v17 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
      v21 = v16;
      MOLogWrite(v17, 3, "-[MIDiskImageManager _onQueue_scanApps:returnMapInfo:]", CFSTR("Encountered error while enumerating %@ : %@"));

    }
  }
  if (a4)
    *a4 = -[NSMutableDictionary copy](v15, "copy");
  v18 = -[NSMutableDictionary copy](v13, "copy", v20, v21);

  return v18;
}

- (void)_onQueue_registerDiscoveredAppEntries:(id)a3 onMountPoint:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskImageManager lsRegisterQueue](self, "lsRegisterQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000100EC;
  v15[3] = &unk_100085080;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  MIRunTransactionalTask(v11, "com.apple.installd.register-content-diskImage", v15);

}

- (void)registerContentsAtMountPoint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MIDiskImageManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010368;
  block[3] = &unk_1000850A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (void)reregisterContentsAtMountPoint:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  MIDiskImageManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010684;
  block[3] = &unk_100084F18;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)unregisterContentsAtMountPoint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MIDiskImageManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MIDiskImageManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010958;
  block[3] = &unk_1000850A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)lsRegisterQueue
{
  return self->_lsRegisterQueue;
}

- (OS_dispatch_queue)mountInfoAccessQueue
{
  return self->_mountInfoAccessQueue;
}

- (NSMutableDictionary)mountInfo
{
  return self->_mountInfo;
}

- (void)setMountInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mountInfo, a3);
}

- (NSString)pendingMountPath
{
  return self->_pendingMountPath;
}

- (void)setPendingMountPath:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMountPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMountPath, 0);
  objc_storeStrong((id *)&self->_mountInfo, 0);
  objc_storeStrong((id *)&self->_mountInfoAccessQueue, 0);
  objc_storeStrong((id *)&self->_lsRegisterQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
