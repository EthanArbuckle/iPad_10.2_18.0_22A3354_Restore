@implementation TransparencyManagedDataStoreController

- (TransparencyManagedDataStoreController)init
{
  void *v3;
  TransparencyManagedDataStoreController *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  v4 = -[TransparencyManagedDataStoreController initWithContainer:logger:](self, "initWithContainer:logger:", 0, v3);

  return v4;
}

- (TransparencyManagedDataStoreController)initWithContainer:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  TransparencyManagedDataStoreController *v8;
  KTCondition *v9;
  void *v10;
  TransparencyManagedDataStoreController *v11;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSPersistentContainer *v18;
  NSPersistentContainer *persistentContainer;
  NSPersistentContainer *v20;
  void *v21;
  id v22;
  objc_super v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TransparencyManagedDataStoreController;
  v8 = -[TransparencyManagedDataStoreController init](&v23, "init");
  if (v8)
  {
    +[KTLoggableDataArrayTransformer registerTransformer](KTLoggableDataArrayTransformer, "registerTransformer");
    +[KTNSErrorValueTransformer registerTransformer](KTNSErrorValueTransformer, "registerTransformer");
    v9 = objc_alloc_init(KTCondition);
    -[TransparencyManagedDataStoreController setLoadComplete:](v8, "setLoadComplete:", v9);

    -[TransparencyManagedDataStoreController setLogger:](v8, "setLogger:", v7);
    if (v6)
    {
      -[TransparencyManagedDataStoreController setPersistentContainer:](v8, "setPersistentContainer:", v6);
      -[TransparencyManagedDataStoreController createContexts:](v8, "createContexts:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFollowup instance](TransparencyFollowup, "instance"));
      -[TransparencyManagedDataStoreController createDataStores:followup:error:](v8, "createDataStores:followup:error:", v7, v10, 0);

      v11 = (TransparencyManagedDataStoreController *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController loadComplete](v8, "loadComplete"));
      -[TransparencyManagedDataStoreController fulfill](v11, "fulfill");
    }
    else
    {
      v11 = (TransparencyManagedDataStoreController *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController bundleURL](v8, "bundleURL"));
      if (!v11)
      {
        -[TransparencyManagedDataStoreController reportCoreDataEventForEntity:write:code:underlyingError:](v8, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("Initialization"), 0, -209, 0);
        goto LABEL_6;
      }
      v22 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", &v22));
      v14 = v22;
      if (!v13)
      {
        -[TransparencyManagedDataStoreController reportCoreDataEventForEntity:write:code:underlyingError:](v8, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("Initialization"), 0, -37, v14);

        v11 = 0;
        goto LABEL_6;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("TransparencyModel.sqlite")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentStoreDescription persistentStoreDescriptionWithURL:](NSPersistentStoreDescription, "persistentStoreDescriptionWithURL:", v15));

      objc_msgSend(v16, "setOption:forKey:", NSFileProtectionNone, NSPersistentStoreFileProtectionKey);
      v17 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v11);
      v18 = (NSPersistentContainer *)objc_msgSend(objc_alloc((Class)NSPersistentContainer), "initWithName:managedObjectModel:", CFSTR("TransparencyModel"), v17);
      persistentContainer = v8->_persistentContainer;
      v8->_persistentContainer = v18;

      v20 = v8->_persistentContainer;
      v24 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      -[NSPersistentContainer setPersistentStoreDescriptions:](v20, "setPersistentStoreDescriptions:", v21);

      -[TransparencyManagedDataStoreController loadPersistentStores](v8, "loadPersistentStores");
    }

    -[TransparencyManagedDataStoreController createPeerOverrides](v8, "createPeerOverrides");
  }
  v11 = v8;
LABEL_6:

  return v11;
}

- (id)bundleURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Transparency")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("TransparencyModel"), CFSTR("momd")));

  return v3;
}

