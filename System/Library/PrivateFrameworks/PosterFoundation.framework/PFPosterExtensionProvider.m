@implementation PFPosterExtensionProvider

+ (id)extensionKitQuery
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC79E8]), "initWithExtensionPointIdentifier:", CFSTR("com.apple.posterkit.provider"));
}

- (PFPosterExtensionProvider)init
{
  return -[PFPosterExtensionProvider initWithDefaultInstanceIdentifier:](self, "initWithDefaultInstanceIdentifier:", 0);
}

- (PFPosterExtensionProvider)initWithDefaultInstanceIdentifier:(id)a3
{
  id v4;
  PFPosterExtensionProvider *v5;
  void *v6;
  PFPosterExtensionInstanceProvider *v7;
  PFPosterExtensionInstanceProvider *instanceProvider;
  uint64_t v9;
  NSPredicate *lock_predicate;
  uint64_t v11;
  NSSet *lock_supportedRoles;
  uint64_t v13;
  NSHashTable *lock_observers;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  PFPosterExtensionProvider *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PFPosterExtensionProvider;
  v5 = -[PFPosterExtensionProvider init](&v17, sel_init);
  if (v5)
  {
    +[PFWorkloop serialQueueTargetingSharedWorkloop:](PFWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.PosterFoundation.extensionProvider.observerQueue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFPosterExtensionProvider setObserverQueue:](v5, "setObserverQueue:", v6);

    v7 = -[PFPosterExtensionInstanceProvider initWithDefaultInstanceIdentifier:]([PFPosterExtensionInstanceProvider alloc], "initWithDefaultInstanceIdentifier:", v4);
    instanceProvider = v5->_instanceProvider;
    v5->_instanceProvider = v7;

    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    lock_predicate = v5->_lock_predicate;
    v5->_lock_predicate = (NSPredicate *)v9;

    PFPosterRolesSupportedForCurrentDeviceClass();
    v11 = objc_claimAutoreleasedReturnValue();
    lock_supportedRoles = v5->_lock_supportedRoles;
    v5->_lock_supportedRoles = (NSSet *)v11;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    lock_observers = v5->_lock_observers;
    v5->_lock_observers = (NSHashTable *)v13;

    PFLogExtensions();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v5;
      _os_log_impl(&dword_24462A000, v15, OS_LOG_TYPE_DEFAULT, "(%p) init", buf, 0xCu);
    }

  }
  return v5;
}

