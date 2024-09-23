@implementation PLFileSystemVolumeManager

- (id)initSharedVolumeManager
{
  PLFileSystemVolumeManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *synchronizationQueue;
  NSFileManager *v6;
  NSFileManager *fileManager;
  NSMutableDictionary *v8;
  NSMutableDictionary *mountedVolumeURLsByUuid;
  NSMutableDictionary *v10;
  NSMutableDictionary *registeredFileSystemVolumesByUuid;
  uint64_t v12;
  NSMapTable *mocsByVolume;
  NSObject *v14;
  _QWORD block[4];
  PLFileSystemVolumeManager *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PLFileSystemVolumeManager;
  v2 = -[PLFileSystemVolumeManager init](&v18, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("PLFileSystemVolumeManager", v3);
    synchronizationQueue = v2->_synchronizationQueue;
    v2->_synchronizationQueue = (OS_dispatch_queue *)v4;

    v6 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
    fileManager = v2->_fileManager;
    v2->_fileManager = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mountedVolumeURLsByUuid = v2->_mountedVolumeURLsByUuid;
    v2->_mountedVolumeURLsByUuid = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registeredFileSystemVolumesByUuid = v2->_registeredFileSystemVolumesByUuid;
    v2->_registeredFileSystemVolumesByUuid = v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    mocsByVolume = v2->_mocsByVolume;
    v2->_mocsByVolume = (NSMapTable *)v12;

    v14 = v2->_synchronizationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PLFileSystemVolumeManager_initSharedVolumeManager__block_invoke;
    block[3] = &unk_1E3677AA0;
    v17 = v2;
    dispatch_sync(v14, block);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLFileSystemVolumeManager;
  -[PLFileSystemVolumeManager dealloc](&v2, sel_dealloc);
}

- (id)volumeForURL:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *synchronizationQueue;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  PLFileSystemVolumeManager *v29;
  uint64_t *v30;
  _QWORD block[5];
  id v32;
  id v33;
  uint64_t *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__7460;
  v41 = __Block_byref_object_dispose__7461;
  v42 = 0;
  v36 = 0;
  v8 = *MEMORY[0x1E0C99D10];
  v35 = 0;
  v9 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v36, v8, &v35);
  v10 = v36;
  v11 = v35;
  if (v9)
  {
    v12 = MEMORY[0x1E0C809B0];
    synchronizationQueue = self->_synchronizationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLFileSystemVolumeManager_volumeForURL_context___block_invoke;
    block[3] = &unk_1E3676EC8;
    block[4] = self;
    v14 = v10;
    v32 = v14;
    v15 = v7;
    v33 = v15;
    v34 = &v37;
    dispatch_sync(synchronizationQueue, block);
    if (!v38[5])
    {
      +[PLFileSystemVolume fetchRequest](PLFileSystemVolume, "fetchRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("volumeUuidString"), v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPredicate:", v17);

      objc_msgSend(v16, "setIncludesPendingChanges:", 1);
      v24[0] = v12;
      v24[1] = 3221225472;
      v24[2] = __50__PLFileSystemVolumeManager_volumeForURL_context___block_invoke_2;
      v24[3] = &unk_1E3668940;
      v25 = v15;
      v18 = v16;
      v26 = v18;
      v30 = &v37;
      v27 = v6;
      v28 = v14;
      v29 = self;
      objc_msgSend(v25, "performBlockAndWait:", v24);

    }
  }
  else
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v6;
      v45 = 2112;
      v46 = v11;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error getting volume UUID string for URL %@: %@", buf, 0x16u);
    }

  }
  v20 = (void *)v38[5];
  if (!v20)
  {
    PLBackendGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v6;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Unable to find or create a PLFileSystemVolume for URL %@", buf, 0xCu);
    }

    v20 = (void *)v38[5];
  }
  v22 = v20;

  _Block_object_dispose(&v37, 8);
  return v22;
}

- (void)registerPLFileSystemVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *synchronizationQueue;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  PLFileSystemVolumeManager *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "volumeUuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7460;
  v24 = __Block_byref_object_dispose__7461;
  v25 = 0;
  if (v5)
  {
    synchronizationQueue = self->_synchronizationQueue;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __56__PLFileSystemVolumeManager_registerPLFileSystemVolume___block_invoke;
    v15 = &unk_1E3676EC8;
    v16 = self;
    v17 = v5;
    v8 = v4;
    v18 = v8;
    v19 = &v20;
    dispatch_sync(synchronizationQueue, &v12);
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v21[5];
      *(_DWORD *)buf = 134218242;
      v27 = v8;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Setting PLFileSystemVolume %p URL to %@", buf, 0x16u);
    }

    objc_msgSend(v8, "setUrl:", v21[5], v12, v13, v14, v15, v16);
  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v4;
      v28 = 2114;
      v29 = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Unable to register volume %{public}@ with uuid %{public}@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v20, 8);

}

