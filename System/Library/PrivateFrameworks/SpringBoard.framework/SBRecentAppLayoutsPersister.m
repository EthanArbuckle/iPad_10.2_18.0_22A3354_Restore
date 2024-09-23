@implementation SBRecentAppLayoutsPersister

- (void)setRecents:(id)a3
{
  NSArray *v4;
  NSArray *recents;
  NSTimer *v6;
  NSTimer *persistTimer;
  id v8;

  v8 = a3;
  BSDispatchQueueAssertMain();
  if (!-[NSArray isEqualToArray:](self->_recents, "isEqualToArray:", v8))
  {
    v4 = (NSArray *)objc_msgSend(v8, "copy");
    recents = self->_recents;
    self->_recents = v4;

    if (!self->_persistTimer)
    {
      -[SBRecentAppLayoutsPersister _scheduledPersistTimer](self, "_scheduledPersistTimer");
      v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      persistTimer = self->_persistTimer;
      self->_persistTimer = v6;

    }
  }

}

- (id)_scheduledPersistTimer
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__persistTimerExpired_, 0, 0, 10.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTolerance:", 5.0);
  return v2;
}

- (SBRecentAppLayoutsPersister)initWithPersistenceURL:(id)a3
{
  id v4;
  SBRecentAppLayoutsPersister *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *ioQueue;
  uint64_t v8;
  NSURL *persistenceURL;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBRecentAppLayoutsPersister;
  v5 = -[SBRecentAppLayoutsPersister init](&v13, sel_init);
  if (v5)
  {
    BSDispatchQueueAssertMain();
    v6 = dispatch_queue_create("com.apple.springboard.SBRecentAppLayoutsPersistence.IOQueue", 0);
    ioQueue = v5->_ioQueue;
    v5->_ioQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(v4, "copy");
    persistenceURL = v5->_persistenceURL;
    v5->_persistenceURL = (NSURL *)v8;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](v5->_persistenceURL, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_initializedNewStoreOnDisk = objc_msgSend(v10, "fileExistsAtPath:", v11) ^ 1;

    -[SBRecentAppLayoutsPersister _loadRecents](v5, "_loadRecents");
  }

  return v5;
}

- (BOOL)initializedNewStoreOnDisk
{
  BSDispatchQueueAssertMain();
  return self->_initializedNewStoreOnDisk;
}

- (void)syncToDiskSoonIfDirty
{
  BSDispatchQueueAssertMain();
  if (self->_persistTimer)
    -[SBRecentAppLayoutsPersister _enqueueDiskWrite](self, "_enqueueDiskWrite");
}

- (void)syncToDiskSynchronously
{
  NSTimer *persistTimer;
  void *v4;
  NSObject *ioQueue;
  id v6;
  void *v7;
  void *v8;

  BSDispatchQueueAssertMain();
  -[NSTimer invalidate](self->_persistTimer, "invalidate");
  persistTimer = self->_persistTimer;
  self->_persistTimer = 0;

  -[NSArray bs_map:](self->_recents, "bs_map:", &__block_literal_global_102);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ioQueue = self->_ioQueue;
  v8 = v4;
  v6 = v4;
  v7 = (void *)BSDispatchBlockCreateWithQualityOfService();
  dispatch_sync(ioQueue, v7);

}

uint64_t __54__SBRecentAppLayoutsPersister_syncToDiskSynchronously__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobufRepresentation");
}

uint64_t __54__SBRecentAppLayoutsPersister_syncToDiskSynchronously__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_writeCompressedProtobufRepresentationToDisk:", *(_QWORD *)(a1 + 40));
}