- (BOOL)loadedStore
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldMoveAsideDatabase:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;

  v4 = a3;
  if (-[TransparencyManagedDataStoreController movedDatabase](self, "movedDatabase"))
  {
    v5 = 0;
  }
  else if (objc_msgSend(v4, "code") == (id)134130
         || objc_msgSend(v4, "code") == (id)134020
         || objc_msgSend(v4, "code") == (id)134100
         || objc_msgSend(v4, "code") == (id)259
         || objc_msgSend(v4, "code") == (id)256
         || objc_msgSend(v4, "code") == (id)134110)
  {
    v5 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    if (objc_msgSend(v7, "isEqualToString:", NSSQLiteErrorDomain))
      v5 = objc_msgSend(v4, "code") == (id)11;
    else
      v5 = 0;

  }
  return v5;
}

- (BOOL)moveAsideDatabase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  id v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  unsigned __int8 v36;
  id v37;
  NSObject *v38;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("TransparencyModel.sqlite")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_random](NSData, "kt_random"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));

  v10 = objc_msgSend(v4, "code");
  v41 = (void *)v9;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".%@.%ld"), v9, v10));
  if (qword_1002A45F0 != -1)
    dispatch_once(&qword_1002A45F0, &stru_10023E930);
  v12 = qword_1002A45F8;
  if (os_log_type_enabled((os_log_t)qword_1002A45F8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v47 = (uint64_t)v7;
    v48 = 2112;
    v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Move Transparency store at %@ to %@", buf, 0x16u);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
  v14 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
  if (os_variant_allows_internal_security_policies("com.apple.Transparency"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "persistentStoreCoordinator"));
    v45 = 0;
    v17 = objc_msgSend(v16, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v14, 0, v13, 0, NSSQLiteStoreType, &v45);
    v18 = v45;

    if ((v17 & 1) == 0)
    {
      if (qword_1002A45F0 != -1)
        dispatch_once(&qword_1002A45F0, &stru_10023E950);
      v19 = qword_1002A45F8;
      if (os_log_type_enabled((os_log_t)qword_1002A45F8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v47 = v14;
        v48 = 2112;
        v49 = (uint64_t)v13;
        v50 = 2114;
        v51 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Could not replace store at %@ from %@: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    v18 = 0;
  }
  v40 = (void *)v11;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "persistentStoreCoordinator"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "persistentStoreForURL:", v13));

  v23 = (void *)v14;
  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "persistentStoreCoordinator"));
    v44 = v18;
    v26 = objc_msgSend(v25, "removePersistentStore:error:", v22, &v44);
    v27 = v44;

    if ((v26 & 1) == 0)
    {
      if (qword_1002A45F0 != -1)
        dispatch_once(&qword_1002A45F0, &stru_10023E970);
      v28 = qword_1002A45F8;
      if (os_log_type_enabled((os_log_t)qword_1002A45F8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = (uint64_t)v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to remove bad store from coordinator: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v27 = v18;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "persistentStoreCoordinator"));
  v43 = v27;
  v31 = objc_msgSend(v30, "destroyPersistentStoreAtURL:withType:options:error:", v13, NSSQLiteStoreType, 0, &v43);
  v32 = v43;

  if ((v31 & 1) != 0)
  {
    v33 = 1;
  }
  else
  {
    if (qword_1002A45F0 != -1)
      dispatch_once(&qword_1002A45F0, &stru_10023E990);
    v34 = qword_1002A45F8;
    if (os_log_type_enabled((os_log_t)qword_1002A45F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v47 = (uint64_t)v13;
      v48 = 2114;
      v49 = (uint64_t)v32;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Could not destroy store at %@: %{public}@", buf, 0x16u);
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v42 = v32;
    v36 = objc_msgSend(v35, "removeItemAtURL:error:", v13, &v42);
    v37 = v42;

    if ((v36 & 1) != 0)
    {
      v33 = 1;
    }
    else
    {
      if (qword_1002A45F0 != -1)
        dispatch_once(&qword_1002A45F0, &stru_10023E9B0);
      v38 = qword_1002A45F8;
      if (os_log_type_enabled((os_log_t)qword_1002A45F8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v47 = (uint64_t)v13;
        v48 = 2114;
        v49 = (uint64_t)v37;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Could not delete file at %@: %{public}@", buf, 0x16u);
      }
      v33 = 0;
    }
    v32 = v37;
  }

  return v33;
}

- (BOOL)createContexts:(id *)a3
{
  self->_sequenceId = -[TransparencyManagedDataStoreController currentSequenceId:](self, "currentSequenceId:");
  return !a3 || !*a3;
}

- (void)setUpdateDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
  objc_msgSend(v5, "setUpdateDelegate:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController xpcQueueDataStore](self, "xpcQueueDataStore"));
  objc_msgSend(v6, "setUpdateDelegate:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController mainQueueDataStore](self, "mainQueueDataStore"));
  objc_msgSend(v7, "setUpdateDelegate:", v4);

}

- (void)setStaticKeyStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
  objc_msgSend(v5, "setStaticKeyStore:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController xpcQueueDataStore](self, "xpcQueueDataStore"));
  objc_msgSend(v6, "setStaticKeyStore:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController mainQueueDataStore](self, "mainQueueDataStore"));
  objc_msgSend(v7, "setStaticKeyStore:", v4);

}

- (void)createPeerOverrides
{
  TransparencyPeerOverrides *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init(TransparencyPeerOverrides);
  -[TransparencyManagedDataStoreController setPeerOverrides:](self, "setPeerOverrides:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController peerOverrides](self, "peerOverrides"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
  objc_msgSend(v5, "setPeerOverridesStore:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController peerOverrides](self, "peerOverrides"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController xpcQueueDataStore](self, "xpcQueueDataStore"));
  objc_msgSend(v7, "setPeerOverridesStore:", v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController peerOverrides](self, "peerOverrides"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController mainQueueDataStore](self, "mainQueueDataStore"));
  objc_msgSend(v8, "setPeerOverridesStore:", v9);

}

- (BOOL)createDataStores:(id)a3 followup:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  TransparencyManagedDataStore *v10;
  TransparencyManagedDataStore *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  TransparencyManagedDataStore *v15;

  v8 = a3;
  v9 = a4;
  v10 = -[TransparencyManagedDataStore initWithController:followup:logger:]([TransparencyManagedDataStore alloc], "initWithController:followup:logger:", self, v9, v8);
  -[TransparencyManagedDataStoreController setDataStore:](self, "setDataStore:", v10);

  v11 = (TransparencyManagedDataStore *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
  v12 = -[TransparencyManagedDataStore populateMissingLogHeadHashes:](v11, "populateMissingLogHeadHashes:", a5);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
    v14 = objc_msgSend(v13, "populateExistingRequestsToLookupTable:", a5);

    if (!v14)
    {
      LOBYTE(v12) = 0;
      goto LABEL_6;
    }
    v15 = -[TransparencyManagedDataStore initWithController:followup:logger:]([TransparencyManagedDataStore alloc], "initWithController:followup:logger:", self, v9, v8);
    -[TransparencyManagedDataStoreController setXpcQueueDataStore:](self, "setXpcQueueDataStore:", v15);

    v11 = -[TransparencyManagedDataStore initWithController:followup:logger:]([TransparencyManagedDataStore alloc], "initWithController:followup:logger:", self, v9, v8);
    -[TransparencyManagedDataStoreController setMainQueueDataStore:](self, "setMainQueueDataStore:", v11);
  }

LABEL_6:
  return v12;
}

- (int64_t)currentSequenceId:(id *)a3
{
  id v5;
  void *v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  TransparencyManagedDataStoreController *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10004F3FC;
  v18 = sub_10004F40C;
  v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004F414;
  v9[3] = &unk_10023E9D8;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController backgroundContext](self, "backgroundContext"));
  v12 = &v14;
  v13 = &v20;
  v10 = v5;
  v11 = self;
  objc_msgSend(v5, "performBlockAndWait:", v9);
  if (a3)
  {
    v6 = (void *)v15[5];
    if (v6)
      *a3 = objc_retainAutorelease(v6);
  }
  v7 = v21[3];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v7;
}

- (void)loadPersistentStores
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004F664;
  v4[3] = &unk_10023EA40;
  v4[4] = self;
  objc_msgSend(v3, "loadPersistentStoresWithCompletionHandler:", v4);

}

- (void)setupComplete
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController loadComplete](self, "loadComplete"));
  objc_msgSend(v2, "fulfill");

}

