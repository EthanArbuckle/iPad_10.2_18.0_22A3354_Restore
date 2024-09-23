@implementation AnalyticsStoreMOHandler

+ (id)sharedAnalyticsStoreMOHandlerWithPersist
{
  void *v2;
  NSObject *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (+[WAUtil isAnalyticsProcessorAllowed](WAUtil, "isAnalyticsProcessorAllowed"))
  {
    if (qword_253D3A4B0 != -1)
      dispatch_once(&qword_253D3A4B0, &__block_literal_global_3);
    v2 = (void *)_MergedGlobals_3;
    if (!_MergedGlobals_3)
    {
      WALogCategoryDefaultHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446466;
        v7 = "+[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist]";
        v8 = 1024;
        v9 = 55;
        _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:AnalyticsStoreMOHandler failed initWithType -- Store unavailable to this process until reboot", (uint8_t *)&v6, 0x12u);
      }

      v2 = (void *)_MergedGlobals_3;
    }
    return v2;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446466;
      v7 = "+[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist]";
      v8 = 1024;
      v9 = 45;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Writing in the WiFi Analytics Store is disabled on this platform", (uint8_t *)&v6, 0x12u);
    }

    return 0;
  }
}

void __67__AnalyticsStoreMOHandler_sharedAnalyticsStoreMOHandlerWithPersist__block_invoke()
{
  AnalyticsStoreMOHandler *v0;
  void *v1;

  v0 = -[AnalyticsStoreMOHandler initWithType:options:]([AnalyticsStoreMOHandler alloc], "initWithType:options:", 1, 0);
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

}

+ (BOOL)isStoreCompatible
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[AnalyticsStoreDescriptor defaultPersistentStoreURL](AnalyticsStoreDescriptor, "defaultPersistentStoreURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreDescriptor defaultModelURL](AnalyticsStoreDescriptor, "defaultModelURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreMOContext sharedManagedObjectModel:](AnalyticsStoreMOContext, "sharedManagedObjectModel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:](AnalyticsPersistenceManager, "isStoreCompatibleAtURL:withModel:", v2, v4);

  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446722;
    v9 = "+[AnalyticsStoreMOHandler isStoreCompatible]";
    v10 = 1024;
    v11 = 69;
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AnalyticsStoreMOHandler isStoreCompatibleAtURL is %d", (uint8_t *)&v8, 0x18u);
  }

  return v5;
}

- (AnalyticsStoreMOHandler)initWithType:(unint64_t)a3 options:(unint64_t)a4
{
  char v4;
  AnalyticsStoreMOHandler *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  AnalyticsStoreMOContext *v12;
  AnalyticsStoreMOContext *v13;
  uint64_t v14;
  AnalyticsPersistenceManager *persistenceManager;
  void *v16;
  AnalyticsStoreMOHandler *v17;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)AnalyticsStoreMOHandler;
  v6 = -[AnalyticsStoreMOHandler init](&v20, sel_init);
  if (!v6)
  {
    v16 = 0;
    v8 = 0;
    v13 = 0;
    goto LABEL_11;
  }
  if (MEMORY[0x24BE671F0] && !MKBUserUnlockedSinceBoot())
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136446466;
    v22 = "-[AnalyticsStoreMOHandler initWithType:options:]";
    v23 = 1024;
    v24 = 82;
    v9 = "%{public}s::%d:Device has not been unlocked since boot";
LABEL_20:
    v10 = v8;
    v11 = 18;
    goto LABEL_21;
  }
  if (a3 == 1)
  {
    v7 = v4 & 3;
    +[AnalyticsStoreDescriptor serverStoreDescriptor:](AnalyticsStoreDescriptor, "serverStoreDescriptor:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      WALogCategoryDefaultHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v22 = "-[AnalyticsStoreMOHandler initWithType:options:]";
        v23 = 1024;
        v24 = 94;
        v25 = 2048;
        v26 = v7;
        v9 = "%{public}s::%d:Error creating server store descriptor with options: %lu";
        v10 = v8;
        v11 = 28;
LABEL_21:
        _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      }
LABEL_22:

      v8 = 0;
      v13 = 0;
      v16 = v6;
      v6 = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  +[AnalyticsStoreDescriptor directStoreDescriptor](AnalyticsStoreDescriptor, "directStoreDescriptor");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136446466;
    v22 = "-[AnalyticsStoreMOHandler initWithType:options:]";
    v23 = 1024;
    v24 = 97;
    v9 = "%{public}s::%d:Error creating direct store descriptor";
    goto LABEL_20;
  }
