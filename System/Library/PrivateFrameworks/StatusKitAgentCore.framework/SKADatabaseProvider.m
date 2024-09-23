@implementation SKADatabaseProvider

- (SKADatabaseProvider)initWithDelegate:(id)a3
{
  id v4;
  SKADatabaseProvider *v5;
  SKADatabaseProvider *v6;
  uint64_t v7;
  NSMutableArray *importCompletionHandlers;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *historyProcessingQueue;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SKADatabaseProvider;
  v5 = -[SKADatabaseProvider init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    importCompletionHandlers = v6->_importCompletionHandlers;
    v6->_importCompletionHandlers = (NSMutableArray *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create("com.apple.StatusKitAgent.CoreData.historyProcessing", v10);
    historyProcessingQueue = v6->_historyProcessingQueue;
    v6->_historyProcessingQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_handleManateeAvailabilityNotification_, *MEMORY[0x24BDB8E60], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDBB498];
    -[SKADatabaseProvider persistentContainer](v6, "persistentContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel_handlePersistentStoreEventChangedNotification_, v15, v16);

  }
  return v6;
}

- (NSPersistentContainer)persistentContainer
{
  SKADatabaseProvider *v2;
  uint64_t v3;
  NSPersistentContainer *persistentContainer;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_persistentContainer)
  {
    -[SKADatabaseProvider createPersistentContainer](v2, "createPersistentContainer");
    v3 = objc_claimAutoreleasedReturnValue();
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = (NSPersistentContainer *)v3;

  }
  objc_sync_exit(v2);

  return v2->_persistentContainer;
}

- (id)createPersistentContainer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  _QWORD v36[5];
  uint8_t v37[4];
  void *v38;
  __int128 buf;
  uint64_t v40;
  char v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x24BDAC8D0];
  +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Creating persistent container: %p", (uint8_t *)&buf, 0xCu);
  }

  -[SKADatabaseProvider containerName](self, "containerName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBB6B0];
  v43[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergedModelFromBundles:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6D8]), "initWithName:managedObjectModel:", v34, v7);
  -[SKADatabaseProvider localPersistentStoreDescription](self, "localPersistentStoreDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v9;
  -[SKADatabaseProvider cloudPersistentStoreDescription](self, "cloudPersistentStoreDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPersistentStoreDescriptions:", v11);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x2020000000;
  v41 = 1;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __48__SKADatabaseProvider_createPersistentContainer__block_invoke;
  v36[3] = &unk_24D977990;
  v36[4] = &buf;
  objc_msgSend(v8, "loadPersistentStoresWithCompletionHandler:", v36);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_handlePersistentStoreRemoteChangeNotification_, *MEMORY[0x24BDBB510], v8);

    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Completed creation of persistent container", v37, 2u);
    }
  }
  else
  {
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKADatabaseProvider createPersistentContainer].cold.3(v14, v15, v16, v17, v18, v19, v20, v21);

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", v7);
    -[SKADatabaseProvider localPersistentStoreDescription](self, "localPersistentStoreDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v22, "URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v37 = 138412290;
      v38 = v24;
      _os_log_impl(&dword_2188DF000, v23, OS_LOG_TYPE_DEFAULT, "Destroying persistent store %@", v37, 0xCu);

    }
    objc_msgSend(v22, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "type");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "options");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v28 = -[NSObject destroyPersistentStoreAtURL:withType:options:error:](v13, "destroyPersistentStoreAtURL:withType:options:error:", v25, v26, v27, &v35);
    v29 = v35;

    if (v28)
    {
      +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "URL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKADatabaseProvider createPersistentContainer].cold.1(v31, v37, v30);
      }
    }
    else
    {
      +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "URL");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKADatabaseProvider createPersistentContainer].cold.2(v32, (uint64_t)v29, (uint64_t)v37, v30);
      }
    }

    v8 = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __48__SKADatabaseProvider_createPersistentContainer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __48__SKADatabaseProvider_createPersistentContainer__block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Completed loading of persistent store: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)hasInitialCloudKitImportOccurred:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id aBlock;

  aBlock = a3;
  if (!-[SKADatabaseProvider cloudKitSetupCompleted](self, "cloudKitSetupCompleted"))
  {
    -[SKADatabaseProvider importCompletionHandlers](self, "importCompletionHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(aBlock);
    objc_msgSend(v5, "addObject:", v6);

    goto LABEL_8;
  }
  if (self->_hasInitialCloudKitImportOccurred)
  {
    v4 = aBlock;
    if (aBlock)
    {
      (*((void (**)(id, uint64_t))aBlock + 2))(aBlock, 1);
LABEL_8:
      v4 = aBlock;
    }
  }
  else
  {
    -[SKADatabaseProvider persistentContainer](self, "persistentContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKADatabaseProvider performInitialImportQueryWithContainer:](self, "performInitialImportQueryWithContainer:", v7);

    v4 = aBlock;
    if (aBlock)
    {
      (*((void (**)(id, _BOOL8))aBlock + 2))(aBlock, v8);
      goto LABEL_8;
    }
  }

}

- (id)appTransactionAuthorName
{
  return CFSTR("StatusKitAgent");
}

- (id)containerName
{
  return CFSTR("SKADatabaseModel");
}

- (id)ckContainerIdentifier
{
  return CFSTR("com.apple.statuskit");
}

- (CKContainer)ckContainer
{
  SKADatabaseProvider *v2;
  CKContainer *ckContainer;
  uint64_t v4;
  CKContainer *v5;
  CKContainer *v6;

  v2 = self;
  objc_sync_enter(v2);
  ckContainer = v2->_ckContainer;
  if (!ckContainer)
  {
    -[SKADatabaseProvider createCkContainer](v2, "createCkContainer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_ckContainer;
    v2->_ckContainer = (CKContainer *)v4;

    ckContainer = v2->_ckContainer;
  }
  v6 = ckContainer;
  objc_sync_exit(v2);

  return v6;
}

- (id)createCkContainer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDB9038]);
  -[SKADatabaseProvider ckContainerIdentifier](self, "ckContainerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContainerIdentifier:environment:", v4, 1);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9030]), "initWithContainerID:", v5);
  return v6;
}

