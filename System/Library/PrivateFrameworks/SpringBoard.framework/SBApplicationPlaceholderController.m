@implementation SBApplicationPlaceholderController

+ (SBApplicationPlaceholderController)sharedInstance
{
  if (sharedInstance_onceToken_60 != -1)
    dispatch_once(&sharedInstance_onceToken_60, &__block_literal_global_414);
  return (SBApplicationPlaceholderController *)(id)sharedInstance___instance_13;
}

- (BOOL)isUsingNetwork
{
  return self->_usingNetwork;
}

- (id)placeholderForDisplayID:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_placeholdersByBundleID, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __52__SBApplicationPlaceholderController_sharedInstance__block_invoke()
{
  SBApplicationPlaceholderController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBApplicationPlaceholderController);
  v1 = (void *)sharedInstance___instance_13;
  sharedInstance___instance_13 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBApplicationPlaceholderController)init
{
  SBApplicationPlaceholderController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *placeholdersByBundleID;
  uint64_t v5;
  SBApplicationController *appController;
  uint64_t v7;
  SBApplicationLibraryObserver *lsWorkspaceObserver;
  NSMutableSet *v9;
  NSMutableSet *pendingAdded;
  NSMutableSet *v11;
  NSMutableSet *pendingInstalled;
  NSMutableSet *v13;
  NSMutableSet *pendingCancelled;
  NSCountedSet *v15;
  NSCountedSet *removingPlaceholderProxies;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  SBApplicationPlaceholder *v24;
  SBApplicationPlaceholder *v25;
  NSObject *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)SBApplicationPlaceholderController;
  v2 = -[SBApplicationPlaceholderController init](&v33, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    placeholdersByBundleID = v2->_placeholdersByBundleID;
    v2->_placeholdersByBundleID = v3;

    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    appController = v2->_appController;
    v2->_appController = (SBApplicationController *)v5;

    -[SBApplicationController _appLibraryObserver](v2->_appController, "_appLibraryObserver");
    v7 = objc_claimAutoreleasedReturnValue();
    lsWorkspaceObserver = v2->_lsWorkspaceObserver;
    v2->_lsWorkspaceObserver = (SBApplicationLibraryObserver *)v7;

    -[SBApplicationLibraryObserver addPlaceholderLifecycleObserver:](v2->_lsWorkspaceObserver, "addPlaceholderLifecycleObserver:", v2);
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingAdded = v2->_pendingAdded;
    v2->_pendingAdded = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingInstalled = v2->_pendingInstalled;
    v2->_pendingInstalled = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingCancelled = v2->_pendingCancelled;
    v2->_pendingCancelled = v13;

    v15 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    removingPlaceholderProxies = v2->_removingPlaceholderProxies;
    v2->_removingPlaceholderProxies = v15;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[SBApplicationLibraryObserver placeholders](v2->_lsWorkspaceObserver, "placeholders", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v22, "bundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = -[SBHProxiedApplicationPlaceholder initWithPlaceholderProxy:]([SBApplicationPlaceholder alloc], "initWithPlaceholderProxy:", v22);
            v25 = v24;
            if (v24)
            {
              -[SBHProxiedApplicationPlaceholder setDelegate:](v24, "setDelegate:", v2);
              -[NSMutableDictionary setObject:forKey:](v2->_placeholdersByBundleID, "setObject:forKey:", v25, v23);
            }

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      }
      while (v19);
    }

    SBLogAppPlaceholder();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableDictionary allKeys](v2->_placeholdersByBundleID, "allKeys");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v27;
      _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Placeholders @ boot time: %@", buf, 0xCu);

    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBApplicationLibraryObserver removePlaceholderLifecycleObserver:](self->_lsWorkspaceObserver, "removePlaceholderLifecycleObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBApplicationPlaceholderController;
  -[SBApplicationPlaceholderController dealloc](&v3, sel_dealloc);
}

