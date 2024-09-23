@implementation AnalyticsPersistenceManager

+ (id)sharedWAPersistenceCoordinatorWithMOM:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__AnalyticsPersistenceManager_sharedWAPersistenceCoordinatorWithMOM___block_invoke;
  block[3] = &unk_24CDDCCF8;
  v11 = v3;
  v4 = qword_253D3A500;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_253D3A500, block);
    v7 = v11;
  }
  v8 = (id)_MergedGlobals_8;

  return v8;
}

void __69__AnalyticsPersistenceManager_sharedWAPersistenceCoordinatorWithMOM___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446466;
    v6 = "+[AnalyticsPersistenceManager sharedWAPersistenceCoordinatorWithMOM:]_block_invoke";
    v7 = 1024;
    v8 = 42;
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:NSPersistentStoreCoordinator doesn't exist yet for this process, alloc and init instance", (uint8_t *)&v5, 0x12u);
  }

  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", *(_QWORD *)(a1 + 32));
  v4 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = v3;

}

- (AnalyticsPersistenceManager)initWithManagedObjectModel:(id)a3 storeDescriptor:(id)a4
{
  id v7;
  id v8;
  AnalyticsPersistenceManager *v9;
  AnalyticsPersistenceManager *v10;
  NSManagedObjectModel **p_managedObjectModel;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  NSXPCStoreServer *v20;
  NSObject *v21;
  NSXPCStoreServer *v22;
  NSObject *v23;
  uint64_t v24;
  NSPersistentStoreCoordinator *persistenceCoordinator;
  void *v26;
  NSPersistentStoreCoordinator *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSXPCStoreServer *xpcStoreServer;
  NSObject *v40;
  NSXPCStoreServer *v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v46;
  NSObject *v47;
  unint64_t v48;
  _QWORD v49[5];
  objc_super v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  NSXPCStoreServer *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v50.receiver = self;
  v50.super_class = (Class)AnalyticsPersistenceManager;
  v9 = -[AnalyticsPersistenceManager init](&v50, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_41;
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
      v57 = 1024;
      v58 = 57;
      _os_log_impl(&dword_212581000, v46, OS_LOG_TYPE_ERROR, "%{public}s::%d:managed object model is nil", buf, 0x12u);
    }

    goto LABEL_41;
  }
  p_managedObjectModel = &v9->_managedObjectModel;
  objc_storeStrong((id *)&v9->_managedObjectModel, a3);
  if (objc_msgSend(v8, "type"))
    LODWORD(v48) = 0;
  else
    v48 = ((unint64_t)objc_msgSend(v8, "analyticsStoreOptions") >> 1) & 1;
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    v13 = objc_msgSend(v8, "type");
    *(_DWORD *)buf = 134218240;
    v56 = (const char *)v13;
    v57 = 1024;
    v58 = v48;
    _os_signpost_emit_with_name_impl(&dword_212581000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager Init", "type %lu migrateOpt %d", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSObject fileExistsAtPath:](v14, "fileExistsAtPath:", v16) & 1) == 0)
  {

LABEL_16:
    goto LABEL_17;
  }
  objc_msgSend(v8, "storeURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:](AnalyticsPersistenceManager, "isStoreCompatibleAtURL:withModel:", v17, *p_managedObjectModel);

  if (!v18)
  {
    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "storeURL");
      v20 = (NSXPCStoreServer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
      v57 = 1024;
      v58 = 68;
      v59 = 2112;
      v60 = v20;
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Incompatible store at URL %@", buf, 0x1Cu);

    }
    WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v14 = v21;
    if ((v48 & 1) != 0)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "storeURL");
        v22 = (NSXPCStoreServer *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
        v57 = 1024;
        v58 = 70;
        v59 = 2112;
        v60 = v22;
        _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to migrate incompatible store at URL %@", buf, 0x1Cu);

      }
      goto LABEL_16;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
      v57 = 1024;
      v58 = 69;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Will not migrate incompatible store.. bailing!", buf, 0x12u);
    }

