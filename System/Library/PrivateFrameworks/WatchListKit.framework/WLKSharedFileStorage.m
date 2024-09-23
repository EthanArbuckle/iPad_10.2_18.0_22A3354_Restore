@implementation WLKSharedFileStorage

- (WLKSharedFileStorage)initWithFileName:(id)a3 class:(Class)a4
{
  id v6;
  WLKSharedFileStorage *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *fileURL;
  uint64_t v12;
  NSFileCoordinator *coordinator;
  uint64_t v14;
  NSString *debugString;
  WLKSharedFileStorage *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WLKSharedFileStorage;
  v7 = -[WLKSharedFileStorage init](&v18, sel_init);
  if (v7)
  {
    WLKDefaultSupportPath();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      fileURL = v7->_fileURL;
      v7->_fileURL = (NSURL *)v10;

    }
    else
    {
      NSLog(CFSTR("WLKSettingsStore - Error: DefaultSupportPath returned nil"));
      v9 = v7->_fileURL;
      v7->_fileURL = 0;
    }

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
    coordinator = v7->_coordinator;
    v7->_coordinator = (NSFileCoordinator *)v12;

    v7->_class = a4;
    -[NSURL lastPathComponent](v7->_fileURL, "lastPathComponent");
    v14 = objc_claimAutoreleasedReturnValue();
    debugString = v7->_debugString;
    v7->_debugString = (NSString *)v14;

    if ((-[objc_class conformsToProtocol:](v7->_class, "conformsToProtocol:", &unk_1EF0FC950) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("class must conform to <WLKCoding>"));

      v16 = 0;
      goto LABEL_9;
    }

  }
  v16 = v7;
LABEL_9:

  return v16;
}

void __29__WLKSharedFileStorage_read___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (v3)
  {
    v16 = 0;
    objc_msgSend(WeakRetained, "_readDataFromURL:error:", v3, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    v8 = v7;
    if (!v6 && v7)
    {
      WLKSystemLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) read failed with error: %@", buf, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    WLKSystemLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(v12 + 32);
      v15 = *(void **)(v12 + 8);
      *(_DWORD *)buf = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) failed to coordinate read of %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)_readDataFromURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", self->_class, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)read:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *debugString;
  NSFileCoordinator *coordinator;
  NSURL *fileURL;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    -[WLKSharedFileStorage read:].cold.1();
  v5 = v4;
  WLKSystemLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    debugString = self->_debugString;
    *(_DWORD *)buf = 138412290;
    v18 = debugString;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) read request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  fileURL = self->_fileURL;
  coordinator = self->_coordinator;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__WLKSharedFileStorage_read___block_invoke;
  v12[3] = &unk_1E68A7BC8;
  objc_copyWeak(&v15, (id *)buf);
  v12[4] = self;
  v13 = 0;
  v10 = v5;
  v14 = v10;
  -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:](coordinator, "coordinateReadingItemAtURL:options:error:byAccessor:", fileURL, 0, &v16, v12);
  v11 = v16;

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)write:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *debugString;
  NSFileCoordinator *coordinator;
  NSURL *fileURL;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    -[WLKSharedFileStorage write:completion:].cold.1();
  v8 = v7;
  if (!v7)
    -[WLKSharedFileStorage write:completion:].cold.2();
  WLKSystemLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    debugString = self->_debugString;
    *(_DWORD *)buf = 138412290;
    v23 = debugString;
    _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) write request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  fileURL = self->_fileURL;
  coordinator = self->_coordinator;
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__WLKSharedFileStorage_write_completion___block_invoke;
  v16[3] = &unk_1E68A7BF0;
  objc_copyWeak(&v20, (id *)buf);
  v16[4] = self;
  v17 = 0;
  v13 = v8;
  v19 = v13;
  v14 = v6;
  v18 = v14;
  -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](coordinator, "coordinateWritingItemAtURL:options:error:byAccessor:", fileURL, 0, &v21, v16);
  v15 = v21;

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __41__WLKSharedFileStorage_write_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v16 = 0;
    v7 = objc_msgSend(WeakRetained, "_writeData:toURL:error:", v6, v3, &v16);
    v8 = v16;
    if ((v7 & 1) == 0)
    {
      WLKSystemLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) write failed with error: %@", buf, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    WLKSystemLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(v12 + 32);
      v15 = *(void **)(v12 + 8);
      *(_DWORD *)buf = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) failed to coordinate write of %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)merge:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *debugString;
  NSFileCoordinator *coordinator;
  NSURL *fileURL;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    -[WLKSharedFileStorage merge:completion:].cold.1();
  v8 = v7;
  if (!v7)
    -[WLKSharedFileStorage merge:completion:].cold.2();
  WLKSystemLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    debugString = self->_debugString;
    *(_DWORD *)buf = 138412290;
    v23 = debugString;
    _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - %@ merge request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  fileURL = self->_fileURL;
  coordinator = self->_coordinator;
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__WLKSharedFileStorage_merge_completion___block_invoke;
  v16[3] = &unk_1E68A7BF0;
  objc_copyWeak(&v20, (id *)buf);
  v16[4] = self;
  v17 = 0;
  v13 = v8;
  v19 = v13;
  v14 = v6;
  v18 = v14;
  -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](coordinator, "coordinateWritingItemAtURL:options:error:byAccessor:", fileURL, 8, &v21, v16);
  v15 = v21;

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __41__WLKSharedFileStorage_merge_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v3)
  {
    v5 = *(id *)(a1 + 48);
    v21 = 0;
    objc_msgSend(WeakRetained, "_readDataFromURL:error:", v3, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v6)
    {
      if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EF106960) & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("class must conform to <WLKMergeableCoding>"));
      WLKSystemLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) Read existing data. Merging", buf, 0xCu);
      }

      objc_msgSend(v6, "dataByMergingWith:", *(_QWORD *)(a1 + 48));
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v10;
    }
    v20 = v7;
    v11 = objc_msgSend(WeakRetained, "_writeData:toURL:error:", v5, v3, &v20);
    v12 = v20;

    if ((v11 & 1) == 0)
    {
      WLKSystemLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412546;
        v23 = v14;
        v24 = 2112;
        v25 = v12;
        _os_log_impl(&dword_1B515A000, v13, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) merge failed with error: %@", buf, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    WLKSystemLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(v16 + 32);
      v19 = *(void **)(v16 + 8);
      *(_DWORD *)buf = 138412802;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1B515A000, v15, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) failed to coordinate write of %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)delete:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *debugString;
  NSFileCoordinator *coordinator;
  NSURL *fileURL;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    -[WLKSharedFileStorage delete:].cold.1();
  v5 = v4;
  WLKSystemLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    debugString = self->_debugString;
    *(_DWORD *)buf = 138412290;
    v17 = debugString;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) delete request", buf, 0xCu);
  }

  fileURL = self->_fileURL;
  coordinator = self->_coordinator;
  v15 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __31__WLKSharedFileStorage_delete___block_invoke;
  v12[3] = &unk_1E68A7C18;
  v12[4] = self;
  v13 = 0;
  v14 = v5;
  v10 = v5;
  -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](coordinator, "coordinateWritingItemAtURL:options:error:byAccessor:", fileURL, 1, &v15, v12);
  v11 = v15;

}