- (NSUUID)defaultInstanceIdentifier
{
  return -[PFPosterExtensionInstanceProvider defaultInstanceIdentifier](self->_instanceProvider, "defaultInstanceIdentifier");
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  int v5;
  PFPosterExtensionProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PFLogExtensions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_24462A000, v4, OS_LOG_TYPE_DEFAULT, "(%p) cancel", (uint8_t *)&v5, 0xCu);
  }

  -[PFPosterExtensionProvider _lock_executeCancellationAndRestartIfAlreadyStarted:](self, "_lock_executeCancellationAndRestartIfAlreadyStarted:", 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)start
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  int v5;
  PFPosterExtensionProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PFLogExtensions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_24462A000, v4, OS_LOG_TYPE_DEFAULT, "(%p) start", (uint8_t *)&v5, 0xCu);
  }

  -[PFPosterExtensionProvider _lock_start](self, "_lock_start");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)reloadExtensions
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  BOOL v5;
  int v7;
  PFPosterExtensionProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PFLogExtensions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_24462A000, v4, OS_LOG_TYPE_DEFAULT, "(%p) reloadExtensions", (uint8_t *)&v7, 0xCu);
  }

  v5 = -[PFPosterExtensionProvider _lock_updateExtensions](self, "_lock_updateExtensions");
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSArray)knownPosterExtensions
{
  void *v2;
  void *v3;
  void *v4;

  -[PFPosterExtensionProvider extensionForIdentifier](self, "extensionForIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __50__PFPosterExtensionProvider_knownPosterExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "posterExtensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterExtensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)hasPosterExtensions
{
  os_unfair_lock_s *p_lock;
  NSUInteger v4;
  NSObject *v5;
  int v7;
  PFPosterExtensionProvider *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSDictionary count](self->_lock_extensionByProvider, "count");
  os_unfair_lock_unlock(p_lock);
  PFLogExtensions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = self;
    v9 = 1024;
    v10 = v4 != 0;
    _os_log_impl(&dword_24462A000, v5, OS_LOG_TYPE_DEFAULT, "(%p) hasPosterExtensions:%{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  return v4 != 0;
}

- (NSDictionary)extensionForIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_lock_extensionByProvider, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSSet)supportedRoles
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSSet copy](self->_lock_supportedRoles, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)setSupportedRoles:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *lock_supportedRoles;
  NSPredicate *lock_rolePredicate;
  NSObject *v8;
  int v9;
  PFPosterExtensionProvider *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    PFPosterRolesSupportedForCurrentDeviceClass();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock(&self->_lock);
  if ((-[NSSet isEqual:](self->_lock_supportedRoles, "isEqual:", v4) & 1) == 0)
  {
    v5 = (NSSet *)objc_msgSend(v4, "copy");
    lock_supportedRoles = self->_lock_supportedRoles;
    self->_lock_supportedRoles = v5;

    lock_rolePredicate = self->_lock_rolePredicate;
    self->_lock_rolePredicate = 0;

    PFLogExtensions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218242;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_24462A000, v8, OS_LOG_TYPE_DEFAULT, "(%p) updating supported roles:%{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (self->_lock_started)
    {
      -[PFPosterExtensionProvider _lock_teardownQueryController](self, "_lock_teardownQueryController");
      self->_lock_started = 0;
      -[PFPosterExtensionProvider _lock_start](self, "_lock_start");
    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setPredicate:(id)a3
{
  NSPredicate *v4;
  NSObject *v5;
  NSPredicate *lock_predicate;
  NSPredicate *v7;
  int v8;
  PFPosterExtensionProvider *v9;
  __int16 v10;
  NSPredicate *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (NSPredicate *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
    v4 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock(&self->_lock);
  PFLogExtensions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_24462A000, v5, OS_LOG_TYPE_DEFAULT, "(%p) updating predicate:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  if (self->_lock_started)
  {
    -[PFPosterExtensionProvider _lock_executeCancellationAndRestartIfAlreadyStarted:](self, "_lock_executeCancellationAndRestartIfAlreadyStarted:", 0);
    self->_lock_started = 0;
    lock_predicate = self->_lock_predicate;
    self->_lock_predicate = v4;

    -[PFPosterExtensionProvider _lock_start](self, "_lock_start");
  }
  else
  {
    v7 = self->_lock_predicate;
    self->_lock_predicate = v4;

  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSPredicate)predicate
{
  os_unfair_lock_s *p_lock;
  NSPredicate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_predicate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)defaultInstanceOfProvider:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("providerId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterExtensionProvider defaultInstanceOfProvider:error:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24462E5BCLL);
  }
  v8 = v7;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary objectForKey:](self->_lock_extensionByProvider, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    -[PFPosterExtensionProvider instanceProvider](self, "instanceProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acquireInstanceForExtension:reason:error:", v9, 0, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v16[0] = *MEMORY[0x24BDD0FD8];
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("providerId");
    v17[0] = v12;
    v17[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pf_errorWithCode:userInfo:", 3, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)acquireInstanceForExtensionWithIdentifier:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  -[PFPosterExtensionProvider extensionForIdentifier](self, "extensionForIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFPosterExtensionProvider instanceProvider](self, "instanceProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "acquireInstanceForExtension:reason:error:", v11, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)relinquishExtensionInstanceWithIdentifier:(id)a3 reason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a3;
  -[PFPosterExtensionProvider extensionForIdentifier](self, "extensionForIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFPosterExtensionProvider instanceProvider](self, "instanceProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "instanceForExtension:reason:", v8, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PFPosterExtensionProvider instanceProvider](self, "instanceProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "relinquishExtensionInstance:reason:", v10, v12);

  }
}

- (void)_lock_executeQuery
{
  void *v3;
  id v4;

  if (self->_lock_started)
  {
    objc_msgSend(MEMORY[0x24BDC79F0], "executeQueries:", self->_lock_queries);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFPosterExtensionProvider _lock_updateExtensions:](self, "_lock_updateExtensions:", v3);

  }
}

- (void)_lock_start
{
  NSObject *v3;
  void *v4;
  NSArray *v5;
  NSArray *lock_queries;
  _EXQueryController *v7;
  _EXQueryController *lock_queryController;
  void *v9;
  uint8_t buf[4];
  PFPosterExtensionProvider *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!self->_lock_started)
  {
    PFLogExtensions();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = self;
      _os_log_impl(&dword_24462A000, v3, OS_LOG_TYPE_DEFAULT, "(%p) start", buf, 0xCu);
    }

    if (!self->_lock_queries)
    {
      -[PFPosterExtensionProvider _lock_buildQuery](self, "_lock_buildQuery");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      lock_queries = self->_lock_queries;
      self->_lock_queries = v5;

    }
    if (!self->_lock_queryController)
    {
      v7 = (_EXQueryController *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79F0]), "initWithQueries:delegate:", self->_lock_queries, self);
      lock_queryController = self->_lock_queryController;
      self->_lock_queryController = v7;

      -[_EXQueryController setDelegate:](self->_lock_queryController, "setDelegate:", self);
      -[_EXQueryController resume](self->_lock_queryController, "resume");
    }
    self->_lock_started = 1;
  }
  -[PFPosterExtensionProvider _lock_executeQuery](self, "_lock_executeQuery");
}

