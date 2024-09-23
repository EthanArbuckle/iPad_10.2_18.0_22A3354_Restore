@implementation QLUbiquitousItemFetcher

- (QLUbiquitousItemFetcher)initWithSandboxingURLWrapper:(id)a3 shouldZipPackageIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  QLUbiquitousItemFetcher *v8;
  QLUbiquitousItemFetcher *v9;
  QLUbiquitousItemFetcher *v10;

  v4 = a4;
  v7 = a3;
  v8 = -[QLUbiquitousItemFetcher initWithZippingPackageIfNeeded:](self, "initWithZippingPackageIfNeeded:", v4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sandboxingWrapper, a3);
    v10 = v9;
  }

  return v9;
}

- (QLUbiquitousItemFetcher)initWithZippingPackageIfNeeded:(BOOL)a3
{
  QLUbiquitousItemFetcher *v4;
  QLUbiquitousItemFetcher *v5;
  uint64_t v6;
  NSMutableArray *updateBlocks;
  QLUbiquitousItemFetcher *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)QLUbiquitousItemFetcher;
  v4 = -[QLItemFetcher init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_shouldZipPackageIfNeeded = a3;
    v6 = objc_opt_new();
    updateBlocks = v5->_updateBlocks;
    v5->_updateBlocks = (NSMutableArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (QLUbiquitousItemFetcher)initWithURL:(id)a3 shouldZipPackageIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  QLUbiquitousItemFetcher *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  FPSandboxingURLWrapper *sandboxingWrapper;
  NSObject *v12;
  QLUbiquitousItemFetcher *v13;
  NSObject **v15;
  id v16;
  uint8_t buf[4];
  QLUbiquitousItemFetcher *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[QLUbiquitousItemFetcher initWithZippingPackageIfNeeded:](self, "initWithZippingPackageIfNeeded:", v4);
  if (v7)
  {
    v8 = *MEMORY[0x1E0CD3378];
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:extensionClass:error:", v6, v8, &v16);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v16;
    sandboxingWrapper = v7->_sandboxingWrapper;
    v7->_sandboxingWrapper = (FPSandboxingURLWrapper *)v9;

    if (!v7->_sandboxingWrapper)
    {
      v12 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        v15 = (NSObject **)MEMORY[0x1E0D83678];
        QLSInitLogging();
        v12 = *v15;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_ERROR, "QLUbiquitousItemFetcher: %@ could not create sandbox wrapper. Error: %@ #PreviewItem", buf, 0x16u);
      }
    }
    v13 = v7;

  }
  return v7;
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  NSMutableArray *updateBlocks;
  void *v16;
  void *v17;
  NSFileCoordinator *v18;
  NSFileCoordinator *fileCoordinator;
  void *v20;
  void *v21;
  NSFileCoordinator *v22;
  void *v23;
  id v24;
  NSObject **v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  QLUbiquitousItemFetcher *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[16];
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12)
  {
    v14 = self->_updateBlocks;
    objc_sync_enter(v14);
    updateBlocks = self->_updateBlocks;
    v16 = (void *)MEMORY[0x1DF089CE8](v12);
    -[NSMutableArray addObject:](updateBlocks, "addObject:", v16);

    objc_sync_exit(v14);
  }
  -[FPSandboxingURLWrapper url](self->_sandboxingWrapper, "url");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isAccessingURL = objc_msgSend(v17, "startAccessingSecurityScopedResource");

  v18 = (NSFileCoordinator *)objc_opt_new();
  fileCoordinator = self->_fileCoordinator;
  self->_fileCoordinator = v18;

  -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB35F8], "readingIntentWithURL:options:", v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->_fileCoordinator;
    v38[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __100__QLUbiquitousItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
    v30 = &unk_1E9EFC5A8;
    v31 = self;
    v35 = v12;
    v32 = v20;
    v36 = v13;
    v33 = v21;
    v34 = v10;
    v24 = v21;
    -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](v22, "coordinateAccessWithIntents:queue:byAccessor:", v23, v11, &v27);

    if (v12)
      -[QLUbiquitousItemFetcher subscribeToPreviewItemProgress](self, "subscribeToPreviewItemProgress", v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);

  }
  else
  {
    v25 = (NSObject **)MEMORY[0x1E0D83678];
    v26 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v26 = *v25;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D936E000, v26, OS_LOG_TYPE_FAULT, "URL cannot be nil when trying to fetch the contents of QLUbiquitousItemFetcher #PreviewItem", buf, 2u);
    }
    -[QLUbiquitousItemFetcher _removeUpdateBlockIfNeeded:](self, "_removeUpdateBlockIfNeeded:", v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLUbiquitousItemFetcher"), 0, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v24);
  }

}

