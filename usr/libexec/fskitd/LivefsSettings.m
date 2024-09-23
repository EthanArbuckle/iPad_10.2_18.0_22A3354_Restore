@implementation LivefsSettings

- (void)initFresh
{
  NSMutableArray *v3;
  NSMutableArray *mounts;

  v3 = (NSMutableArray *)objc_opt_new(NSMutableArray, a2);
  mounts = self->_mounts;
  self->_mounts = v3;

  self->_needsLoad = 1;
  -[LivefsSettings setIdleTimer:](self, "setIdleTimer:", 0);
}

- (LivefsSettings)init
{
  LivefsSettings *v2;
  LivefsSettings *v3;
  uint64_t BootUUID;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *tasks;
  uint64_t v10;
  uint64_t v11;
  NSMutableSet *taskUpdateClients;
  uint64_t v13;
  uint64_t v14;
  FSResourceManager *resourceManager;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  objc_super v21;
  uint8_t buf[4];
  NSString *v23;

  v21.receiver = self;
  v21.super_class = (Class)LivefsSettings;
  v2 = -[LivefsSettings init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    BootUUID = getBootUUID(-[LivefsSettings initFresh](v2, "initFresh"));
    v5 = objc_claimAutoreleasedReturnValue(BootUUID);
    v6 = v3->_bootUUID;
    v3->_bootUUID = (NSString *)v5;

    v8 = objc_opt_new(NSMutableDictionary, v7);
    tasks = v3->_tasks;
    v3->_tasks = (NSMutableDictionary *)v8;

    v11 = objc_opt_new(NSMutableSet, v10);
    taskUpdateClients = v3->_taskUpdateClients;
    v3->_taskUpdateClients = (NSMutableSet *)v11;

    v14 = objc_opt_new(FSResourceManager, v13);
    resourceManager = v3->_resourceManager;
    v3->_resourceManager = (FSResourceManager *)v14;

    v17 = livefs_std_log(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = v3->_bootUUID;
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Got boot UUID %@", buf, 0xCu);
    }

  }
  return v3;
}

- (NSArray)mounts
{
  uint64_t v4;

  if (self->_needsLoad)
  {
    v4 = 0;
    -[LivefsSettings load:](self, "load:", &v4);
  }
  return (NSArray *)-[NSMutableArray copy](self->_mounts, "copy");
}