- (id)placeholdersByDisplayID
{
  return self->_placeholdersByBundleID;
}

- (BOOL)hasDownloadedStoreApplication
{
  return self->_hasDownloadedFromStore;
}

- (void)applicationPlaceholdersAdded:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableDictionary *placeholdersByBundleID;
  NSMutableSet *pendingAdded;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  NSMutableDictionary *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogAppPlaceholder();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    placeholdersByBundleID = self->_placeholdersByBundleID;
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = placeholdersByBundleID;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "App placeholder proxies added: %@, currentlyKnownExistingPlaceholders: %@", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationPlaceholderController.m"), 129, CFSTR("%s: should be called on the main thread only."), "-[SBApplicationPlaceholderController applicationPlaceholdersAdded:]");

    if (!v5)
      goto LABEL_8;
  }
  pendingAdded = self->_pendingAdded;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](pendingAdded, "unionSet:", v9);

  -[NSMutableSet minusSet:](self->_pendingCancelled, "minusSet:", self->_pendingAdded);
  -[NSMutableSet minusSet:](self->_pendingInstalled, "minusSet:", self->_pendingAdded);
  if (-[NSCountedSet intersectsSet:](self->_removingPlaceholderProxies, "intersectsSet:", self->_pendingAdded))
  {
    do
      -[NSCountedSet minusSet:](self->_removingPlaceholderProxies, "minusSet:", self->_pendingAdded);
    while ((-[NSCountedSet intersectsSet:](self->_removingPlaceholderProxies, "intersectsSet:", self->_pendingAdded) & 1) != 0);
  }
  -[SBApplicationPlaceholderController _processPendingProxies](self, "_processPendingProxies");
LABEL_8:

}

- (void)applicationPlaceholdersInstalled:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableSet *pendingInstalled;
  void *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogAppPlaceholder();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "App placeholder proxies installed: %@", buf, 0xCu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationPlaceholderController.m"), 148, CFSTR("%s: should be called on the main thread only."), "-[SBApplicationPlaceholderController applicationPlaceholdersInstalled:]");

    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_5:
    pendingInstalled = self->_pendingInstalled;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet unionSet:](pendingInstalled, "unionSet:", v8);

    -[SBApplicationPlaceholderController _processPendingProxies](self, "_processPendingProxies");
  }
LABEL_6:

}

- (void)applicationPlaceholdersCancelled:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableSet *pendingCancelled;
  void *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogAppPlaceholder();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "App placeholder proxies cancelled: %@", buf, 0xCu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationPlaceholderController.m"), 157, CFSTR("%s: should be called on the main thread only."), "-[SBApplicationPlaceholderController applicationPlaceholdersCancelled:]");

    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_5:
    pendingCancelled = self->_pendingCancelled;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet unionSet:](pendingCancelled, "unionSet:", v8);

    -[SBApplicationPlaceholderController _processPendingProxies](self, "_processPendingProxies");
  }
LABEL_6:

}

- (void)applicationPlaceholdersNetworkUsageChanged:(BOOL)a3
{
  id v4;

  if (self->_usingNetwork != a3)
  {
    self->_usingNetwork = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SBApplicationPlaceholdersNetworkUsageDidChangeNotification"), self, 0);

  }
}

- (void)_processPendingProxies
{
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationPlaceholderController.m"), 175, CFSTR("%s: should be called on the main thread only."), "-[SBApplicationPlaceholderController _processPendingProxies]");

  }
  if (-[NSMutableSet count](self->_pendingAdded, "count"))
  {
    -[SBApplicationPlaceholderController _addPlaceholders:](self, "_addPlaceholders:", self->_pendingAdded);
    -[NSMutableSet removeAllObjects](self->_pendingAdded, "removeAllObjects");
  }
  if (-[NSMutableSet count](self->_pendingInstalled, "count"))
  {
    -[SBApplicationPlaceholderController _removePlaceholders:forInstall:](self, "_removePlaceholders:forInstall:", self->_pendingInstalled, 1);
    -[NSMutableSet removeAllObjects](self->_pendingInstalled, "removeAllObjects");
  }
  if (-[NSMutableSet count](self->_pendingCancelled, "count"))
  {
    -[SBApplicationPlaceholderController _removePlaceholders:forInstall:](self, "_removePlaceholders:forInstall:", self->_pendingCancelled, 0);
    -[NSMutableSet removeAllObjects](self->_pendingCancelled, "removeAllObjects");
  }
}