void __100__QLUbiquitousItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  void (*v10)(void);
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_removeUpdateBlockIfNeeded:", *(_QWORD *)(a1 + 64));
  if (objc_msgSend(v3, "code") == 3072)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v16 = 0;
    v6 = objc_msgSend(v4, "evictUbiquitousItemAtURL:error:", v5, &v16);
    v7 = v16;

    if ((v6 & 1) == 0)
    {
      v8 = (NSObject **)MEMORY[0x1E0D83678];
      v9 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        QLSInitLogging();
        v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v3;
        _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_ERROR, "Failed to evict file for canceled download: %@ #Downloading", buf, 0xCu);
      }
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_17;
  }
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "URL");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", objc_opt_class()))
    {
      v11 = *(_BYTE **)(a1 + 32);
      if (v11[72])
      {
        objc_msgSend(v11, "_createURLForPackageIfNeeded");
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = *(_BYTE **)(a1 + 32);
        v7 = (id)v12;
      }
      objc_msgSend(v11, "setFetchingState:", 1);
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", objc_opt_class()))
      {
        objc_msgSend(*(id *)(a1 + 32), "_createURLForPackageIfNeeded");
        v13 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setFetchingState:", 1);
        v14 = *(_QWORD *)(a1 + 72);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

        v7 = (id)v13;
LABEL_18:

        goto LABEL_19;
      }
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    }
LABEL_17:
    v10();
    goto LABEL_18;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_19:

}

- (void)subscribeToPreviewItemProgress
{
  void *v3;
  void *v4;
  void *v5;
  id progressSubscriber;
  _QWORD v7[5];

  if (!self->_progressSubscriber)
  {
    v3 = (void *)MEMORY[0x1E0CB38A8];
    -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__QLUbiquitousItemFetcher_subscribeToPreviewItemProgress__block_invoke;
    v7[3] = &unk_1E9EFC5D0;
    v7[4] = self;
    objc_msgSend(v3, "_addSubscriberForFileURL:withPublishingHandler:", v4, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    progressSubscriber = self->_progressSubscriber;
    self->_progressSubscriber = v5;

  }
}

id __57__QLUbiquitousItemFetcher_subscribeToPreviewItemProgress__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "totalUnitCount"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v4;

  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  objc_sync_enter(v7);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "fractionCompleted");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("fractionCompleted"), 1, 0);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__QLUbiquitousItemFetcher_subscribeToPreviewItemProgress__block_invoke_2;
  v19[3] = &unk_1E9EFBFC8;
  v15 = *(_QWORD *)(a1 + 32);
  v20 = v3;
  v21 = v15;
  v16 = v3;
  v17 = (void *)MEMORY[0x1DF089CE8](v19);

  return v17;
}

uint64_t __57__QLUbiquitousItemFetcher_subscribeToPreviewItemProgress__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("fractionCompleted"));
}

- (BOOL)canBeCanceled
{
  return 1;
}

