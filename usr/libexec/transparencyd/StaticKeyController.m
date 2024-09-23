@implementation StaticKeyController

- (id)initCloudDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 complete:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  StaticKeyController *v17;
  StaticKeyController *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  KTContactsStore *v27;
  dispatch_queue_t v28;
  NSObject *v29;
  os_log_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  StaticKeyController *v41;
  StaticKeyController *v42;
  NSObject *v43;
  NSObject *v44;
  id v46;
  _QWORD v47[4];
  StaticKeyController *v48;
  id v49;
  __int128 *p_buf;
  uint8_t v51[16];
  objc_super v52;
  id v53;
  id v54;
  __int128 buf;
  uint64_t v56;
  id v57;
  NSFileAttributeKey v58;
  NSFileProtectionType v59;

  v12 = a3;
  v46 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "StaticKeyController: %@", (uint8_t *)&buf, 0xCu);
  }
  if (v12)
  {
    v16 = 0;
LABEL_5:
    v52.receiver = self;
    v52.super_class = (Class)StaticKeyController;
    v17 = -[StaticKeyController init](&v52, "init", v46);
    v18 = v17;
    if (v17)
    {
      if (v14)
      {
        -[StaticKeyController setNotificationCenter:](v17, "setNotificationCenter:", v14);
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
        -[StaticKeyController setNotificationCenter:](v18, "setNotificationCenter:", v25);

      }
      -[StaticKeyController setIdsDelegate:](v18, "setIdsDelegate:", v46);
      -[StaticKeyController setConfigurationStore:](v18, "setConfigurationStore:", v13);
      v26 = objc_alloc_init((Class)CNContactStore);
      v27 = -[KTContactsStore initWithContactStore:]([KTContactsStore alloc], "initWithContactStore:", v26);
      -[StaticKeyController setContactStore:](v18, "setContactStore:", v27);

      v28 = dispatch_queue_create("StaticKeyController", 0);
      -[StaticKeyController setQueue:](v18, "setQueue:", v28);

      v29 = objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](v18, "queue"));
      dispatch_suspend(v29);

      v30 = os_log_create("com.apple.Transparency", "StaticKeyDatabase");
      -[StaticKeyController setLog:](v18, "setLog:", v30);

      v31 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](v18, "log"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "setup StaticKeyController: %@", (uint8_t *)&buf, 0xCu);
      }

      v32 = objc_alloc((Class)NSManagedObjectModel);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController staticKeyModelURL](v18, "staticKeyModelURL"));
      v34 = objc_msgSend(v32, "initWithContentsOfURL:", v33);

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[StaticKeyController cloudPersistentStoreDescription:](StaticKeyController, "cloudPersistentStoreDescription:", v12));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentCloudKitContainer persistentContainerWithName:managedObjectModel:](NSPersistentCloudKitContainer, "persistentContainerWithName:managedObjectModel:", CFSTR("StaticKey"), v34));
      -[StaticKeyController setCloudContainer:](v18, "setCloudContainer:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](v18, "cloudContainer"));
      objc_msgSend(v37, "setPersistentStoreDescriptions:", v35);

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v56 = 0x2020000000;
      v57 = 0;
      v57 = objc_msgSend(v35, "count");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](v18, "cloudContainer"));
      -[StaticKeyController setPersistentContainer:](v18, "setPersistentContainer:", v38);

      v39 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](v18, "log"));
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Load Core Data", v51, 2u);
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](v18, "persistentContainer"));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10002C868;
      v47[3] = &unk_10023CD28;
      v41 = v18;
      v48 = v41;
      p_buf = &buf;
      v49 = v15;
      objc_msgSend(v40, "loadPersistentStoresWithCompletionHandler:", v47);

      self = v41;
      _Block_object_dispose(&buf, 8);

      v42 = self;
      goto LABEL_33;
    }
    if (qword_1002A4570 != -1)
      dispatch_once(&qword_1002A4570, &stru_10023CD00);
    v24 = qword_1002A4578;
    if (os_log_type_enabled((os_log_t)qword_1002A4578, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "StaticKeyController: super init", (uint8_t *)&buf, 2u);
    }
    self = 0;