- (id)fileManager
{
  return (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
}

- (id)databaseDirectoryURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v12;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("StatusKit"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("database"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseProvider fileManager](self, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) == 0)
  {
    -[SKADatabaseProvider fileManager](self, "fileManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  }
  return v6;
}

- (id)localDatabaseFileURL
{
  void *v2;
  void *v3;

  -[SKADatabaseProvider databaseDirectoryURL](self, "databaseDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("statuskit-local-v1.db"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cloudDatabaseFileURL
{
  void *v2;
  void *v3;

  -[SKADatabaseProvider databaseDirectoryURL](self, "databaseDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("statuskit-cloud.db"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastProcessedPersistentHistoryTokenFileURL
{
  void *v2;
  void *v3;

  -[SKADatabaseProvider databaseDirectoryURL](self, "databaseDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("lastProcessedPersistentHistoryToken.data"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localPersistentStoreDescription
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[SKADatabaseProvider localDatabaseFileURL](self, "localDatabaseFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB740], "persistentStoreDescriptionWithURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setType:", *MEMORY[0x24BDBB580]);
  objc_msgSend(v3, "setConfiguration:", CFSTR("Local"));
  objc_msgSend(v3, "setShouldAddStoreAsynchronously:", 0);
  objc_msgSend(v3, "setOption:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDBB4C8]);
  v4 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v3, "setOption:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB488]);
  objc_msgSend(v3, "setOption:forKey:", v4, *MEMORY[0x24BDBB420]);

  return v3;
}

- (id)cloudPersistentStoreDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[SKADatabaseProvider cloudDatabaseFileURL](self, "cloudDatabaseFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB740], "persistentStoreDescriptionWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", *MEMORY[0x24BDBB580]);
  objc_msgSend(v4, "setShouldAddStoreAsynchronously:", 0);
  -[SKADatabaseProvider ckContainerIdentifier](self, "ckContainerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6F8]), "initWithContainerIdentifier:", v5);
  objc_msgSend(v6, "setUseDeviceToDeviceEncryption:", 1);
  objc_msgSend(v6, "setApsConnectionMachServiceName:", CFSTR("com.apple.aps.StatusKit.CloudKitMirroring"));
  objc_msgSend(v4, "setCloudKitContainerOptions:", v6);
  objc_msgSend(v4, "setConfiguration:", CFSTR("Cloud"));
  v7 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v4, "setOption:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB4C8]);
  objc_msgSend(v4, "setOption:forKey:", v7, *MEMORY[0x24BDBB520]);
  objc_msgSend(v4, "setOption:forKey:", v7, *MEMORY[0x24BDBB488]);
  objc_msgSend(v4, "setOption:forKey:", v7, *MEMORY[0x24BDBB420]);

  return v4;
}

- (void)handlePersistentStoreRemoteChangeNotification:(id)a3
{
  NSObject *v4;
  NSObject *historyProcessingQueue;
  _QWORD block[4];
  id v7;
  id buf[2];

  +[SKADatabaseProvider logger](SKADatabaseProvider, "logger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Persistent store remote change notification received.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  historyProcessingQueue = self->_historyProcessingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__SKADatabaseProvider_handlePersistentStoreRemoteChangeNotification___block_invoke;
  block[3] = &unk_24D9779B8;
  objc_copyWeak(&v7, buf);
  dispatch_async(historyProcessingQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __69__SKADatabaseProvider_handlePersistentStoreRemoteChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "processPersistentStoreRemoteChanges");

}

- (void)processPersistentStoreRemoteChanges
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  -[SKADatabaseProvider persistentContainer](self, "persistentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newBackgroundContext");

  v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__SKADatabaseProvider_processPersistentStoreRemoteChanges__block_invoke;
  v10[3] = &unk_24D977538;
  v10[4] = self;
  v11 = v4;
  v9 = v5;
  v12 = v9;
  v6 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "databaseDidReceiveRemoteChangesForChannels:", v8);

  }
}

void __58__SKADatabaseProvider_processPersistentStoreRemoteChanges__block_invoke(uint64_t a1)
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
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[16];
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBB728], "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appTransactionAuthorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1758];
  v59[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:argumentArray:", CFSTR("author != %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setPredicate:", v6);
  objc_msgSend(*(id *)(a1 + 32), "lastProcessedPersistentHistoryToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchRequest:", v2);
  v9 = *(void **)(a1 + 40);
  v56 = 0;
  objc_msgSend(v9, "executeRequest:error:", v8, &v56);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v56;
  objc_msgSend(v10, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __58__SKADatabaseProvider_processPersistentStoreRemoteChanges__block_invoke_cold_1();
    goto LABEL_30;
  }
  if (objc_msgSend(v12, "count"))
  {
    v36 = 0;
    v37 = v10;
    v38 = v8;
    v39 = v7;
    v40 = v6;
    v41 = v3;
    v42 = v2;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v35 = v13;
    obj = v13;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (!v45)
      goto LABEL_27;
    v44 = *(_QWORD *)v52;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v52 != v44)
          objc_enumerationMutation(obj);
        v46 = v15;
        v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v15);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v16, "changes", v35, v36, v37, v38, v39, v40, v41, v42);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v48 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              objc_msgSend(v22, "changedObjectID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "entity");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "name");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v23) = objc_msgSend(v25, "isEqualToString:", v27);

              if ((_DWORD)v23)
              {
                objc_msgSend(*(id *)(a1 + 32), "extractModifiedChannelFromPersistentStoreRemoteChangeForChannel:managedObjectContext:", v22, *(_QWORD *)(a1 + 40));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v29 = (objc_class *)objc_opt_class();
                NSStringFromClass(v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v25, "isEqualToString:", v30);

                if (!v31)
                  goto LABEL_23;
                objc_msgSend(*(id *)(a1 + 32), "extractModifiedChannelFromPersistentStoreRemoteChangeForReceivedInvitation:managedObjectContext:", v22, *(_QWORD *)(a1 + 40));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v32 = v28;
              if (v28)
              {
                objc_msgSend(v28, "identifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v33, "length"))
                  objc_msgSend(*(id *)(a1 + 48), "addObject:", v33);

              }
LABEL_23:

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          }
          while (v19);
        }

        v15 = v46 + 1;
      }
      while (v46 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      if (!v45)
      {
LABEL_27:

        objc_msgSend(obj, "lastObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "token");
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setLastProcessedPersistentHistoryToken:", v14);
        v3 = v41;
        v2 = v42;
        v7 = v39;
        v6 = v40;
        v10 = v37;
        v8 = v38;
        v13 = v35;
        v11 = v36;
        goto LABEL_30;
      }
    }
  }
  +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "History change request found no results.", buf, 2u);
  }
LABEL_30:

}

- (id)extractModifiedChannelFromPersistentStoreRemoteChangeForChannel:(id)a3 managedObjectContext:(id)a4
{
  NSObject *v6;
  id v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  int v15;
  NSObject *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[NSObject changeType](v6, "changeType");
  if (v8 < 2)
  {
    -[NSObject changedObjectID](v6, "changedObjectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKADatabaseProvider existingManagedObjectWithID:managedObjectContext:](self, "existingManagedObjectWithID:managedObjectContext:", v9, v7);
    v10 = objc_claimAutoreleasedReturnValue();

    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v15 = 138412546;
        v16 = v10;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Have channel matching persistent history change. Channel: %@ Change: %@", (uint8_t *)&v15, 0x16u);
      }

      v10 = v10;
      v13 = v10;
    }
    else
    {
      if (v12)
      {
        v15 = 138412290;
        v16 = v6;
        _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Could not find channel matching persisent history change: %@", (uint8_t *)&v15, 0xCu);
      }

      v13 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (v8 == 2)
  {
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring delete channel change: %@", (uint8_t *)&v15, 0xCu);
    }
    v13 = 0;
    goto LABEL_14;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (id)extractModifiedChannelFromPersistentStoreRemoteChangeForReceivedInvitation:(id)a3 managedObjectContext:(id)a4
{
  NSObject *v6;
  id v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  NSObject *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[NSObject changeType](v6, "changeType");
  if (v8 < 2)
  {
    -[NSObject changedObjectID](v6, "changedObjectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKADatabaseProvider existingManagedObjectWithID:managedObjectContext:](self, "existingManagedObjectWithID:managedObjectContext:", v9, v7);
    v10 = objc_claimAutoreleasedReturnValue();

    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v17 = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Have received invitation matching persistent history change. ReceivedInvitation: %@ Change: %@", (uint8_t *)&v17, 0x16u);
      }

      -[NSObject channel](v10, "channel");
      v11 = objc_claimAutoreleasedReturnValue();
      +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v11)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 138412546;
          v18 = v11;
          v19 = 2112;
          v20 = v6;
          _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "ReceivedInvitation matching persistent history change has channel. Channel: %@ Change: %@", (uint8_t *)&v17, 0x16u);
        }

        v11 = v11;
        v15 = v11;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[SKADatabaseProvider extractModifiedChannelFromPersistentStoreRemoteChangeForReceivedInvitation:managedObjectContext:].cold.1();

        v15 = 0;
      }
    }
    else
    {
      if (v12)
      {
        v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Could not find encryption key matching persisent history change: %@", (uint8_t *)&v17, 0xCu);
      }
      v15 = 0;
    }

LABEL_21:
    goto LABEL_22;
  }
  if (v8 == 2)
  {
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring delete received invitation change: %@", (uint8_t *)&v17, 0xCu);
    }
    v15 = 0;
    goto LABEL_21;
  }
  v15 = 0;
