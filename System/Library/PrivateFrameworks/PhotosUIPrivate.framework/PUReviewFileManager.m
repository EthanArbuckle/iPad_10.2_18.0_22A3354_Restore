@implementation PUReviewFileManager

- (PUReviewFileManager)initWithFileManager:(id)a3
{
  id v6;
  PUReviewFileManager *v7;
  PUReviewFileManager *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *fileManagementQueue;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *safePathURL;
  void *v16;
  objc_super v17;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewFileManager.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileManager"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PUReviewFileManager;
  v7 = -[PUReviewFileManager init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->__fileManager, a3);
    v9 = dispatch_queue_create("com.apple.ax-review.filemanagement", 0);
    fileManagementQueue = v8->__fileManagementQueue;
    v8->__fileManagementQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    safePathURL = v8->__safePathURL;
    v8->__safePathURL = (NSURL *)v13;

  }
  return v8;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to delete file at URL: %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = -[PUReviewFileManager _removeItemAtURL:error:stackshot:](self, "_removeItemAtURL:error:stackshot:", v6, a4, 0);
  return v8;
}

- (void)removeItemAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUReviewFileManager _fileManagementQueue](self, "_fileManagementQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  PLUIGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to delete file at URL: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PUReviewFileManager_removeItemAtURL_completion___block_invoke;
  block[3] = &unk_1E58A72D8;
  objc_copyWeak(&v18, &location);
  v15 = v6;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (BOOL)_allowedToDeleteItemAtURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  objc_msgSend(a3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewFileManager _safePathURL](self, "_safePathURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "count");
  if (v7 <= objc_msgSend(v6, "count"))
  {
    v11 = 0;
  }
  else if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) == 0)
        break;
      ++v8;
    }
    while (objc_msgSend(v6, "count") > v8);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)_removeItemAtURL:(id)a3 error:(id *)a4 stackshot:(id)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a5;
  if (-[PUReviewFileManager _allowedToDeleteItemAtURL:](self, "_allowedToDeleteItemAtURL:", v9))
  {
    -[PUReviewFileManager _fileManager](self, "_fileManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "removeItemAtURL:error:", v9, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Attempt to remove item %@. "), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewFileManager _safePathURL](self, "_safePathURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("The item is outside the specified safe area %@. "), v13);

    if (v10)
    {
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendFormat:", CFSTR("The deletion was attempted via\n%@"), v14);

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewFileManager.m"), 99, v11);

    v12 = 0;
  }

  return v12;
}

- (NSFileManager)_fileManager
{
  return self->__fileManager;
}

- (OS_dispatch_queue)_fileManagementQueue
{
  return self->__fileManagementQueue;
}

- (NSURL)_safePathURL
{
  return self->__safePathURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__safePathURL, 0);
  objc_storeStrong((id *)&self->__fileManagementQueue, 0);
  objc_storeStrong((id *)&self->__fileManager, 0);
}

void __50__PUReviewFileManager_removeItemAtURL_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = 0;
  v3 = objc_msgSend(WeakRetained, "_removeItemAtURL:error:stackshot:", *(_QWORD *)(a1 + 32), &v6, *(_QWORD *)(a1 + 40));
  v4 = v6;

  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v3, v4);

}

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PUReviewFileManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, block);
  return (id)defaultManager_defaultManager;
}

void __37__PUReviewFileManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithFileManager:", v4);
  v3 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = v2;

}

@end