- (int64_t)waitSetupComplete:(int64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController loadComplete](self, "loadComplete"));
  v5 = objc_msgSend(v4, "wait:", a3);

  return (int64_t)v5;
}

- (void)reportCoreDataEventForEntity:(id)a3 write:(BOOL)a4 code:(int64_t)a5 underlyingError:(id)a6
{
  -[TransparencyManagedDataStoreController reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:](self, "reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:", a3, 1, a4, a5, a6);
}

- (void)reportCoreDataEventForEntity:(id)a3 hardFailure:(BOOL)a4 write:(BOOL)a5 code:(int64_t)a6 underlyingError:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController logger](self, "logger"));
  v15 = kTransparencyErrorDatabase;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](SecXPCHelper, "cleanseErrorForXPC:", v12));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v15, a6, v16, CFSTR("CoreData report event")));
  v20[0] = CFSTR("entityType");
  v20[1] = CFSTR("write");
  v21[0] = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  v21[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));

  objc_msgSend(v14, "logResultForEvent:hardFailure:result:withAttributes:", CFSTR("ktCoreDataEvent"), v9, v17, v19);
}

- (BOOL)saveContext:(id)a3 error:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v16[11];
  uint8_t buf[4];
  void *v18;

  v6 = a3;
  v16[0] = 0;
  v7 = objc_msgSend(v6, "save:", v16);
  v8 = v16[0];
  v9 = v8;
  if (v8)
    v10 = v7;
  else
    v10 = 1;
  if ((v10 & 1) != 0)
  {
    v11 = v8;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](SecXPCHelper, "cleanseErrorForXPC:", v8));

    if (a4 && v11)
      *a4 = objc_retainAutorelease(v11);
    -[TransparencyManagedDataStoreController reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("Persistence"), 1, -129, v11);
    if (qword_1002A45F0 != -1)
      dispatch_once(&qword_1002A45F0, &stru_10023EA60);
    v12 = qword_1002A45F8;
    if (os_log_type_enabled((os_log_t)qword_1002A45F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error saving context: %@", buf, 0xCu);
    }
    if (qword_1002A45F0 != -1)
      dispatch_once(&qword_1002A45F0, &stru_10023EA80);
    v13 = (id)qword_1002A45F8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Calling stack: %@", buf, 0xCu);

    }
  }

  return v7;
}

