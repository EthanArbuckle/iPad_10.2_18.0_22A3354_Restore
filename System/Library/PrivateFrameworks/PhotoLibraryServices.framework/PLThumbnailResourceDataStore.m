@implementation PLThumbnailResourceDataStore

+ (unsigned)storeClassID
{
  return 1;
}

- (CGImage)newTableThumbImageForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGImage *v9;
  int v11;
  unsigned int v12;

  v11 = -1;
  v12 = 0;
  objc_msgSend(a3, "tableType:index:", &v12, &v11);
  -[PLThumbnailResourceDataStore thumbnailFormatsByTableType](self, "thumbnailFormatsByTableType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLThumbnailResourceDataStore thumbnailManager](self, "thumbnailManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbManagerForFormatID:", objc_msgSend(v6, "formatID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (CGImage *)objc_msgSend(v8, "createImageWithIdentifier:orIndex:", 0, v11);
  return v9;
}

- (PLThumbnailManager)thumbnailManager
{
  return (PLThumbnailManager *)-[PLLazyObject objectValue](self->_lazyThumbnailManager, "objectValue");
}

- (id)thumbnailFormatsByTableType
{
  return (id)-[PLLazyObject objectValue](self->_lazyThumbnailFormatsByTableType, "objectValue");
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return 5;
}

id __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)objc_opt_class();
    objc_msgSend(WeakRetained, "thumbnailFormats");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_tableFormatsByTableTypeFromFormats:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)thumbnailFormats
{
  NSArray *overridenThumbnailFormats;

  overridenThumbnailFormats = self->_overridenThumbnailFormats;
  if (overridenThumbnailFormats)
    return overridenThumbnailFormats;
  -[PLLazyObject objectValue](self->_lazyThumbnailFormats, "objectValue");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)_tableFormatsByTableTypeFromFormats:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dimension"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v3;
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v13, "isTable"))
        {
          if (objc_msgSend(v13, "isSquare"))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E375D8C0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E375D8D8);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
                continue;
              v16 = &unk_1E375D8D8;
            }
            else
            {
              v16 = &unk_1E375D8C0;
            }
          }
          else
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E375D8F0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E375D908);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
                continue;
              v16 = &unk_1E375D908;
            }
            else
            {
              v16 = &unk_1E375D8F0;
            }
          }
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v16);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v4;
}