LABEL_9:
  v6->_storeType = a3;
  v12 = -[AnalyticsStoreMOContext initWithStoreDescriptor:]([AnalyticsStoreMOContext alloc], "initWithStoreDescriptor:", v8);
  if (!v12)
  {
    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "-[AnalyticsStoreMOHandler initWithType:options:]";
      v23 = 1024;
      v24 = 103;
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating store controller", buf, 0x12u);
    }

    goto LABEL_22;
  }
  v13 = v12;
  objc_storeStrong((id *)&v6->_storeMOContext, v12);
  -[AnalyticsStoreMOContext persistenceManager](v6->_storeMOContext, "persistenceManager");
  v14 = objc_claimAutoreleasedReturnValue();
  persistenceManager = v6->_persistenceManager;
  v6->_persistenceManager = (AnalyticsPersistenceManager *)v14;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel_contextDidSave_, *MEMORY[0x24BDBB458], 0);
LABEL_11:

  v17 = v6;
  return v17;
}

- (AnalyticsStoreMOHandler)initWithContext:(id)a3
{
  id v5;
  AnalyticsStoreMOHandler *v6;
  uint64_t v7;
  AnalyticsPersistenceManager *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  const char *v13;
  AnalyticsPersistenceManager *persistenceManager;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AnalyticsStoreMOHandler;
  v6 = -[AnalyticsStoreMOHandler init](&v15, sel_init);
  if (!v6)
    goto LABEL_13;
  if (MEMORY[0x24BE671F0] && !MKBUserUnlockedSinceBoot())
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsStoreMOHandler initWithContext:]";
      v18 = 1024;
      v19 = 128;
      v13 = "%{public}s::%d:Device has not been unlocked since boot";
      goto LABEL_11;
    }
LABEL_12:

LABEL_13:
    persistenceManager = v6->_persistenceManager;
    v6->_persistenceManager = 0;

    v10 = v6;
    v6 = 0;
    goto LABEL_6;
  }
  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsStoreMOHandler initWithContext:]";
      v18 = 1024;
      v19 = 130;
      v13 = "%{public}s::%d:Error given store controller";
LABEL_11:
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v6->_storeMOContext, a3);
  -[AnalyticsStoreMOContext persistenceManager](v6->_storeMOContext, "persistenceManager");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v6->_persistenceManager;
  v6->_persistenceManager = (AnalyticsPersistenceManager *)v7;

  -[AnalyticsStoreMOContext storeDescriptor](v6->_storeMOContext, "storeDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_storeType = objc_msgSend(v9, "type");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel_contextDidSave_, *MEMORY[0x24BDBB458], 0);
LABEL_6:

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AnalyticsStoreMOHandler;
  -[AnalyticsStoreMOHandler dealloc](&v4, sel_dealloc);
}

- (NSManagedObjectContext)managedObjectContext
{
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *v3;
  void *v5;
  void *v6;
  NSManagedObjectContext *v7;
  void *v8;
  void *v9;
  void *v10;
  NSManagedObjectContext *v11;

  managedObjectContext = self->__managedObjectContext;
  if (managedObjectContext)
  {
    v3 = managedObjectContext;
  }
  else
  {
    -[AnalyticsStoreMOHandler persistenceManager](self, "persistenceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistenceCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (NSManagedObjectContext *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
      objc_msgSend(MEMORY[0x24BDBB6C8], "mergeByPropertyObjectTrumpMergePolicy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSManagedObjectContext setMergePolicy:](v7, "setMergePolicy:", v8);

      -[NSManagedObjectContext setPersistentStoreCoordinator:](v7, "setPersistentStoreCoordinator:", v6);
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "processName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSManagedObjectContext setTransactionAuthor:](v7, "setTransactionAuthor:", v10);

      v11 = self->__managedObjectContext;
      self->__managedObjectContext = v7;

    }
    v3 = self->__managedObjectContext;

  }
  return v3;
}

- (void)performBlockOnManagedObjectContext:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performBlock", ", buf, 2u);
  }

  -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__AnalyticsStoreMOHandler_performBlockOnManagedObjectContext_block___block_invoke;
  v13[3] = &unk_24CDDDF38;
  v14 = v6;
  v15 = v7;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v13);

  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performBlock", ", buf, 2u);
  }

}