LABEL_27:
    v42 = 0;
    goto LABEL_33;
  }
  v54 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", &v54));
  v16 = v54;
  if (!v19)
  {
    if (qword_1002A4570 != -1)
      dispatch_once(&qword_1002A4570, &stru_10023CCC0);
    v43 = qword_1002A4578;
    if (os_log_type_enabled((os_log_t)qword_1002A4578, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "StaticKeyController: transparencyFilesPath: %@", (uint8_t *)&buf, 0xCu);
    }
    v12 = 0;
    goto LABEL_27;
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", CFSTR("StaticKey"), 1));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v58 = NSFileProtectionKey;
  v59 = NSFileProtectionNone;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
  v53 = v16;
  v22 = objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, v21, &v53);
  v23 = v53;

  if ((v22 & 1) != 0)
  {
    v16 = v23;
    goto LABEL_5;
  }
  if (qword_1002A4570 != -1)
    dispatch_once(&qword_1002A4570, &stru_10023CCE0);
  v44 = qword_1002A4578;
  if (os_log_type_enabled((os_log_t)qword_1002A4578, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v23;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "StaticKeyController: create directory %@", (uint8_t *)&buf, 0xCu);
  }
  v42 = 0;
  v16 = v23;
LABEL_33:

  return v42;
}

- (id)initLocalDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 contactStore:(id)a7 complete:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  StaticKeyController *v20;
  StaticKeyController *v21;
  void *v22;
  dispatch_queue_t v23;
  os_log_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  StaticKeyController *v34;
  StaticKeyController *v35;
  id v37;
  _QWORD v38[4];
  StaticKeyController *v39;
  id v40;
  objc_super v41;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v41.receiver = self;
  v41.super_class = (Class)StaticKeyController;
  v20 = -[StaticKeyController init](&v41, "init");
  v21 = v20;
  if (v20)
  {
    v37 = v16;
    if (v17)
    {
      -[StaticKeyController setNotificationCenter:](v20, "setNotificationCenter:", v17);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
      -[StaticKeyController setNotificationCenter:](v21, "setNotificationCenter:", v22);

    }
    -[StaticKeyController setIdsDelegate:](v21, "setIdsDelegate:", v15);
    -[StaticKeyController setContactStore:](v21, "setContactStore:", v18);
    v23 = dispatch_queue_create("StaticKeyController", 0);
    -[StaticKeyController setQueue:](v21, "setQueue:", v23);

    v24 = os_log_create("com.apple.Transparency", "StaticKeyDatabase");
    -[StaticKeyController setLog:](v21, "setLog:", v24);

    v25 = objc_alloc((Class)NSManagedObjectModel);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController staticKeyModelURL](v21, "staticKeyModelURL"));
    v27 = objc_msgSend(v25, "initWithContentsOfURL:", v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[StaticKeyController persistentStoreDescriptions:](StaticKeyController, "persistentStoreDescriptions:", v14));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentContainer persistentContainerWithName:managedObjectModel:](NSPersistentContainer, "persistentContainerWithName:managedObjectModel:", CFSTR("StaticKey"), v27));
    -[StaticKeyController setPersistentContainer:](v21, "setPersistentContainer:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](v21, "persistentContainer"));
    objc_msgSend(v30, "setPersistentStoreDescriptions:", v28);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](v21, "persistentContainer"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10002CD2C;
    v38[3] = &unk_10023CD50;
    v32 = v15;
    v33 = v14;
    v34 = v21;
    v39 = v34;
    v40 = v19;
    objc_msgSend(v31, "loadPersistentStoresWithCompletionHandler:", v38);

    v16 = v37;
    -[StaticKeyController setConfigurationStore:](v34, "setConfigurationStore:", v37);
    v35 = v34;
    v14 = v33;
    v15 = v32;

  }
  return v21;
}

- (void)remoteUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  __int16 v10;
  void *v11;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remoteUpdate: %@/%@", buf, 0x16u);

  }
  v6 = objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CF10;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_async(v6, block);

}

- (id)historyTokenFromData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v3 = a3;
  v5 = objc_opt_class(NSData, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSPersistentHistoryToken, v6), v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dataFromHistoryToken:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v5 = objc_opt_class(NSPersistentHistoryToken, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0));
  else
    v6 = 0;

  return v6;
}

- (void)processCoreDataHistory
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  StaticKeyController *v21;
  id v22;
  uint8_t buf[4];
  id v24;

  v3 = objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  v5 = objc_msgSend(v4, "newBackgroundContext");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v5, "setMergePolicy:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getSettingsData:", CFSTR("CoreDataSyncToken")));

  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_10002D258;
  v18 = &unk_10023CD98;
  v19 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController historyTokenFromData:](self, "historyTokenFromData:", v9));
  v20 = v5;
  v21 = self;
  v10 = v7;
  v22 = v10;
  v11 = v5;
  v12 = v19;
  objc_msgSend(v11, "performBlockAndWait:", &v15);
  if (objc_msgSend(v10, "count", v15, v16, v17, v18))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "processCoreDataHistory: updating: %@", buf, 0xCu);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    objc_msgSend(v13, "didUpdateStaticKeyStore:application:", v14, kKTApplicationIdentifierIDS);

  }
}

