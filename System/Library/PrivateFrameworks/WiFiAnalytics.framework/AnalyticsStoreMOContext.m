@implementation AnalyticsStoreMOContext

+ (id)sharedManagedObjectModel:(id)a3
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
  block[2] = __52__AnalyticsStoreMOContext_sharedManagedObjectModel___block_invoke;
  block[3] = &unk_24CDDCCF8;
  v11 = v3;
  v4 = qword_253D3A4E0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_253D3A4E0, block);
    v7 = v11;
  }
  v8 = (id)_MergedGlobals_6;

  return v8;
}

void __52__AnalyticsStoreMOContext_sharedManagedObjectModel___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136446722;
    v7 = "+[AnalyticsStoreMOContext sharedManagedObjectModel:]_block_invoke";
    v8 = 1024;
    v9 = 31;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NSManagedObjectModel doesn't exist yet for this process, alloc and init instance for URL: %@", (uint8_t *)&v6, 0x1Cu);

  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", *(_QWORD *)(a1 + 32));
  v5 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = v4;

}

- (AnalyticsStoreMOContext)initWithStoreDescriptor:(id)a3
{
  id v5;
  AnalyticsStoreMOContext *v6;
  AnalyticsStoreMOContext *v7;
  void *v8;
  NSObject *v9;
  AnalyticsPersistenceManager *v10;
  AnalyticsPersistenceManager *v11;
  const char *v13;
  NSObject *v14;
  AnalyticsPersistenceManager *persistenceManager;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AnalyticsStoreMOContext;
  v6 = -[AnalyticsStoreMOContext init](&v16, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_15;
  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[AnalyticsStoreMOContext initWithStoreDescriptor:]";
      v19 = 1024;
      v20 = 49;
      v13 = "%{public}s::%d:storeDescriptor is nil";
LABEL_10:
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
    }
LABEL_14:

LABEL_15:
    persistenceManager = v7->_persistenceManager;
    v7->_persistenceManager = 0;

    v9 = 0;
    v7 = 0;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_storeDescriptor, a3);
  objc_msgSend(v5, "modelURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreMOContext sharedManagedObjectModel:](AnalyticsStoreMOContext, "sharedManagedObjectModel:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[AnalyticsStoreMOContext initWithStoreDescriptor:]";
      v19 = 1024;
      v20 = 55;
      v13 = "%{public}s::%d:failed to create managedObjectModel";
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v7->_managedObjectModel, v9);
  v10 = -[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]([AnalyticsPersistenceManager alloc], "initWithManagedObjectModel:storeDescriptor:", v9, v7->_storeDescriptor);
  v11 = v7->_persistenceManager;
  v7->_persistenceManager = v10;

  if (!v7->_persistenceManager)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[AnalyticsStoreMOContext initWithStoreDescriptor:]";
      v19 = 1024;
      v20 = 60;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create persistence manager", buf, 0x12u);
    }

    goto LABEL_14;
  }
LABEL_5:

  return v7;
}

- (BOOL)storeNeedsImmediatePruning:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[AnalyticsStoreMOContext storeDescriptor](self, "storeDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v6, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 0;
  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[AnalyticsStoreMOContext storeNeedsImmediatePruning:]";
      v19 = 1024;
      v20 = 80;
      v21 = 2112;
      v22 = (unint64_t)v9;
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to get attributes for storeURL with error %@", buf, 0x1Cu);
    }

  }
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDD0D08]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongLongValue");
  if (v13 > a3)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "-[AnalyticsStoreMOContext storeNeedsImmediatePruning:]";
      v19 = 1024;
      v20 = 89;
      v21 = 2048;
      v22 = v13;
      v23 = 2048;
      v24 = a3;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Store size %llu bytes exceeds %llu bytes", buf, 0x26u);
    }

  }
  return v13 > a3;
}

- (AnalyticsPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (AnalyticsStoreDescriptor)storeDescriptor
{
  return self->_storeDescriptor;
}

- (void)setStoreDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_storeDescriptor, a3);
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (NSManagedObjectModel)sharedManagedObjectModel
{
  return self->_sharedManagedObjectModel;
}

- (void)setSharedManagedObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_sharedManagedObjectModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedManagedObjectModel, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_storeDescriptor, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

@end
