@implementation MTCoreDataContainer

- (MTManagedObjectContext)privateQueueContext
{
  MTManagedObjectContext *privateQueueContext;
  MTCoreDataContainer *v4;
  void *v5;
  MTManagedObjectContext *v6;
  MTManagedObjectContext *v7;
  PFManagedObjectContextMonitor *v8;
  PFManagedObjectContextMonitor *privateMonitor;

  privateQueueContext = self->_privateQueueContext;
  if (!privateQueueContext)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_privateQueueContext)
    {
      -[MTCoreDataContainer persistentStoreCoordinator](v4, "persistentStoreCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreDataContainer _createManagedObjectContextWithName:coordinator:concurrencyType:](v4, "_createManagedObjectContextWithName:coordinator:concurrencyType:", CFSTR("background context"), v5, 1);
      v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();
      v7 = self->_privateQueueContext;
      self->_privateQueueContext = v6;

      v8 = -[PFManagedObjectContextMonitor initWithContext:label:pingInterval:shortHangDuration:severeHangDuration:criticalHangDuration:criticalHangRepeatInterval:]([PFManagedObjectContextMonitor alloc], "initWithContext:label:pingInterval:shortHangDuration:severeHangDuration:criticalHangDuration:criticalHangRepeatInterval:", self->_privateQueueContext, 0, 1.0, 5.0, 10.0, 15.0, 1.0);
      privateMonitor = v4->_privateMonitor;
      v4->_privateMonitor = v8;

      -[PFManagedObjectContextMonitor beginMonitoring](v4->_privateMonitor, "beginMonitoring");
    }
    objc_sync_exit(v4);

    privateQueueContext = self->_privateQueueContext;
  }
  return privateQueueContext;
}

- (id)mainOrPrivateContext
{
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    -[MTCoreDataContainer mainQueueContext](self, "mainQueueContext");
  else
    -[MTCoreDataContainer privateQueueContext](self, "privateQueueContext");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTManagedObjectContext)mainQueueContext
{
  MTManagedObjectContext *mainQueueContext;
  MTCoreDataContainer *v4;
  void *v5;
  MTManagedObjectContext *v6;
  MTManagedObjectContext *v7;

  mainQueueContext = self->_mainQueueContext;
  if (!mainQueueContext)
  {
    v4 = self;
    objc_sync_enter(v4);
    -[MTCoreDataContainer persistentStoreCoordinator](v4, "persistentStoreCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCoreDataContainer _createManagedObjectContextWithName:coordinator:concurrencyType:](v4, "_createManagedObjectContextWithName:coordinator:concurrencyType:", CFSTR("main queue context"), v5, 2);
    v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mainQueueContext;
    self->_mainQueueContext = v6;

    objc_sync_exit(v4);
    mainQueueContext = self->_mainQueueContext;
  }
  return mainQueueContext;
}

- (MTManagedObjectContext)importContext
{
  MTManagedObjectContext *importContext;
  MTCoreDataContainer *v4;
  void *v5;
  MTManagedObjectContext *v6;
  MTManagedObjectContext *v7;
  PFManagedObjectContextMonitor *v8;
  PFManagedObjectContextMonitor *importMonitor;

  importContext = self->_importContext;
  if (!importContext)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_importContext)
    {
      -[MTCoreDataContainer persistentStoreCoordinator](v4, "persistentStoreCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreDataContainer _createManagedObjectContextWithName:coordinator:concurrencyType:](v4, "_createManagedObjectContextWithName:coordinator:concurrencyType:", CFSTR("import context"), v5, 1);
      v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();
      v7 = self->_importContext;
      self->_importContext = v6;

      v8 = -[PFManagedObjectContextMonitor initWithContext:label:pingInterval:shortHangDuration:severeHangDuration:criticalHangDuration:criticalHangRepeatInterval:]([PFManagedObjectContextMonitor alloc], "initWithContext:label:pingInterval:shortHangDuration:severeHangDuration:criticalHangDuration:criticalHangRepeatInterval:", self->_importContext, 1, 1.0, 10.0, 20.0, 30.0, 1.0);
      importMonitor = v4->_importMonitor;
      v4->_importMonitor = v8;

      -[PFManagedObjectContextMonitor beginMonitoring](v4->_importMonitor, "beginMonitoring");
    }
    objc_sync_exit(v4);

    importContext = self->_importContext;
  }
  return importContext;
}