- (id)iconManager
{
  void *v2;
  void *v3;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_addPlaceholders:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  SBApplicationPlaceholder *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id obj;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBApplicationPlaceholderController iconManager](self, "iconManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "iconModel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_20;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v43 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      v11 = (void *)MEMORY[0x1D17E5334]();
      objc_msgSend(v10, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D4E420];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Placeholder add BEGIN"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logStep:byParty:phase:success:forBundleID:description:", 0, 10, 1, 1, v12, v14);

      -[SBApplicationPlaceholderController placeholderForDisplayID:](self, "placeholderForDisplayID:", v12);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        v17 = v36;
LABEL_10:
        objc_msgSend(v17, "addObject:", v16, v31);
        goto LABEL_11;
      }
      v18 = -[SBHProxiedApplicationPlaceholder initWithPlaceholderProxy:]([SBApplicationPlaceholder alloc], "initWithPlaceholderProxy:", v10);
      v16 = v18;
      if (v18)
      {
        -[SBHProxiedApplicationPlaceholder setDelegate:](v18, "setDelegate:", self);
        -[NSMutableDictionary setObject:forKey:](self->_placeholdersByBundleID, "setObject:forKey:", v16, v12);
        v17 = v33;
        goto LABEL_10;
      }
LABEL_11:
      objc_msgSend(v37, "addObject:", v16, v31);
      if (!self->_hasDownloadedFromStore && objc_msgSend(v16, "isStoreDownload"))
        self->_hasDownloadedFromStore = 1;
      if (-[SBApplicationPlaceholderController placeholderRepresentsNewAppInstallFromStore:](self, "placeholderRepresentsNewAppInstallFromStore:", v16))
      {
        v19 = v12;

        v7 = v19;
      }

      objc_autoreleasePoolPop(v11);
    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  }
  while (v6);
LABEL_20:

  objc_msgSend(v32, "addApplicationPlaceholders:", v37);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v34);
        v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v24, "applicationBundleID", v31);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0D4E420];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Created icon for placeholder."));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logStep:byParty:phase:success:forBundleID:description:", 1, 10, 3, 1, v25, v27);

        SBLogAppPlaceholder();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          v47 = v24;
          v48 = 2112;
          v49 = v25;
          _os_log_debug_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEBUG, "Created icon %p for placeholder %@", buf, 0x16u);
        }

        if ((objc_msgSend(v24, "hasObserver:", self) & 1) == 0)
          objc_msgSend(v24, "addObserver:", self);

      }
      v21 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v21);
  }
  v29 = v31;
  if (v7)
  {
    objc_msgSend(v31, "applicationIconForBundleIdentifier:", v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v32, "setIconToReveal:revealingPrevious:", v30, 1);
      objc_msgSend(v32, "tryScrollToIconToRevealAnimated:", SBWorkspaceSpringBoardIsActive());
    }

  }
  if (objc_msgSend(v33, "count", v31) || objc_msgSend(v36, "count"))
    -[SBApplicationPlaceholderController _postPlaceholdersDidChangeForAdded:modified:removed:](self, "_postPlaceholdersDidChangeForAdded:modified:removed:", v33, v36, 0);

}