void __31__WLKSharedFileStorage_delete___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v4, "removeItemAtURL:error:", v3, &v15);
    v5 = v15;

    if (v5 && objc_msgSend(v5, "code") == 4)
    {
      WLKSystemLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = a1[4];
        v8 = *(_QWORD *)(v7 + 32);
        v9 = *(_QWORD *)(v7 + 8);
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) No file found to delete. Returning success. %@", buf, 0x16u);
      }

      v5 = 0;
    }
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    WLKSystemLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      v12 = a1[5];
      v13 = *(_QWORD *)(v11 + 32);
      v14 = *(_QWORD *)(v11 + 8);
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKSharedFileStorage - (%@) failed to coordinate deletion of %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (BOOL)_writeData:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  WLKDefaultSupportPath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    NSLog(CFSTR("WLKSettingsStore - Error: DefaultSupportPath returned nil"));
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, a5);

  if (!v12)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v13 = 1;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v13 = objc_msgSend(v14, "writeToURL:options:error:", v8, 1, a5);

LABEL_8:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)read:.cold.1()
{
  __assert_rtn("-[WLKSharedFileStorage read:]", "WLKSharedFileStorage.m", 56, "completion != nil");
}

- (void)write:completion:.cold.1()
{
  __assert_rtn("-[WLKSharedFileStorage write:completion:]", "WLKSharedFileStorage.m", 83, "data != nil");
}

- (void)write:completion:.cold.2()
{
  __assert_rtn("-[WLKSharedFileStorage write:completion:]", "WLKSharedFileStorage.m", 84, "completion != nil");
}

- (void)merge:completion:.cold.1()
{
  __assert_rtn("-[WLKSharedFileStorage merge:completion:]", "WLKSharedFileStorage.m", 112, "data != nil");
}

- (void)merge:completion:.cold.2()
{
  __assert_rtn("-[WLKSharedFileStorage merge:completion:]", "WLKSharedFileStorage.m", 113, "completion != nil");
}

- (void)delete:.cold.1()
{
  __assert_rtn("-[WLKSharedFileStorage delete:]", "WLKSharedFileStorage.m", 155, "completion != nil");
}

@end