LABEL_41:
    LODWORD(v48) = 0;
    goto LABEL_33;
  }
LABEL_17:
  WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager PersistentStoreCoordinatorInit", ", buf, 2u);
  }

  +[AnalyticsPersistenceManager sharedWAPersistenceCoordinatorWithMOM:](AnalyticsPersistenceManager, "sharedWAPersistenceCoordinatorWithMOM:", *p_managedObjectModel);
  v24 = objc_claimAutoreleasedReturnValue();
  persistenceCoordinator = v10->_persistenceCoordinator;
  v10->_persistenceCoordinator = (NSPersistentStoreCoordinator *)v24;

  if (v10->_persistenceCoordinator)
  {
    v26 = (void *)MEMORY[0x212BEF45C]();
    v27 = v10->_persistenceCoordinator;
    objc_msgSend(v8, "storeDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __74__AnalyticsPersistenceManager_initWithManagedObjectModel_storeDescriptor___block_invoke;
    v49[3] = &unk_24CDDE8C0;
    v49[4] = &v51;
    -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:](v27, "addPersistentStoreWithDescription:completionHandler:", v28, v49);

    objc_autoreleasePoolPop(v26);
    LODWORD(v28) = *((unsigned __int8 *)v52 + 24);
    WALogCategoryDefaultHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if ((_DWORD)v28)
    {
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_212581000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager PersistentStoreCoordinatorInit", ", buf, 2u);
      }

      if (!objc_msgSend(v8, "type") && (objc_msgSend(v8, "analyticsStoreOptions") & 1) != 0)
      {
        WALogCategoryDefaultHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_212581000, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager XPCStoreInit", ", buf, 2u);
        }

        v32 = (void *)objc_opt_new();
        v33 = (void *)MEMORY[0x212BEF45C]();
        v34 = objc_alloc(MEMORY[0x24BDBB770]);
        objc_msgSend(v8, "storeURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "modelURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "remoteStoreOptions");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v34, "initForStoreWithURL:usingModelAtURL:options:policy:", v35, v36, v37, v32);
        xpcStoreServer = v10->_xpcStoreServer;
        v10->_xpcStoreServer = (NSXPCStoreServer *)v38;

        objc_autoreleasePoolPop(v33);
        -[NSXPCStoreServer startListening](v10->_xpcStoreServer, "startListening");
        WALogCategoryDefaultHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = v10->_xpcStoreServer;
          *(_DWORD *)buf = 136446722;
          v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
          v57 = 1024;
          v58 = 105;
          v59 = 2112;
          v60 = v41;
          _os_log_impl(&dword_212581000, v40, OS_LOG_TYPE_INFO, "%{public}s::%d:initialized remote server %@", buf, 0x1Cu);
        }

        WALogCategoryDefaultHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v42))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_212581000, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager XPCStoreInit", ", buf, 2u);
        }

      }
      *((_BYTE *)v52 + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
        v57 = 1024;
        v58 = 89;
        _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to add persistent store", buf, 0x12u);
      }

    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
      v57 = 1024;
      v58 = 76;
      _os_log_impl(&dword_212581000, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:_persistenceCoordinator is nil", buf, 0x12u);
    }

  }
LABEL_33:
  if (!*((_BYTE *)v52 + 24))
  {

    v10 = 0;
  }
  WALogCategoryDefaultHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v43))
  {
    v44 = objc_msgSend(v8, "type");
    *(_DWORD *)buf = 134218240;
    v56 = (const char *)v44;
    v57 = 1024;
    v58 = v48;
    _os_signpost_emit_with_name_impl(&dword_212581000, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager Init", "type %lu migrateOpt %d", buf, 0x12u);
  }

  _Block_object_dispose(&v51, 8);
  return v10;
}