- (void)startedWorkLocked
{
  NSObject *idleTimerSource;
  dispatch_time_t v3;

  idleTimerSource = self->_idleTimerSource;
  if (idleTimerSource)
  {
    v3 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(idleTimerSource, v3, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }
}

- (void)setIdleTimerLocked:(BOOL)a3
{
  NSObject *idleTimerSource;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  uint64_t v8;
  NSObject *v9;

  idleTimerSource = self->_idleTimerSource;
  if (a3)
  {
    if (idleTimerSource)
    {
      dispatch_source_cancel(idleTimerSource);
      v5 = self->_idleTimerSource;
      self->_idleTimerSource = 0;

    }
  }
  else if (!idleTimerSource)
  {
    v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, 0);
    v7 = self->_idleTimerSource;
    self->_idleTimerSource = v6;

    dispatch_source_set_timer((dispatch_source_t)self->_idleTimerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_source_set_event_handler((dispatch_source_t)self->_idleTimerSource, &stru_100055B90);
    dispatch_resume((dispatch_object_t)self->_idleTimerSource);
    v8 = livefs_std_log(-[LivefsSettings startedWorkLocked](self, "startedWorkLocked"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10003C9D8(v9);

  }
}

- (void)setIdleTimer:(BOOL)a3
{
  _BOOL8 v3;
  LivefsSettings *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  -[LivefsSettings setIdleTimerLocked:](obj, "setIdleTimerLocked:", v3);
  objc_sync_exit(obj);

}

- (void)taskSetChanged
{
  _BOOL8 v2;
  LivefsSettings *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = -[NSMutableArray count](obj->_mounts, "count")
    || -[NSMutableDictionary count](obj->_tasks, "count")
    || -[NSMutableSet count](obj->_taskUpdateClients, "count") != 0;
  -[LivefsSettings setIdleTimerLocked:](obj, "setIdleTimerLocked:", v2);
  objc_sync_exit(obj);

}

- (void)startedWork
{
  LivefsSettings *obj;

  obj = self;
  objc_sync_enter(obj);
  -[LivefsSettings startedWorkLocked](obj, "startedWorkLocked");
  objc_sync_exit(obj);

}

- (void)cleanupConfigFromLastBoot
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  LivefsSettings *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10003CA58(v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = self;
  v6 = self->_mounts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", LiveFSMounterVolumeProviderNameKey));
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider"));

        if ((v13 & 1) == 0)
          objc_msgSend(v3, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeObjectsInArray:](v14->_mounts, "removeObjectsInArray:", v3);
  -[LivefsSettings save:](v14, "save:", 0);

}

- (BOOL)load:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  NSMutableArray *DeepCopy;
  NSMutableArray *mounts;
  void *v18;
  NSString *bootUUID;
  uint64_t v20;
  NSObject *v21;
  id v23;
  id v24;

  v24 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LiveFSClient supportDirURL:forURL:daemonPrefName:error:](LiveFSClient, "supportDirURL:forURL:daemonPrefName:error:", 14, 0, CFSTR("livefsd"), &v24));
  v6 = v24;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("settings.plist")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    if ((v13 & 1) != 0)
    {
      v23 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v10, &v23));
      v14 = v23;
      v7 = v14;
      if (v14 || !v8)
      {
        if (a3)
        {
          v7 = objc_retainAutorelease(v14);
          v9 = 0;
          *a3 = v7;
        }
        else
        {
          v9 = 0;
        }
        goto LABEL_25;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mounts")));
      DeepCopy = (NSMutableArray *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, v15, 1uLL);
      mounts = self->_mounts;
      self->_mounts = DeepCopy;

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("bootUUID")));
      bootUUID = self->_bootUUID;
      if (bootUUID)
      {
        if (!v18 || !-[NSString isEqualToString:](bootUUID, "isEqualToString:", v18))
          -[LivefsSettings cleanupConfigFromLastBoot](self, "cleanupConfigFromLastBoot");
      }
      else
      {
        v20 = livefs_std_log(0);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_10003CA98(v21);

      }
      if (self->_needsLoad)
        self->_needsLoad = 0;
      -[LivefsSettings taskSetChanged](self, "taskSetChanged");

      v7 = 0;
    }
    else
    {
      if (!self->_needsLoad)
        -[LivefsSettings initFresh](self, "initFresh");
      v7 = 0;
      v8 = 0;
      self->_needsLoad = 0;
    }
    v9 = 1;
    goto LABEL_25;
  }
  v7 = v6;
  if (a3)
  {
    v7 = objc_retainAutorelease(v6);
    v8 = 0;
    v9 = 0;
    *a3 = v7;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v10 = v5;
LABEL_25:

  return v9;
}

- (BOOL)save:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  __CFString *bootUUID;
  __CFString *v11;
  NSMutableArray *mounts;
  void *v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  id v23;

  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LiveFSClient supportDirURL:forURL:daemonPrefName:error:](LiveFSClient, "supportDirURL:forURL:daemonPrefName:error:", 14, 0, CFSTR("livefsd"), &v19));
  v6 = v19;
  if (v6)
  {
    v7 = v6;
    if (a3)
    {
      v7 = objc_retainAutorelease(v6);
      v8 = 0;
      *a3 = v7;
    }
    else
    {
      v8 = 0;
    }
    v9 = v5;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("settings.plist")));

    if (-[NSMutableArray count](self->_mounts, "count"))
    {
      bootUUID = (__CFString *)self->_bootUUID;
      if (!bootUUID)
        bootUUID = &stru_100056698;
      v11 = bootUUID;
      mounts = self->_mounts;
      v20[0] = CFSTR("mounts");
      v20[1] = CFSTR("bootUUID");
      v21[0] = mounts;
      v21[1] = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      v17 = 0;
      objc_msgSend(v13, "writeToURL:error:", v9, &v17);
      v14 = v17;
      v7 = v14;
      if (a3 && v14)
      {
        *a3 = objc_retainAutorelease(v14);
      }
      else if (!v14)
      {
        -[LivefsSettings setIdleTimer:](self, "setIdleTimer:", 1);
      }
      v8 = v7 == 0;

    }
    else
    {
      -[LivefsSettings taskSetChanged](self, "taskSetChanged");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v18 = 0;
      objc_msgSend(v15, "removeItemAtURL:error:", v9, &v18);
      v7 = v18;

      if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error deleting preference file: %@", buf, 0xCu);
      }
      v8 = 1;
    }
  }

  return v8;
}

