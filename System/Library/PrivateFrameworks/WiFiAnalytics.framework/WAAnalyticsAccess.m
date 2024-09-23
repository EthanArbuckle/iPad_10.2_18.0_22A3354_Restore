@implementation WAAnalyticsAccess

+ (id)sharedWAAnalyticsAccess
{
  if (qword_253D3A4F0 != -1)
    dispatch_once(&qword_253D3A4F0, &__block_literal_global_6);
  return (id)_MergedGlobals_7;
}

void __44__WAAnalyticsAccess_sharedWAAnalyticsAccess__block_invoke()
{
  NSObject *v0;
  WAAnalyticsAccess *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "+[WAAnalyticsAccess sharedWAAnalyticsAccess]_block_invoke";
    v5 = 1024;
    v6 = 65;
    _os_log_impl(&dword_212581000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sharedWAAnalyticsAccess doesn't exist yet for this process, alloc and init instance", (uint8_t *)&v3, 0x12u);
  }

  v1 = objc_alloc_init(WAAnalyticsAccess);
  v2 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v1;

}

+ (void)initialize
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)registry;
  registry = (uint64_t)v2;

}

+ (id)accessWithOptions:(unint64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  id v6;
  WAAnalyticsAccess *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if ((a3 & 1) != 0)
    {
      v5 = CFSTR("WAAccessReadOnly");
    }
    else
    {
      WALogCategoryDefaultHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v10 = 136446722;
        v11 = "+[WAAnalyticsAccess accessWithOptions:]";
        v12 = 1024;
        v13 = 90;
        v14 = 2048;
        v15 = a3;
        _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unhandled options %lu", (uint8_t *)&v10, 0x1Cu);
      }

      v5 = 0;
    }
  }
  else
  {
    v5 = CFSTR("WAAccessReadWrite");
  }
  v6 = (id)registry;
  objc_sync_enter(v6);
  objc_msgSend((id)registry, "objectForKey:", v5);
  v7 = (WAAnalyticsAccess *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[WAAnalyticsAccess initWithOptions:]([WAAnalyticsAccess alloc], "initWithOptions:", a3);
    objc_msgSend((id)registry, "setObject:forKey:", v7, v5);
  }
  objc_sync_exit(v6);

  v8 = (void *)-[WAAnalyticsAccess copy](v7, "copy");
  return v8;
}

- (WAAnalyticsAccess)initWithOptions:(unint64_t)a3
{
  WAAnalyticsAccess *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WAAnalyticsAccess;
  result = -[WAAnalyticsAccess init](&v5, sel_init);
  if (result)
    result->_options = a3;
  return result;
}

- (NSManagedObjectContext)mainObjectContext
{
  return -[AnalyticsStoreMOHandler managedObjectContext](self->__moHandler, "managedObjectContext");
}

- (void)reset
{
  id v2;

  -[WAAnalyticsAccess mainObjectContext](self, "mainObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (BOOL)save
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[WAAnalyticsAccess persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAAnalyticsAccess mainObjectContext](self, "mainObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasChanges");

    if (!v5)
      return 1;
    -[WAAnalyticsAccess mainObjectContext](self, "mainObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = objc_msgSend(v6, "save:", &v10);

    if ((v7 & 1) != 0)
      return 1;
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[WAAnalyticsAccess save]";
      v13 = 1024;
      v14 = 164;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error saving moc", buf, 0x12u);
    }

  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WAAnalyticsAccess *v4;
  uint64_t v5;
  AnalyticsStoreMOHandler *moHandler;
  uint64_t v7;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSObject *v9;
  unint64_t options;
  _BOOL4 v11;
  _BOOL4 v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(WAAnalyticsAccess);
  v4->_options = -[WAAnalyticsAccess options](self, "options");
  +[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist](AnalyticsStoreMOHandler, "sharedAnalyticsStoreMOHandlerWithPersist");
  v5 = objc_claimAutoreleasedReturnValue();
  moHandler = v4->__moHandler;
  v4->__moHandler = (AnalyticsStoreMOHandler *)v5;

  -[WAAnalyticsAccess persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v7 = objc_claimAutoreleasedReturnValue();
  persistentStoreCoordinator = v4->__persistentStoreCoordinator;
  v4->__persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v7;

  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    options = v4->_options;
    v11 = v4->__moHandler != 0;
    v12 = v4->__persistentStoreCoordinator != 0;
    v14 = 136447234;
    v15 = "-[WAAnalyticsAccess copyWithZone:]";
    v16 = 1024;
    v17 = 181;
    v18 = 2048;
    v19 = options;
    v20 = 1024;
    v21 = v11;
    v22 = 1024;
    v23 = v12;
    _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAAnalyticsAccess copyWithZone options = %lu, moHandler exists = %d, psc exists = %d", (uint8_t *)&v14, 0x28u);
  }

  return v4;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  NSObject *v3;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSObject *v5;
  void *v6;
  void *v7;
  NSPersistentStoreCoordinator *v8;
  NSPersistentStoreCoordinator *v9;
  NSError *persistentStoreError;
  NSPersistentStoreCoordinator *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((self->_options & 1) != 0)
  {
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136446466;
      v14 = "-[WAAnalyticsAccess persistentStoreCoordinator]";
      v15 = 1024;
      v16 = 190;
      _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Return no persistentStoreCoordinator for WAAccessReadOnly", (uint8_t *)&v13, 0x12u);
    }
    v11 = 0;
  }
  else
  {
    v3 = (id)registry;
    objc_sync_enter(v3);
    persistentStoreCoordinator = self->__persistentStoreCoordinator;
    if (!persistentStoreCoordinator)
    {
      WALogCategoryDefaultHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136446466;
        v14 = "-[WAAnalyticsAccess persistentStoreCoordinator]";
        v15 = 1024;
        v16 = 199;
        _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Copying persistenceCoordinator from AnalyticsStoreMOHandler", (uint8_t *)&v13, 0x12u);
      }

      +[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist](AnalyticsStoreMOHandler, "sharedAnalyticsStoreMOHandlerWithPersist");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "persistenceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistenceCoordinator");
      v8 = (NSPersistentStoreCoordinator *)objc_claimAutoreleasedReturnValue();
      v9 = self->__persistentStoreCoordinator;
      self->__persistentStoreCoordinator = v8;

      persistentStoreError = self->_persistentStoreError;
      self->_persistentStoreError = 0;

      persistentStoreCoordinator = self->__persistentStoreCoordinator;
    }
    v11 = persistentStoreCoordinator;
    objc_sync_exit(v3);
  }

  return v11;
}

- (AnalyticsStoreMOContext)storeMOContext
{
  return self->__storeMOContext;
}

- (AnalyticsStoreMOHandler)moHandler
{
  return self->__moHandler;
}

- (void)setMoHandler:(id)a3
{
  objc_storeStrong((id *)&self->__moHandler, a3);
}

- (NSError)persistentStoreError
{
  return self->_persistentStoreError;
}

- (void)setPersistentStoreError:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreError, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreError, 0);
  objc_storeStrong((id *)&self->__moHandler, 0);
  objc_storeStrong((id *)&self->__storeMOContext, 0);
  objc_storeStrong((id *)&self->__persistentStoreCoordinator, 0);
}

@end