- (id)persistentStoreCoordinator
{
  NSPersistentStoreCoordinator *coordinator;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  coordinator = self->_coordinator;
  if (coordinator)
    return coordinator;
  v5 = objc_alloc(MEMORY[0x1E0C97C00]);
  -[MTCoreDataContainer config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithManagedObjectModel:", v7);
  -[MTCoreDataContainer setCoordinator:](self, "setCoordinator:", v8);

  -[MTCoreDataContainer coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C979E8];
  -[MTCoreDataContainer config](self, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseFileUrl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoreDataContainer config](self, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistentStoreOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v9, "addPersistentStoreWithType:configuration:URL:options:error:", v10, 0, v12, v14, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v18;

  if (!v15)
  {
    -[MTCoreDataContainer checkForBackwardsMigration_probablyNotABug:](self, "checkForBackwardsMigration_probablyNotABug:", v16);
    -[MTCoreDataContainer checkForFullDisk_probablyNotABug:](self, "checkForFullDisk_probablyNotABug:", v16);
    -[MTCoreDataContainer checkForRadar75450416_probablyNotABug:](self, "checkForRadar75450416_probablyNotABug:", v16);
    -[MTCoreDataContainer checkForWritePermissions:](self, "checkForWritePermissions:", v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Error creating persistent store"), CFSTR("Error: %@"), v16);
  }
  -[MTCoreDataContainer coordinator](self, "coordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (MTCoreDataContainerConfigProvider)config
{
  return self->_config;
}

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (id)_createManagedObjectContextWithName:(id)a3 coordinator:(id)a4 concurrencyType:(unint64_t)a5
{
  id v8;
  id v9;
  MTManagedObjectContext *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[MTManagedObjectContext initWithConcurrencyType:name:]([MTManagedObjectContext alloc], "initWithConcurrencyType:name:", a5, v9);

  -[MTManagedObjectContext setPersistentStoreCoordinator:](v10, "setPersistentStoreCoordinator:", v8);
  -[MTManagedObjectContext setMergePolicy:](v10, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  -[MTManagedObjectContext setUndoManager:](v10, "setUndoManager:", 0);
  -[MTManagedObjectContext setType:](v10, "setType:", a5 != 2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_mergeFromContextDidSaveNotification_, *MEMORY[0x1E0C978A8], v10);

  return v10;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

uint64_t __57__MTCoreDataContainer__notifyLibraryChanged_contextName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "libraryDidChange:", *(_QWORD *)(a1 + 40));
}

- (MTCoreDataContainer)initWithConfig:(id)a3
{
  id v4;
  MTCoreDataContainer *v5;
  MTCoreDataContainer *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  dispatch_queue_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  objc_super v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTCoreDataContainer;
  v5 = -[MTCoreDataContainer init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MTCoreDataContainer setConfig:](v5, "setConfig:", v4);
    -[MTCoreDataContainer setValid:](v6, "setValid:", 1);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCoreDataContainer setNotifiers:](v6, "setNotifiers:", v7);

    v21[0] = CFSTR("MTPodcast");
    v21[1] = CFSTR("MTEpisode");
    v21[2] = CFSTR("MTPlaylist");
    v21[3] = CFSTR("MTPodcastPlaylistSettings");
    v21[4] = CFSTR("MTChannel");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCoreDataContainer setEntityNames:](v6, "setEntityNames:", v8);

    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@MergeQueue"), v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
    -[MTCoreDataContainer setMergeQueue:](v6, "setMergeQueue:", v13);

    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@MergeNotifierQueue"), v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    -[MTCoreDataContainer setMergeNotifierQueue:](v6, "setMergeNotifierQueue:", v18);

  }
  return v6;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setNotifiers:(id)a3
{
  objc_storeStrong((id *)&self->_notifiers, a3);
}

- (void)setMergeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mergeQueue, a3);
}

- (void)setMergeNotifierQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mergeNotifierQueue, a3);
}

