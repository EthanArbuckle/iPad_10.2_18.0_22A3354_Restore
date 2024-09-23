@implementation PLCacheDeleteRegistration

- (void)cameraWatcherDidChangeState:(id)a3
{
  NSObject *queue;
  id v5;
  NSObject *v6;
  NSMutableDictionary *fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary;
  NSMutableDictionary *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(queue) = objc_msgSend(v5, "isCameraRunning");

  if ((queue & 1) == 0 && self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary)
  {
    PLResourceCachingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Camera preview stopped, processing ccd purge notifications now", buf, 2u);
    }

    fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary = self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PLCacheDeleteRegistration_cameraWatcherDidChangeState___block_invoke;
    v9[3] = &unk_1E3667488;
    v9[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary, "enumerateKeysAndObjectsUsingBlock:", v9);
    v8 = self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary;
    self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary = 0;

  }
}

- (PLCacheDeleteRegistration)init
{
  PLCacheDeleteRegistration *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cacheDeleteSupportByLibraryURL;
  NSMutableDictionary *v5;
  NSMutableDictionary *notificationIDsByLibraryURL;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  PFCameraViewfinderSessionWatcher *cameraWatcher;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PLCacheDeleteRegistration;
  v2 = -[PLCacheDeleteRegistration init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cacheDeleteSupportByLibraryURL = v2->_cacheDeleteSupportByLibraryURL;
    v2->_cacheDeleteSupportByLibraryURL = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    notificationIDsByLibraryURL = v2->_notificationIDsByLibraryURL;
    v2->_notificationIDsByLibraryURL = v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.photos.cacheDelete", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D750E0]), "initWithDispatchQueue:delegate:", v2->_queue, v2);
    cameraWatcher = v2->_cameraWatcher;
    v2->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v10;

    -[PFCameraViewfinderSessionWatcher startWatching](v2->_cameraWatcher, "startWatching");
  }
  return v2;
}

- (void)registerCacheDeleteSupport:(id)a3 withLibraryServicesManager:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PLCacheDeleteRegistration *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PLCacheDeleteRegistration_registerCacheDeleteSupport_withLibraryServicesManager___block_invoke;
  block[3] = &unk_1E3677530;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)unregisterCacheDeleteSupport:(id)a3 withLibraryServicesManager:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  PLCacheDeleteRegistration *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__PLCacheDeleteRegistration_unregisterCacheDeleteSupport_withLibraryServicesManager___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)_registerResourceDirectories
{
  id v3;
  NSMutableDictionary *cacheDeleteSupportByLibraryURL;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  const __CFString *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  cacheDeleteSupportByLibraryURL = self->_cacheDeleteSupportByLibraryURL;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke;
  v17[3] = &unk_1E36673F8;
  v6 = v3;
  v18 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cacheDeleteSupportByLibraryURL, "enumerateKeysAndObjectsUsingBlock:", v17);
  PLResourceCachingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Current resource directories %@", buf, 0xCu);
  }

  v19 = CFSTR("CACHE_DELETE_PURGE_NOTIFICATION");
  v20 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_52;
  v16[3] = &unk_1E3667420;
  v16[4] = self;
  v9 = (void *)MEMORY[0x19AEC174C](v16);
  v10 = CacheDeleteRegister();
  PLResourceCachingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "Failed to register with CacheDelete for purge notifications";
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_199541000, v14, v15, v13, buf, 2u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v13 = "Registered for CacheDelete purge notifications";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }

}

- (void)_processRemovedFiles:(id)a3 withCacheDeleteSupport:(id)a4 forLibraryURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PLCacheDeleteRegistration *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__PLCacheDeleteRegistration__processRemovedFiles_withCacheDeleteSupport_forLibraryURL___block_invoke;
  v15[3] = &unk_1E3677998;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)_replaceCameraWatcherWith:(id)a3
{
  PFCameraViewfinderSessionWatcher *v4;
  PFCameraViewfinderSessionWatcher *cameraWatcher;

  v4 = (PFCameraViewfinderSessionWatcher *)a3;
  -[PFCameraViewfinderSessionWatcher stopWatching](self->_cameraWatcher, "stopWatching");
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = v4;

}

