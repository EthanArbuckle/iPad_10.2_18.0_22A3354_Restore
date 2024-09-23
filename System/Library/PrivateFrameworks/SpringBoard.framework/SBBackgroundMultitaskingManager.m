@implementation SBBackgroundMultitaskingManager

- (void)_appProcessStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_appToBackgroundTasks;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "visibility") == 2)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_appToBackgroundTasks = self->_lock_appToBackgroundTasks;
    objc_msgSend(v4, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](lock_appToBackgroundTasks, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    os_unfair_lock_unlock(p_lock);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[SBBackgroundFetchTask finishWithResult:](*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), 5uLL);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_57 != -1)
    dispatch_once(&sharedInstance_onceToken_57, &__block_literal_global_398);
  return (id)sharedInstance___sharedInstance_28;
}

uint64_t __49__SBBackgroundMultitaskingManager_sharedInstance__block_invoke()
{
  SBBackgroundMultitaskingManager *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBBackgroundMultitaskingManager);
  v1 = (void *)sharedInstance___sharedInstance_28;
  sharedInstance___sharedInstance_28 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBBackgroundMultitaskingManager)init
{
  SBBackgroundMultitaskingManager *v2;
  SBBackgroundMultitaskingManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *lock_appToBackgroundTasks;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBBackgroundMultitaskingManager;
  v2 = -[SBBackgroundMultitaskingManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_appToBackgroundTasks = v3->_lock_appToBackgroundTasks;
    v3->_lock_appToBackgroundTasks = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__appProcessStateDidChange_, CFSTR("SBApplicationProcessStateDidChange"), 0);

  }
  return v3;
}

- (void)_backgroundTaskFinished:(id)a3 forAppInfo:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  NSMutableDictionary *lock_appToBackgroundTasks;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a4;
  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_appToBackgroundTasks = self->_lock_appToBackgroundTasks;
  objc_msgSend(v13, "processIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](lock_appToBackgroundTasks, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeObjectIdenticalTo:", v7);
  if (!objc_msgSend(v10, "count"))
  {
    v11 = self->_lock_appToBackgroundTasks;
    objc_msgSend(v13, "processIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)_createBackgroundFetchTaskForAppInfo:(id)a3
{
  id v4;
  SBBackgroundFetchTask *v5;
  id v6;
  id *v7;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_appToBackgroundTasks;
  void *v10;
  id v11;
  NSMutableDictionary *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  SBBackgroundMultitaskingManager *v19;
  id v20;

  v4 = a3;
  v5 = [SBBackgroundFetchTask alloc];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72__SBBackgroundMultitaskingManager__createBackgroundFetchTaskForAppInfo___block_invoke;
  v18 = &unk_1E8EC0C90;
  v19 = self;
  v6 = v4;
  v20 = v6;
  v7 = -[SBBackgroundFetchTask initForAppInfo:withCompletion:]((id *)&v5->super.isa, v6, &v15);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_appToBackgroundTasks = self->_lock_appToBackgroundTasks;
  objc_msgSend(v6, "processIdentity", v15, v16, v17, v18, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](lock_appToBackgroundTasks, "objectForKey:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = self->_lock_appToBackgroundTasks;
    objc_msgSend(v6, "processIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v13);

  }
  objc_msgSend(v11, "addObject:", v7);
  os_unfair_lock_unlock(p_lock);

  return v7;
}

uint64_t __72__SBBackgroundMultitaskingManager__createBackgroundFetchTaskForAppInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundTaskFinished:forAppInfo:", a2, *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_appToBackgroundTasks, 0);
}

@end