- (PLThumbnailResourceDataStore)initWithPathManager:(id)a3
{
  id v5;
  PLThumbnailResourceDataStore *v6;
  PLThumbnailResourceDataStore *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  PLLazyObject *lazyThumbnailManager;
  id v14;
  id v15;
  uint64_t v16;
  PLLazyObject *lazyThumbnailFormats;
  id v18;
  id v19;
  uint64_t v20;
  PLLazyObject *lazyThumbnailFormatsByTableType;
  PLThumbnailIndexes *v22;
  PLThumbnailIndexes *thumbnailIndexes;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PLThumbnailResourceDataStore;
  v6 = -[PLResourceDataStore initWithPathManager:](&v34, sel_initWithPathManager_, v5);
  v7 = v6;
  if (v6)
  {
    -[PLResourceDataStore pathManager](v6, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLThumbnailResourceDataStore.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.pathManager"));

    }
    v9 = objc_initWeak(&location, v7);

    v10 = objc_alloc(MEMORY[0x1E0D73248]);
    v11 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke;
    v31[3] = &unk_1E36759D8;
    objc_copyWeak(&v32, &location);
    v12 = objc_msgSend(v10, "initWithRetriableBlock:", v31);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    lazyThumbnailManager = v7->_lazyThumbnailManager;
    v7->_lazyThumbnailManager = (PLLazyObject *)v12;

    v14 = objc_initWeak(&location, v7);
    v15 = objc_alloc(MEMORY[0x1E0D73248]);
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke_2;
    v28[3] = &unk_1E3670E50;
    objc_copyWeak(&v30, &location);
    v29 = v5;
    v16 = objc_msgSend(v15, "initWithRetriableBlock:", v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    lazyThumbnailFormats = v7->_lazyThumbnailFormats;
    v7->_lazyThumbnailFormats = (PLLazyObject *)v16;

    v18 = objc_initWeak(&location, v7);
    v19 = objc_alloc(MEMORY[0x1E0D73248]);
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke_3;
    v26[3] = &unk_1E36759D8;
    objc_copyWeak(&v27, &location);
    v20 = objc_msgSend(v19, "initWithRetriableBlock:", v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    lazyThumbnailFormatsByTableType = v7->_lazyThumbnailFormatsByTableType;
    v7->_lazyThumbnailFormatsByTableType = (PLLazyObject *)v20;

    v7->_observersLock._os_unfair_lock_opaque = 0;
    if (PLIsAssetsd())
    {
      v22 = objc_alloc_init(PLThumbnailIndexes);
      thumbnailIndexes = v7->_thumbnailIndexes;
      v7->_thumbnailIndexes = v22;

    }
  }

  return v7;
}

id __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_makeThumbnailManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_makeThumbnailManager
{
  PLThumbnailManager *v3;
  void *v4;
  PLThumbnailManager *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;

  v3 = [PLThumbnailManager alloc];
  -[PLResourceDataStore pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLThumbnailManager initWithPhotoLibraryPathManager:storeFromMigration:](v3, "initWithPhotoLibraryPathManager:storeFromMigration:", v4, 0);

  -[PLResourceDataStore pathManager](self, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = +[PLThumbnailManagerCore isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:](PLThumbnailManager, "isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:", v6);

  if ((_DWORD)v4)
    -[PLThumbnailResourceDataStore _startWatchingThumbnailConfigFile](self, "_startWatchingThumbnailConfigFile");
  if ((PLIsForegroundApplication() & 1) != 0 || MEMORY[0x19AEC0720]())
  {
    -[PLResourceDataStore pathManager](self, "pathManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PLThumbnailManagerCore isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:](PLThumbnailManager, "isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:", v7);

    if (v8)
      -[PLThumbnailResourceDataStore _installBackgroundWatcher](self, "_installBackgroundWatcher");
  }
  return v5;
}

- (void)_startWatchingThumbnailConfigFile
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  void *v5;
  id v6;
  int v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *configWatcherSource;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  unsigned int v18;
  _QWORD handler[4];
  id v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  if (!self->_configWatcherSource)
  {
    -[PLResourceDataStore pathManager](self, "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLThumbnailManagerCore thumbnailConfigurationPathWithPathManager:](PLThumbnailManager, "thumbnailConfigurationPathWithPathManager:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v5);
    v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0x8000);
    if (v7 < 0)
    {
      PLImageManagerGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v6;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to watch thumbnail config, cannot open file at path: %@", (uint8_t *)location, 0xCu);
      }
    }
    else
    {
      v8 = v7;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = dispatch_queue_create("com.apple.photos.thumbconfigwatcher", v10);
      v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DE8], v8, 1uLL, v11);
      configWatcherSource = self->_configWatcherSource;
      self->_configWatcherSource = v12;

      objc_initWeak(location, self);
      v14 = self->_configWatcherSource;
      v15 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __65__PLThumbnailResourceDataStore__startWatchingThumbnailConfigFile__block_invoke;
      handler[3] = &unk_1E3677D48;
      objc_copyWeak(&v20, location);
      dispatch_source_set_event_handler(v14, handler);
      v16 = self->_configWatcherSource;
      v17[0] = v15;
      v17[1] = 3221225472;
      v17[2] = __65__PLThumbnailResourceDataStore__startWatchingThumbnailConfigFile__block_invoke_2;
      v17[3] = &__block_descriptor_36_e5_v8__0l;
      v18 = v8;
      dispatch_source_set_cancel_handler(v16, v17);
      dispatch_resume((dispatch_object_t)self->_configWatcherSource);
      objc_destroyWeak(&v20);
      objc_destroyWeak(location);

    }
  }
  os_unfair_lock_unlock(p_observersLock);
}

- (void)_installBackgroundWatcher
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *clientBackgroundTransitionObserverToken;
  _QWORD v8[4];
  id v9;
  id location;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  if (!self->_clientBackgroundTransitionObserverToken)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    DCIM_applicationBackgroundedNotificationName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__PLThumbnailResourceDataStore__installBackgroundWatcher__block_invoke;
    v8[3] = &unk_1E3671BB0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, 0, v8);
    v6 = objc_claimAutoreleasedReturnValue();
    clientBackgroundTransitionObserverToken = self->_clientBackgroundTransitionObserverToken;
    self->_clientBackgroundTransitionObserverToken = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_observersLock);
}

