@implementation SBHSelectedApplicationDataSource

- (void)beginTrackingApplicationsWithBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSelectedApplicationDataSource();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Begin tracking %@", buf, 0xCu);
  }

  BSDispatchQueueAssertMain();
  v6 = -[NSMutableSet count](self->_trackedApplicationBundleIdentifiers, "count");
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  -[NSMutableSet allObjects](self->_trackedApplicationBundleIdentifiers, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsInArray:", v8);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        -[NSMutableSet addObject:](self->_trackedApplicationBundleIdentifiers, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13++), (_QWORD)v18);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[SBHSelectedApplicationDataSource addApplicationsForBundleIdentifiers:forcePlaceholders:](self, "addApplicationsForBundleIdentifiers:forcePlaceholders:", v9, 0);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:", self);

    -[SBHSelectedApplicationDataSource appInfoObserverAssertion](self, "appInfoObserverAssertion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend((id)objc_opt_class(), "homeScreenService");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addIconBadgeValueObserver:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBHSelectedApplicationDataSource setAppInfoObserverAssertion:](self, "setAppInfoObserverAssertion:", v17);
    }
  }

}

- (void)addApplicationsForBundleIdentifiers:(id)a3 forcePlaceholders:(BOOL)a4
{
  SBHSimpleApplication *v5;
  NSObject *v6;
  SBHSimpleApplication *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  SBHSimpleApplication *v14;
  SBHSimpleApplication *v15;
  SBHSimpleApplication *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  os_unfair_lock_t lock;
  SBHSimpleApplication *v34;
  _BOOL4 v35;
  void *obj;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  SBHSimpleApplication *v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v35 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v5 = (SBHSimpleApplication *)a3;
  SBLogSelectedApplicationDataSource();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v50 = v5;
    v51 = 1024;
    LODWORD(v52) = v35;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "Will add applications for %@, force placeholders: %{BOOL}u", buf, 0x12u);
  }

  BSDispatchQueueAssertMain();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = v5;
  v8 = -[SBHSimpleApplication countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  v34 = v7;
  if (v8)
  {
    v9 = v8;
    v38 = 0;
    v39 = 0;
    v37 = 0;
    v10 = *(_QWORD *)v45;
    v32 = 0;
    lock = &self->_installProgressBundleIdentifiersLock;
    v11 = v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v12);
        if (-[NSMutableSet containsObject:](self->_trackedApplicationBundleIdentifiers, "containsObject:", v13, v32))
        {
          v14 = [SBHSimpleApplication alloc];
          if (v11)
            v15 = -[SBHSimpleApplication initWithBundleIdentifier:forcePlaceholder:](v14, "initWithBundleIdentifier:forcePlaceholder:", v13, 1);
          else
            v15 = -[SBHSimpleApplication initWithBundleIdentifier:allowPlaceholder:](v14, "initWithBundleIdentifier:allowPlaceholder:", v13, 1);
          v16 = v15;
          -[SBHSimpleApplication setIconModelApplicationDataSource:](v15, "setIconModelApplicationDataSource:", self);
          SBLogSelectedApplicationDataSource();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v16;
            v51 = 2112;
            v52 = v13;
            _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "Got app %@ for %@", buf, 0x16u);
          }

          if (v16)
          {
            if (v11 || -[SBHSimpleApplication isPlaceholder](v16, "isPlaceholder"))
            {
              -[NSMutableDictionary objectForKey:](self->_applicationPlaceholders, "objectForKey:", v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v18)
              {
                SBLogSelectedApplicationDataSource();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1CFEF3000, v19, OS_LOG_TYPE_DEFAULT, "Setting app as placeholder", buf, 2u);
                }

                -[NSMutableDictionary setObject:forKey:](self->_applicationPlaceholders, "setObject:forKey:", v16, v13);
                v20 = v39;
                if (!v39)
                  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v39 = v20;
                objc_msgSend(v20, "addObject:", v16);
              }
              objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "installProgress");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                os_unfair_lock_lock(lock);
                -[SBHSelectedApplicationDataSource _lock_beginObservingInstallProgress:forBundleIdentifier:](self, "_lock_beginObservingInstallProgress:forBundleIdentifier:", v22, v13);
                os_unfair_lock_unlock(lock);
              }

              v11 = v35;
              v7 = v34;
            }
            else
            {
              -[NSMutableDictionary objectForKey:](self->_applications, "objectForKey:", v13);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSMutableDictionary setObject:forKey:](self->_applications, "setObject:forKey:", v16, v13);
              if (v23)
              {
                v24 = v37;
                if (!v37)
                {
                  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v37 = v24;
                }
              }
              else
              {
                v24 = v32;
                if (!v32)
                {
                  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v32 = v24;
                }
              }
              objc_msgSend(v24, "addObject:", v16, v32);
              -[NSMutableDictionary objectForKey:](self->_applicationPlaceholders, "objectForKey:", v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                -[NSMutableDictionary removeObjectForKey:](self->_applicationPlaceholders, "removeObjectForKey:", v13);
                v25 = v38;
                if (!v38)
                  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v38 = v25;
                objc_msgSend(v25, "addObject:", v21);
              }
            }

          }
        }
        ++v12;
      }
      while (v9 != v12);
      v26 = -[SBHSimpleApplication countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      v9 = v26;
    }
    while (v26);
  }
  else
  {
    v38 = 0;
    v39 = 0;
    v37 = 0;
    v32 = 0;
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (void *)-[NSHashTable copy](self->_observers, "copy");
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v31, "iconModelApplicationDataSource:applicationsAdded:", self, v32);
        if (v37 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v31, "iconModelApplicationDataSource:applicationsUpdated:", self, v37);
        if (v39 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v31, "iconModelApplicationDataSource:applicationPlaceholdersAdded:", self, v39);
        if (v38 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v31, "iconModelApplicationDataSource:applicationPlaceholdersRemoved:", self, v38);
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v28);
  }

}