- (id)serializedError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  if (v4)
  {
    v13[0] = CFSTR("errorDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v14[0] = v5;
    v13[1] = CFSTR("errorCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(v3, "code")));
    v14[1] = v6;
    v13[2] = CFSTR("errorInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

    v14[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));

  }
  else
  {
    v11[0] = CFSTR("errorDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v11[1] = CFSTR("errorCode");
    v12[0] = v5;
    v9 = objc_msgSend(v3, "code");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v9));
    v12[1] = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  }

  return v8;
}

- (id)deserializedError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("errorCode")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("errorInfo")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("errorDomain")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, objc_msgSend(v4, "longValue"), v5));
  return v7;
}

- (id)addMountNamed:(id)a3 displayName:(id)a4 mountID:(unsigned int)a5 mountedOn:(id)a6 provider:(id)a7 fpStorage:(id)a8 domainError:(id)a9 how:(int)a10 isReAdd:(BOOL)a11
{
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  id v20;
  LivefsSettings *v21;
  void *v22;
  NSMutableArray *mounts;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSMutableArray *v36;
  unsigned int v37;
  id v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;

  v14 = *(_QWORD *)&a5;
  v17 = a3;
  v41 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v42 = a9;
  v21 = self;
  objc_sync_enter(v21);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = -1;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
  mounts = v21->_mounts;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10002B4F8;
  v44[3] = &unk_100055BB8;
  v24 = v19;
  v45 = v24;
  v25 = v18;
  v46 = v25;
  v26 = v22;
  v47 = v26;
  v27 = v20;
  v48 = v27;
  v28 = v17;
  v49 = v28;
  v50 = &v51;
  -[NSMutableArray enumerateObjectsUsingBlock:](mounts, "enumerateObjectsUsingBlock:", v44);
  if (v52[3] == -1 || a11)
  {
    v32 = v41;
    v33 = (void *)objc_opt_new(NSMutableDictionary, v29);
    objc_msgSend(v33, "setObject:forKey:", v28, LiveFSMounterVolumeNameKey);
    objc_msgSend(v33, "setObject:forKey:", v41, LiveFSMounterDisplayNameKey);
    objc_msgSend(v33, "setObject:forKey:", v25, LiveFSMounterMountedOnKey);
    objc_msgSend(v33, "setObject:forKey:", v26, LiveFSMounterMountIDKey);
    objc_msgSend(v33, "setObject:forKey:", v24, LiveFSMounterVolumeProviderNameKey);
    objc_msgSend(v33, "setObject:forKey:", v27, LiveFSMounterDomainStorageKey);
    if (v42)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[LivefsSettings serializedError:](v21, "serializedError:", v42));
      objc_msgSend(v33, "setObject:forKey:", v34, LiveFSMounterDomainErrorKey);

    }
    if ((a10 & 0x20) != 0)
      objc_msgSend(v33, "setObject:forKey:", &__kCFBooleanTrue, LiveFSMounterDomainContainsPhotos);
    if ((a10 & 0x80) != 0)
      objc_msgSend(v33, "setObject:forKey:", &__kCFBooleanTrue, LiveFSMounterDomainHidden);
    if ((a10 & 0x1000) != 0)
      objc_msgSend(v33, "setObject:forKey:", &__kCFBooleanTrue, LiveFSMounterDomainErasable);
    v35 = v52[3];
    v36 = v21->_mounts;
    if (v35 == -1)
      -[NSMutableArray addObject:](v36, "addObject:", v33);
    else
      -[NSMutableArray replaceObjectAtIndex:withObject:](v36, "replaceObjectAtIndex:withObject:", v35, v33);
    if (v21->_needsLoad)
      v21->_needsLoad = 0;
    v43 = 0;
    v37 = -[LivefsSettings save:](v21, "save:", &v43);
    v38 = v43;
    v30 = v38;
    if (v37)
      v39 = 0;
    else
      v39 = v38;
    v31 = v39;

  }
  else
  {
    v30 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 516, 0));
    v31 = v30;
    v32 = v41;
  }

  _Block_object_dispose(&v51, 8);
  objc_sync_exit(v21);

  return v31;
}