- (void)setContactsSyncController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
    objc_msgSend(v5, "invalidateContactsSyncing");

    -[StaticKeyController setContacts:](self, "setContacts:", 0);
  }
  v6 = v8;
  if (v8)
  {
    -[StaticKeyController setContacts:](self, "setContacts:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
    objc_msgSend(v7, "setDelegate:", self);

    v6 = v8;
  }

}

- (void)consumeContactsChangeHistory
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
  objc_msgSend(v2, "consumeContactsChangeHistory");

}

- (void)startContactsSyncing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
  objc_msgSend(v2, "startContactsSyncing");

}

- (void)drainContactsSyncing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
  objc_msgSend(v2, "drainContactsSyncing");

}

- (id)staticKeyModelURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Transparency")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("StaticKeyDataModel"), CFSTR("momd")));

  return v3;
}

+ (id)persistentStoreDescriptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("StaticKey")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentStoreDescription persistentStoreDescriptionWithURL:](NSPersistentStoreDescription, "persistentStoreDescriptionWithURL:", v3));
  objc_msgSend(v4, "setType:", NSSQLiteStoreType);
  objc_msgSend(v4, "setShouldAddStoreAsynchronously:", 0);
  objc_msgSend(v4, "setConfiguration:", CFSTR("Default"));
  objc_msgSend(v4, "setOption:forKey:", &__kCFBooleanTrue, NSPersistentHistoryTrackingKey);
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return v5;
}

+ (id)cloudPersistentStoreDescription:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("CloudStore")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentStoreDescription persistentStoreDescriptionWithURL:](NSPersistentStoreDescription, "persistentStoreDescriptionWithURL:", v3));
  objc_msgSend(v4, "setConfiguration:", CFSTR("Cloud"));
  objc_msgSend(v4, "setShouldAddStoreAsynchronously:", 0);
  v5 = objc_alloc((Class)NSPersistentCloudKitContainerOptions);
  v6 = objc_msgSend(v5, "initWithContainerIdentifier:", off_10029E9E0);
  objc_msgSend(v6, "setUseDeviceToDeviceEncryption:", 1);
  objc_msgSend(v6, "setApsConnectionMachServiceName:", CFSTR("com.apple.aps.transparencyd-coredata"));
  objc_msgSend(v4, "setCloudKitContainerOptions:", v6);
  objc_msgSend(v4, "setOption:forKey:", &__kCFBooleanTrue, NSPersistentStoreRemoteChangeNotificationPostOptionKey);
  objc_msgSend(v4, "setOption:forKey:", &__kCFBooleanTrue, NSPersistentHistoryTrackingKey);
  v9 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v7;
}

- (BOOL)importFromCloud
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  v5 = objc_msgSend(v4, "newBackgroundContext");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v5, "setMergePolicy:", v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002DCA4;
  v9[3] = &unk_10023CDE8;
  v11 = &v12;
  v9[4] = self;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v7, "performBlockAndWait:", v9);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (BOOL)exportToCloud
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  v5 = objc_msgSend(v4, "newBackgroundContext");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v5, "setMergePolicy:", v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002DFC8;
  v9[3] = &unk_10023CDE8;
  v11 = &v12;
  v9[4] = self;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v7, "performBlockAndWait:", v9);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (BOOL)triggerSync:(id *)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer", a3));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002E290;
    block[3] = &unk_10023A390;
    block[4] = self;
    dispatch_sync(v5, block);

  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1001ACC40();

  }
  return v4 != 0;
}

- (BOOL)setupCloudSchema:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  NSObject *v12;
  id v14;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer"));

  if (v7)
  {
    if (v5)
      v8 = 6;
    else
      v8 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer"));
    v14 = 0;
    v10 = objc_msgSend(v9, "initializeCloudKitSchemaWithOptions:error:", v8, &v14);
    v11 = v14;

    if ((v10 & 1) == 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1001ACC6C();

      if (a4)
      {
        v11 = objc_retainAutorelease(v11);
        *a4 = v11;
      }
    }
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001ACC40();
    v10 = 0;
  }

  return v10;
}

- (BOOL)resetCloudZone:(id *)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer", a3));

  v5 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "reset zone start", buf, 2u);
    }

    v7 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentStoreCoordinator"));
    objc_msgSend(v7, "setPersistentStoreCoordinator:", v9);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002E51C;
    v11[3] = &unk_10023B3A8;
    v11[4] = self;
    v12 = v7;
    v6 = v7;
    -[NSObject performBlockAndWait:](v6, "performBlockAndWait:", v11);

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1001ACC40();
  }

  return v4 != 0;
}