- (void)cancelFetch
{
  -[NSFileCoordinator cancel](self->_fileCoordinator, "cancel");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  NSMutableArray *v15;
  uint64_t v16;
  double v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject **v25;
  NSObject *v26;
  NSMutableArray *obj;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  double v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("fractionCompleted")))
  {
    objc_msgSend(v11, "fractionCompleted");
    v14 = v13;
    obj = self->_updateBlocks;
    objc_sync_enter(obj);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = self->_updateBlocks;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    v18 = v14;
    if (v16)
    {
      v19 = *(_QWORD *)v30;
      do
      {
        v20 = 0;
        do
        {
          v21 = v11;
          v22 = v12;
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v15);
          v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20);
          *(float *)&v17 = v18;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

          v12 = v22;
          v11 = v21;
          ++v20;
        }
        while (v16 != v20);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v16);
    }

    objc_sync_exit(obj);
    v25 = (NSObject **)MEMORY[0x1E0D83678];
    v26 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v26 = *v25;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v34 = v18;
      _os_log_impl(&dword_1D936E000, v26, OS_LOG_TYPE_DEBUG, "Updated progress for downloading file: %f #Downloading", buf, 0xCu);
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)QLUbiquitousItemFetcher;
    -[QLUbiquitousItemFetcher observeValueForKeyPath:ofObject:change:context:](&v28, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:", self->_progressSubscriber);
  -[QLUbiquitousItemFetcher _deleteTempraryZipPackageFileIfNeeded](self, "_deleteTempraryZipPackageFileIfNeeded");
  if (self->_isAccessingURL)
  {
    -[FPSandboxingURLWrapper url](self->_sandboxingWrapper, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");

  }
  v4.receiver = self;
  v4.super_class = (Class)QLUbiquitousItemFetcher;
  -[QLUbiquitousItemFetcher dealloc](&v4, sel_dealloc);
}

- (BOOL)isLongFetchOperation
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;

  -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "startAccessingSecurityScopedResource");

  -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_QLDownloadingStatusIsNotCurrent");

  if (v4)
  {
    -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAccessingSecurityScopedResource");

  }
  return v6;
}

- (id)itemSize
{
  NSNumber *sizeTotalUnitCount;
  NSNumber *v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  sizeTotalUnitCount = self->_sizeTotalUnitCount;
  if (sizeTotalUnitCount)
  {
    v3 = sizeTotalUnitCount;
  }
  else
  {
    -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "startAccessingSecurityScopedResource");

    -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_QLUrlFileSize");
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopAccessingSecurityScopedResource");

    }
  }
  return v3;
}

- (id)fetchedContent
{
  void *v3;

  v3 = -[QLItemFetcher fetchingState](self, "fetchingState");
  if (v3)
  {
    -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSURL)fileURL
{
  return (NSURL *)-[FPSandboxingURLWrapper url](self->_sandboxingWrapper, "url");
}

- (id)newItemProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_opt_new();
  -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(MEMORY[0x1E0CD3308], "UTIForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__QLUbiquitousItemFetcher_newItemProvider__block_invoke;
  v9[3] = &unk_1E9EFC5F8;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v3, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v6, 0, 0, v9);

  return v3;
}

uint64_t __42__QLUbiquitousItemFetcher_newItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 1, 0);
  return 0;
}

- (void)_removeUpdateBlockIfNeeded:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *updateBlocks;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = self->_updateBlocks;
    objc_sync_enter(v5);
    updateBlocks = self->_updateBlocks;
    v7 = (void *)MEMORY[0x1DF089CE8](v8);
    -[NSMutableArray removeObject:](updateBlocks, "removeObject:", v7);

    objc_sync_exit(v5);
    v4 = v8;
  }

}

