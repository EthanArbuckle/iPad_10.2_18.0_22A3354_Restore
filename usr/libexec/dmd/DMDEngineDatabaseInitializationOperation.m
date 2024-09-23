@implementation DMDEngineDatabaseInitializationOperation

- (void)dealloc
{
  objc_super v3;

  -[DMDDeviceStateProvider removeObserver:forKeyPath:context:](self->_deviceStateProvider, "removeObserver:forKeyPath:context:", self, CFSTR("hasKeychainUnlockedSinceBoot"), "DMDEngineDatabaseInitializationOperationContext");
  v3.receiver = self;
  v3.super_class = (Class)DMDEngineDatabaseInitializationOperation;
  -[DMDEngineDatabaseOperation dealloc](&v3, "dealloc");
}

- (BOOL)isReady
{
  void *v3;
  BOOL v4;
  unsigned __int8 v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseInitializationOperation deviceStateProvider](self, "deviceStateProvider"));
  v7.receiver = self;
  v7.super_class = (Class)DMDEngineDatabaseInitializationOperation;
  if (-[DMDEngineDatabaseInitializationOperation isReady](&v7, "isReady"))
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "hasKeychainUnlockedSinceBoot");

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if (a6 == "DMDEngineDatabaseInitializationOperationContext")
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("hasKeychainUnlockedSinceBoot"), a4, a5))
    {
      -[DMDEngineDatabaseInitializationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isReady"));
      -[DMDEngineDatabaseInitializationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isReady"));
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DMDEngineDatabaseInitializationOperation;
    -[DMDEngineDatabaseInitializationOperation observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)setDeviceStateProvider:(id)a3
{
  DMDDeviceStateProvider *v4;
  DMDDeviceStateProvider *deviceStateProvider;
  DMDDeviceStateProvider *v6;

  v4 = (DMDDeviceStateProvider *)a3;
  -[DMDDeviceStateProvider removeObserver:forKeyPath:context:](self->_deviceStateProvider, "removeObserver:forKeyPath:context:", self, CFSTR("hasKeychainUnlockedSinceBoot"), "DMDEngineDatabaseInitializationOperationContext");
  deviceStateProvider = self->_deviceStateProvider;
  self->_deviceStateProvider = v4;
  v6 = v4;

  -[DMDDeviceStateProvider addObserver:forKeyPath:options:context:](self->_deviceStateProvider, "addObserver:forKeyPath:options:context:", self, CFSTR("hasKeychainUnlockedSinceBoot"), 4, "DMDEngineDatabaseInitializationOperationContext");
}

- (void)operationWillStart
{
  objc_super v3;

  -[DMDEngineDatabaseInitializationOperation setDeviceStateProvider:](self, "setDeviceStateProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)DMDEngineDatabaseInitializationOperation;
  -[DMDEngineDatabaseInitializationOperation operationWillStart](&v3, "operationWillStart");
}

- (void)main
{
  _QWORD v3[5];

  -[DMDEngineDatabaseInitializationOperation destroyLegacyDatabaseIfNeeded](self, "destroyLegacyDatabaseIfNeeded");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100039AF8;
  v3[3] = &unk_1000BAD98;
  v3[4] = self;
  -[DMDEngineDatabaseInitializationOperation loadPersistentStoresWithCompletionHandler:](self, "loadPersistentStoresWithCompletionHandler:", v3);
}

- (void)destroyLegacyDatabaseIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t v32[8];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager dmd_legacyUserConfigurationEngineDatabaseURL](NSFileManager, "dmd_legacyUserConfigurationEngineDatabaseURL"));
  if (objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("-wal")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("-shm")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v8, 0));

    v41[0] = v3;
    v41[1] = v9;
    v41[2] = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 3));
    v11 = DMFConfigurationEngineLog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "removing legacy database...", buf, 2u);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v14)
    {
      v15 = v14;
      v29 = v9;
      v30 = v6;
      v31 = v3;
      v16 = 0;
      v17 = *(_QWORD *)v35;
      v18 = 1;
      do
      {
        v19 = 0;
        v20 = v16;
        do
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v13);
          v21 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v19);
          v33 = v20;
          v22 = objc_msgSend(v2, "removeItemAtURL:error:", v21, &v33);
          v16 = v33;

          if ((v22 & 1) == 0)
          {
            v24 = DMFConfigurationEngineLog(v23);
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              sub_1000760E0(buf, v16, &v39, v25);

            v18 = 0;
          }
          v19 = (char *)v19 + 1;
          v20 = v16;
        }
        while (v15 != v19);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v15);

      v6 = v30;
      v3 = v31;
      v9 = v29;
      if ((v18 & 1) == 0)
        goto LABEL_21;
    }
    else
    {

      v16 = 0;
    }
    v27 = DMFConfigurationEngineLog(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "deleted legacy database", v32, 2u);
    }