- (id)_getInternalQueue
{
  return self->_queue;
}

- (void)_setCacheDeleteSupport:(id)a3 forLibrary:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheDeleteSupportByLibraryURL, "setObject:forKeyedSubscript:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileIDsAndPurgedPathsReceivedWhileCameraIsStreamingPerLibrary, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationIDsByLibraryURL, 0);
  objc_storeStrong((id *)&self->_cacheDeleteSupportByLibraryURL, 0);
}

void __57__PLCacheDeleteRegistration_cameraWatcherDidChangeState___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markAsNotLocallyAvailableForResourcesWithFileIDsToPath:", v5);

}

void __87__PLCacheDeleteRegistration__processRemovedFiles_withCacheDeleteSupport_forLibraryURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  PLResourceCachingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v34 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Processing %ld events", buf, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v26 = v4;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rescan"), v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          PLResourceCachingGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Missing history events, rescanning whole file system", buf, 2u);
          }

          PLSimulateCrash();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_60_26706);
          v4 = v26;
          objc_msgSend(v26, "removeAllObjects");
          goto LABEL_21;
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("historyDone"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          PLResourceCachingGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          v4 = v26;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "No more purge events to handle", buf, 2u);
          }

          goto LABEL_21;
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("path"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("fileID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 48), "isFilePurgedForFileID:purgedPath:", v13, v12))
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v12, v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v4 = v26;
      if (v6)
        continue;
      break;
    }
  }
LABEL_21:

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "isCameraRunning") & 1) != 0)
  {
    PLResourceCachingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Camera preview is running, delaying acting on purge notification till preview stops", buf, 2u);
    }

    v17 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      v17 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKeyedSubscript:", v22, *(_QWORD *)(a1 + 56));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24 >> 4 > 0x270)
    {
      PLResourceCachingGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = (uint64_t)v4;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "More than 10,000 ccd notifications already pending, ignoring these: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
      v25 = objc_claimAutoreleasedReturnValue();
      -[NSObject addEntriesFromDictionary:](v25, "addEntriesFromDictionary:", v4);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "markAsNotLocallyAvailableForResourcesWithFileIDsToPath:", v4);
  }

}

uint64_t __87__PLCacheDeleteRegistration__processRemovedFiles_withCacheDeleteSupport_forLibraryURL___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "rescanResourcesFromFileSystem");
}

void __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "purgeableDirectories");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

uint64_t __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_52(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLResourceCachingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = a2;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "got notifications: %@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_53;
  v8[3] = &unk_1E36673F8;
  v8[4] = v5;
  return objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);
}

void __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLResourceCachingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "enumerating directories for notification ID: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v6, "purgeableDirectories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v11 = v5;
  v12 = v6;
  CacheDeleteEnumerateRemovedFilesInDirectories();

}

uint64_t __57__PLCacheDeleteRegistration__registerResourceDirectories__block_invoke_54(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processRemovedFiles:withCacheDeleteSupport:forLibraryURL:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __85__PLCacheDeleteRegistration_unregisterCacheDeleteSupport_withLibraryServicesManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", 0, v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", 0, v3);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "count"))
      objc_msgSend(*(id *)(a1 + 40), "_registerResourceDirectories");
    else
      CacheDeleteRegister();
  }
  else
  {
    PLResourceCachingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Missing libraryURL to unregister ", v5, 2u);
    }

  }
}