- (void)setEntityNames:(id)a3
{
  objc_storeStrong((id *)&self->_entityNames, a3);
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

void __59__MTCoreDataContainer_mergeFromContextDidSaveNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (objc_msgSend(WeakRetained, "valid"))
  {
    _MTLogCategoryDatabase();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);

    _MTLogCategoryDatabase();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v7;
      _os_signpost_emit_with_name_impl(&dword_1A904E000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "mergeFromContextDidSaveNotification", "from: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    v8 = (void *)MEMORY[0x1E0C97B88];
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mergeChangesFromRemoteContextSave:intoContexts:", v9, *(_QWORD *)(a1 + 48));

    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_notifyLibraryChanged:contextName:", v10, v11);

    _MTLogCategoryDatabase();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A904E000, v13, OS_SIGNPOST_INTERVAL_END, v4, "mergeFromContextDidSaveNotification", ", (uint8_t *)&v14, 2u);
    }

  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)mergeFromContextDidSaveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoreDataContainer allContexts](self, "allContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
    goto LABEL_4;
  if (objc_msgSend(v6, "containsObject:", v5))
  {
    objc_msgSend(v7, "removeObject:", v5);
LABEL_4:
    objc_initWeak(&location, self);
    -[MTCoreDataContainer mergeQueue](self, "mergeQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MTCoreDataContainer_mergeFromContextDidSaveNotification___block_invoke;
    block[3] = &unk_1E54D1570;
    objc_copyWeak(&v13, &location);
    v10 = v5;
    v11 = v4;
    v12 = v7;
    dispatch_async(v8, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (OS_dispatch_queue)mergeQueue
{
  return self->_mergeQueue;
}

- (void)_notifyLibraryChanged:(id)a3 contextName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id inited;
  void *v12;
  id v13;
  MTLibraryChanges *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  MTLibraryChanges *v22;
  id location;

  v6 = a3;
  v7 = a4;
  -[MTCoreDataContainer notifiers](self, "notifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  -[MTCoreDataContainer notifiers](self, "notifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  inited = objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1AF4138F4]();
  v13 = inited;
  v14 = -[MTLibraryChanges initWithContextName:]([MTLibraryChanges alloc], "initWithContextName:", v7);
  objc_msgSend(v6, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0C97870]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoreDataContainer _addChanges:ofType:toLibraryChanges:](self, "_addChanges:ofType:toLibraryChanges:", v16, 0, v14);

  objc_msgSend(v6, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A18]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoreDataContainer _addChanges:ofType:toLibraryChanges:](self, "_addChanges:ofType:toLibraryChanges:", v18, 2, v14);

  objc_msgSend(v6, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0C97838]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoreDataContainer _addChanges:ofType:toLibraryChanges:](self, "_addChanges:ofType:toLibraryChanges:", v20, 1, v14);

  if (-[MTLibraryChanges hasChanges](v14, "hasChanges"))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__MTCoreDataContainer__notifyLibraryChanged_contextName___block_invoke;
    v21[3] = &unk_1E54D1598;
    v21[4] = self;
    v22 = v14;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v21);

  }
  objc_autoreleasePoolPop(v12);
  objc_destroyWeak(&location);

}