- (id)fetchHandles:(id)a3 moc:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[KTCoreDataSTHandle fetchRequest](KTCoreDataSTHandle, "fetchRequest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("publicIdentity == %@"), v9));

  objc_msgSend(v10, "setPredicate:", v11);
  v18 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeFetchRequest:error:", v10, &v18));

  v13 = v18;
  if (v12)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v12));
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "fetchHandles failed with: %@", buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v13);
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  }
  v16 = (void *)v14;

  return v16;
}

- (id)storeStaticKey:(id)a3 contactIdentifier:(id)a4 contactExternalIdentifier:(id)a5 mappings:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v39;
  void *v40;
  _QWORD block[5];
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  StaticKeyController *v47;
  id v48;
  uint64_t *v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint8_t v63[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;

  v39 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController fetchContactsSyncToken](self, "fetchContactsSyncToken"));

  if (!v15)
  {
    if (qword_1002A4570 != -1)
      dispatch_once(&qword_1002A4570, &stru_10023CE30);
    v16 = qword_1002A4578;
    if (os_log_type_enabled((os_log_t)qword_1002A4578, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "storeStaticKey no previously existing sync token", buf, 2u);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController contactStore](self, "contactStore", v39));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
    objc_msgSend(v17, "fetchAndStoreContactsSyncTokenWithConfigStore:", v18);

  }
  *(_QWORD *)buf = 0;
  v58 = buf;
  v59 = 0x3032000000;
  v60 = sub_10002ED6C;
  v61 = sub_10002ED7C;
  v62 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer", v39));
  v20 = objc_msgSend(v19, "newBackgroundContext");

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v20, "setMergePolicy:", v21);

  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_10002ED6C;
  v55 = sub_10002ED7C;
  v56 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "ktStorageString"));
  v23 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", CFSTR(",")));
    *(_DWORD *)v63 = 138412802;
    v64 = v40;
    v65 = 2112;
    v66 = v22;
    v67 = 2112;
    v68 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "storeStaticKey identity: %@ %@ mappings: %@", v63, 0x20u);

  }
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10002ED84;
  v42[3] = &unk_10023CE58;
  v25 = v13;
  v43 = v25;
  v26 = v12;
  v44 = v26;
  v27 = v20;
  v45 = v27;
  v49 = &v51;
  v28 = v22;
  v46 = v28;
  v47 = self;
  v29 = v14;
  v48 = v29;
  v50 = buf;
  objc_msgSend(v27, "performBlockAndWait:", v42);
  v30 = (void *)*((_QWORD *)v58 + 5);
  if (!a7 || v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "contactExternalURI"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v58 + 5), "publicKeyID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "publicAccountIdentity"));
    -[StaticKeyController postChangeForEntry:publicAccountIdentity:](self, "postChangeForEntry:publicAccountIdentity:", v31, v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v58 + 5), "mappings"));
    objc_msgSend(v34, "didUpdateStaticKeyStore:application:", v35, kKTApplicationIdentifierIDS);

  }
  else
  {
    *a7 = objc_retainAutorelease((id)v52[5]);
  }
  v36 = objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F550;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_async(v36, block);

  v37 = *((id *)v58 + 5);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(buf, 8);
  return v37;
}

- (void)postChangeForEntry:(id)a3 publicAccountIdentity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "postChangeToEntry externalURI: %@ publicKey: %@", buf, 0x16u);
  }

  if (v6 && v7)
  {
    v11[0] = kTransparencyStaticKeyStoreContactIdentifier;
    v11[1] = kTransparencyStaticKeyStorePublicIdentifydentifier;
    v12[0] = v6;
    v12[1] = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController notificationCenter](self, "notificationCenter"));
    objc_msgSend(v10, "postNotificationName:object:userInfo:deliverImmediately:", kTransparencyStaticKeyStoreNotification, 0, v9, 1);

  }
}