uint64_t __68__AnalyticsStoreMOHandler_performBlockOnManagedObjectContext_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)performBlockOnManagedObjectContextForNSData:(id)a3 withDate:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performBlockNSData", ", buf, 2u);
  }

  -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __86__AnalyticsStoreMOHandler_performBlockOnManagedObjectContextForNSData_withDate_block___block_invoke;
  v17[3] = &unk_24CDDDF60;
  v19 = v9;
  v20 = v10;
  v18 = v8;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  objc_msgSend(v12, "performBlockAndWait:", v17);

  WALogCategoryDefaultHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performBlockNSData", ", buf, 2u);
  }

}

uint64_t __86__AnalyticsStoreMOHandler_performBlockOnManagedObjectContextForNSData_withDate_block___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)saveManagedObjectContext
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler saveManagedObjectContext", ", buf, 2u);
  }

  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]";
    v13 = 1024;
    v14 = 196;
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Attempting Save MOC with save", buf, 0x12u);
  }

  -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasChanges");

  if ((v6 & 1) != 0)
  {
    -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__AnalyticsStoreMOHandler_saveManagedObjectContext__block_invoke;
    v10[3] = &unk_24CDDCCF8;
    v10[4] = self;
    objc_msgSend(v7, "performBlockAndWait:", v10);

  }
  else
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]";
      v13 = 1024;
      v14 = 198;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:No changes to be saved", buf, 0x12u);
    }

  }
  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler saveManagedObjectContext", ", buf, 2u);
  }

}

void __51__AnalyticsStoreMOHandler_saveManagedObjectContext__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler save", ", buf, 2u);
  }

  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]_block_invoke";
    v15 = 1024;
    v16 = 206;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Save MOC, calling save", buf, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = objc_msgSend(v4, "save:", &v12);
  v6 = v12;

  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v14 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]_block_invoke";
      v15 = 1024;
      v16 = 212;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Saved context", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v14 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]_block_invoke";
    v15 = 1024;
    v16 = 210;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error saving context: %@ %@", buf, 0x26u);

  }
  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v5;
    _os_signpost_emit_with_name_impl(&dword_212581000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler save", "success:%d", buf, 8u);
  }

}

- (void)updateManagedObjectContextWithoutSave
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave", ", buf, 2u);
  }

  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave]";
    v10 = 1024;
    v11 = 245;
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Attempting Update MOC without save", buf, 0x12u);
  }

  -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__AnalyticsStoreMOHandler_updateManagedObjectContextWithoutSave__block_invoke;
  v7[3] = &unk_24CDDCCF8;
  v7[4] = self;
  objc_msgSend(v5, "performBlockAndWait:", v7);

  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave", ", buf, 2u);
  }

}

void __64__AnalyticsStoreMOHandler_updateManagedObjectContextWithoutSave__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave]_block_invoke";
    v6 = 1024;
    v7 = 249;
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Update MOC without save, calling processPendingChanges", (uint8_t *)&v4, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processPendingChanges");

}

- (void)contextDidSave:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136446466;
    v5 = "-[AnalyticsStoreMOHandler contextDidSave:]";
    v6 = 1024;
    v7 = 261;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Notification contextDidSave NSManagedObjectContextDidSaveNotification", (uint8_t *)&v4, 0x12u);
  }

}

- (void)performPruneBasedOnStoreSizeAndSave
{
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performPruneBasedOnStoreSizeAndSave", ", (uint8_t *)&v8, 2u);
  }

  -[AnalyticsStoreMOHandler storeMOContext](self, "storeMOContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storeNeedsImmediatePruning:", 104857600);

  if (v5)
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136446466;
      v9 = "-[AnalyticsStoreMOHandler performPruneBasedOnStoreSizeAndSave]";
      v10 = 1024;
      v11 = 269;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:storeNeedsImmediatePruning returned true, calling pruneManagedObjects", (uint8_t *)&v8, 0x12u);
    }

    -[AnalyticsStoreMOHandler pruneManagedObjects](self, "pruneManagedObjects");
  }
  -[AnalyticsStoreMOHandler saveManagedObjectContext](self, "saveManagedObjectContext");
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performPruneBasedOnStoreSizeAndSave", ", (uint8_t *)&v8, 2u);
  }

}