- (void)_addChanges:(id)a3 ofType:(int)a4 toLibraryChanges:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "entity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[MTCoreDataContainer entityNames](self, "entityNames");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsObject:", v15);

        if (v17)
          objc_msgSend(v8, "addChangeWith:entityName:changeType:", v13, v15, a4);

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

}

- (NSArray)entityNames
{
  return self->_entityNames;
}

- (id)contextForName:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[MTCoreDataContainer allContexts](self, "allContexts");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "name", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)allContexts
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_mainQueueContext)
    objc_msgSend(v3, "addObject:");
  if (self->_privateQueueContext)
    objc_msgSend(v4, "addObject:");
  if (self->_carPlayContext)
    objc_msgSend(v4, "addObject:");
  if (self->_storeContext)
    objc_msgSend(v4, "addObject:");
  if (self->_importContext)
    objc_msgSend(v4, "addObject:");
  if (self->_resetableImportContext)
    objc_msgSend(v4, "addObject:");
  if (self->_loggingContext)
    objc_msgSend(v4, "addObject:");
  if (self->_playbackContext)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (void)addChangeNotifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MTCoreDataContainer notifiers](self, "notifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MTCoreDataContainer notifiers](self, "notifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (NSHashTable)notifiers
{
  return self->_notifiers;
}

void __57__MTCoreDataContainer__notifyLibraryChanged_contextName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mergeNotifierQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MTCoreDataContainer__notifyLibraryChanged_contextName___block_invoke_2;
  v6[3] = &unk_1E54D11F8;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, v6);

}

- (OS_dispatch_queue)mergeNotifierQueue
{
  return self->_mergeNotifierQueue;
}

- (MTManagedObjectContext)storeContext
{
  MTManagedObjectContext *storeContext;
  MTCoreDataContainer *v4;
  void *v5;
  MTManagedObjectContext *v6;
  MTManagedObjectContext *v7;

  storeContext = self->_storeContext;
  if (!storeContext)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_storeContext)
    {
      -[MTCoreDataContainer persistentStoreCoordinator](v4, "persistentStoreCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreDataContainer _createManagedObjectContextWithName:coordinator:concurrencyType:](v4, "_createManagedObjectContextWithName:coordinator:concurrencyType:", CFSTR("state machine context"), v5, 1);
      v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();
      v7 = self->_storeContext;
      self->_storeContext = v6;

    }
    objc_sync_exit(v4);

    storeContext = self->_storeContext;
  }
  return storeContext;
}

- (MTManagedObjectContext)playbackContext
{
  MTManagedObjectContext *playbackContext;
  MTCoreDataContainer *v4;
  void *v5;
  MTManagedObjectContext *v6;
  MTManagedObjectContext *v7;

  playbackContext = self->_playbackContext;
  if (!playbackContext)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_playbackContext)
    {
      -[MTCoreDataContainer persistentStoreCoordinator](v4, "persistentStoreCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreDataContainer _createManagedObjectContextWithName:coordinator:concurrencyType:](v4, "_createManagedObjectContextWithName:coordinator:concurrencyType:", CFSTR("playback"), v5, 1);
      v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();
      v7 = self->_playbackContext;
      self->_playbackContext = v6;

    }
    objc_sync_exit(v4);

    playbackContext = self->_playbackContext;
  }
  return playbackContext;
}

- (MTManagedObjectContext)carPlayContext
{
  MTManagedObjectContext *carPlayContext;
  MTCoreDataContainer *v4;
  void *v5;
  MTManagedObjectContext *v6;
  MTManagedObjectContext *v7;

  carPlayContext = self->_carPlayContext;
  if (!carPlayContext)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_carPlayContext)
    {
      -[MTCoreDataContainer persistentStoreCoordinator](v4, "persistentStoreCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreDataContainer _createManagedObjectContextWithName:coordinator:concurrencyType:](v4, "_createManagedObjectContextWithName:coordinator:concurrencyType:", CFSTR("carplay context"), v5, 1);
      v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();
      v7 = self->_carPlayContext;
      self->_carPlayContext = v6;

    }
    objc_sync_exit(v4);

    carPlayContext = self->_carPlayContext;
  }
  return carPlayContext;
}