LABEL_22:

  return v15;
}

- (id)existingManagedObjectWithID:(id)a3 managedObjectContext:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  objc_msgSend(a4, "existingObjectWithID:error:", a3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = v5;
  if (!v4)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDD0B88]))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 133000)
      {
        +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v6;
          _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Did not find object matching change history event. Object has already been deleted. Error: %@", buf, 0xCu);
        }
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

    }
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKADatabaseProvider existingManagedObjectWithID:managedObjectContext:].cold.1();
    goto LABEL_9;
  }
LABEL_10:

  return v4;
}

- (void)handlePersistentStoreEventChangedNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (!self->_hasInitialCloudKitImportOccurred)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDBB4A0]);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v11, "type");
    if (v5 == 1)
    {
      if (self->_hasInitialCloudKitImportOccurred)
      {
LABEL_9:

        return;
      }
      self->_hasInitialCloudKitImportOccurred = 1;
      -[SKADatabaseProvider delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "initialCloudKitImportReceived:", self);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BDBB498];
      -[SKADatabaseProvider persistentContainer](self, "persistentContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, v9, v10);

    }
    else
    {
      if (v5)
        goto LABEL_9;
      objc_msgSend(v11, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_9;
      -[SKADatabaseProvider setCloudKitSetupCompleted:](self, "setCloudKitSetupCompleted:", 1);
      -[SKADatabaseProvider persistentContainer](self, "persistentContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKADatabaseProvider performInitialImportQueryWithContainer:](self, "performInitialImportQueryWithContainer:", v7);
    }

    goto LABEL_9;
  }
}