- (id)mapStaticKeyToStoreEntry:(id)a3 handles:(id)a4 moc:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  NSObject *v46;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publicIdentity"));
  if (v11)
  {
    v43 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[KTAccountPublicID ktAccountPublicIDWithStorageString:error:](KTAccountPublicID, "ktAccountPublicIDWithStorageString:error:", v11, &v43));
    v13 = v43;
    v14 = v13;
    if (v12)
    {
      v36 = v13;
      v37 = v11;
      v15 = objc_alloc_init((Class)KTIDStaticKeyStoreEntry);
      v35 = v12;
      objc_msgSend(v15, "setPublicKeyID:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contactIdentifier"));
      objc_msgSend(v15, "setContactIdentifier:", v16);

      v38 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contactExternalIdentifier"));
      v34 = v15;
      objc_msgSend(v15, "setContactServerPath:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v20 = v10;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "idsID"));

            if (v26)
            {
              v27 = objc_alloc_init((Class)KTIDStaticKeyStoreHandle);
              objc_msgSend(v27, "setValidationDate:", 0);
              objc_msgSend(v27, "setValid:", 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "idsID"));
              objc_msgSend(v27, "setHandle:", v28);

              objc_msgSend(v27, "setErrorCode:", objc_msgSend(v25, "error"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "idsID"));
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, v29);

              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "idsID"));
              objc_msgSend(v18, "addObject:", v30);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v22);
      }

      v31 = v34;
      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(v34, "setMappings:", v18);
        objc_msgSend(v34, "setHandles:", v19);
      }

      v9 = v38;
      v14 = v36;
      v11 = v37;
      v12 = v35;
    }
    else
    {
      v32 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v14;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Failed to create KTAccountPublicID: %@", buf, 0xCu);
      }

      v31 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v14);
    }

  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to create public identity string", buf, 2u);
    }
    v31 = 0;
  }

  return v31;
}

- (id)findStaticKeyByKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  StaticKeyController *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10002ED6C;
  v32 = sub_10002ED7C;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10002ED6C;
  v26 = sub_10002ED7C;
  v27 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ktStorageString"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
    v9 = objc_msgSend(v8, "newBackgroundContext");

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
    objc_msgSend(v9, "setMergePolicy:", v10);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002FC28;
    v16[3] = &unk_10023CE80;
    v17 = v7;
    v11 = v9;
    v18 = v11;
    v19 = self;
    v20 = &v28;
    v21 = &v22;
    objc_msgSend(v11, "performBlockAndWait:", v16);
    v12 = (void *)v23[5];
    if (!v12)
    {
      if (a4)
      {
        v13 = (void *)v29[5];
        if (v13)
        {
          *a4 = objc_retainAutorelease(v13);
          v12 = (void *)v23[5];
        }
      }
    }
    v14 = v12;

  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (id)findStaticKeyByHandle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  StaticKeyController *v18;
  uint64_t *v19;
  uint64_t *v20;
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

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10002ED6C;
  v31 = sub_10002ED7C;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10002ED6C;
  v25 = sub_10002ED7C;
  v26 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  v8 = objc_msgSend(v7, "newBackgroundContext");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v8, "setMergePolicy:", v9);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002FF28;
  v15[3] = &unk_10023CE80;
  v10 = v6;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v18 = self;
  v19 = &v27;
  v20 = &v21;
  objc_msgSend(v11, "performBlockAndWait:", v15);
  if (a4)
  {
    v12 = (void *)v28[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (BOOL)shouldDoInitialCloudSyncing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getSettingsDate:", CFSTR("lastCKSyncData")));

    if (v4 && v7)
    {
      if (qword_1002A4570 != -1)
        dispatch_once(&qword_1002A4570, &stru_10023CEE0);
      v8 = qword_1002A4578;
      if (os_log_type_enabled((os_log_t)qword_1002A4578, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cloud sync: last sync: %{public}@", (uint8_t *)&v17, 0xCu);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", -604800.0));
      v10 = objc_msgSend(v7, "compare:", v9);
      v11 = v10 == (id)-1;
      if (v10 != (id)-1)
        goto LABEL_24;
      if (qword_1002A4570 != -1)
        dispatch_once(&qword_1002A4570, &stru_10023CF00);
      v12 = qword_1002A4578;
      if (os_log_type_enabled((os_log_t)qword_1002A4578, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "7d cloud sync setting", (uint8_t *)&v17, 2u);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
      objc_msgSend(v13, "setSettingsDate:date:", CFSTR("lastCKSyncData"), v4);

    }
    else
    {
      if (qword_1002A4570 != -1)
        dispatch_once(&qword_1002A4570, &stru_10023CEC0);
      v15 = qword_1002A4578;
      if (os_log_type_enabled((os_log_t)qword_1002A4578, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Initial cloud sync setting", (uint8_t *)&v17, 2u);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
      objc_msgSend(v9, "setSettingsDate:date:", CFSTR("lastCKSyncData"), v4);
    }
    v11 = 1;
LABEL_24:

    goto LABEL_25;
  }
  if (qword_1002A4570 != -1)
    dispatch_once(&qword_1002A4570, &stru_10023CEA0);
  v14 = qword_1002A4578;
  v11 = 0;
  if (os_log_type_enabled((os_log_t)qword_1002A4578, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No cloud sync setting", (uint8_t *)&v17, 2u);
    v11 = 0;
  }
LABEL_25:

  return v11;
}

- (void)launchCloudSyncing:(id)a3 initialDelay:(double)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v6 = a3;
  if (a4 >= 0.0 && -[StaticKeyController shouldDoInitialCloudSyncing:](self, "shouldDoInitialCloudSyncing:", v6))
  {
    v7 = (void *)os_transaction_create("initial-cloud-sync");
    v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v9 = objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000306A0;
    v12[3] = &unk_10023B3A8;
    v12[4] = self;
    v13 = v7;
    v10 = v7;
    dispatch_after(v8, v9, v12);

  }
  else
  {
    if (qword_1002A4570 != -1)
      dispatch_once(&qword_1002A4570, &stru_10023CF20);
    v11 = qword_1002A4578;
    if (os_log_type_enabled((os_log_t)qword_1002A4578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping initial cloud sync", buf, 2u);
    }
  }

}

- (id)findStaticKeyByContactIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  StaticKeyController *v18;
  uint64_t *v19;
  uint64_t *v20;
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

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10002ED6C;
  v31 = sub_10002ED7C;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10002ED6C;
  v25 = sub_10002ED7C;
  v26 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  v8 = objc_msgSend(v7, "newBackgroundContext");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v8, "setMergePolicy:", v9);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003090C;
  v15[3] = &unk_10023CE80;
  v10 = v6;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v18 = self;
  v19 = &v27;
  v20 = &v21;
  objc_msgSend(v11, "performBlockAndWait:", v15);
  if (a4)
  {
    v12 = (void *)v28[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)findStaticKeyByContactExternalURI:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  StaticKeyController *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  if (v6)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = sub_10002ED6C;
    v30 = sub_10002ED7C;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_10002ED6C;
    v24 = sub_10002ED7C;
    v25 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
    v8 = objc_msgSend(v7, "newBackgroundContext");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
    objc_msgSend(v8, "setMergePolicy:", v9);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100030C34;
    v14[3] = &unk_10023CE80;
    v15 = v6;
    v10 = v8;
    v16 = v10;
    v17 = self;
    v18 = &v26;
    v19 = &v20;
    objc_msgSend(v10, "performBlockAndWait:", v14);
    if (a4)
    {
      v11 = (void *)v27[5];
      if (v11)
        *a4 = objc_retainAutorelease(v11);
    }
    v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)validateStaticKeyStoreMappingByKey:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController findStaticKeyByKey:error:](self, "findStaticKeyByKey:error:", a3));
  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController validateStoreEntry:error:](self, "validateStoreEntry:error:", v6, a4));
  else
    v7 = 0;

  return v7;
}