- (void)pruneManagedObjects
{
  NSObject *v3;
  _UNKNOWN **v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _UNKNOWN **v23;
  void *v24;
  AnalyticsStoreMOHandler *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  __int128 v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  unint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler pruneManagedObjects", ", buf, 2u);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = &off_24CDDB000;
  +[AnalyticsStoreProxy analyticsStoreEntityNames](AnalyticsStoreProxy, "analyticsStoreEntityNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v34;
    *(_QWORD *)&v6 = 136446978;
    v30 = v6;
    v31 = *(_QWORD *)v34;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v9);
        objc_msgSend(v4[21], "analyticsStoreEntitiesWithDate", v30);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v10);

        if (v12)
        {
          v13 = v4[21];
          -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "entityCount:withPredicate:moc:", v10, 0, v14);

          if (v15)
          {
            WALogCategoryDefaultHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v30;
              v39 = "-[AnalyticsStoreMOHandler pruneManagedObjects]";
              v40 = 1024;
              v41 = 288;
              v42 = 2112;
              v43 = v10;
              v44 = 2048;
              v45 = v15;
              _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Total objects for %@:%lu", buf, 0x26u);
            }

            v17 = v15 >> 1;
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", v10);
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 1);
            v37 = v19;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setSortDescriptors:", v20);

            objc_msgSend(v18, "setFetchLimit:", v17);
            v21 = v4[21];
            -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "batchDelete:withPredicate:withFetchRequest:moc:", v10, 0, v18, v22);

            v23 = v4;
            v24 = v4[21];
            v25 = self;
            -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v24, "entityCount:withPredicate:moc:", v10, 0, v26);

            WALogCategoryDefaultHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v30;
              v39 = "-[AnalyticsStoreMOHandler pruneManagedObjects]";
              v40 = 1024;
              v41 = 298;
              v42 = 2112;
              v43 = v10;
              v44 = 2048;
              v45 = v27;
              _os_log_impl(&dword_212581000, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Total objects for %@:%lu", buf, 0x26u);
            }

            self = v25;
            v4 = v23;
            v8 = v31;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v7);
  }

  WALogCategoryDefaultHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler pruneManagedObjects", ", buf, 2u);
  }

}

- (void)pruneTestBSSes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[BSSMO entityName](BSSMO, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.bssid == %@"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        WALogCategoryDefaultHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "description");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446978;
          v24 = "-[AnalyticsStoreMOHandler pruneTestBSSes:]";
          v25 = 1024;
          v26 = 310;
          v27 = 2112;
          v28 = v5;
          v29 = 2112;
          v30 = v12;
          _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ where %@", buf, 0x26u);

        }
        -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:](AnalyticsStoreProxy, "batchDelete:withPredicate:withFetchRequest:moc:", v5, v10, 0, v13);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v7);
  }

  +[NetworkMO entityName](NetworkMO, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v24 = "-[AnalyticsStoreMOHandler pruneTestBSSes:]";
    v25 = 1024;
    v26 = 315;
    v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ with no BSSes", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("numBSS == 0"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:](AnalyticsStoreProxy, "batchDelete:withPredicate:withFetchRequest:moc:", v14, v16, 0, v17);

}