- (void)setAppInfoObserverAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_appInfoObserverAssertion, a3);
}

- (BSInvalidatable)appInfoObserverAssertion
{
  return self->_appInfoObserverAssertion;
}

+ (id)homeScreenService
{
  if (homeScreenService_onceToken_0 != -1)
    dispatch_once(&homeScreenService_onceToken_0, &__block_literal_global_51);
  return (id)homeScreenService__homeScreenService_0;
}

- (SBHSelectedApplicationDataSource)init
{
  SBHSelectedApplicationDataSource *v2;
  NSMutableSet *v3;
  NSMutableSet *trackedApplicationBundleIdentifiers;
  NSMutableDictionary *v5;
  NSMutableDictionary *applications;
  NSMutableDictionary *v7;
  NSMutableDictionary *applicationPlaceholders;
  uint64_t v9;
  NSMapTable *installProgressBundleIdentifiers;
  NSMutableDictionary *v11;
  NSMutableDictionary *bundleIdentifierToInstallProgresses;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBHSelectedApplicationDataSource;
  v2 = -[SBHSelectedApplicationDataSource init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    trackedApplicationBundleIdentifiers = v2->_trackedApplicationBundleIdentifiers;
    v2->_trackedApplicationBundleIdentifiers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    applications = v2->_applications;
    v2->_applications = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    applicationPlaceholders = v2->_applicationPlaceholders;
    v2->_applicationPlaceholders = v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    installProgressBundleIdentifiers = v2->_installProgressBundleIdentifiers;
    v2->_installProgressBundleIdentifiers = (NSMapTable *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bundleIdentifierToInstallProgresses = v2->_bundleIdentifierToInstallProgresses;
    v2->_bundleIdentifierToInstallProgresses = v11;

    v2->_installProgressBundleIdentifiersLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)addIconModelApplicationDataSourceObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

void __53__SBHSelectedApplicationDataSource_homeScreenService__block_invoke()
{
  id v0;
  void *v1;

  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0DAAE90]);
    v1 = (void *)homeScreenService__homeScreenService_0;
    homeScreenService__homeScreenService_0 = (uint64_t)v0;

  }
}

