@implementation PCSLockManager

- (id)initManager
{
  PCSLockManager *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t v5;
  NSHashTable *holders;
  os_log_t v7;
  OS_os_log *log;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PCSLockManager;
  v2 = -[PCSLockManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    holders = v2->_holders;
    v2->_holders = (NSHashTable *)v5;

    v7 = os_log_create("com.apple.ProtectedCloudStorage", "lockassertion");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

  }
  return v2;
}

+ (id)manager
{
  if (manager_onceToken != -1)
    dispatch_once(&manager_onceToken, &__block_literal_global_8);
  return (id)manager_manager;
}

void __25__PCSLockManager_manager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PCSLockManager initManager]([PCSLockManager alloc], "initManager");
  v1 = (void *)manager_manager;
  manager_manager = (uint64_t)v0;

}

+ (BOOL)holdAssertion
{
  return aks_assert_hold(0, 0, 0x1EuLL) == 0;
}

+ (void)dropAssertion
{
  aks_assert_drop(0, 0);
}

- (id)lockAssertion:(id)a3
{
  id v4;
  id v5;
  PCSLockManager *v6;

  v4 = a3;
  v5 = -[PCSLockAssertion initAssertion:manager:]([PCSLockAssertion alloc], "initAssertion:manager:", v4, self);
  v6 = self;
  objc_sync_enter(v6);
  -[NSHashTable addObject:](v6->_observers, "addObject:", v5);
  objc_sync_exit(v6);

  return v5;
}

- (void)removeAssertion:(id)a3
{
  PCSLockManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  -[PCSLockManager _onlockDropAssertion:](v4, "_onlockDropAssertion:", v5);
  objc_sync_exit(v4);

}

- (BOOL)holdAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  PCSLockManager *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  BOOL v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PCSLockManager log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1A9508000, v5, OS_LOG_TYPE_DEFAULT, "assertion %{public}@ trying to hold lock assertion", (uint8_t *)&v13, 0xCu);

  }
  v7 = self;
  objc_sync_enter(v7);
  if (-[NSHashTable count](v7->_holders, "count")
    && !+[PCSLockManager holdAssertion](PCSLockManager, "holdAssertion"))
  {
    v11 = 0;
  }
  else
  {
    -[PCSLockManager log](v7, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[NSHashTable count](v7->_holders, "count");
      v10 = " though piggyback";
      if (!v9)
        v10 = "";
      v13 = 136315138;
      v14 = v10;
      _os_log_impl(&dword_1A9508000, v8, OS_LOG_TYPE_DEFAULT, "Got lock assertion%s", (uint8_t *)&v13, 0xCu);
    }

    -[NSHashTable addObject:](v7->_holders, "addObject:", v4);
    v11 = 1;
  }
  objc_sync_exit(v7);

  return v11;
}

- (void)_onlockDropAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PCSLockManager log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1A9508000, v5, OS_LOG_TYPE_DEFAULT, "assertion %{public}@ dropping lock assertion", (uint8_t *)&v8, 0xCu);

  }
  -[NSHashTable removeObject:](self->_holders, "removeObject:", v4);
  if (!-[NSHashTable count](self->_holders, "count"))
  {
    +[PCSLockManager dropAssertion](PCSLockManager, "dropAssertion");
    -[PCSLockManager log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "dropped lock assertion", (uint8_t *)&v8, 2u);
    }

  }
}

- (void)dropAssertion:(id)a3
{
  PCSLockManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[PCSLockManager _onlockDropAssertion:](v4, "_onlockDropAssertion:", v5);
  objc_sync_exit(v4);

}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSHashTable)holders
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHolders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_holders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