void __83__PLCacheDeleteRegistration_registerCacheDeleteSupport_withLibraryServicesManager___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCentralizedCacheDeleteCapable");

    if ((v5 & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1E0D731D8];
      objc_msgSend(v3, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mountPointForPath:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        PLResourceCachingGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v3;
          v18 = "Failed to get mount point for libraryURL %@";
LABEL_34:
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
        }
LABEL_35:

        goto LABEL_36;
      }
      objc_msgSend(*((id *)a1[5] + 1), "objectForKeyedSubscript:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      PLResourceCachingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (!v11)
          goto LABEL_17;
        *(_DWORD *)buf = 138412290;
        v30 = v3;
        v12 = "Replacing cache delete support for libraryURL %@";
      }
      else
      {
        if (!v11)
          goto LABEL_17;
        *(_DWORD *)buf = 138412290;
        v30 = v3;
        v12 = "Adding cache delete support for libraryURL %@";
      }
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_17:

      objc_msgSend(*((id *)a1[5] + 1), "setObject:forKeyedSubscript:", a1[6], v3);
      if (objc_msgSend(a1[4], "wellKnownPhotoLibraryIdentifier") == 1)
      {
        v17 = CFSTR("com.apple.assetsd.purgeNotification");
LABEL_21:
        objc_msgSend(*((id *)a1[5] + 2), "setObject:forKeyedSubscript:", v17, v3);
        objc_msgSend(a1[6], "purgeableDirectories");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        PLResourceCachingGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v30 = v3;
          v31 = 2112;
          v32 = v8;
          v33 = 2112;
          v34 = v20;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Listen for purge notifications on libraryURL %@ (mount point: %@) and resource directories %@", buf, 0x20u);
        }

        CacheDeleteInitPurgeMarker();
        objc_msgSend(a1[5], "_registerResourceDirectories");
        PLResourceCachingGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Processing purging events at start up", buf, 2u);
        }

        v26 = a1[6];
        v27 = v3;
        CacheDeleteEnumerateRemovedFilesInDirectories();

        goto LABEL_35;
      }
      if (objc_msgSend(a1[4], "wellKnownPhotoLibraryIdentifier") == 3)
      {
        objc_msgSend(CFSTR("com.apple.assetsd.purgeNotification"), "stringByAppendingFormat:", CFSTR(".%lu"), objc_msgSend(a1[4], "wellKnownPhotoLibraryIdentifier"));
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
          goto LABEL_21;
      }
      else
      {
        v28 = 0;
        +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:](PLPhotoLibraryIdentifier, "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:", v3, 1, &v28);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v28;
        if (v23)
        {
          objc_msgSend(v23, "uuid");
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("com.apple.assetsd.purgeNotification"), "stringByAppendingFormat:", CFSTR(".%@"), v25);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          PLResourceCachingGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v3;
            v31 = 2112;
            v32 = v24;
            _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Unable to get library identifier for cache delete purge notification ID: %@, error: %@", buf, 0x16u);
          }
          v17 = 0;
        }

        if (v17)
          goto LABEL_21;
      }
      PLResourceCachingGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v3;
        v18 = "Couldn't derive purgeNotificationID for libraryURL %@";
        goto LABEL_34;
      }
      goto LABEL_35;
    }
    PLResourceCachingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v3;
      v13 = "%@ does not support CCD";
      v14 = v8;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    PLResourceCachingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "Missing libraryURL to listen for purge notifications";
      v14 = v8;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 2;
LABEL_11:
      _os_log_impl(&dword_199541000, v14, v15, v13, buf, v16);
    }
  }
LABEL_36:

}

uint64_t __83__PLCacheDeleteRegistration_registerCacheDeleteSupport_withLibraryServicesManager___block_invoke_41(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processRemovedFiles:withCacheDeleteSupport:forLibraryURL:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)registerDefaultHandlers
{
  NSObject *v2;
  uint8_t v3[16];

  PLResourceCachingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "CacheDelete registerDefaultHandler", v3, 2u);
  }

  CacheDeleteRegister();
}

