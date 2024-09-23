@implementation TPFileStorageManager

- (id)imageWithName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[TPFileStorageManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__TPFileStorageManager_imageWithName___block_invoke;
  block[3] = &unk_1E75FD3B8;
  block[4] = self;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  dispatch_sync(v5, block);

  v7 = (void *)v14[5];
  if (!v7)
  {
    -[TPFileStorageManager clearLegacyStorageIfNecessary](self, "clearLegacyStorageIfNecessary");
    v7 = (void *)v14[5];
  }
  v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __38__TPFileStorageManager_imageWithName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const char *v5;
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  UInt8 *v19;
  UInt8 *v20;
  const __CFAllocator *v21;
  const __CFAllocator *v22;
  NSObject *v23;
  CFAllocatorContext context;
  stat v25;

  objc_msgSend(*(id *)(a1 + 32), "urlForFileSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation");
    if (!v5)
    {
      TPDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __38__TPFileStorageManager_imageWithName___block_invoke_cold_1();
      goto LABEL_13;
    }
    v6 = open(v5, 0, 0);
    if (v6 >= 1)
    {
      v7 = v6;
      memset(&v25, 0, sizeof(v25));
      if (fstat(v6, &v25))
      {
        TPDefaultLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __38__TPFileStorageManager_imageWithName___block_invoke_cold_3(v7, v8);
LABEL_7:

LABEL_8:
        v9 = 0;
        goto LABEL_9;
      }
      if (v25.st_size)
      {
        v19 = (UInt8 *)mmap(0, v25.st_size, 1, 1025, v7, 0);
        if (v19 == (UInt8 *)-1)
        {
          TPDefaultLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            __38__TPFileStorageManager_imageWithName___block_invoke_cold_2(v7, v8);
          goto LABEL_7;
        }
        v20 = v19;
        context.version = 0;
        memset(&context.retain, 0, 40);
        context.info = (void *)v25.st_size;
        context.deallocate = (CFAllocatorDeallocateCallBack)_mmapDeallocatorCallback;
        context.preferredSize = 0;
        v21 = CFAllocatorCreate(0, &context);
        if (!v21)
          goto LABEL_8;
        v22 = v21;
        v9 = CFDataCreateWithBytesNoCopy(0, v20, v25.st_size, v21);
        if (!v9)
          munmap(v20, v25.st_size);
        CFRelease(v22);
      }
      else
      {
        TPDefaultLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(context.version) = 0;
          _os_log_impl(&dword_1BCFA3000, v23, OS_LOG_TYPE_DEFAULT, "Memory mapping a zero byte file", (uint8_t *)&context, 2u);
        }

        v9 = CFDataCreate(0, 0, 0);
      }
LABEL_9:
      close(v7);
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0DC3870];
        v12 = objc_retainAutorelease(v10);
        v13 = objc_msgSend(v12, "CGImage");
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scale");
        objc_msgSend(v11, "imageWithCGImage:scale:orientation:", v13, objc_msgSend(v12, "imageOrientation"), v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

LABEL_13:
      }
    }
  }

}

void __38__TPFileStorageManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (NSURL)urlForFileSystem
{
  NSURL *urlForFileSystem;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSURL *v8;
  NSURL *v9;
  id v11;

  urlForFileSystem = self->_urlForFileSystem;
  if (!urlForFileSystem)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d"), CFSTR("TelephonyUI"), 10);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
      v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v9 = self->_urlForFileSystem;
      self->_urlForFileSystem = v8;

    }
    else
    {
      TPDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[TPFileStorageManager urlForFileSystem].cold.1();
    }

    urlForFileSystem = self->_urlForFileSystem;
  }
  return urlForFileSystem;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TPFileStorageManager)init
{
  TPFileStorageManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPFileStorageManager;
  v2 = -[TPFileStorageManager init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TelephonyUI.TPFileStorageManager", MEMORY[0x1E0C80D50]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_localeChanged, *MEMORY[0x1E0C99720], 0);

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__TPFileStorageManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TPFileStorageManager;
  -[TPFileStorageManager dealloc](&v4, sel_dealloc);
}

- (void)saveImage:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TPFileStorageManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__TPFileStorageManager_saveImage_withName___block_invoke;
  block[3] = &unk_1E75FD4E0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __43__TPFileStorageManager_saveImage_withName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  char v18;

  objc_msgSend(*(id *)(a1 + 32), "urlForFileSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v18);

    if (v5)
      v6 = v18 == 0;
    else
      v6 = 1;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v17);
      v9 = v17;

      if ((v8 & 1) == 0)
      {
        TPDefaultLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __43__TPFileStorageManager_saveImage_withName___block_invoke_cold_2();

      }
    }
    objc_msgSend(v2, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(*(UIImage **)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v13 = objc_msgSend(v12, "writeToURL:options:error:", v11, 268435457, &v16);
    v14 = v16;

    if ((v13 & 1) == 0)
    {
      TPDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __43__TPFileStorageManager_saveImage_withName___block_invoke_cold_1();

    }
  }

}