- (int64_t)sequenceId
{
  return &self->_sequenceId;
}

- (NSManagedObjectContext)backgroundContext
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  TransparencyMergePolicy *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentStoreCoordinator"));

  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
    objc_msgSend(v5, "setUndoManager:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentStoreCoordinator"));
    objc_msgSend(v5, "setPersistentStoreCoordinator:", v7);

    v8 = objc_alloc_init(TransparencyMergePolicy);
    objc_msgSend(v5, "setMergePolicy:", v8);

  }
  else
  {
    v5 = 0;
  }

  return (NSManagedObjectContext *)v5;
}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPersistentContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSManagedObjectContext)topLevelContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTopLevelContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (TransparencyManagedDataStore)xpcQueueDataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcQueueDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (TransparencyManagedDataStore)mainQueueDataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainQueueDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (TransparencyPeerOverrides)peerOverrides
{
  return (TransparencyPeerOverrides *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPeerOverrides:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)movedDatabase
{
  return self->_movedDatabase;
}

- (void)setMovedDatabase:(BOOL)a3
{
  self->_movedDatabase = a3;
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (KTCondition)loadComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLoadComplete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadComplete, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_peerOverrides, 0);
  objc_storeStrong((id *)&self->_mainQueueDataStore, 0);
  objc_storeStrong((id *)&self->_xpcQueueDataStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_topLevelContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

@end