void __74__AnalyticsPersistenceManager_initWithManagedObjectModel_storeDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]_block_invoke";
      v11 = 1024;
      v12 = 82;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:error %@ adding persistent store %@", (uint8_t *)&v9, 0x26u);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 136446722;
      v10 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]_block_invoke";
      v11 = 1024;
      v12 = 84;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_INFO, "%{public}s::%d:added persistent store with description %@", (uint8_t *)&v9, 0x1Cu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

+ (BOOL)isStoreCompatibleAtURL:(id)a3 withModel:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  NSObject *v16;
  int v17;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v7 = MEMORY[0x212BEF45C]();
  v24 = 0;
  v8 = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", &v24);
  v9 = v24;
  WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136446466;
      v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
      v31 = 1024;
      v32 = 129;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Getting NSPersistentStoreCoordinator metadataForPersistentStoreOfType", buf, 0x12u);
    }

    v12 = *MEMORY[0x24BDBB580];
    v23 = v9;
    objc_msgSend(MEMORY[0x24BDBB738], "metadataForPersistentStoreOfType:URL:options:error:", v12, v5, 0, &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;

    if (v14)
    {
      WALogCategoryDefaultHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
        v31 = 1024;
        v32 = 134;
        v33 = 2112;
        v34 = v14;
        v19 = "%{public}s::%d:ERROR NSPersistentStoreCoordinator metadataForPersistentStoreOfType returned error %@";
        v20 = v16;
        v21 = 28;
LABEL_20:
        _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
      }
    }
    else
    {
      if (v13)
      {
        v15 = objc_msgSend(v6, "isConfiguration:compatibleWithStoreMetadata:", 0, v13);
        *((_BYTE *)v26 + 24) = v15;
        WALogCategoryDefaultHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
          v31 = 1024;
          v32 = 139;
          v33 = 2112;
          v34 = v13;
          _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NSPersistentStoreCoordinator metadataForPersistentStoreOfType metadata is %@", buf, 0x1Cu);
        }
        v17 = 0;
        goto LABEL_9;
      }
      WALogCategoryDefaultHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
        v31 = 1024;
        v32 = 135;
        v19 = "%{public}s::%d:ERROR NSPersistentStoreCoordinator metadataForPersistentStoreOfType failed to alloc";
        v20 = v16;
        v21 = 18;
        goto LABEL_20;
      }
    }
    v17 = 4;
LABEL_9:

    v9 = v14;
    goto LABEL_10;
  }
  if (v11)
  {
    *(_DWORD *)buf = 136446466;
    v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
    v31 = 1024;
    v32 = 127;
    _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Store does not exist on this device.", buf, 0x12u);
  }

  *((_BYTE *)v26 + 24) = 1;
  v17 = 4;
LABEL_10:

  objc_autoreleasePoolPop((void *)v7);
  if ((v17 | 4) == 4)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __64__AnalyticsPersistenceManager_isStoreCompatibleAtURL_withModel___block_invoke;
    v22[3] = &unk_24CDDCBF0;
    v22[4] = &v25;
    +[WAUtil getLazyNSNumberPreference:domain:exists:](WAUtil, "getLazyNSNumberPreference:domain:exists:", CFSTR("isStoreCompatible"), CFSTR("com.apple.wifi.analytics"), v22);
    LOBYTE(v7) = *((_BYTE *)v26 + 24) != 0;
  }
  _Block_object_dispose(&v25, 8);

  return v7 & 1;
}

void __64__AnalyticsPersistenceManager_isStoreCompatibleAtURL_withModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446978;
    v6 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]_block_invoke";
    v7 = 1024;
    v8 = 149;
    v9 = 2080;
    v10 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]_block_invoke";
    v11 = 1024;
    v12 = objc_msgSend(v3, "BOOLValue");
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING isStoreCompatible to %u", (uint8_t *)&v5, 0x22u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");
}

- (NSPersistentStoreCoordinator)persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (NSXPCStoreServer)xpcStoreServer
{
  return self->_xpcStoreServer;
}

- (void)setXpcStoreServer:(id)a3
{
  objc_storeStrong((id *)&self->_xpcStoreServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcStoreServer, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistenceCoordinator, 0);
}

@end