- (void)dealloc
{
  os_unfair_lock_s *p_installProgressBundleIdentifiersLock;
  NSMapTable *v4;
  NSMapTable *installProgressBundleIdentifiers;
  NSMutableDictionary *bundleIdentifierToInstallProgresses;
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_installProgressBundleIdentifiersLock = &self->_installProgressBundleIdentifiersLock;
  os_unfair_lock_lock(&self->_installProgressBundleIdentifiersLock);
  v4 = self->_installProgressBundleIdentifiers;
  installProgressBundleIdentifiers = self->_installProgressBundleIdentifiers;
  self->_installProgressBundleIdentifiers = 0;

  bundleIdentifierToInstallProgresses = self->_bundleIdentifierToInstallProgresses;
  self->_bundleIdentifierToInstallProgresses = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[SBHSelectedApplicationDataSource _lock_endObservingInstallProgress:](self, "_lock_endObservingInstallProgress:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_installProgressBundleIdentifiersLock);
  -[BSInvalidatable invalidate](self->_appInfoObserverAssertion, "invalidate");
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:", self);

  v13.receiver = self;
  v13.super_class = (Class)SBHSelectedApplicationDataSource;
  -[SBHSelectedApplicationDataSource dealloc](&v13, sel_dealloc);
}

- (void)endTrackingApplicationsWithBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSelectedApplicationDataSource();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "End tracking %@", buf, 0xCu);
  }

  BSDispatchQueueAssertMain();
  v6 = -[NSMutableSet count](self->_trackedApplicationBundleIdentifiers, "count");
  -[SBHSelectedApplicationDataSource removeApplicationsForBundleIdentifiers:](self, "removeApplicationsForBundleIdentifiers:", v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[NSMutableSet removeObject:](self->_trackedApplicationBundleIdentifiers, "removeObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), (_QWORD)v14);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if (v6 && !-[NSMutableSet count](self->_trackedApplicationBundleIdentifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:", self);

    -[SBHSelectedApplicationDataSource appInfoObserverAssertion](self, "appInfoObserverAssertion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidate");

    -[SBHSelectedApplicationDataSource setAppInfoObserverAssertion:](self, "setAppInfoObserverAssertion:", 0);
  }

}

- (void)endTrackingAllApplications
{
  id v3;

  BSDispatchQueueAssertMain();
  -[NSMutableSet allObjects](self->_trackedApplicationBundleIdentifiers, "allObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHSelectedApplicationDataSource endTrackingApplicationsWithBundleIdentifiers:](self, "endTrackingApplicationsWithBundleIdentifiers:", v3);

}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_applications, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)applicationPlaceholderWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_applicationPlaceholders, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)uninstallApplicationWithBundleIdentifier:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 buf;
  void *v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  BSDispatchQueueAssertMain();
  if ((-[NSMutableSet containsObject:](self->_trackedApplicationBundleIdentifiers, "containsObject:", v8) & 1) != 0)
  {
    SBLogSelectedApplicationDataSource();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "Requesting uninstallation of %@", (uint8_t *)&buf, 0xCu);
    }

    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v11 = (void *)getIXUninstallOptionsClass_softClass;
    v23 = getIXUninstallOptionsClass_softClass;
    v12 = MEMORY[0x1E0C809B0];
    if (!getIXUninstallOptionsClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v25 = __getIXUninstallOptionsClass_block_invoke;
      v26 = &unk_1E8D85AF8;
      v27 = &v20;
      __getIXUninstallOptionsClass_block_invoke((uint64_t)&buf);
      v11 = (void *)v21[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v20, 8);
    v14 = objc_alloc_init(v13);
    objc_msgSend(v14, "setRequestUserConfirmation:", a4 & 1);
    objc_msgSend(v14, "setShowArchiveOption:", (a4 >> 1) & 1);
    objc_msgSend(v14, "setShowDemotionOption:", (a4 >> 2) & 1);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v15 = (void *)getIXAppInstallCoordinatorClass_softClass_0;
    v23 = getIXAppInstallCoordinatorClass_softClass_0;
    if (!getIXAppInstallCoordinatorClass_softClass_0)
    {
      *(_QWORD *)&buf = v12;
      *((_QWORD *)&buf + 1) = 3221225472;
      v25 = __getIXAppInstallCoordinatorClass_block_invoke_0;
      v26 = &unk_1E8D85AF8;
      v27 = &v20;
      __getIXAppInstallCoordinatorClass_block_invoke_0((uint64_t)&buf);
      v15 = (void *)v21[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v20, 8);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __96__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke;
    v17[3] = &unk_1E8D8AD40;
    v18 = v8;
    v19 = v9;
    objc_msgSend(v16, "uninstallAppWithBundleID:options:completion:", v18, v14, v17);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 3, 0);
  }

}

void __96__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v5 = v4;
  BSDispatchMain();

}

uint64_t __96__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  SBLogSelectedApplicationDataSource();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "Install coordinator reported an error for uninstallation of %@: %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
  else if (v4)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "Install coordinator reported success for uninstallation of %@", (uint8_t *)&v11, 0xCu);
  }

  if (*(_QWORD *)(a1 + 32) || (v8 = *(_QWORD *)(a1 + 56), v8 > 4))
    v9 = 3;
  else
    v9 = qword_1D0192FD0[v8];
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v9);
  return result;
}

