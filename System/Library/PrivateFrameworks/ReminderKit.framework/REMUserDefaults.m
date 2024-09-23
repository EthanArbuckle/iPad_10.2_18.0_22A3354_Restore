@implementation REMUserDefaults

void __37__REMUserDefaults_daemonUserDefaults__block_invoke()
{
  REMDaemonUserDefaults *v0;
  void *v1;

  v0 = -[REMDaemonUserDefaults initWithSuiteName:containerURL:]([REMDaemonUserDefaults alloc], "initWithSuiteName:containerURL:", CFSTR("com.apple.remindd"), 0);
  v1 = (void *)daemonUserDefaults_defaults;
  daemonUserDefaults_defaults = (uint64_t)v0;

}

+ (REMDaemonUserDefaults)daemonUserDefaults
{
  if (daemonUserDefaults_onceToken != -1)
    dispatch_once(&daemonUserDefaults_onceToken, &__block_literal_global_24);
  return (REMDaemonUserDefaults *)(id)daemonUserDefaults_defaults;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setShowRemindersAsOverdue_cached:(BOOL)a3
{
  self->_showRemindersAsOverdue_cached = a3;
}

- (REMUserDefaults)initWithSuiteName:(id)a3 containerURL:(id)a4
{
  id v6;
  id v7;
  REMUserDefaults *v8;
  uint64_t v9;
  NSString *suiteName;
  uint64_t v11;
  NSUserDefaults *userDefaults;
  NSObject *v13;
  NSString *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSUserDefaults *v22;
  uint64_t v23;
  NSUserDefaults *v24;
  NSString *v25;
  uint64_t v26;
  NSMutableDictionary *observers;
  objc_super v29;
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)REMUserDefaults;
  v8 = -[REMUserDefaults init](&v29, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    suiteName = v8->_suiteName;
    v8->_suiteName = (NSString *)v9;

    if (v7)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "_initWithSuiteName:container:", v8->_suiteName, v7);
      userDefaults = v8->_userDefaults;
      v8->_userDefaults = (NSUserDefaults *)v11;

      +[REMLog utility](REMLog, "utility");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = v8->_suiteName;
        *(_DWORD *)buf = 138412546;
        v31 = v14;
        v32 = 2112;
        v33 = v7;
        v15 = "REMUserDefaults created {suiteName: %@, container: %@}";
        v16 = v13;
        v17 = 22;
LABEL_10:
        _os_log_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v8->_suiteName);

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v8->_userDefaults;
        v8->_userDefaults = (NSUserDefaults *)v21;

        +[REMLog utility](REMLog, "utility");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v15 = "REMUserDefaults created {standardUserDefaults: true}";
          v16 = v13;
          v17 = 2;
          goto LABEL_10;
        }
      }
      else
      {
        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v8->_suiteName);
        v24 = v8->_userDefaults;
        v8->_userDefaults = (NSUserDefaults *)v23;

        +[REMLog utility](REMLog, "utility");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v25 = v8->_suiteName;
          *(_DWORD *)buf = 138412290;
          v31 = v25;
          v15 = "REMUserDefaults created {suiteName: %@}";
          v16 = v13;
          v17 = 12;
          goto LABEL_10;
        }
      }
    }

    v26 = objc_opt_new();
    observers = v8->_observers;
    v8->_observers = (NSMutableDictionary *)v26;

  }
  return v8;
}

- (id)_startObservingValuesForKey:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[REMUserDefaults _addObserverForKey:block:](self, "_addObserverForKey:block:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, v6, 0, 0);

  return v7;
}

- (id)_startStreamingValuesForKey:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[REMUserDefaults _addObserverForKey:block:](self, "_addObserverForKey:block:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, v6, 4, 0);

  return v7;
}

- (id)_addObserverForKey:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  REMUserDefaultsObserver *v11;

  v6 = a3;
  v7 = a4;
  -[REMUserDefaults observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 8);
    -[REMUserDefaults observers](self, "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

  }
  v11 = -[REMUserDefaultsObserver initWithUserDefaults:key:block:]([REMUserDefaultsObserver alloc], "initWithUserDefaults:key:block:", self, v6, v7);

  objc_msgSend(v9, "addObject:", v11);
  return v11;
}

- (void)_removeObserver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "userDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMUserDefaults observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "removeObject:", v9);
    if (!objc_msgSend(v6, "count"))
    {
      -[REMUserDefaults observers](self, "observers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v4);

      -[REMUserDefaults userDefaults](self, "userDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:forKeyPath:", self, v4);

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(void);
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[REMLog utility](REMLog, "utility");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[REMUserDefaults observeValueForKeyPath:ofObject:change:context:].cold.1((uint64_t)v8, v10);

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v9)
  {
    -[REMUserDefaults observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "block", (_QWORD)v20);
            v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v19[2]();

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v16);
      }

    }
  }

}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (BOOL)showRemindersAsOverdue_cached
{
  return self->_showRemindersAsOverdue_cached;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_suiteName, 0);
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:(NSObject *)a2 change:context:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_DEBUG, "REMUserDefaults KVO change observed {userDefaultsKey: %@}", (uint8_t *)&v2, 0xCu);
}

@end