- (MTManagedObjectContext)resetableImportContext
{
  MTManagedObjectContext *resetableImportContext;
  MTCoreDataContainer *v4;
  void *v5;
  MTManagedObjectContext *v6;
  MTManagedObjectContext *v7;

  resetableImportContext = self->_resetableImportContext;
  if (!resetableImportContext)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_resetableImportContext)
    {
      -[MTCoreDataContainer persistentStoreCoordinator](v4, "persistentStoreCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreDataContainer _createManagedObjectContextWithName:coordinator:concurrencyType:](v4, "_createManagedObjectContextWithName:coordinator:concurrencyType:", CFSTR("resetable import context"), v5, 1);
      v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();
      v7 = self->_resetableImportContext;
      self->_resetableImportContext = v6;

      -[MTManagedObjectContext setIsResetable:](self->_resetableImportContext, "setIsResetable:", 1);
    }
    objc_sync_exit(v4);

    resetableImportContext = self->_resetableImportContext;
  }
  return resetableImportContext;
}

- (MTManagedObjectContext)loggingContext
{
  MTManagedObjectContext *loggingContext;
  MTCoreDataContainer *v4;
  void *v5;
  MTManagedObjectContext *v6;
  MTManagedObjectContext *v7;

  loggingContext = self->_loggingContext;
  if (!loggingContext)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_loggingContext)
    {
      -[MTCoreDataContainer persistentStoreCoordinator](v4, "persistentStoreCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreDataContainer _createManagedObjectContextWithName:coordinator:concurrencyType:](v4, "_createManagedObjectContextWithName:coordinator:concurrencyType:", CFSTR("logging"), v5, 1);
      v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();
      v7 = self->_loggingContext;
      self->_loggingContext = v6;

    }
    objc_sync_exit(v4);

    loggingContext = self->_loggingContext;
  }
  return loggingContext;
}

- (void)checkForBackwardsMigration_probablyNotABug:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v4 = objc_msgSend(v5, "code");

    if (v4 == 134100 && +[MTDB coreDataVersion](MTDB, "coreDataVersion") >= 142)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Database is newer than app"), CFSTR("Update install to an older build is unsupported by podcasts."));
  }
  else
  {

  }
}

- (void)checkForFullDisk_probablyNotABug:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C979C8];
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C979C8]) & 1) != 0)
  {
    objc_msgSend(v8, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (v7 == 13)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Disk is full"), CFSTR("Could not open podcasts library because the disk is full."));
  }
  else
  {

  }
}

- (void)checkForRadar75450416_probablyNotABug:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v4 = objc_msgSend(v5, "code");

    if (v4 == 134100 && +[MTDB coreDataVersion](MTDB, "coreDataVersion") == 78)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Unmigratable database"), CFSTR("This device has a corrupt, unmigrateable database that never shipped to the public. See rdar://75450416 for mitigation instructions."));
  }
  else
  {

  }
}

- (void)checkForWritePermissions:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v4 = objc_msgSend(v5, "code");

    if (v4 == 513)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("No write permissions"), CFSTR("The current user does not have write permissions for the Podcasts library path."));
  }
  else
  {

  }
}

- (id)persistentStoreUuid
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v3 = (void *)MEMORY[0x1E0C97C00];
  v4 = *MEMORY[0x1E0C979E8];
  -[MTCoreDataContainer config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseFileUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoreDataContainer config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentStoreOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "metadataForPersistentStoreOfType:URL:options:error:", v4, v6, v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  if (v9 || objc_msgSend(v10, "code") != 260)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0C97A08]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)removeChangeNotifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MTCoreDataContainer notifiers](self, "notifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MTCoreDataContainer notifiers](self, "notifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)tearDownAsync:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[MTCoreDataContainer mergeQueue](self, "mergeQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__MTCoreDataContainer_tearDownAsync___block_invoke;
  v7[3] = &unk_1E54D15C0;
  v7[4] = self;
  v8 = a3;
  dispatch_async(v6, v7);

}