- (void)_removePlaceholders:(id)a3 forInstall:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBApplicationController *appController;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SBApplicationIcon *v38;
  SBApplicationIcon *v39;
  id v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[6];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  void *v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v4 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "iconManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationController allBundleIdentifiers](self->_appController, "allBundleIdentifiers");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v6;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v50)
  {
    v48 = *(_QWORD *)v58;
    v8 = 0x1E0D4E000uLL;
    v9 = 0x1E0CB3000uLL;
    v43 = v4;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v58 != v48)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(v8 + 1056);
        objc_msgSend(*(id *)(v9 + 2368), "stringWithFormat:", CFSTR("Placeholder remove BEGIN"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logStep:byParty:phase:success:forBundleID:description:", 4, 10, 1, 1, v12, v14);

        -[SBApplicationPlaceholderController placeholderForDisplayID:](self, "placeholderForDisplayID:", v12);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v9;
        v17 = (void *)v15;
        if (v15)
        {
          v18 = (void *)MEMORY[0x1D17E5334](objc_msgSend(v7, "addObject:", v15));
          if (v4)
          {
            -[SBApplicationController _appLibrary](self->_appController, "_appLibrary");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "installedApplicationWithBundleIdentifier:", v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v42, "_setIgnoreMutatingIconListsOnApplicationInstall:", 1);
              appController = self->_appController;
              v62 = v20;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBApplicationController applicationsAdded:](appController, "applicationsAdded:", v22);

              objc_msgSend(v42, "_setIgnoreMutatingIconListsOnApplicationInstall:", 0);
            }
            else
            {
              SBLogAppPlaceholder();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v64 = v12;
                _os_log_error_impl(&dword_1D0540000, v26, OS_LOG_TYPE_ERROR, "No app info found for supposedly installed placeholder for %{public}@", buf, 0xCu);
              }

            }
            v4 = v43;
          }
          -[SBApplicationController applicationWithBundleIdentifier:](self->_appController, "applicationWithBundleIdentifier:", v12);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v11, "installType");
          if (v28 == 1)
          {
            if (!objc_msgSend(v46, "containsObject:", v12))
              goto LABEL_23;
          }
          else
          {
            if (v28 != 3)
            {
LABEL_23:

              objc_autoreleasePoolPop(v18);
              v8 = 0x1E0D4E000;
              goto LABEL_24;
            }
            if ((objc_msgSend(v46, "containsObject:", v12) & 1) == 0)
            {
              objc_msgSend(v27, "markNewlyInstalled");
              goto LABEL_23;
            }
          }
          objc_msgSend(v27, "markRecentlyUpdated");
          goto LABEL_23;
        }
        v23 = *(void **)(v8 + 1056);
        objc_msgSend(*(id *)(v16 + 2368), "stringWithFormat:", CFSTR("State mismatch -- no model placeholder found matching."));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logStep:byParty:phase:success:forBundleID:description:", 4, 10, 2, 0, v12, v24);

        SBLogAppPlaceholder();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v64 = v12;
          _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "*** No placeholder exists for placeholderProxy with bundleID: %{public}@. Ignoring this removal.", buf, 0xCu);
        }

LABEL_24:
        v9 = 0x1E0CB3000;
      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v50);
  }

  objc_msgSend(v41, "iconImageCache");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rootViewController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "traitCollection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "sbh_iconImageAppearanceFromTraitCollection:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v29 = v7;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v54 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
        objc_msgSend(v34, "placeholderProxy");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "applicationBundleID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          -[SBApplicationController applicationWithBundleIdentifier:](self->_appController, "applicationWithBundleIdentifier:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCountedSet addObject:](self->_removingPlaceholderProxies, "addObject:", v35);
          -[SBApplicationPlaceholderController _finishPlaceholder:](self, "_finishPlaceholder:", v34);
          if (v37
            && (v38 = -[SBHApplicationIcon initWithApplication:]([SBApplicationIcon alloc], "initWithApplication:", v37)) != 0)
          {
            v39 = v38;
            v52[0] = MEMORY[0x1E0C809B0];
            v52[1] = 3221225472;
            v52[2] = __69__SBApplicationPlaceholderController__removePlaceholders_forInstall___block_invoke;
            v52[3] = &unk_1E8EC1CE8;
            v52[4] = self;
            v52[5] = v34;
            v40 = (id)objc_msgSend(v51, "cacheImageForIcon:imageAppearance:options:completionHandler:", v38, v49, 5, v52);

          }
          else
          {
            -[SBApplicationPlaceholderController _finishSwappingPlaceholderAfterCachingIcon:](self, "_finishSwappingPlaceholderAfterCachingIcon:", v34);
          }

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v31);
  }

}