- (void)localeChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[TPFileStorageManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__TPFileStorageManager_localeChanged__block_invoke;
  block[3] = &unk_1E75FD2A8;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

void __37__TPFileStorageManager_localeChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  __int128 v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "urlForFileSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 1, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;

  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 138412546;
    v17 = v7;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v11;
        v14 = objc_msgSend(v13, "removeItemAtURL:error:", v12, &v18);
        v5 = v18;

        if (v14)
          v15 = v5 == 0;
        else
          v15 = 0;
        if (!v15)
        {
          TPDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v25 = v12;
            v26 = 2112;
            v27 = v5;
            _os_log_error_impl(&dword_1BCFA3000, v16, OS_LOG_TYPE_ERROR, "Error deleting file %@ %@", buf, 0x16u);
          }

        }
        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

}

- (id)urlsForLegacyFileSystem
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, &v26);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v26;

    if (v7)
    {
      v20 = v8;
      v21 = v4;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = v7;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v13, "pathComponents", v20, v21, (_QWORD)v22);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lastObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("TelephonyUI"));

            if (v16)
              objc_msgSend(v2, "addObject:", v13);
          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        }
        while (v10);
      }

      v8 = v20;
      v4 = v21;
    }
    else
    {
      TPDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[TPFileStorageManager urlsForLegacyFileSystem].cold.2();

    }
  }
  else
  {
    TPDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[TPFileStorageManager urlsForLegacyFileSystem].cold.1();
    v8 = v5;
  }

  v18 = (void *)objc_msgSend(v2, "copy");
  return v18;
}

- (void)clearLegacyStorageIfNecessary
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (!-[TPFileStorageManager hasClearedLegacyStorage](self, "hasClearedLegacyStorage"))
  {
    TPDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BCFA3000, v3, OS_LOG_TYPE_DEFAULT, "clear legacy storage", v5, 2u);
    }

    -[TPFileStorageManager urlsForLegacyFileSystem](self, "urlsForLegacyFileSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPFileStorageManager deleteStorageAtURLs:](self, "deleteStorageAtURLs:", v4);

    -[TPFileStorageManager setHasClearedLegacyStorage:](self, "setHasClearedLegacyStorage:", 1);
  }
}

- (void)deleteStorageAtURLs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[TPFileStorageManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__TPFileStorageManager_deleteStorageAtURLs___block_invoke;
  block[3] = &unk_1E75FD2A8;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __44__TPFileStorageManager_deleteStorageAtURLs___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v19;
    *(_QWORD *)&v3 = 138412546;
    v16 = v3;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

        if (v10)
        {
          TPDefaultLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v7;
            _os_log_impl(&dword_1BCFA3000, v11, OS_LOG_TYPE_DEFAULT, "deleting legacy storage at URL: %@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          v13 = objc_msgSend(v12, "removeItemAtURL:error:", v7, &v17);
          v14 = v17;

          if ((v13 & 1) == 0)
          {
            TPDefaultLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v16;
              v23 = v7;
              v24 = 2112;
              v25 = v14;
              _os_log_error_impl(&dword_1BCFA3000, v15, OS_LOG_TYPE_ERROR, "Error deleting storage at %@ %@", buf, 0x16u);
            }

          }
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v4);
  }

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)hasClearedLegacyStorage
{
  return self->_hasClearedLegacyStorage;
}

- (void)setHasClearedLegacyStorage:(BOOL)a3
{
  self->_hasClearedLegacyStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_urlForFileSystem, 0);
}

void __43__TPFileStorageManager_saveImage_withName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BCFA3000, v0, v1, "Error writing image %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__TPFileStorageManager_saveImage_withName___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BCFA3000, v0, v1, "Error creating directory for mmap images %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__TPFileStorageManager_imageWithName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BCFA3000, v0, v1, "Can't get file system representation for file path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__TPFileStorageManager_imageWithName___block_invoke_cold_2(int a1, NSObject *a2)
{
  int *v4;
  char *v5;
  _DWORD v6[2];
  __int16 v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = __error();
  v5 = strerror(*v4);
  v6[0] = 67109378;
  v6[1] = a1;
  v7 = 2080;
  v8 = v5;
  _os_log_error_impl(&dword_1BCFA3000, a2, OS_LOG_TYPE_ERROR, "Could not mmap %d: %s", (uint8_t *)v6, 0x12u);
}

void __38__TPFileStorageManager_imageWithName___block_invoke_cold_3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BCFA3000, a2, OS_LOG_TYPE_ERROR, "fstat failed %d", (uint8_t *)v2, 8u);
}

- (void)urlForFileSystem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BCFA3000, v0, v1, "Error getting library cache Directory %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)urlsForLegacyFileSystem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BCFA3000, v0, v1, "Error getting files from directory %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