- (id)_lock_buildQuery
{
  void *v3;
  void *v4;
  NSSet *v5;
  void *v6;
  NSSet *v7;
  NSPredicate *v8;
  NSPredicate *lock_rolePredicate;
  void *v10;
  _QWORD v12[4];
  NSSet *v13;

  objc_msgSend((id)objc_opt_class(), "extensionKitQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "bs_safeAddObject:", self->_lock_predicate);
  if (!self->_lock_rolePredicate)
  {
    v5 = self->_lock_supportedRoles;
    v6 = (void *)MEMORY[0x24BDD1758];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __45__PFPosterExtensionProvider__lock_buildQuery__block_invoke;
    v12[3] = &unk_251543A48;
    v13 = v5;
    v7 = v5;
    objc_msgSend(v6, "predicateWithBlock:", v12);
    v8 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    lock_rolePredicate = self->_lock_rolePredicate;
    self->_lock_rolePredicate = v8;

    objc_msgSend(v4, "addObject:", self->_lock_rolePredicate);
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v3, "setPredicate:", v10);

  return v3;
}

uint64_t __45__PFPosterExtensionProvider__lock_buildQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "applicationExtensionRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x24BDBD288];
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:ofClass:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "pf_supportedRoles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "applicationExtensionRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PFRoleProviderForLSApplicationExtensionRecord(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pf_supportedRoles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = objc_msgSend(*(id *)(a1 + 32), "intersectsSet:", v9);

  return v12;
}

- (void)_lock_teardownQueryController
{
  NSObject *v3;
  NSArray *lock_queries;
  _EXQueryController *lock_queryController;
  int v6;
  PFPosterExtensionProvider *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PFLogExtensions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_24462A000, v3, OS_LOG_TYPE_DEFAULT, "(%p) teardownQueryController", (uint8_t *)&v6, 0xCu);
  }

  lock_queries = self->_lock_queries;
  self->_lock_queries = 0;

  -[_EXQueryController setDelegate:](self->_lock_queryController, "setDelegate:", 0);
  -[_EXQueryController suspend](self->_lock_queryController, "suspend");
  lock_queryController = self->_lock_queryController;
  self->_lock_queryController = 0;

}

- (void)_lock_executeCancellationAndRestartIfAlreadyStarted:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 lock_started;
  int v7;
  PFPosterExtensionProvider *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  PFLogExtensions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = self;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_24462A000, v5, OS_LOG_TYPE_DEFAULT, "(%p) _lock_executeCancellationAndRestartIfAlreadyStarted:%{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  -[PFPosterExtensionProvider _lock_teardownQueryController](self, "_lock_teardownQueryController");
  lock_started = self->_lock_started;
  self->_lock_started = 0;
  if (lock_started && v3)
    -[PFPosterExtensionProvider _lock_start](self, "_lock_start");
  -[PFPosterExtensionInstanceProvider cancel](self->_instanceProvider, "cancel");
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  _EXQueryController *v6;
  id v7;
  _EXQueryController *lock_queryController;
  NSObject *v9;
  NSObject *v10;
  _EXQueryController *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  PFPosterExtensionProvider *v17;
  __int16 v18;
  _EXQueryController *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _EXQueryController *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (_EXQueryController *)a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_queryController = self->_lock_queryController;
  PFLogExtensions();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (lock_queryController == v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134218498;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_24462A000, v10, OS_LOG_TYPE_DEFAULT, "(%p) queryControllerDidUpdate:%@ resultDifference:%@", (uint8_t *)&v16, 0x20u);
    }

    v12 = (void *)MEMORY[0x24BDBCF20];
    -[_EXQueryController extensionIdentities](v6, "extensionIdentities");
    v13 = objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v13)
      v14 = v13;
    else
      v14 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v12, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFPosterExtensionProvider _lock_updateExtensions:](self, "_lock_updateExtensions:", v15);

  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = self->_lock_queryController;
    v16 = 134218754;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v11;
    _os_log_error_impl(&dword_24462A000, v10, OS_LOG_TYPE_ERROR, "(%p) ignoring imposter queryControllerDidUpdate:%@ resultDifference:%@ - My controller is %@", (uint8_t *)&v16, 0x2Au);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_lock_updateExtensions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v11;
  PFPosterExtensionProvider *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDC79F0];
  -[PFPosterExtensionProvider _lock_buildQuery](self, "_lock_buildQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PFPosterExtensionProvider _lock_updateExtensions:](self, "_lock_updateExtensions:", v7);

  PFLogExtensions();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218240;
    v12 = self;
    v13 = 1024;
    v14 = v8;
    _os_log_impl(&dword_24462A000, v9, OS_LOG_TYPE_DEFAULT, "(%p) didUpdateExtensions:%{BOOL}u", (uint8_t *)&v11, 0x12u);
  }

  return v8;
}