uint64_t __37__MTCoreDataContainer_tearDownAsync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDown:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_tearDown:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  MTManagedObjectContext *mainQueueContext;
  uint64_t v8;
  NSObject *v9;
  MTManagedObjectContext *privateQueueContext;
  NSObject *v11;
  MTManagedObjectContext *carPlayContext;
  NSObject *v13;
  MTManagedObjectContext *storeContext;
  NSObject *v15;
  MTManagedObjectContext *importContext;
  NSObject *v17;
  MTManagedObjectContext *resetableImportContext;
  NSObject *v19;
  MTManagedObjectContext *loggingContext;
  NSObject *v21;
  MTManagedObjectContext *playbackContext;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[5];
  BOOL v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD v39[4];
  NSObject *v40;
  _QWORD v41[4];
  NSObject *v42;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  mainQueueContext = self->_mainQueueContext;
  v8 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __33__MTCoreDataContainer__tearDown___block_invoke;
  v41[3] = &unk_1E54D0DE0;
  v9 = v6;
  v42 = v9;
  -[MTManagedObjectContext performBlock:](mainQueueContext, "performBlock:", v41);
  dispatch_group_enter(v9);
  privateQueueContext = self->_privateQueueContext;
  v39[0] = v8;
  v39[1] = 3221225472;
  v39[2] = __33__MTCoreDataContainer__tearDown___block_invoke_2;
  v39[3] = &unk_1E54D0DE0;
  v11 = v9;
  v40 = v11;
  -[MTManagedObjectContext performBlock:](privateQueueContext, "performBlock:", v39);
  dispatch_group_enter(v11);
  carPlayContext = self->_carPlayContext;
  v37[0] = v8;
  v37[1] = 3221225472;
  v37[2] = __33__MTCoreDataContainer__tearDown___block_invoke_3;
  v37[3] = &unk_1E54D0DE0;
  v13 = v11;
  v38 = v13;
  -[MTManagedObjectContext performBlock:](carPlayContext, "performBlock:", v37);
  dispatch_group_enter(v13);
  storeContext = self->_storeContext;
  v35[0] = v8;
  v35[1] = 3221225472;
  v35[2] = __33__MTCoreDataContainer__tearDown___block_invoke_4;
  v35[3] = &unk_1E54D0DE0;
  v15 = v13;
  v36 = v15;
  -[MTManagedObjectContext performBlock:](storeContext, "performBlock:", v35);
  dispatch_group_enter(v15);
  importContext = self->_importContext;
  v33[0] = v8;
  v33[1] = 3221225472;
  v33[2] = __33__MTCoreDataContainer__tearDown___block_invoke_5;
  v33[3] = &unk_1E54D0DE0;
  v17 = v15;
  v34 = v17;
  -[MTManagedObjectContext performBlock:](importContext, "performBlock:", v33);
  dispatch_group_enter(v17);
  resetableImportContext = self->_resetableImportContext;
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __33__MTCoreDataContainer__tearDown___block_invoke_6;
  v31[3] = &unk_1E54D0DE0;
  v19 = v17;
  v32 = v19;
  -[MTManagedObjectContext performBlock:](resetableImportContext, "performBlock:", v31);
  dispatch_group_enter(v19);
  loggingContext = self->_loggingContext;
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __33__MTCoreDataContainer__tearDown___block_invoke_7;
  v29[3] = &unk_1E54D0DE0;
  v21 = v19;
  v30 = v21;
  -[MTManagedObjectContext performBlock:](loggingContext, "performBlock:", v29);
  dispatch_group_enter(v21);
  playbackContext = self->_playbackContext;
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = __33__MTCoreDataContainer__tearDown___block_invoke_8;
  v27[3] = &unk_1E54D0DE0;
  v28 = v21;
  v23 = v21;
  -[MTManagedObjectContext performBlock:](playbackContext, "performBlock:", v27);
  -[MTCoreDataContainer mergeQueue](self, "mergeQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __33__MTCoreDataContainer__tearDown___block_invoke_9;
  v25[3] = &unk_1E54D15C0;
  v25[4] = self;
  v26 = a3;
  dispatch_group_notify(v23, v24, v25);

}