- (void)unregisterPLFileSystemVolume:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *synchronizationQueue;
  _QWORD block[5];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "volumeUuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Unregistering volume with uuid %@", buf, 0xCu);
  }

  if (v5)
  {
    synchronizationQueue = self->_synchronizationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLFileSystemVolumeManager_unregisterPLFileSystemVolume___block_invoke;
    block[3] = &unk_1E3677530;
    block[4] = self;
    v9 = v5;
    v10 = v4;
    dispatch_sync(synchronizationQueue, block);

  }
}

- (void)_updateOfflineStates
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMapTable *mocsByVolume;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *obj;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_synchronizationQueue);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_registeredFileSystemVolumesByUuid;
  v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(obj);
        v24 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_mountedVolumeURLsByUuid, "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        PLBackendGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v37 = v4;
          v38 = 2112;
          v39 = v5;
          _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "volumeURL for uuid %@ is %@", buf, 0x16u);
        }

        -[NSMutableDictionary objectForKey:](self->_registeredFileSystemVolumesByUuid, "objectForKey:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v23 = v7;
        objc_msgSend(v7, "allObjects");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v28 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              mocsByVolume = self->_mocsByVolume;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMapTable objectForKey:](mocsByVolume, "objectForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v13, "managedObjectContext");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16 != v17)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFileSystemVolumeManager.m"), 206, CFSTR("volume's MOC should match the one I stored"));

                }
                v25[0] = MEMORY[0x1E0C809B0];
                v25[1] = 3221225472;
                v25[2] = __49__PLFileSystemVolumeManager__updateOfflineStates__block_invoke;
                v25[3] = &unk_1E3677C18;
                v25[4] = v13;
                v26 = v5;
                objc_msgSend(v16, "performBlock:", v25);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v10);
        }

        v3 = v24 + 1;
      }
      while (v24 + 1 != v22);
      v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v22);
  }

}

- (void)_updateMountedVolumeURLs
{
  uint64_t v3;
  void *v4;
  void *v5;
  PLFileSystemVolumeManager *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id obj;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_synchronizationQueue);
  v3 = *MEMORY[0x1E0C99D10];
  v22[0] = *MEMORY[0x1E0C99D10];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileManager mountedVolumeURLsIncludingResourceValuesForKeys:options:](self->_fileManager, "mountedVolumeURLsIncludingResourceValuesForKeys:options:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  -[NSMutableDictionary removeAllObjects](self->_mountedVolumeURLsByUuid, "removeAllObjects");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v16 = 0;
        objc_msgSend(v11, "resourceValuesForKeys:error:", v4, &v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v16;
        objc_msgSend(v12, "objectForKeyedSubscript:", v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_mountedVolumeURLsByUuid, "setObject:forKeyedSubscript:", v11, v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mocsByVolume, 0);
  objc_storeStrong((id *)&self->_registeredFileSystemVolumesByUuid, 0);
  objc_storeStrong((id *)&self->_mountedVolumeURLsByUuid, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
}

void __49__PLFileSystemVolumeManager__updateOfflineStates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 != *(void **)(a1 + 40)
    && (!objc_msgSend(v2, "isEqual:") || (objc_msgSend(*(id *)(a1 + 40), "isEqual:", v3) & 1) == 0))
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 134218498;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Updating PLFileSystemVolume %p URL from %@ to %@", (uint8_t *)&v8, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setUrl:", *(_QWORD *)(a1 + 40));
  }

}

void __58__PLFileSystemVolumeManager_unregisterPLFileSystemVolume___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "removeObject:", a1[6]);
  v2 = *(void **)(a1[4] + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

void __56__PLFileSystemVolumeManager_registerPLFileSystemVolume___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));
    v2 = v9;
  }
  v10 = v2;
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, v5);

  objc_msgSend(*(id *)(a1 + 32), "_updateOfflineStates");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __50__PLFileSystemVolumeManager_volumeForURL_context___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v2, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "managedObjectContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)a1[6];

        if (v9 == v10)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

void __50__PLFileSystemVolumeManager_volumeForURL_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v18 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  objc_msgSend(v4, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v9 = *(void **)(a1 + 48);
    v17 = 0;
    v10 = *MEMORY[0x1E0C99C40];
    v16 = 0;
    objc_msgSend(v9, "getResourceValue:forKey:error:", &v17, v10, &v16);
    v11 = v17;
    v12 = v16;
    +[PLManagedObject insertInManagedObjectContext:](PLFileSystemVolume, "insertInManagedObjectContext:", *(_QWORD *)(a1 + 32));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setVolumeUuidString:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setName:", v11);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 64), "registerPLFileSystemVolume:");

  }
}

uint64_t __52__PLFileSystemVolumeManager_initSharedVolumeManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMountedVolumeURLs");
}

+ (id)sharedFileSystemVolumeManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PLFileSystemVolumeManager_sharedFileSystemVolumeManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFileSystemVolumeManager_onceToken != -1)
    dispatch_once(&sharedFileSystemVolumeManager_onceToken, block);
  return (id)sFileSystemVolumeManager;
}

void __58__PLFileSystemVolumeManager_sharedFileSystemVolumeManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initSharedVolumeManager");
  v2 = (void *)sFileSystemVolumeManager;
  sFileSystemVolumeManager = v1;

}

@end