- (BOOL)performInitialImportQueryWithContainer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  BOOL hasInitialCloudKitImportOccurred;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[16];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Fetching NSPersistentCloudKitContainerEvents for first import check", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBB6F0], "fetchRequestForEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(succeeded == YES) AND (type == %ld) AND (endDate != nil)"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x24BDBB6F0], "fetchEventsMatchingFetchRequest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultType:", 1);
  objc_msgSend(v4, "persistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistentStores");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAffectedStores:", v10);

  v11 = (void *)objc_msgSend(v4, "newBackgroundContext");
  v32 = 0;
  objc_msgSend(v11, "executeRequest:error:", v8, &v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v32;
  objc_msgSend(v12, "result");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  self->_hasInitialCloudKitImportOccurred = v16 != 0;
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDBB498];
    -[SKADatabaseProvider persistentContainer](self, "persistentContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObserver:name:object:", self, v18, v19);

  }
  if (-[SKADatabaseProvider cloudKitSetupCompleted](self, "cloudKitSetupCompleted"))
  {
    v27 = v13;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[SKADatabaseProvider importCompletionHandlers](self, "importCompletionHandlers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i) + 16))();
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v22);
    }

    v13 = v27;
  }
  hasInitialCloudKitImportOccurred = self->_hasInitialCloudKitImportOccurred;

  return hasInitialCloudKitImportOccurred;
}