void __33__MTCoreDataContainer__tearDown___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__MTCoreDataContainer__tearDown___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__MTCoreDataContainer__tearDown___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__MTCoreDataContainer__tearDown___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__MTCoreDataContainer__tearDown___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__MTCoreDataContainer__tearDown___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__MTCoreDataContainer__tearDown___block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__MTCoreDataContainer__tearDown___block_invoke_8(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__MTCoreDataContainer__tearDown___block_invoke_9(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "setValid:", 0);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v2, "destroy");

}

- (void)destroy
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  -[MTCoreDataContainer persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoreDataContainer config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseFileUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C979E8];
  -[MTCoreDataContainer config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentStoreOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v9 = objc_msgSend(v3, "destroyPersistentStoreAtURL:withType:options:error:", v5, v6, v8, &v20);
  v10 = v20;
  if ((v9 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCoreDataContainer config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "databaseFileUrl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    v15 = objc_msgSend(v12, "removeItemAtURL:error:", v14, &v19);
    v18 = v4;
    v16 = v3;
    v17 = v19;

    v11 = v15 ^ 1;
    v10 = v17;
    v3 = v16;
    v4 = v18;
  }

  if (v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Failed to destory store"), CFSTR("Error: %@"), v10);

}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (void)setManagedObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectModel, a3);
}

- (void)setMainQueueContext:(id)a3
{
  objc_storeStrong((id *)&self->_mainQueueContext, a3);
}

- (void)setPrivateQueueContext:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueueContext, a3);
}

- (void)setCarPlayContext:(id)a3
{
  objc_storeStrong((id *)&self->_carPlayContext, a3);
}

- (void)setStoreContext:(id)a3
{
  objc_storeStrong((id *)&self->_storeContext, a3);
}

- (void)setImportContext:(id)a3
{
  objc_storeStrong((id *)&self->_importContext, a3);
}

- (void)setResetableImportContext:(id)a3
{
  objc_storeStrong((id *)&self->_resetableImportContext, a3);
}

- (void)setLoggingContext:(id)a3
{
  objc_storeStrong((id *)&self->_loggingContext, a3);
}

- (void)setPlaybackContext:(id)a3
{
  objc_storeStrong((id *)&self->_playbackContext, a3);
}

- (PFManagedObjectContextMonitor)privateMonitor
{
  return self->_privateMonitor;
}

- (void)setPrivateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_privateMonitor, a3);
}

- (PFManagedObjectContextMonitor)importMonitor
{
  return self->_importMonitor;
}

- (void)setImportMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_importMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityNames, 0);
  objc_storeStrong((id *)&self->_notifiers, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_mergeNotifierQueue, 0);
  objc_storeStrong((id *)&self->_mergeQueue, 0);
  objc_storeStrong((id *)&self->_importMonitor, 0);
  objc_storeStrong((id *)&self->_privateMonitor, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_loggingContext, 0);
  objc_storeStrong((id *)&self->_resetableImportContext, 0);
  objc_storeStrong((id *)&self->_importContext, 0);
  objc_storeStrong((id *)&self->_storeContext, 0);
  objc_storeStrong((id *)&self->_carPlayContext, 0);
  objc_storeStrong((id *)&self->_privateQueueContext, 0);
  objc_storeStrong((id *)&self->_mainQueueContext, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
}

@end