- (id)validateStaticKeyStoreMappingByContactIdentifer:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController findStaticKeyByContactIdentifier:error:](self, "findStaticKeyByContactIdentifier:error:", a3));
  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController validateStoreEntry:error:](self, "validateStoreEntry:error:", v6, a4));
  else
    v7 = 0;

  return v7;
}

- (id)validateStaticKeyStoreMappingByContactExternalURI:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController findStaticKeyByContactExternalURI:error:](self, "findStaticKeyByContactExternalURI:error:", a3));
  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController validateStoreEntry:error:](self, "validateStoreEntry:error:", v6, a4));
  else
    v7 = 0;

  return v7;
}

- (BOOL)deleteStaticKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  v8 = objc_msgSend(v7, "newBackgroundContext");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v8, "setMergePolicy:", v9);

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10002ED6C;
  v29 = sub_10002ED7C;
  v30 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ktStorageString"));
  v12 = v11;
  if (v11)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100031120;
    v19[3] = &unk_10023CE80;
    v20 = v11;
    v21 = v8;
    v23 = &v25;
    v13 = v10;
    v22 = v13;
    v24 = &v31;
    objc_msgSend(v21, "performBlockAndWait:", v19);
    if (a4)
    {
      v14 = (void *)v26[5];
      if (v14)
        *a4 = objc_retainAutorelease(v14);
    }
    if (objc_msgSend(v13, "count"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
      objc_msgSend(v15, "didUpdateStaticKeyStore:application:", v16, kKTApplicationIdentifierIDS);

    }
    v17 = *((_BYTE *)v32 + 24) != 0;

  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)deleteStaticKeyByContactIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  v8 = objc_msgSend(v7, "newBackgroundContext");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v8, "setMergePolicy:", v9);

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10002ED6C;
  v29 = sub_10002ED7C;
  v30 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003163C;
  v19[3] = &unk_10023CE80;
  v11 = v6;
  v20 = v11;
  v12 = v8;
  v21 = v12;
  v23 = &v25;
  v13 = v10;
  v22 = v13;
  v24 = &v31;
  objc_msgSend(v12, "performBlockAndWait:", v19);
  if (a4)
  {
    v14 = (void *)v26[5];
    if (v14)
      *a4 = objc_retainAutorelease(v14);
  }
  if (objc_msgSend(v13, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
    objc_msgSend(v15, "didUpdateStaticKeyStore:application:", v16, kKTApplicationIdentifierIDS);

  }
  v17 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)deleteStaticKeyByContactExternalURI:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v6 = a3;
  if (v6)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
    v8 = objc_msgSend(v7, "newBackgroundContext");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
    objc_msgSend(v8, "setMergePolicy:", v9);

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = sub_10002ED6C;
    v28 = sub_10002ED7C;
    v29 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100031BB4;
    v18[3] = &unk_10023CE80;
    v19 = v6;
    v11 = v8;
    v20 = v11;
    v22 = &v24;
    v12 = v10;
    v21 = v12;
    v23 = &v30;
    objc_msgSend(v11, "performBlockAndWait:", v18);
    if (a4)
    {
      v13 = (void *)v25[5];
      if (v13)
        *a4 = objc_retainAutorelease(v13);
    }
    if (objc_msgSend(v12, "count"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
      objc_msgSend(v14, "didUpdateStaticKeyStore:application:", v15, kKTApplicationIdentifierIDS);

    }
    v16 = *((_BYTE *)v31 + 24) != 0;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)listStaticKey:(id *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  v6 = objc_msgSend(v5, "newBackgroundContext");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v6, "setMergePolicy:", v7);

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_10002ED6C;
  v17[4] = sub_10002ED7C;
  v18 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100032048;
  v13[3] = &unk_10023B0A8;
  v8 = v6;
  v14 = v8;
  v16 = v17;
  v9 = v4;
  v15 = v9;
  objc_msgSend(v8, "performBlockAndWait:", v13);
  v10 = v15;
  v11 = v9;

  _Block_object_dispose(v17, 8);
  return v11;
}