- (id)lastProcessedPersistentHistoryToken
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v8;

  -[SKADatabaseProvider lastProcessedPersistentHistoryTokenFileURL](self, "lastProcessedPersistentHistoryTokenFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v5)
    {
      +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKADatabaseProvider lastProcessedPersistentHistoryToken].cold.2();

    }
  }
  else
  {
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SKADatabaseProvider lastProcessedPersistentHistoryToken].cold.1();
    v4 = 0;
  }

  return v4;
}

- (void)setLastProcessedPersistentHistoryToken:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v5)
  {
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SKADatabaseProvider setLastProcessedPersistentHistoryToken:].cold.2();
  }
  else if (objc_msgSend(v4, "length"))
  {
    -[SKADatabaseProvider lastProcessedPersistentHistoryTokenFileURL](self, "lastProcessedPersistentHistoryTokenFileURL");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeToURL:atomically:", v6, 1);
  }
  else
  {
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SKADatabaseProvider setLastProcessedPersistentHistoryToken:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void)deviceToDeviceEncryptedDatabaseCapableWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  void (**v9)(id, uint64_t);
  uint8_t buf[16];

  v4 = (void (**)(id, uint64_t))a3;
  +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Checking device to device encrypted database capability.", buf, 2u);
  }

  if (-[SKADatabaseProvider overrideDeviceEncryptionCheck](self, "overrideDeviceEncryptionCheck"))
  {
    +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Overriding device-to-device encryption check because default has been set.", buf, 2u);
    }

    v4[2](v4, 1);
  }
  else if (-[SKADatabaseProvider accountCheckCompleted](self, "accountCheckCompleted"))
  {
    v4[2](v4, -[SKADatabaseProvider accountSupportsDeviceToDeviceEncryption](self, "accountSupportsDeviceToDeviceEncryption"));
  }
  else
  {
    -[SKADatabaseProvider ckContainer](self, "ckContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke;
    v8[3] = &unk_24D9779E0;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "accountInfoWithCompletionHandler:", v8);

  }
}