- (void)removeApplicationsForBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSelectedApplicationDataSource();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Will remove applications for %@", buf, 0xCu);
  }

  BSDispatchQueueAssertMain();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_applications, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (!v9)
            v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v9, "addObject:", v13);
          SBLogSelectedApplicationDataSource();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v13;
            _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEFAULT, "Found non-placeholder app to remove: %@", buf, 0xCu);
          }

        }
        -[NSMutableDictionary objectForKey:](self->_applicationPlaceholders, "objectForKey:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v8, "addObject:", v15);
          SBLogSelectedApplicationDataSource();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v15;
            _os_log_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_DEFAULT, "Found placeholder app to remove: %@", buf, 0xCu);
          }

        }
        -[NSMutableDictionary removeObjectForKey:](self->_applications, "removeObjectForKey:", v12);
        -[NSMutableDictionary removeObjectForKey:](self->_applicationPlaceholders, "removeObjectForKey:", v12);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v22, "iconModelApplicationDataSource:applicationsRemoved:", self, v9);
        if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v22, "iconModelApplicationDataSource:applicationPlaceholdersRemoved:", self, v8);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

}

+ (id)keyPathsForObservingInstallProgress
{
  return &unk_1E8E175E8;
}

- (void)_lock_beginObservingInstallProgress:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMapTable *installProgressBundleIdentifiers;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  installProgressBundleIdentifiers = self->_installProgressBundleIdentifiers;
  if (installProgressBundleIdentifiers)
  {
    -[NSMapTable objectForKey:](installProgressBundleIdentifiers, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend((id)objc_opt_class(), "keyPathsForObservingInstallProgress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v34;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14++), 0, 305926858);
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v12);
      }

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(MEMORY[0x1E0CB38A8], "keyPathsForValuesAffectingInstallState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19++), 0, 305926858);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v17);
      }

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(MEMORY[0x1E0CB38A8], "keyPathsForValuesAffectingInstallPhase", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v26;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v26 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v24++), 0, 305926858);
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        }
        while (v22);
      }

      -[NSMapTable setObject:forKey:](self->_installProgressBundleIdentifiers, "setObject:forKey:", v7, v6);
      -[NSMutableDictionary setObject:forKey:](self->_bundleIdentifierToInstallProgresses, "setObject:forKey:", v6, v7);
    }
  }

}

- (void)_lock_endObservingInstallProgress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend((id)objc_opt_class(), "keyPathsForObservingInstallProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v9++), 305926858);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(MEMORY[0x1E0CB38A8], "keyPathsForValuesAffectingInstallState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14++), 305926858);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(MEMORY[0x1E0CB38A8], "keyPathsForValuesAffectingInstallPhase", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++), 305926858);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v17);
  }

  -[NSMapTable objectForKey:](self->_installProgressBundleIdentifiers, "objectForKey:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifierToInstallProgresses, "removeObjectForKey:", v20);
  -[NSMapTable removeObjectForKey:](self->_installProgressBundleIdentifiers, "removeObjectForKey:", v4);

}

- (void)updateStateOfPlaceholder:(id)a3 fromProgress:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v7 = objc_msgSend(v6, "installState");
  v8 = objc_msgSend(v6, "installPhase");
  objc_msgSend(v6, "fractionCompleted");
  v10 = v9;

  -[SBHSelectedApplicationDataSource updateStateOfPlaceholder:withInstallState:installPhase:installProgress:](self, "updateStateOfPlaceholder:withInstallState:installPhase:installProgress:", v11, v7, v8, v10);
}

- (void)updateStateOfPlaceholder:(id)a3 withInstallState:(unint64_t)a4 installPhase:(unint64_t)a5 installProgress:(double)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BOOL8 v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a4 - 3 >= 2)
  {
    if (a4 != 2)
    {
      if (a4 == 5 && (BSFloatIsOne() & 1) != 0)
      {
        v10 = 0;
        v11 = 0;
      }
      else if ((a5 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        v12 = a5 - 1;
        v13 = a5 == 3;
        v10 = 0;
        if (v12 >= 2)
          v11 = v13;
        else
          v11 = 2;
      }
      else
      {
        v10 = 0;
        if (BSFloatIsZero())
          v11 = 1;
        else
          v11 = 2;
      }
      goto LABEL_13;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  v11 = 1;
LABEL_13:
  SBLogSelectedApplicationDataSource();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v15;
    v18 = 2048;
    v19 = v11;
    v20 = 2048;
    v21 = a6;
    v22 = 1024;
    v23 = v10;
    _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEFAULT, "Updating install progress for %@: state: %li, progress: %f, paused: %{BOOL}u", (uint8_t *)&v16, 0x26u);

  }
  objc_msgSend(v9, "updateProgressState:progressPercent:progressPaused:", v11, v10, a6);

}