LABEL_21:
  }

}

- (void)loadPersistentStoresWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableArray *v9;
  void *v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  void *v14;
  _QWORD v15[4];
  NSMutableArray *v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentStoreDescriptions"));
  v8 = objc_msgSend(v7, "mutableCopy");

  if (!objc_msgSend(v8, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDEngineDatabaseInitializationOperation.m"), 112, CFSTR("Configuration database does not have registered persistent stores"));

  }
  v9 = objc_opt_new(NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003A0C0;
  v15[3] = &unk_1000BAE58;
  v16 = v9;
  v17 = v8;
  v18 = v5;
  v11 = v5;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v10, "loadPersistentStoresWithCompletionHandler:", v15);

}

- (void)fixupDatabaseWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A3C8;
  v7[3] = &unk_1000BAEA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBackgroundTask:", v7);

}

- (BOOL)updateMetadataForManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  id *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v17 = a4;
  v18 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreCoordinator"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentStores"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadataForPersistentStore:", v12, v17));
        v14 = objc_msgSend(v13, "mutableCopy");

        objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("DMDEngineDatabaseFixedDigitalHealthUsageEventMetadataKey"));
        objc_msgSend(v6, "setMetadata:forPersistentStore:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v15 = objc_msgSend(v18, "save:", v17);
  return v15;
}

- (BOOL)destroyPersistentStoresWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSMutableArray *v29;
  id obj;
  uint64_t v31;
  DMDEngineDatabaseInitializationOperation *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];

  v29 = objc_opt_new(NSMutableArray);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v32 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentStoreDescriptions"));

  obj = v5;
  v33 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  v6 = 0;
  if (v33)
  {
    v31 = *(_QWORD *)v36;
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](v32, "database"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentStoreCoordinator"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "options"));
        v34 = v8;
        v15 = objc_msgSend(v11, "destroyPersistentStoreAtURL:withType:options:error:", v12, v13, v14, &v34);
        v6 = v34;

        if ((v15 & 1) == 0)
        {
          v17 = DMFConfigurationEngineLog(v16);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "verboseDescription"));
            *(_DWORD *)buf = 138543618;
            v42 = v20;
            v43 = 2114;
            v44 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "unable to remove persistent store %{public}@: %{public}@", buf, 0x16u);

          }
          -[NSMutableArray addObject:](v29, "addObject:", v6);
        }
        v7 = (char *)v7 + 1;
        v8 = v6;
      }
      while (v33 != v7);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v33);
  }

  v22 = -[NSMutableArray count](v29, "count");
  v23 = v22;
  if (a3 && v22)
  {
    v39 = DMFErrorFailedConfigurationDatabaseStoreKey;
    v24 = -[NSMutableArray copy](v29, "copy");
    v40 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    v26 = DMFErrorWithCodeAndUserInfo(4007, v25);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v26);

  }
  return v23 == 0;
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceStateProvider, 0);
}

@end