- (id)_createURLForPackageIfNeeded
{
  void *v3;
  char v4;
  QLURLHandler *zipPackageUrlHandler;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void **v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject **v30;
  NSObject *v31;
  id v32;
  QLURLHandler *v33;
  _QWORD v34[4];
  id v35;
  __int128 *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int128 v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_QLIsPackageURL");

  if ((v4 & 1) == 0)
  {
    -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  zipPackageUrlHandler = self->_zipPackageUrlHandler;
  if (zipPackageUrlHandler)
  {
    -[QLURLHandler fileURL](zipPackageUrlHandler, "fileURL");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;
    return v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E98];
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@"), v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v17 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v38);
  v18 = v38;
  if (v18)
    v17 = 0;

  if ((v17 & 1) != 0)
  {
    -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v43 = 0;
    *((_QWORD *)&v43 + 1) = &v43;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    v47 = 0;
    v22 = (void *)objc_opt_new();
    -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __55__QLUbiquitousItemFetcher__createURLForPackageIfNeeded__block_invoke;
    v34[3] = &unk_1E9EFC620;
    v24 = v21;
    v35 = v24;
    v36 = &v43;
    objc_msgSend(v22, "coordinateReadingItemAtURL:options:error:byAccessor:", v23, 8, &v37, v34);
    v25 = v37;

    if (v25)
    {
      v26 = (void **)MEMORY[0x1E0D83678];
      v27 = (void *)*MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        QLSInitLogging();
        v27 = *v26;
      }
      v28 = v27;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[QLUbiquitousItemFetcher fileURL](self, "fileURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = v29;
        v41 = 2112;
        v42 = v25;
        _os_log_impl(&dword_1D936E000, v28, OS_LOG_TYPE_ERROR, "Could not do a coordinated read for directory at URL: %@ (%@). #PreviewItem", buf, 0x16u);

      }
    }
    else
    {
      v32 = objc_alloc(MEMORY[0x1E0CD3300]);
      v33 = (QLURLHandler *)objc_msgSend(v32, "initWithURL:sandboxType:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 40), *MEMORY[0x1E0CD3378]);
      v28 = self->_zipPackageUrlHandler;
      self->_zipPackageUrlHandler = v33;
    }

    -[QLURLHandler fileURL](self->_zipPackageUrlHandler, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    v30 = (NSObject **)MEMORY[0x1E0D83678];
    v31 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v31 = *v30;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v43) = 138412290;
      *(_QWORD *)((char *)&v43 + 4) = v18;
      _os_log_impl(&dword_1D936E000, v31, OS_LOG_TYPE_ERROR, "Could not create temporary folder for data item with error: %@ #PreviewItem", (uint8_t *)&v43, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

void __55__QLUbiquitousItemFetcher__createURLForPackageIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  objc_msgSend(v4, "copyItemAtURL:toURL:error:", v3, v5, &v10);
  v6 = v10;

  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x1E0D83678];
    v8 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v12 = v3;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_ERROR, "Could not copy zipped folder at URL (%@) to URL (%@). Error: %@ #PreviewItem", buf, 0x20u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
  }

}

- (void)_deleteTempraryZipPackageFileIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  id v9;
  NSObject **v10;
  NSObject *v11;
  QLURLHandler *zipPackageUrlHandler;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_zipPackageUrlHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLURLHandler fileURL](self->_zipPackageUrlHandler, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

    if (v6)
    {
      -[QLURLHandler fileURL](self->_zipPackageUrlHandler, "fileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v8 = objc_msgSend(v3, "removeItemAtURL:error:", v7, &v13);
      v9 = v13;

      if ((v8 & 1) == 0)
      {
        v10 = (NSObject **)MEMORY[0x1E0D83678];
        v11 = *MEMORY[0x1E0D83678];
        if (!*MEMORY[0x1E0D83678])
        {
          QLSInitLogging();
          v11 = *v10;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v9;
          _os_log_impl(&dword_1D936E000, v11, OS_LOG_TYPE_ERROR, "Could not delete temporary zip file for folder URL with error: %@ #PreviewItem", buf, 0xCu);
        }
        goto LABEL_10;
      }
    }
    else
    {
      v9 = 0;
    }
    zipPackageUrlHandler = self->_zipPackageUrlHandler;
    self->_zipPackageUrlHandler = 0;

LABEL_10:
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLUbiquitousItemFetcher;
  v4 = a3;
  -[QLItemFetcher encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sandboxingWrapper, CFSTR("sandboxingWrapper"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_zipPackageUrlHandler, CFSTR("zipPackageUrlHandler"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldZipPackageIfNeeded, CFSTR("shouldZipPackageIfNeeded"));

}

- (QLUbiquitousItemFetcher)initWithCoder:(id)a3
{
  id v4;
  QLUbiquitousItemFetcher *v5;
  uint64_t v6;
  NSMutableArray *updateBlocks;
  uint64_t v8;
  FPSandboxingURLWrapper *sandboxingWrapper;
  uint64_t v10;
  QLURLHandler *zipPackageUrlHandler;
  QLUbiquitousItemFetcher *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLUbiquitousItemFetcher;
  v5 = -[QLItemFetcher initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    updateBlocks = v5->_updateBlocks;
    v5->_updateBlocks = (NSMutableArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxingWrapper"));
    v8 = objc_claimAutoreleasedReturnValue();
    sandboxingWrapper = v5->_sandboxingWrapper;
    v5->_sandboxingWrapper = (FPSandboxingURLWrapper *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zipPackageUrlHandler"));
    v10 = objc_claimAutoreleasedReturnValue();
    zipPackageUrlHandler = v5->_zipPackageUrlHandler;
    v5->_zipPackageUrlHandler = (QLURLHandler *)v10;

    v5->_shouldZipPackageIfNeeded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldZipPackageIfNeeded"));
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zipPackageUrlHandler, 0);
  objc_storeStrong((id *)&self->_sizeTotalUnitCount, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_sandboxingWrapper, 0);
}

@end