- (void)ageOutManagedObjectsOlderThan:(double)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan", ", buf, 2u);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  +[AnalyticsStoreProxy analyticsStoreEntityNames](AnalyticsStoreProxy, "analyticsStoreEntityNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v31;
    *(_QWORD *)&v8 = 136446722;
    v29 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        +[BSSMO entityName](BSSMO, "entityName", v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v14)
        {
          WALogCategoryDefaultHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            v35 = "-[AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan:]";
            v36 = 1024;
            v37 = 325;
            v38 = 2112;
            v39 = v12;
            v40 = 2048;
            v41 = (uint64_t)(a3 / 86400.0);
            _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ older than %ld days", buf, 0x26u);
          }

          v16 = v12;
          v17 = CFSTR("lastSeen");
          goto LABEL_12;
        }
        +[NetworkMO entityName](NetworkMO, "entityName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v12, "isEqual:", v19);

        if (v20)
        {
          WALogCategoryDefaultHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v35 = "-[AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan:]";
            v36 = 1024;
            v37 = 330;
            v38 = 2112;
            v39 = v12;
            _os_log_impl(&dword_212581000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ with no BSSes", buf, 0x1Cu);
          }

          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("numBSS == 0"));
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        +[AnalyticsStoreProxy analyticsStoreEntitiesWithDate](AnalyticsStoreProxy, "analyticsStoreEntitiesWithDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "containsObject:", v12);

        if (v25)
        {
          WALogCategoryDefaultHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            v35 = "-[AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan:]";
            v36 = 1024;
            v37 = 334;
            v38 = 2112;
            v39 = v12;
            v40 = 2048;
            v41 = (uint64_t)(a3 / 86400.0);
            _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ older than:%ld days", buf, 0x26u);
          }

          v16 = v12;
          v17 = CFSTR("date");
LABEL_12:
          +[AnalyticsStoreProxy predicateForEntityWithAgeOlderThan:dateAttribute:olderThan:](AnalyticsStoreProxy, "predicateForEntityWithAgeOlderThan:dateAttribute:olderThan:", v16, v17, a3);
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_17:
          v22 = (void *)v18;
          -[AnalyticsStoreMOHandler managedObjectContext](self, "managedObjectContext");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:](AnalyticsStoreProxy, "batchDelete:withPredicate:withFetchRequest:moc:", v12, v22, 0, v23);

        }
        ++v11;
      }
      while (v9 != v11);
      v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      v9 = v27;
    }
    while (v27);
  }

  WALogCategoryDefaultHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan", ", buf, 2u);
  }

}

- (BOOL)setBssManagedObjectPropertyValueForKeyWithoutSave:(id)a3 forKey:(id)a4 withValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x212BEF45C]();
  v12 = +[BSSMO setBssManagedObjectPropertyValueForKey:forKey:withValue:](BSSMO, "setBssManagedObjectPropertyValueForKey:forKey:withValue:", v8, v9, v10);
  if (v12)
  {
    -[AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave](self, "updateManagedObjectContextWithoutSave");
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "bssid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "network");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ssid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136447490;
      v19 = "-[AnalyticsStoreMOHandler setBssManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:]";
      v20 = 1024;
      v21 = 353;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated BSSMO unparsedBeacon property for key:%@ for bssid:%@ ssid:%@ value:%@", (uint8_t *)&v18, 0x3Au);

    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446466;
      v19 = "-[AnalyticsStoreMOHandler setBssManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:]";
      v20 = 1024;
      v21 = 349;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed", (uint8_t *)&v18, 0x12u);
    }
  }

  objc_autoreleasePoolPop(v11);
  return v12;
}

- (BOOL)setNetworkManagedObjectPropertyValueForKeyWithoutSave:(id)a3 forKey:(id)a4 withValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x212BEF45C]();
  v12 = +[NetworkMO setNetworkManagedObjectPropertyValueForKey:forKey:withValue:](NetworkMO, "setNetworkManagedObjectPropertyValueForKey:forKey:withValue:", v8, v9, v10);
  if (v12)
  {
    -[AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave](self, "updateManagedObjectContextWithoutSave");
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "ssid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136447234;
      v17 = "-[AnalyticsStoreMOHandler setNetworkManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:]";
      v18 = 1024;
      v19 = 367;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated NetworkMO channels property for key:%@ ssid:%@ value:%@", (uint8_t *)&v16, 0x30u);

    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446466;
      v17 = "-[AnalyticsStoreMOHandler setNetworkManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:]";
      v18 = 1024;
      v19 = 363;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed", (uint8_t *)&v16, 0x12u);
    }
  }

  objc_autoreleasePoolPop(v11);
  return v12;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->__managedObjectContext, a3);
}

- (AnalyticsPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (AnalyticsStoreMOContext)storeMOContext
{
  return self->_storeMOContext;
}

- (void)setStoreMOContext:(id)a3
{
  objc_storeStrong((id *)&self->_storeMOContext, a3);
}

- (unint64_t)storeType
{
  return self->_storeType;
}

- (void)setStoreType:(unint64_t)a3
{
  self->_storeType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMOContext, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->__managedObjectContext, 0);
}

@end