- (void)_loadRecents
{
  void (**v3)(_QWORD);
  NSURL *persistenceURL;
  void *v5;
  id v6;
  void *v7;
  NSURL *v8;
  NSURL *v9;
  uint64_t v10;
  SBPBAppLayoutList *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSURL *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSURL *v25;
  void *v26;
  SBPBAppLayoutList *v27;
  void *v28;
  NSURL *v29;
  void *v30;
  void *v31;
  void (**v32)(_QWORD);
  SBRecentAppLayoutsPersister *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  _QWORD v40[6];
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  NSURL *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __43__SBRecentAppLayoutsPersister__loadRecents__block_invoke;
  v40[3] = &unk_1E8E9DE88;
  v40[4] = self;
  v40[5] = a2;
  v3 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v40);
  v33 = self;
  persistenceURL = self->_persistenceURL;
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", persistenceURL, 0, &v39);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v39;
  if (v5)
  {
    v38 = 0;
    objc_msgSend(v5, "decompressedDataUsingAlgorithm:error:", 0, &v38);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSURL *)v38;
    v9 = v8;
    if (v7)
    {
      v29 = v8;
      v31 = v5;
      v32 = v3;
      v30 = v7;
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v7);
      v11 = objc_alloc_init(SBPBAppLayoutList);
      v28 = (void *)v10;
      -[SBPBAppLayoutList readFrom:](v11, "readFrom:", v10);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v27 = v11;
      -[SBPBAppLayoutList applayouts]((uint64_t)v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v13);
            v18 = *(NSURL **)(*((_QWORD *)&v34 + 1) + 8 * i);
            +[SBAppLayout appLayoutWithProtobufRepresentation:](SBAppLayout, "appLayoutWithProtobufRepresentation:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v12, "addObject:", v19);
            }
            else
            {
              SBLogAppSwitcher();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                _SBFLoggingMethodProem();
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v43 = v21;
                v44 = 2114;
                v45 = v18;
                _os_log_error_impl(&dword_1D0540000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Couldn't derive app layout from Protobuf representation: %{public}@", buf, 0x16u);

              }
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        }
        while (v15);
      }

      -[SBRecentAppLayoutsPersister setRecents:](v33, "setRecents:", v12);
      v5 = v31;
      v3 = v32;
      v7 = v30;
      v9 = v29;
    }
    else
    {
      SBLogAppSwitcher();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        _SBFLoggingMethodProem();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v26;
        v44 = 2114;
        v45 = v9;
        _os_log_error_impl(&dword_1D0540000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Error decompressing recents: %{public}@", buf, 0x16u);

      }
      v3[2](v3);
    }

  }
  else
  {
    SBLogAppSwitcher();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v33->_persistenceURL;
      *(_DWORD *)buf = 138543874;
      v43 = v24;
      v44 = 2114;
      v45 = v25;
      v46 = 2114;
      v47 = v6;
      _os_log_error_impl(&dword_1D0540000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Error reading recents from %{public}@: %{public}@", buf, 0x20u);

    }
    v3[2](v3);
  }

}

void __43__SBRecentAppLayoutsPersister__loadRecents__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  SBLogAppSwitcher();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "%{public}@ Using empty switcher model to recover from error with persisted switcher model", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setRecents:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v13 = 0;
  v6 = objc_msgSend(v4, "removeItemAtURL:error:", v5, &v13);
  v7 = v13;

  SBLogAppSwitcher();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    _SBFLoggingMethodProem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v12;
    v18 = 2114;
    v19 = v7;
    _os_log_error_impl(&dword_1D0540000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Error removing faulty switcher model from %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "%{public}@ Removed faulty switcher model from %{public}@", buf, 0x16u);
LABEL_6:

  }
LABEL_8:

}

- (void)_enqueueDiskWrite
{
  NSTimer *persistTimer;
  void *v4;
  NSObject *ioQueue;
  id v6;
  void *v7;
  void *v8;

  BSDispatchQueueAssertMain();
  -[NSTimer invalidate](self->_persistTimer, "invalidate");
  persistTimer = self->_persistTimer;
  self->_persistTimer = 0;

  -[NSArray bs_map:](self->_recents, "bs_map:", &__block_literal_global_11_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ioQueue = self->_ioQueue;
  v8 = v4;
  v6 = v4;
  v7 = (void *)BSDispatchBlockCreateWithQualityOfService();
  dispatch_async(ioQueue, v7);

}

uint64_t __48__SBRecentAppLayoutsPersister__enqueueDiskWrite__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobufRepresentation");
}

uint64_t __48__SBRecentAppLayoutsPersister__enqueueDiskWrite__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_writeCompressedProtobufRepresentationToDisk:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_writeCompressedProtobufRepresentationToDisk:(id)a3
{
  NSObject *ioQueue;
  id v5;
  SBPBAppLayoutList *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSURL *v11;
  NSURL *persistenceURL;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSURL *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSURL *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  ioQueue = self->_ioQueue;
  v5 = a3;
  dispatch_assert_queue_V2(ioQueue);
  v6 = objc_alloc_init(SBPBAppLayoutList);
  v7 = (void *)objc_msgSend(v5, "mutableCopy");

  -[SBPBAppLayoutList setApplayouts:]((uint64_t)v6, v7);
  v8 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  -[SBPBAppLayoutList writeTo:](v6, "writeTo:", v8);
  objc_msgSend(v8, "immutableData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v9, "compressedDataUsingAlgorithm:error:", 0, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSURL *)v20;
  if (v10)
  {
    persistenceURL = self->_persistenceURL;
    v19 = 0;
    v13 = objc_msgSend(v10, "writeToURL:options:error:", persistenceURL, 268435457, &v19);
    v14 = v19;
    if ((v13 & 1) == 0)
    {
      SBLogAppSwitcher();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        _SBFLoggingMethodProem();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = self->_persistenceURL;
        *(_DWORD *)buf = 138543874;
        v22 = v17;
        v23 = 2112;
        v24 = v18;
        v25 = 2112;
        v26 = v14;
        _os_log_error_impl(&dword_1D0540000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Error writing recents to %@: %@", buf, 0x20u);

      }
    }
  }
  else
  {
    SBLogAppSwitcher();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v11;
      _os_log_error_impl(&dword_1D0540000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Error compressing data: %@", buf, 0x16u);

    }
  }

}

- (NSArray)recents
{
  return self->_recents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_persistTimer, 0);
  objc_storeStrong((id *)&self->_persistenceURL, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end