- (id)updateMountEntry:(id)a3 provider:(id)a4 settingsDictionary:(id *)a5 updateBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  LivefsSettings *v13;
  NSMutableArray *mounts;
  id v15;
  id v16;
  void *v17;
  id v18;
  unsigned int v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = self;
  objc_sync_enter(v13);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = -1;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10002B8BC;
  v35 = sub_10002B8CC;
  v36 = 0;
  mounts = v13->_mounts;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002B8D4;
  v26[3] = &unk_100055BE0;
  v15 = v11;
  v27 = v15;
  v16 = v10;
  v28 = v16;
  v29 = &v37;
  v30 = &v31;
  -[NSMutableArray enumerateObjectsUsingBlock:](mounts, "enumerateObjectsUsingBlock:", v26);
  if (v38[3] == -1)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 0x7FFFFFFFFFFFFFFFLL, 0));
    v23 = v21;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v32[5]));
    v12[2](v12, v17);
    -[NSMutableArray replaceObjectAtIndex:withObject:](v13->_mounts, "replaceObjectAtIndex:withObject:", v38[3], v17);
    v18 = objc_retainAutorelease(v17);
    *a5 = v18;
    v25 = 0;
    v19 = -[LivefsSettings save:](v13, "save:", &v25);
    v20 = v25;
    v21 = v20;
    if (v19)
      v22 = 0;
    else
      v22 = v20;
    v23 = v22;

  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  objc_sync_exit(v13);

  return v23;
}

- (id)removeMountNamed:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  LivefsSettings *v8;
  NSMutableArray *mounts;
  id v10;
  id v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v15;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -1;
  mounts = v8->_mounts;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002BB34;
  v18[3] = &unk_100055C08;
  v10 = v7;
  v19 = v10;
  v11 = v6;
  v20 = v11;
  v21 = &v22;
  -[NSMutableArray enumerateObjectsUsingBlock:](mounts, "enumerateObjectsUsingBlock:", v18);
  if (v23[3] == -1)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 0x7FFFFFFFFFFFFFFFLL, 0));
    v14 = v13;
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](v8->_mounts, "removeObjectAtIndex:");
    v17 = 0;
    v12 = -[LivefsSettings save:](v8, "save:", &v17);
    v13 = v17;
    v14 = v13;
    if (v12)
      v13 = 0;
  }
  v15 = v13;

  _Block_object_dispose(&v22, 8);
  objc_sync_exit(v8);

  return v15;
}

- (void)removeReferencesToTask:(id)a3
{
  NSMutableDictionary *v4;
  FSResourceManager *v5;
  id v6;

  v6 = a3;
  v4 = self->_tasks;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](self->_tasks, "removeObjectForKey:", v6);
  objc_sync_exit(v4);

  v5 = self->_resourceManager;
  objc_sync_enter(v5);
  -[FSResourceManager removeTaskUUID:](self->_resourceManager, "removeTaskUUID:", v6);
  objc_sync_exit(v5);

}

- (NSString)bootUUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)tasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTasks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableSet)taskUpdateClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTaskUpdateClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (FSResourceManager)resourceManager
{
  return (FSResourceManager *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResourceManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_taskUpdateClients, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_bootUUID, 0);
  objc_storeStrong((id *)&self->_idleTimerSource, 0);
  objc_storeStrong((id *)&self->_mounts, 0);
}

@end