void __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke_2;
  block[3] = &unk_24D976E78;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v13[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "supportsDeviceToDeviceEncryption");
  objc_msgSend(*(id *)(a1 + 40), "setAccountCheckCompleted:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setAccountSupportsDeviceToDeviceEncryption:", v2);
  +[SKADatabaseProvider logger](SKADatabaseProvider, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((_DWORD)v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Account supports device-to-device encryption", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)databaseHasBeenCreated
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SKADatabaseProvider fileManager](self, "fileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseProvider localDatabaseFileURL](self, "localDatabaseFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  return v6;
}

- (BOOL)overrideDeviceEncryptionCheck
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("skipHSA2"), CFSTR("com.apple.StatusKitAgent"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (void)handleManateeAvailabilityNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  +[SKADatabaseProvider logger](SKADatabaseProvider, "logger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Received manatee availability changed notification. Resetting account check status.", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SKADatabaseProvider_handleManateeAvailabilityNotification___block_invoke;
  block[3] = &unk_24D977A08;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __61__SKADatabaseProvider_handleManateeAvailabilityNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccountCheckCompleted:", 0);
}

+ (id)logger
{
  if (logger_onceToken_22 != -1)
    dispatch_once(&logger_onceToken_22, &__block_literal_global_22);
  return (id)logger__logger_22;
}

void __29__SKADatabaseProvider_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKADatabaseProvider");
  v1 = (void *)logger__logger_22;
  logger__logger_22 = (uint64_t)v0;

}

- (id)newBackgroundContext
{
  void *v2;
  void *v3;

  -[SKADatabaseProvider persistentContainer](self, "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newBackgroundContext");

  return v3;
}

- (SKADatabaseProvidingDelegate)delegate
{
  return (SKADatabaseProvidingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)historyProcessingQueue
{
  return self->_historyProcessingQueue;
}

- (void)setHistoryProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_historyProcessingQueue, a3);
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (void)setCkContainer:(id)a3
{
  objc_storeStrong((id *)&self->_ckContainer, a3);
}

- (BOOL)accountCheckCompleted
{
  return self->_accountCheckCompleted;
}

- (void)setAccountCheckCompleted:(BOOL)a3
{
  self->_accountCheckCompleted = a3;
}

- (BOOL)accountSupportsDeviceToDeviceEncryption
{
  return self->_accountSupportsDeviceToDeviceEncryption;
}

- (void)setAccountSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  self->_accountSupportsDeviceToDeviceEncryption = a3;
}

- (BOOL)hasInitialCloudKitImportOccurred
{
  return self->_hasInitialCloudKitImportOccurred;
}

- (void)setHasInitialCloudKitImportOccurred:(BOOL)a3
{
  self->_hasInitialCloudKitImportOccurred = a3;
}

- (BOOL)cloudKitSetupCompleted
{
  return self->_cloudKitSetupCompleted;
}

- (void)setCloudKitSetupCompleted:(BOOL)a3
{
  self->_cloudKitSetupCompleted = a3;
}

- (NSMutableArray)importCompletionHandlers
{
  return self->_importCompletionHandlers;
}

- (void)setImportCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_importCompletionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_ckContainer, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_historyProcessingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)createPersistentContainer
{
  OUTLINED_FUNCTION_1(&dword_2188DF000, a1, a3, "Failed creation of persistent container", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __48__SKADatabaseProvider_createPersistentContainer__block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, v0, (uint64_t)v0, "Failed to load persistent store. Error: %@ Store: %@", v1);
  OUTLINED_FUNCTION_3();
}

void __58__SKADatabaseProvider_processPersistentStoreRemoteChanges__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error executing history change request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)extractModifiedChannelFromPersistentStoreRemoteChangeForReceivedInvitation:managedObjectContext:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_5_0(&dword_2188DF000, v0, (uint64_t)v0, "ReceivedInvitation matching persistent history change has not channel. ReceivedInvitation: %@ Change: %@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)existingManagedObjectWithID:managedObjectContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching object matching change transaction. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)lastProcessedPersistentHistoryToken
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error unarchiving last processed persistent history token. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setLastProcessedPersistentHistoryToken:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2188DF000, a1, a3, "Archived last processed persistent history token is zero length", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)setLastProcessedPersistentHistoryToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error archiving last processed persistent history token. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2188DF000, a1, a3, "Account does not support device-to-device encryption and is not statuskit capable", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