- (BOOL)_lock_updateExtensions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  _BOOL4 v36;
  char v37;
  void *v38;
  NSDictionary *v39;
  NSDictionary *lock_extensionByProvider;
  NSObject *v41;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  NSObject *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  PFPosterExtensionProvider *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)-[NSDictionary copy](self->_lock_extensionByProvider, "copy");
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v45 = v6;
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v54 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v12, "identity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v9);
    }

    v14 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v45, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v44 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v43 = v4;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v50;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v20);
          if (!-[NSPredicate evaluateWithObject:](self->_lock_predicate, "evaluateWithObject:", v21, v43))
          {
            PFLogExtensions();
            v23 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              goto LABEL_29;
            *(_DWORD *)buf = 134218242;
            v58 = self;
            v59 = 2112;
            v60 = v21;
            v27 = v23;
            v28 = "(%p) Predicate rejected extension identity %@";
LABEL_26:
            _os_log_impl(&dword_24462A000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
            goto LABEL_29;
          }
          v22 = -[NSPredicate evaluateWithObject:](self->_lock_rolePredicate, "evaluateWithObject:", v21);
          PFLogExtensions();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (!v22)
          {
            if (!v24)
              goto LABEL_29;
            *(_DWORD *)buf = 134218242;
            v58 = self;
            v59 = 2112;
            v60 = v21;
            v27 = v23;
            v28 = "(%p) Role Predicate rejected extension identity %@";
            goto LABEL_26;
          }
          if (v24)
          {
            *(_DWORD *)buf = 134218242;
            v58 = self;
            v59 = 2112;
            v60 = v21;
            _os_log_impl(&dword_24462A000, v23, OS_LOG_TYPE_DEFAULT, "(%p) Examining extension identity %@", buf, 0x16u);
          }

          objc_msgSend(v5, "objectForKey:", v21);
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v23 = v25;
            PFLogExtensions();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v58 = self;
              v59 = 2112;
              v60 = v21;
              _os_log_impl(&dword_24462A000, v26, OS_LOG_TYPE_DEFAULT, "(%p) Extension identity %@ already tracked", buf, 0x16u);
            }

LABEL_28:
            objc_msgSend(v46, "addObject:", v23);
            goto LABEL_29;
          }
          +[PFPosterExtension extensionWithIdentity:](PFPosterExtension, "extensionWithIdentity:", v21);
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
            goto LABEL_28;
          PFLogExtensions();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v58 = self;
            v59 = 2112;
            v60 = v21;
            _os_log_impl(&dword_24462A000, v29, OS_LOG_TYPE_DEFAULT, "(%p) Failed to add new extension wrapper: %@; PFPosterExtension unable to create extension",
              buf,
              0x16u);
          }

          PFLogExtensions();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v58 = self;
            v59 = 2112;
            v60 = v21;
            _os_log_error_impl(&dword_24462A000, v23, OS_LOG_TYPE_ERROR, "(%p) Extension identity %@ could not be used to create a PFPosterExtension. Bailing.", buf, 0x16u);
          }