- (BOOL)setErrorCode:(int)a3 forMapping:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v8 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10002ED6C;
  v27 = sub_10002ED7C;
  v28 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  v10 = objc_msgSend(v9, "newBackgroundContext");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v10, "setMergePolicy:", v11);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003239C;
  v17[3] = &unk_10023CF88;
  v12 = v8;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = &v23;
  v22 = a3;
  v21 = &v29;
  objc_msgSend(v13, "performBlockAndWait:", v17);
  if (a5)
  {
    v14 = (void *)v24[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (id)lastContactSyncDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getSettingsDate:", CFSTR("lastContactSyncDate")));

  return v3;
}

- (void)updateLastContactSyncDate
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "setSettingsDate:date:", CFSTR("lastContactSyncDate"), v2);

}

- (id)fetchContactsSyncToken
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getSettingsData:", CFSTR("lastContactSyncData")));

  return v3;
}

- (void)storeContactsSyncToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  objc_msgSend(v5, "setSettingsData:data:", CFSTR("lastContactSyncData"), v4);

}

- (void)fetchPeerHandles:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "fetchPeerHandles:application:complete:", v8, v9, v10);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1001ACD2C();

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (void)validatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5
{
  void (**v5)(id, id, _QWORD);
  id v6;

  v5 = (void (**)(id, id, _QWORD))a5;
  v6 = objc_alloc_init((Class)KTVerifierResult);
  objc_msgSend(v6, "setSucceed:", 0);
  v5[2](v5, v6, 0);

}

- (id)validateStoreEntry:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10002ED6C;
  v25 = sub_10002ED7C;
  v26 = 0;
  v5 = a3;
  v26 = v5;
  if (qword_1002A4570 != -1)
    dispatch_once(&qword_1002A4570, &stru_10023CFA8);
  v6 = (id)qword_1002A4578;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mappings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",")));
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "validateStoreEntry looking for handles: %@", buf, 0xCu);

  }
  v9 = dispatch_semaphore_create(0);
  v10 = kKTApplicationIdentifierIDS;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mappings"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000329C8;
  v17[3] = &unk_10023D030;
  v12 = v5;
  v18 = v12;
  v20 = &v21;
  v13 = v9;
  v19 = v13;
  -[StaticKeyController fetchPeerHandles:application:complete:](self, "fetchPeerHandles:application:complete:", v11, v10, v17);

  v14 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v13, v14);
  v15 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (void)peerVerificationUpdated:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "StaticKeyController updating verification", v4, 2u);
  }

}