uint64_t __69__SBApplicationPlaceholderController__removePlaceholders_forInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishSwappingPlaceholderAfterCachingIcon:", *(_QWORD *)(a1 + 40));
}

- (void)_finishSwappingPlaceholderAfterCachingIcon:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "placeholderProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationPlaceholderController.m"), 353, CFSTR("We already checked that this had a non-nil placeholderProxy"));

  }
  objc_msgSend(v16, "applicationBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationPlaceholderController.m"), 356, CFSTR("We already checked that this had a non-nil applicationBundleID"));

  }
  v7 = -[NSCountedSet containsObject:](self->_removingPlaceholderProxies, "containsObject:", v5);
  -[SBApplicationController applicationWithBundleIdentifier:](self->_appController, "applicationWithBundleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SBApplicationPlaceholderController iconManager](self, "iconManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      v11 = (id)objc_msgSend(v9, "replaceApplicationPlaceholderWithApplication:", v8);
    }
    else
    {
      objc_msgSend(v9, "iconModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applicationIconsForBundleIdentifier:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeIcons:", v13);

    }
  }
  -[NSCountedSet removeObject:](self->_removingPlaceholderProxies, "removeObject:", v5);

}

- (void)_finishPlaceholder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "invalidate");
  objc_msgSend(v4, "applicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[NSMutableDictionary removeObjectForKey:](self->_placeholdersByBundleID, "removeObjectForKey:", v5);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationPlaceholderController _postPlaceholdersDidChangeForAdded:modified:removed:](self, "_postPlaceholdersDidChangeForAdded:modified:removed:", 0, 0, v6);

}

- (void)_postPlaceholdersDidChangeForAdded:(id)a3 modified:(id)a4 removed:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("__placeholdersAdded"));
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("__placeholdersModified"));
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("__placeholdersRemoved"));
    SBLogAppPlaceholder();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Placeholders added: %@, modified: %@, removed: %@", (uint8_t *)&v14, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("SBApplicationPlaceholdersDidChangeNotification"), self, v11);

  }
}

- (BOOL)placeholderShouldAllowPausing:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditingAllowed");

  return v5;
}

- (void)placeholderWantsUninstall:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "applicationWithBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "uninstallApplication:", v5);

}

- (BOOL)placeholderRepresentsNewAppInstallFromStore:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "isStoreDownload");
  objc_msgSend(v3, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = 0;
  else
    v8 = v4;

  return v8;
}

- (void)iconAccessoriesDidUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEditing"))
    v6 = objc_msgSend(v4, "isUninstallSupportedForIcon:", v3);
  else
    v6 = 0;
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertItemsOfClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) == 0 && objc_msgSend(v8, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v14, "icon", (_QWORD)v16);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          if (v15 == v3)
            objc_msgSend(v14, "deactivate");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removingPlaceholderProxies, 0);
  objc_storeStrong((id *)&self->_pendingCancelled, 0);
  objc_storeStrong((id *)&self->_pendingInstalled, 0);
  objc_storeStrong((id *)&self->_pendingAdded, 0);
  objc_storeStrong((id *)&self->_placeholdersByBundleID, 0);
  objc_storeStrong((id *)&self->_lsWorkspaceObserver, 0);
  objc_storeStrong((id *)&self->_appController, 0);
}

@end