+ (void)registerSpecialCaseHandler
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t v12[16];
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PLCacheDeleteRegistration_registerSpecialCaseHandler__block_invoke;
  v14[3] = &__block_descriptor_40_e45_____CFDictionary__20__0i8____CFDictionary__12l;
  v14[4] = a1;
  v4 = (void *)MEMORY[0x19AEC174C](v14, a2);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __55__PLCacheDeleteRegistration_registerSpecialCaseHandler__block_invoke_30;
  v13[3] = &__block_descriptor_40_e45_____CFDictionary__20__0i8____CFDictionary__12l;
  v13[4] = a1;
  v5 = (void *)MEMORY[0x19AEC174C](v13);
  v6 = CacheDeleteRegister();
  PLResourceCachingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      v9 = "Failed to register with CacheDelete for purge UrgencySpecialCase";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_199541000, v10, v11, v9, v12, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    v9 = "Registered with CacheDelete for purge UrgencySpecialCase";
    v10 = v8;
    v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

}

+ (id)cacheDeleteUrgencySpecialCasePhotoLibrary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryURLForIdentifier:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openBundleAtLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v6 = objc_msgSend(v5, "activate:", &v14);
  v7 = v14;
  v8 = v7;
  if (v6
    && (v7,
        v13 = 0,
        v9 = objc_msgSend(v5, "awaitLibraryState:error:", 7, &v13),
        v8 = v13,
        v9))
  {
    objc_msgSend(v5, "databaseContext");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)-[NSObject newShortLivedLibraryWithName:](v10, "newShortLivedLibraryWithName:", "CacheDelete UrgencySpecialCase");
  }
  else
  {
    PLResourceCachingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to photo library for CacheDelete: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

uint64_t __55__PLCacheDeleteRegistration_registerSpecialCaseHandler__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLResourceCachingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2 != 4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Called by CacheDelete to purge but NOT UrgencySpecialCase...", buf, 2u);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = (unint64_t)v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Called by CacheDelete to purge UrgencySpecialCase... amount: %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "cacheDeleteUrgencySpecialCasePhotoLibrary");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!infoVolumeMatchesLibrary(v5, v7))
  {
    PLResourceCachingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "CacheDelete purge volume does not match the photo library", buf, 2u);
    }

LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  -[NSObject thumbnailManager](v7, "thumbnailManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject managedObjectContext](v7, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "removeAllThumbnailsInContextForUrgentCacheDeleteRequest:dryRun:count:", v10, 0, 0);

  PLResourceCachingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "purged for CacheDelete UrgencySpecialCase: %lld in thumbnails", buf, 0xCu);
  }

  v13 = v11 & ~(v11 >> 63);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedLongLongValue");

  if (v15 > v13)
  {
    v16 = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:](PLDiskSpaceManagement, "performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:", v15 - v13, 1, 0, v7);
    PLResourceCachingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v26 = v16;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "purged for CacheDelete UrgencySpecialCase: %llu in shared streams", buf, 0xCu);
    }

    v13 += v16;
  }
LABEL_17:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v24[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v21 = objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __55__PLCacheDeleteRegistration_registerSpecialCaseHandler__block_invoke_30(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 != 4)
  {
    PLResourceCachingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Called by CacheDelete to find purgeable but NOT UrgencySpecialCase", buf, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "cacheDeleteUrgencySpecialCasePhotoLibrary");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!infoVolumeMatchesLibrary(v5, v6))
  {
    PLResourceCachingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "CacheDelete purgeable volume does not match the photo library", buf, 2u);
    }

LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  -[NSObject thumbnailManager](v6, "thumbnailManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "removeAllThumbnailsInContextForUrgentCacheDeleteRequest:dryRun:count:", 0, 1, 0);

  PLResourceCachingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v8;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Called by CacheDelete to find purgeable for UrgencySpecialCase: %lld in thumbnails", buf, 0xCu);
  }

  v10 = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:](PLDiskSpaceManagement, "performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:", 0, 0, 0, v6);
  PLResourceCachingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v10;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Called by CacheDelete to find purgeable for UrgencySpecialCase: %llu in shared streams", buf, 0xCu);
  }

  v12 = v10 + v8;
LABEL_14:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v16 = objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