id __52__PLThumbnailResourceDataStore_initWithPathManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[PLThumbnailManagerCore thumbnailFormatsForConfigPhase:withPathManager:](PLThumbnailManager, "thumbnailFormatsForConfigPhase:withPathManager:", 1, *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (PLImageTableEntryFooter_s)_tableFooterForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PLImageTableEntryFooter_s *v9;
  int v11;
  unsigned int v12;

  if (!a3)
    return 0;
  v11 = -1;
  v12 = 0;
  objc_msgSend(a3, "tableType:index:", &v12, &v11);
  -[PLThumbnailResourceDataStore thumbnailFormatsByTableType](self, "thumbnailFormatsByTableType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLThumbnailResourceDataStore thumbnailManager](self, "thumbnailManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "thumbManagerForFormatID:", objc_msgSend(v6, "formatID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = (PLImageTableEntryFooter_s *)objc_msgSend(v8, "tableFooterForIndex:", v11);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_stopWatchingThumbnailConfigFile
{
  os_unfair_lock_s *p_observersLock;
  NSObject *configWatcherSource;
  OS_dispatch_source *v5;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  configWatcherSource = self->_configWatcherSource;
  if (configWatcherSource)
  {
    dispatch_source_cancel(configWatcherSource);
    v5 = self->_configWatcherSource;
    self->_configWatcherSource = 0;

  }
  os_unfair_lock_unlock(p_observersLock);
}

- (void)invalidateThumbnailManager
{
  -[PLThumbnailResourceDataStore _stopWatchingThumbnailConfigFile](self, "_stopWatchingThumbnailConfigFile");
  -[PLLazyObject resetObject](self->_lazyThumbnailManager, "resetObject");
  -[PLLazyObject resetObject](self->_lazyThumbnailFormats, "resetObject");
  -[PLLazyObject resetObject](self->_lazyThumbnailFormatsByTableType, "resetObject");
}

- (void)overrideThumbnailFormatsWithFormatIDs:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *overridenThumbnailFormats;
  NSArray *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "intValue", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  overridenThumbnailFormats = self->_overridenThumbnailFormats;
  self->_overridenThumbnailFormats = v5;
  v13 = v5;

  -[PLLazyObject resetObject](self->_lazyThumbnailFormats, "resetObject");
  -[PLLazyObject resetObject](self->_lazyThumbnailFormatsByTableType, "resetObject");

}

- (void)dealloc
{
  NSObject *clientBackgroundTransitionObserverToken;
  void *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;

  clientBackgroundTransitionObserverToken = self->_clientBackgroundTransitionObserverToken;
  if (clientBackgroundTransitionObserverToken)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = clientBackgroundTransitionObserverToken;
    objc_msgSend(v4, "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", v5);

  }
  v7.receiver = self;
  v7.super_class = (Class)PLThumbnailResourceDataStore;
  -[PLThumbnailResourceDataStore dealloc](&v7, sel_dealloc);
}

- (id)name
{
  return CFSTR("Thumbnail");
}

- (id)descriptionForSubtype:(int64_t)a3
{
  return &stru_1E36789C0;
}

- (id)keyFromKeyStruct:(const void *)a3
{
  return -[PLThumbnailResourceDataStoreKey initWithKeyStruct:]([PLThumbnailResourceDataStoreKey alloc], "initWithKeyStruct:", a3);
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLThumbnailResourceDataStore.m"), 252, CFSTR("resourceDataForKey is not supported for PLThumbnailResourceDataStore."));

  return 0;
}

- (id)resourceURLForKey:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLThumbnailResourceDataStore.m"), 258, CFSTR("resourceURLForKey is not supported for PLThumbnailResourceDataStore."));

  return 0;
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  return 0;
}