- (id)findStaticKeyByContact:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v13;
  id v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "externalURI"));
  v14 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController findStaticKeyByContactExternalURI:error:](self, "findStaticKeyByContactExternalURI:error:", v7, &v14));
  v9 = v14;

  if (v8)
  {
    v10 = v9;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v13 = v9;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController findStaticKeyByContactIdentifier:error:](self, "findStaticKeyByContactIdentifier:error:", v11, &v13));
    v10 = v13;

    if (a4 && !v8 && v10)
    {
      v10 = objc_retainAutorelease(v10);
      v8 = 0;
      *a4 = v10;
    }
  }

  return v8;
}

- (void)updateContact:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  NSObject *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[KeyTransparencyContactMapping mapContactsToIDS:](KeyTransparencyContactMapping, "mapContactsToIDS:", v4));
  v6 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "updateContact contactMappings: %@", buf, 0xCu);
  }

  v27 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController findStaticKeyByContact:error:](self, "findStaticKeyByContact:error:", v4, &v27));

  v8 = v27;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mappings"));
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

    if (-[NSObject isEqual:](v10, "isEqual:", v5))
    {
      v11 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v12 = "updateContact mappings match";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    if (objc_msgSend(v5, "count"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicKeyID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactExternalURI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
      v24 = v8;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController storeStaticKey:contactIdentifier:contactExternalIdentifier:mappings:error:](self, "storeStaticKey:contactIdentifier:contactExternalIdentifier:mappings:error:", v23, v13, v14, v15, &v24));
      v17 = v24;

      if (!v16)
      {
        v11 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1001ACE18();
        v8 = v17;
        goto LABEL_18;
      }
LABEL_15:
      v8 = v17;
      v11 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v12 = "updateContact complete";
        goto LABEL_17;
      }
LABEL_18:

      goto LABEL_19;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactExternalURI"));
    v26 = v8;
    v19 = -[StaticKeyController deleteStaticKeyByContactExternalURI:error:](self, "deleteStaticKeyByContactExternalURI:error:", v18, &v26);
    v17 = v26;

    if ((v19 & 1) != 0)
      goto LABEL_15;
    v20 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1001ACDB8();

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactIdentifier"));
    v25 = v17;
    v22 = -[StaticKeyController deleteStaticKeyByContactIdentifier:error:](self, "deleteStaticKeyByContactIdentifier:error:", v21, &v25);
    v8 = v25;

    if ((v22 & 1) == 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1001ACDB8();
      goto LABEL_18;
    }
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001ACD58();
  }
LABEL_19:

}

- (void)deleteContact:(id)a3 contactExternalURI:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  NSObject *v11;
  unsigned __int8 v12;
  NSObject *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v15 = 0;
    v8 = -[StaticKeyController deleteStaticKeyByContactExternalURI:error:](self, "deleteStaticKeyByContactExternalURI:error:", v7, &v15);
    v9 = v15;
    v10 = v9;
    if ((v8 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    v9 = 0;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_1001ACED8();

  v14 = v9;
  v12 = -[StaticKeyController deleteStaticKeyByContactIdentifier:error:](self, "deleteStaticKeyByContactIdentifier:error:", v6, &v14);
  v10 = v14;

  if ((v12 & 1) == 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1001ACE78();

  }
LABEL_11:

}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (NSPersistentCloudKitContainer)cloudContainer
{
  return self->_cloudContainer;
}

- (void)setCloudContainer:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContainer, a3);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (StaticKeyContactsProtocol)contacts
{
  return (StaticKeyContactsProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContacts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (STCConfigurationStoreDelegate)configurationStore
{
  return (STCConfigurationStoreDelegate *)objc_loadWeakRetained((id *)&self->_configurationStore);
}

- (void)setConfigurationStore:(id)a3
{
  objc_storeWeak((id *)&self->_configurationStore, a3);
}

- (KTNotificationCenter)notificationCenter
{
  return (KTNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (StaticKeyIDSDelegate)idsDelegate
{
  return (StaticKeyIDSDelegate *)objc_loadWeakRetained((id *)&self->_idsDelegate);
}

- (void)setIdsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_idsDelegate, a3);
}

- (KTContactsStoreProtocol)contactStore
{
  return (KTContactsStoreProtocol *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContactStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_idsDelegate);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_configurationStore);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cloudContainer, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

@end