- (void)applicationInstallsDidStart:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");

        objc_msgSend(v11, "installProgress");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13)
          v16 = v14 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          objc_msgSend(v4, "addObject:", v13);
          objc_msgSend(v5, "setObject:forKey:", v15, v13);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v19 = v4;
  v17 = v4;
  v18 = v5;
  BSDispatchMain();

}

uint64_t __64__SBHSelectedApplicationDataSource_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBHSelectedApplicationDataSource_applicationInstallsDidStart___block_invoke_2;
  v6[3] = &unk_1E8D8AD68;
  v2 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  SBLogSelectedApplicationDataSource();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "Application installs did start: %@", buf, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "addApplicationsForBundleIdentifiers:forcePlaceholders:", *(_QWORD *)(a1 + 48), 1);
}

void __64__SBHSelectedApplicationDataSource_applicationInstallsDidStart___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", v6))
    objc_msgSend(*(id *)(a1 + 32), "_lock_beginObservingInstallProgress:forBundleIdentifier:", v5, v6);

}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSelectedApplicationDataSource();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@:%@", buf, 0x16u);

  }
  v7 = v4;
  BSDispatchMain();

}

void __65__SBHSelectedApplicationDataSource_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "bundleIdentifier", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v7, "installProgress");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "updateStateOfPlaceholder:fromProgress:", v9, v10);

          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)applicationsDidInstall:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    SBLogSelectedApplicationDataSource();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "Applications did install: %@", buf, 0xCu);
    }

    v12 = v4;
    BSDispatchMain();

  }
}

uint64_t __59__SBHSelectedApplicationDataSource_applicationsDidInstall___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 32), "_lock_endObservingInstallProgress:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  return objc_msgSend(*(id *)(a1 + 32), "addApplicationsForBundleIdentifiers:forcePlaceholders:", *(_QWORD *)(a1 + 40), 0);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v11 = v4;
    BSDispatchMain();

  }
}

uint64_t __61__SBHSelectedApplicationDataSource_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogSelectedApplicationDataSource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_DEFAULT, "Applications did uninstall: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "removeApplicationsForBundleIdentifiers:", *(_QWORD *)(a1 + 32));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  SBLogSelectedApplicationDataSource();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v12;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@:%@", buf, 0x16u);

  }
  if (a6 == (void *)305926858)
  {
    v13 = v10;
    SBLogSelectedApplicationDataSource();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEFAULT, "Install progress did change: %@", buf, 0xCu);
    }

    v15 = v13;
    BSDispatchMain();

  }
}

void __83__SBHSelectedApplicationDataSource_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  v2 = (void *)v5;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v5);
    v3 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v5;
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 32), "updateStateOfPlaceholder:fromProgress:", v3, *(_QWORD *)(a1 + 40));

      v2 = (void *)v5;
    }
  }

}

- (void)homeScreenService:(id)a3 applicationIconInfoChangedForBundleIdentifiers:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  BSDispatchMain();

}

void __101__SBHSelectedApplicationDataSource_homeScreenService_applicationIconInfoChangedForBundleIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "remoteBadgeValueDidChange");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)allApplicationsForIconModel:(id)a3
{
  return (id)-[NSMutableDictionary allValues](self->_applications, "allValues", a3);
}

- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4
{
  return (id)-[NSMutableDictionary objectForKey:](self->_applications, "objectForKey:", a4);
}

- (id)allApplicationPlaceholdersForIconModel:(id)a3
{
  return (id)-[NSMutableDictionary allValues](self->_applicationPlaceholders, "allValues", a3);
}

- (void)removeIconModelApplicationDataSourceObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)uninstallApplicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_completion___block_invoke;
  v8[3] = &unk_1E8D8AD90;
  v9 = v6;
  v7 = v6;
  -[SBHSelectedApplicationDataSource uninstallApplicationWithBundleIdentifier:options:completion:](self, "uninstallApplicationWithBundleIdentifier:options:completion:", a3, 1, v8);

}

uint64_t __88__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

- (NSString)description
{
  return (NSString *)-[SBHSelectedApplicationDataSource descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHSelectedApplicationDataSource descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_trackedApplicationBundleIdentifiers, CFSTR("trackedApplicationBundleIdentifiers"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHSelectedApplicationDataSource succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_workspace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInfoObserverAssertion, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToInstallProgresses, 0);
  objc_storeStrong((id *)&self->_installProgressBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationPlaceholders, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_trackedApplicationBundleIdentifiers, 0);
}

@end