- (id)virtualResourcesForAsset:(id)a3
{
  id v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  PLTableThumbnailVirtualResource *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  unint64_t v32;
  PLThumbnailResourceDataStoreKey *v33;
  id v34;
  int v35;
  unsigned __int8 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasTableThumbs") && (objc_msgSend(v4, "isDeleted") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(&unk_1E3763350, "count"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v6 = objc_msgSend(&unk_1E3763350, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (!v6)
      goto LABEL_4;
    v7 = v6;
    v8 = *(_QWORD *)v38;
LABEL_7:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v8)
        objc_enumerationMutation(&unk_1E3763350);
      v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v9);
      -[PLThumbnailResourceDataStore thumbnailFormatsByTableType](self, "thumbnailFormatsByTableType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12 || !objc_msgSend(v12, "isTable"))
        goto LABEL_24;
      v13 = objc_msgSend(v10, "longValue");
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", (2 * objc_msgSend(v12, "formatID")) | 0x30001);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PLVirtualResource initWithRecipe:forAsset:]([PLTableThumbnailVirtualResource alloc], "initWithRecipe:forAsset:", v14, v4);
      if (objc_msgSend(v12, "isSquare"))
        break;
      if (objc_msgSend(v12, "formatMode") == 2)
      {
        v18 = objc_msgSend(v4, "width");
        v19 = objc_msgSend(v4, "height");
        if (v18 <= v19)
          v20 = v19;
        else
          v20 = v18;
        v21 = (double)v20;
        objc_msgSend(v12, "dimension");
        v23 = v22 / v21;
        -[PLVirtualResource setUnorientedWidth:](v15, "setUnorientedWidth:", (uint64_t)(v23 * (double)objc_msgSend(v4, "width")));
        v17 = v23 * (double)objc_msgSend(v4, "height");
        goto LABEL_19;
      }
LABEL_20:
      v24 = objc_msgSend(v4, "width");
      if (objc_msgSend(v4, "height") * v24 < 1)
      {
        LODWORD(v25) = 0;
      }
      else
      {
        v26 = -[PLVirtualResource unorientedWidth](v15, "unorientedWidth");
        v27 = (float)(-[PLVirtualResource unorientedHeight](v15, "unorientedHeight") * v26);
        v28 = objc_msgSend(v4, "width");
        *(float *)&v25 = v27 / (float)(objc_msgSend(v4, "height") * v28);
      }
      -[PLVirtualResource setScale:](v15, "setScale:", v25);
      objc_msgSend(v14, "codecFourCharCodeName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLVirtualResource setCodecFourCharCodeName:](v15, "setCodecFourCharCodeName:", v29);

      objc_msgSend(v14, "uti");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLVirtualResource setUniformTypeIdentifier:](v15, "setUniformTypeIdentifier:", v30);

      -[PLVirtualResource setDataStore:](v15, "setDataStore:", self);
      -[PLVirtualResource setDataStoreSubtype:](v15, "setDataStoreSubtype:", v13);
      v36 = 0;
      v35 = 4 * (v13 & 7);
      v31 = objc_msgSend(v4, "effectiveThumbnailIndex");
      v32 = ((unint64_t)(v31 & 0x7FFFFFF) << 6) | v35 & 0x3F | ((unint64_t)v36 << 32) & 0xFFFFFFFE0000003FLL;
      v35 = (v31 << 6) | v35 & 0x3F;
      v36 = BYTE4(v32);
      v33 = -[PLThumbnailResourceDataStoreKey initWithKeyStruct:]([PLThumbnailResourceDataStoreKey alloc], "initWithKeyStruct:", &v35);
      -[PLVirtualResource setDataStoreKey:](v15, "setDataStoreKey:", v33);
      objc_msgSend(v34, "addObject:", v15);

LABEL_24:
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(&unk_1E3763350, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (!v7)
          goto LABEL_4;
        goto LABEL_7;
      }
    }
    objc_msgSend(v12, "dimension");
    -[PLVirtualResource setUnorientedWidth:](v15, "setUnorientedWidth:", (uint64_t)v16);
    objc_msgSend(v12, "dimension");
LABEL_19:
    -[PLVirtualResource setUnorientedHeight:](v15, "setUnorientedHeight:", (uint64_t)v17);
    goto LABEL_20;
  }
  v34 = (id)MEMORY[0x1E0C9AA60];
LABEL_4:

  return v34;
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E20], "set", a3, *(_QWORD *)&a4);
}

- (BOOL)canStoreExternalResource:(id)a3
{
  return 0;
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  return 0;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  id v7;
  void *v8;

  v7 = a6;
  objc_msgSend(a4, "localAvailability");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PLThumbnailResourceDataStore"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v8, 0, 0);

  return 0;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  return 0;
}

- (BOOL)thumbnailForKey:(id)a3 matchesAssetID:(id)a4
{
  id v6;
  PLImageTableEntryFooter_s *v7;
  PLImageTableEntryFooter_s *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a4;
  v7 = -[PLThumbnailResourceDataStore _tableFooterForKey:](self, "_tableFooterForKey:", a3);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73308]), "initWithCFUUIDBytes:", *(_QWORD *)&v8->var0.var0, *(_QWORD *)&v8->var0.var8);
    objc_msgSend(v6, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    free(v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PLThumbnailIndexes)thumbnailIndexes
{
  return (PLThumbnailIndexes *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBackgroundTransitionObserverToken, 0);
  objc_storeStrong((id *)&self->_configWatcherSource, 0);
  objc_storeStrong((id *)&self->_overridenThumbnailFormats, 0);
  objc_storeStrong((id *)&self->_lazyThumbnailFormatsByTableType, 0);
  objc_storeStrong((id *)&self->_lazyThumbnailFormats, 0);
  objc_storeStrong((id *)&self->_lazyThumbnailManager, 0);
  objc_storeStrong((id *)&self->_thumbnailIndexes, 0);
}

void __57__PLThumbnailResourceDataStore__installBackgroundWatcher__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateThumbnailManager");

}

void __65__PLThumbnailResourceDataStore__startWatchingThumbnailConfigFile__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "invalidateThumbnailManager");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("PLThumbnailResourceDataStoreThumbnailManagerConfigDidChange"), v3);

    WeakRetained = v3;
  }

}

uint64_t __65__PLThumbnailResourceDataStore__startWatchingThumbnailConfigFile__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

+ (id)supportedRecipes
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)resourceIsSquare:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "dataStoreSubtype") == 1 || objc_msgSend(v3, "dataStoreSubtype") == 0;

  return v4;
}

@end