LABEL_29:

          ++v20;
        }
        while (v18 != v20);
        v30 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        v18 = v30;
      }
      while (v30);
    }

    v31 = (void *)objc_msgSend(v46, "copy");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v44;
    v34 = -[NSObject isEqual:](v44, "isEqual:", v32);
    PFLogExtensions();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v36)
      {
        *(_DWORD *)buf = 134217984;
        v58 = self;
        _os_log_impl(&dword_24462A000, v35, OS_LOG_TYPE_DEFAULT, "(%p) Extension update received; no updates found.",
          buf,
          0xCu);
      }
      v4 = v43;
    }
    else
    {
      if (v36)
      {
        *(_DWORD *)buf = 134217984;
        v58 = self;
        _os_log_impl(&dword_24462A000, v35, OS_LOG_TYPE_DEFAULT, "(%p) Extension update received; pushing out updates",
          buf,
          0xCu);
      }

      v38 = (void *)objc_opt_new();
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __52__PFPosterExtensionProvider__lock_updateExtensions___block_invoke;
      v47[3] = &unk_251543A70;
      v35 = v38;
      v48 = v35;
      objc_msgSend(v31, "enumerateObjectsUsingBlock:", v47);
      v39 = -[NSObject copy](v35, "copy");
      lock_extensionByProvider = self->_lock_extensionByProvider;
      self->_lock_extensionByProvider = v39;

      -[PFPosterExtensionProvider _lock_notifyDataStoreOfUpdatedExtensions:fromExtensions:](self, "_lock_notifyDataStoreOfUpdatedExtensions:fromExtensions:", v32, v44);
      PFLogExtensions();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v58 = self;
        _os_log_impl(&dword_24462A000, v41, OS_LOG_TYPE_DEFAULT, "(%p) Extension update complete", buf, 0xCu);
      }

      v4 = v43;
      v33 = v44;
    }

    v37 = v34 ^ 1;
  }
  else
  {
    PFLogExtensions();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v58 = self;
      _os_log_impl(&dword_24462A000, v33, OS_LOG_TYPE_DEFAULT, "(%p) Rejecting updateExtensions; no extensions received.",
        buf,
        0xCu);
    }
    v37 = 0;
  }

  return v37;
}

void __52__PFPosterExtensionProvider__lock_updateExtensions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "posterExtensionBundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (void)_lock_notifyDataStoreOfUpdatedExtensions:(id)a3 fromExtensions:(id)a4
{
  id v6;
  NSObject *v7;
  NSHashTable *v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSHashTable *v19;
  NSObject *log;
  id v21;
  _QWORD block[6];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  PFPosterExtensionProvider *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21 = a4;
  PFLogExtensions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v31 = self;
    v32 = 2048;
    v33 = objc_msgSend(v6, "count");
    v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_24462A000, v7, OS_LOG_TYPE_DEFAULT, "(%p) Extensions updated; Received %lu extensions: %@",
      buf,
      0x20u);
  }

  v8 = self->_lock_observers;
  v9 = -[NSHashTable count](v8, "count");
  PFLogExtensions();
  log = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134218242;
      v31 = self;
      v32 = 2112;
      v33 = (uint64_t)v6;
      _os_log_impl(&dword_24462A000, log, OS_LOG_TYPE_DEFAULT, "(%p) Notifying delegate of updated Poster Extensions %@", buf, 0x16u);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    log = v8;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v19 = v8;
      v13 = *(_QWORD *)v26;
      v14 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(log);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[PFPosterExtensionProvider observerQueue](self, "observerQueue");
          v17 = objc_claimAutoreleasedReturnValue();
          block[0] = v14;
          block[1] = 3221225472;
          block[2] = __85__PFPosterExtensionProvider__lock_notifyDataStoreOfUpdatedExtensions_fromExtensions___block_invoke;
          block[3] = &unk_251543AB8;
          block[4] = v16;
          block[5] = self;
          v23 = v6;
          v24 = v21;
          dispatch_async(v17, block);

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
      v8 = v19;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 134218242;
    v31 = self;
    v32 = 2112;
    v33 = (uint64_t)v6;
    _os_log_impl(&dword_24462A000, log, OS_LOG_TYPE_DEFAULT, "(%p) Observers were not set; Poster Extensions were updated: %@",
      buf,
      0x16u);
  }

  -[PFPosterExtensionProvider instanceProvider](self, "instanceProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "noteExtensionsWereUpdated:", v6);

}

uint64_t __85__PFPosterExtensionProvider__lock_notifyDataStoreOfUpdatedExtensions_fromExtensions___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "bs_array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_31);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "posterExtensionProvider:foundExtensions:", v3, v5);

  }
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "posterExtensionProvider:updatedExtensionsFrom:to:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  return result;
}

uint64_t __85__PFPosterExtensionProvider__lock_notifyDataStoreOfUpdatedExtensions_fromExtensions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "posterExtensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterExtensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setObserverQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PFPosterExtensionInstanceProvider)instanceProvider
{
  return self->_instanceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceProvider, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_lock_supportedRoles, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_rolePredicate, 0);
  objc_storeStrong((id *)&self->_lock_predicate, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_lock_extensionByProvider, 0);
  objc_storeStrong((id *)&self->_lock_queryController, 0);
  objc_storeStrong((id *)&self->_lock_queries, 0);
}

- (void)defaultInstanceOfProvider:(const char *)a1 error:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
