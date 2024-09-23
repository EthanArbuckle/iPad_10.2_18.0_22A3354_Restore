@implementation WBSFaviconProviderPersistenceController

- (void)openAndCheckIntegrity:(BOOL)a3 createIfNeeded:(BOOL)a4 fallBackToMemoryStoreIfError:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *internalQueue;
  id v12;
  _QWORD block[5];
  id v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;

  v10 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke;
  block[3] = &unk_1E54430E0;
  block[4] = self;
  v14 = v10;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v12 = v10;
  dispatch_async(internalQueue, block);

}

uint64_t __103__WBSFaviconProviderPersistenceController_removeIconFilesNotReferencedInDatabaseWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeEntriesForKeyStringsNotIncludedIn:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

- (void)dataCacheDidSetUp:(id)a3
{
  -[WBSFaviconProviderPersistenceController _finishSetUpWithStatus:](self, "_finishSetUpWithStatus:", 0);
}

- (void)_finishSetUpWithStatus:(int64_t)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__WBSFaviconProviderPersistenceController__finishSetUpWithStatus___block_invoke;
  v4[3] = &unk_1E5443130;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  WBSOnDiskDataCache *v6;
  uint64_t v7;
  void *v8;
  WBSFaviconProviderDatabaseController *v9;
  uint64_t v10;
  void *v11;
  WBSFaviconProviderRecordCache *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  NSObject *v22;
  _QWORD v23[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  v2 = MEMORY[0x1A85D45E4](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 112) && *(_QWORD *)(v5 + 104))
  {
    v6 = -[WBSOnDiskDataCache initWithCacheDirectoryURL:]([WBSOnDiskDataCache alloc], "initWithCacheDirectoryURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDataCacheDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setIsInMemoryCacheEnabled:", 0);
    v9 = -[WBSSQLiteStore initWithURL:]([WBSFaviconProviderDatabaseController alloc], "initWithURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(_QWORD *)(v10 + 24) = v9;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
    v12 = objc_alloc_init(WBSFaviconProviderRecordCache);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 32);
    *(_QWORD *)(v13 + 32) = v12;

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 24);
    v17 = *(unsigned __int8 *)(a1 + 48);
    v18 = *(unsigned __int8 *)(a1 + 49);
    v19 = *(unsigned __int8 *)(a1 + 50);
    v20 = *(_BYTE *)(v15 + 96) == 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_8;
    v23[3] = &unk_1E54430B8;
    v23[4] = v15;
    return objc_msgSend(v16, "openAndCheckIntegrity:createIfNeeded:fallBackToMemoryStoreIfError:lockingPolicy:completionHandler:", v17, v18, v19, v20, v23);
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_cold_1(v22);
    return objc_msgSend(*(id *)(a1 + 32), "_finishSetUpWithStatus:", 3);
  }
}

void __66__WBSFaviconProviderPersistenceController__finishSetUpWithStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(v2 + 24);
    *(_QWORD *)(v2 + 24) = 0;

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

    v6 = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = 2;
  }
  *(_QWORD *)(v2 + 72) = v6;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = 0;

}

- (void)removeIconFilesNotReferencedInDatabaseWithCompletionHandler:(id)a3
{
  id v4;
  WBSFaviconProviderDatabaseController *faviconDatabase;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  faviconDatabase = self->_faviconDatabase;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__WBSFaviconProviderPersistenceController_removeIconFilesNotReferencedInDatabaseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5443360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WBSFaviconProviderDatabaseController fetchAllIconUUIDsWithCompletionHandler:](faviconDatabase, "fetchAllIconUUIDsWithCompletionHandler:", v7);

}

- (WBSFaviconProviderPersistenceController)initWithPersistenceBaseURL:(id)a3 databaseName:(id)a4 preferredIconSize:(CGSize)a5 isReadOnly:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  WBSFaviconProviderPersistenceController *v14;
  WBSFaviconProviderPersistenceController *v15;
  NSURL *baseURL;
  void *v17;
  uint64_t v18;
  NSURL *databaseURL;
  uint64_t v20;
  NSURL *diskCacheURL;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  id v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *internalQueue;
  WBSFaviconProviderPrivateCache *v30;
  WBSFaviconProviderPrivateCache *privateCache;
  uint64_t v32;
  NSMapTable *inMemoryImageCache;
  WBSFaviconProviderPersistenceController *v34;
  objc_super v36;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WBSFaviconProviderPersistenceController;
  v14 = -[WBSFaviconProviderPersistenceController init](&v36, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_baseURL, a3);
    if (v13 && (baseURL = v15->_baseURL) != 0)
    {
      objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("db"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByAppendingPathComponent:isDirectory:](baseURL, "URLByAppendingPathComponent:isDirectory:", v17, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      databaseURL = v15->_databaseURL;
      v15->_databaseURL = (NSURL *)v18;

      -[NSURL URLByAppendingPathComponent:isDirectory:](v15->_baseURL, "URLByAppendingPathComponent:isDirectory:", v13, 1);
      v20 = objc_claimAutoreleasedReturnValue();
      diskCacheURL = v15->_diskCacheURL;
      v15->_diskCacheURL = (NSURL *)v20;

    }
    else
    {
      v22 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WBSFaviconProviderPersistenceController initWithPersistenceBaseURL:databaseName:preferredIconSize:isReadOnly:].cold.1((uint64_t *)&v15->_baseURL, (uint64_t)v13, v22);
    }
    v15->_controllerState = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.internalQueue"), v26, v15);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = dispatch_queue_create((const char *)objc_msgSend(v27, "UTF8String"), v23);
    internalQueue = v15->_internalQueue;
    v15->_internalQueue = (OS_dispatch_queue *)v28;

    v30 = objc_alloc_init(WBSFaviconProviderPrivateCache);
    privateCache = v15->_privateCache;
    v15->_privateCache = v30;

    v15->_preferredIconSize.width = width;
    v15->_preferredIconSize.height = height;
    v15->_isReadOnly = a6;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v32 = objc_claimAutoreleasedReturnValue();
    inMemoryImageCache = v15->_inMemoryImageCache;
    v15->_inMemoryImageCache = (NSMapTable *)v32;

    v34 = v15;
  }

  return v15;
}

- (WBSFaviconProviderPersistenceController)init
{

  return 0;
}

uint64_t __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_8(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) < 3)
    return objc_msgSend(*(id *)(result + 32), "_finishSetUpWithStatus:", objc_msgSend(*(id *)(result + 32), "_faviconStatusFromWBSSQLStoreStatus:", a2));
  if (!a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 16), "setUp");
  return result;
}

- (void)closeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5443108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 3;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5443108;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "closeWithCompletionHandler:", v4);

}

void __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_3;
  v2[3] = &unk_1E5443108;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "savePendingChangesBeforeTearDown");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E5443108;
  v5[4] = v2;
  v6 = v3;
  dispatch_async(v4, v5);

}

uint64_t __70__WBSFaviconProviderPersistenceController_closeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)savePendingChangesBeforeTermination
{
  NSObject *internalQueue;
  WBSOnDiskDataCache *faviconDiskCache;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSFaviconProviderPersistenceController_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  -[WBSOnDiskDataCache savePendingChangesBeforeTearDown](self->_faviconDiskCache, "savePendingChangesBeforeTearDown");
  faviconDiskCache = self->_faviconDiskCache;
  self->_faviconDiskCache = 0;

}

void __78__WBSFaviconProviderPersistenceController_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v5;
  void *v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 72);
  if (v2)
    v3 = v2 == 3;
  else
    v3 = 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 72) = 3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "savePendingChangesBeforeTermination");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  }
}

- (void)flushPrivateDataFromMemoryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__WBSFaviconProviderPersistenceController_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5443108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __91__WBSFaviconProviderPersistenceController_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllImageDataWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (int64_t)_faviconStatusFromWBSSQLStoreStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (id)_imageFromURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_inMemoryImageCache, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v7);

      if (v8)
      {
        +[WBSFaviconProviderUtilities imageWithURL:closetToPreferredSize:](WBSFaviconProviderUtilities, "imageWithURL:closetToPreferredSize:", v4, self->_preferredIconSize.width, self->_preferredIconSize.height);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_inMemoryImageCache, "setObject:forKey:", v9, v4);
        v6 = v9;
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setIconData:(id)a3 forPageURLString:(id)a4 iconURLString:(id)a5 iconSize:(CGSize)a6 hasGeneratedResolutions:(BOOL)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *internalQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  CGFloat v31;
  CGFloat v32;
  BOOL v33;
  BOOL v34;

  height = a6.height;
  width = a6.width;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a9;
  internalQueue = self->_internalQueue;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke;
  v26[3] = &unk_1E54431F8;
  v29 = v17;
  v30 = v20;
  v26[4] = self;
  v27 = v18;
  v33 = a8;
  v28 = v19;
  v31 = width;
  v32 = height;
  v34 = a7;
  v22 = v17;
  v23 = v19;
  v24 = v18;
  v25 = v20;
  dispatch_async(internalQueue, v26);

}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "safari_stringByFormattingForFaviconDatabase");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 88))
    {
      objc_msgSend(*(id *)(v5 + 40), "setIsRejectedResource:forPageURLString:iconURLString:", 0, v2, v3);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setImageData:forPageURLString:iconURLString:iconSize:hasGeneratedResolutions:", *(_QWORD *)(a1 + 56), v2, v4, *(unsigned __int8 *)(a1 + 89), *(double *)(a1 + 72), *(double *)(a1 + 80));
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      v6 = *(void **)(v5 + 24);
      v7 = *(unsigned __int8 *)(a1 + 89);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_2;
      v8[3] = &unk_1E54431D0;
      v8[4] = v5;
      v9 = v3;
      v10 = *(id *)(a1 + 56);
      v13 = *(_OWORD *)(a1 + 72);
      v12 = *(id *)(a1 + 64);
      v11 = v2;
      objc_msgSend(v6, "linkAndUpdateTimestampForIconWithPageURLString:iconURLString:iconSize:iconHasGeneratedResolutions:completionHandler:", v11, v9, v7, v8, *(double *)(a1 + 72), *(double *)(a1 + 80));

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_3;
  block[3] = &unk_1E54431A8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 64);
  block[1] = 3221225472;
  v13 = v6;
  v14 = v7;
  v15 = v5;
  v16 = v8;
  v17 = *(id *)(a1 + 48);
  v20 = *(_OWORD *)(a1 + 72);
  v19 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, block);

}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double *v11;
  BOOL v12;
  double *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v28[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeRecordForIconUUIDs:", v3);

    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    v27 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeEntriesForKeyStrings:completionHandler:", v5, 0);

  }
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  objc_msgSend(*(id *)(a1 + 48), "dateAdded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 64);
  v11 = (double *)(a1 + 88);
  v12 = v10 == 0;
  if (v10)
    v13 = (double *)(a1 + 96);
  else
    v13 = (double *)(MEMORY[0x1E0C9D820] + 8);
  if (v12)
    v11 = (double *)MEMORY[0x1E0C9D820];
  objc_msgSend(v6, "setDateAdded:forFaviconURLString:iconUUID:iconSize:hasGeneratedResolutions:", v7, v8, v9, objc_msgSend(*(id *)(a1 + 48), "hasGeneratedResolutions"), *v11, *v13);

  v14 = objc_msgSend(*(id *)(a1 + 64), "length");
  v15 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  if (v14)
  {
    v16 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 48), "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4;
    v22[3] = &unk_1E5443180;
    v25 = *(id *)(a1 + 80);
    v18 = *(id *)(a1 + 72);
    v19 = *(_QWORD *)(a1 + 40);
    v23 = v18;
    v24 = v19;
    objc_msgSend(v15, "setEntry:forKeyString:completionHandler:", v16, v17, v22);

    v20 = v25;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeEntriesForKeyStrings:completionHandler:", v21, *(_QWORD *)(a1 + 80));

  }
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4_cold_2(v6);
    v7 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4_cold_1(a1, v7);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_15;
    v10[3] = &unk_1E5443158;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v9, "removePageURLString:completionHandler:", v8, v10);

  }
}

uint64_t __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setIconIsRejectedResource:(BOOL)a3 forPageURLString:(id)a4 iconURLString:(id)a5 isPrivate:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *internalQueue;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  BOOL v24;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke;
  block[3] = &unk_1E5443220;
  block[4] = self;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v23 = a6;
  v24 = a3;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  dispatch_async(internalQueue, block);

}

void __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "safari_stringByFormattingForFaviconDatabase");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setIsRejectedResource:forPageURLString:iconURLString:", *(unsigned __int8 *)(a1 + 65), v2, v3);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      if (*(_BYTE *)(a1 + 65))
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke_2;
        v8[3] = &unk_1E5441E68;
        v9 = *(id *)(a1 + 56);
        objc_msgSend(v4, "markRejectedIconAtPageURLString:iconURLString:completionHandler:", v2, v3, v8);
        v5 = v9;
      }
      else
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke_3;
        v6[3] = &unk_1E5441E68;
        v7 = *(id *)(a1 + 56);
        objc_msgSend(v4, "markValidIconAtPageURLString:iconURLString:completionHandler:", v2, v3, v6);
        v5 = v7;
      }

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __128__WBSFaviconProviderPersistenceController_setIconIsRejectedResource_forPageURLString_iconURLString_isPrivate_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rejectedResourceInfosForPageURLString:(id)a3 iconURLString:(id)a4 includingPrivateData:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __134__WBSFaviconProviderPersistenceController_rejectedResourceInfosForPageURLString_iconURLString_includingPrivateData_completionHandler___block_invoke;
  block[3] = &unk_1E5443248;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a5;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(internalQueue, block);

}

void __134__WBSFaviconProviderPersistenceController_rejectedResourceInfosForPageURLString_iconURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) != 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "safari_stringByFormattingForFaviconDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 64))
    goto LABEL_7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "rejectedResourceInfosForPageURLString:iconURLString:", v4, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

LABEL_7:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "rejectedResourceIconInfosForPageURLString:iconURLString:completionHandler:", v4, v2, *(_QWORD *)(a1 + 56));
    goto LABEL_8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_8:
}

- (void)linkPageURLString:(id)a3 toIconURLString:(id)a4 isPrivate:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke;
  block[3] = &unk_1E5443248;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a5;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(internalQueue, block);

}

void __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "safari_stringByFormattingForFaviconDatabase");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 64))
    {
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "linkPageURLString:toIconURLString:", v2, v3));
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 24);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5443298;
      v6[4] = v4;
      v7 = *(id *)(a1 + 56);
      objc_msgSend(v5, "linkPageURLString:toExistingIconURLString:completionHandler:", v2, v3, v6);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  char v15;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke_3;
  v11[3] = &unk_1E5443270;
  v15 = a2;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v9;
  v14 = v8;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __105__WBSFaviconProviderPersistenceController_linkPageURLString_toIconURLString_isPrivate_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 56))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v8[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeRecordForIconUUIDs:", v3);

    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeEntriesForKeyStrings:completionHandler:", v5, 0);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)removeIconWithPageURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke;
  block[3] = &unk_1E54417E0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(internalQueue, block);

}

void __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeImageDataForPageURLString:", v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke_2;
    v5[3] = &unk_1E54432E8;
    v5[4] = v3;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "removePageURLString:completionHandler:", v2, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke_3;
  block[3] = &unk_1E54432C0;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __89__WBSFaviconProviderPersistenceController_removeIconWithPageURLString_completionHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v2 = *(void **)(a1[5] + 32);
    v8[0] = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeRecordForIconUUIDs:", v3);

    v4 = *(void **)(a1[5] + 16);
    v7 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeEntriesForKeyStrings:completionHandler:", v5, 0);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)removeAllIconsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5443108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 72) == 2)
  {
    v2 = *(void **)(v1 + 40);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_2;
    v3[3] = &unk_1E5443310;
    v3[4] = v1;
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "removeAllImageDataWithCompletionHandler:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_3;
  v4[3] = &unk_1E5443108;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "removeAllPageURLStringsWithCompletionHandler:", v4);

}

void __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_4;
  v4[3] = &unk_1E5443108;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __79__WBSFaviconProviderPersistenceController_removeAllIconsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllRecords");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reset");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeIconsWithURLStringsNotFoundIn:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke;
  block[3] = &unk_1E54417E0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(internalQueue, block);

}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "safari_stringByFormattingForFaviconDatabase");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_2;
    v13[3] = &unk_1E54433B0;
    v13[4] = v9;
    v11 = *(id *)(a1 + 48);
    v14 = v2;
    v15 = v11;
    v12 = v2;
    objc_msgSend(v10, "fetchAllKnownPageURLStringsWithCompletionHandler:", v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5443388;
  v7[4] = v4;
  v10 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, v7);

}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  id v10;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    v2 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_4;
    v9[3] = &unk_1E5443338;
    v3 = *(void **)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "objectsPassingTest:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      v7[0] = v2;
      v7[1] = 3221225472;
      v7[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_5;
      v7[3] = &unk_1E5443360;
      v7[4] = v5;
      v8 = *(id *)(a1 + 56);
      objc_msgSend(v6, "removePageURLStrings:completionHandler:", v4, v7);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_6;
  block[3] = &unk_1E54432C0;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    objc_msgSend(v2, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeRecordForIconUUIDs:", v4);

    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_7;
    v7[3] = &unk_1E54423D0;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "removeEntriesForKeyStrings:completionHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __97__WBSFaviconProviderPersistenceController_removeIconsWithURLStringsNotFoundIn_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)iconForPageURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5443428;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalQueue, v13);

}

void __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) != 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "imageDataForPageURLString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v3)) == 0)
  {

LABEL_8:
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_2;
    v8[3] = &unk_1E5443400;
    v8[4] = v6;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v7, "iconInfoForPageURLString:completionHandler:", v2, v8);

    goto LABEL_9;
  }
  v5 = (void *)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_9:
}

void __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_3;
  block[3] = &unk_1E54417E0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_4;
    v5[3] = &unk_1E54433D8;
    v3 = *(void **)(a1 + 32);
    v6 = v2;
    v7 = v3;
    v8 = *(id *)(a1 + 48);
    v4 = v2;
    objc_msgSend(v3, "_iconForIconUUID:completionHandler:", v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (a2 || (v2 = *(_QWORD *)(a1 + 32)) == 0)
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_imageFromURL:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
  else
  {
    v3 = *(void **)(a1 + 48);
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_5;
    v7[3] = &unk_1E54423D0;
    v8 = v3;
    objc_msgSend(v4, "removeAllDataForIconUUID:completionHandler:", v2, v7);

  }
}

uint64_t __103__WBSFaviconProviderPersistenceController_iconForPageURLString_includingPrivateData_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)iconForIconURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5443428;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalQueue, v13);

}

void __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) != 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "imageDataForIconURLString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v3)) == 0)
  {

LABEL_8:
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_2;
    v8[3] = &unk_1E5443400;
    v8[4] = v6;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v7, "iconInfoForIconURLString:completionHandler:", v2, v8);

    goto LABEL_9;
  }
  v5 = (void *)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_9:
}

void __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_3;
  block[3] = &unk_1E54417E0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_4;
    v5[3] = &unk_1E54433D8;
    v3 = *(void **)(a1 + 32);
    v6 = v2;
    v7 = v3;
    v8 = *(id *)(a1 + 48);
    v4 = v2;
    objc_msgSend(v3, "_iconForIconUUID:completionHandler:", v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (a2 || (v2 = *(_QWORD *)(a1 + 32)) == 0)
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_imageFromURL:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
  else
  {
    v3 = *(void **)(a1 + 48);
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_5;
    v7[3] = &unk_1E54423D0;
    v8 = v3;
    objc_msgSend(v4, "removeAllDataForIconUUID:completionHandler:", v2, v7);

  }
}

uint64_t __103__WBSFaviconProviderPersistenceController_iconForIconURLString_includingPrivateData_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_iconForIconUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  WBSOnDiskDataCache *faviconDiskCache;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    faviconDiskCache = self->_faviconDiskCache;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__WBSFaviconProviderPersistenceController__iconForIconUUID_completionHandler___block_invoke;
    v9[3] = &unk_1E5443478;
    v9[4] = self;
    v10 = v6;
    -[WBSOnDiskDataCache getEntryURLForKeyString:completionHandler:](faviconDiskCache, "getEntryURLForKeyString:completionHandler:", a3, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __78__WBSFaviconProviderPersistenceController__iconForIconUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WBSFaviconProviderPersistenceController__iconForIconUUID_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5443450;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __78__WBSFaviconProviderPersistenceController__iconForIconUUID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)iconInfoForPageURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5443428;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalQueue, v13);

}

void __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56)
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "imageInfoForPageURLString:", v2),
          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = (void *)v3;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke_2;
      v7[3] = &unk_1E5443400;
      v7[4] = v5;
      v8 = *(id *)(a1 + 48);
      objc_msgSend(v6, "iconInfoForPageURLString:completionHandler:", v2, v7);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke_3;
  block[3] = &unk_1E54417E0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __107__WBSFaviconProviderPersistenceController_iconInfoForPageURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(*(id *)(a1 + 40), "dateAdded");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "iconURLString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safari_stringByFormattingForFaviconDatabase");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "size");
      objc_msgSend(v2, "setDateAdded:forFaviconURLString:iconUUID:iconSize:hasGeneratedResolutions:", v3, v5, v8, objc_msgSend(*(id *)(a1 + 40), "hasGeneratedResolutions"), v6, v7);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)iconInfoForIconURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5443428;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalQueue, v13);

}

void __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56)
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "imageInfoForIconURLString:", v2),
          (v3 = objc_claimAutoreleasedReturnValue()) != 0)
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "iconInfoForURLString:", v2),
          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = (void *)v3;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke_2;
      v7[3] = &unk_1E54434A0;
      v7[4] = v5;
      v9 = *(id *)(a1 + 48);
      v8 = v2;
      objc_msgSend(v6, "iconInfoForIconURLString:completionHandler:", v8, v7);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5443388;
  v7[4] = v4;
  v10 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, v7);

}

void __107__WBSFaviconProviderPersistenceController_iconInfoForIconURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  id v7;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(*(id *)(a1 + 40), "dateAdded");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "size");
      objc_msgSend(v2, "setDateAdded:forFaviconURLString:iconUUID:iconSize:hasGeneratedResolutions:", v3, v4, v7, objc_msgSend(*(id *)(a1 + 40), "hasGeneratedResolutions"), v5, v6);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)firstIconForVariantsOfPageURLString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5443428;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalQueue, v13);

}

void __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) != 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "safari_urlStringVariantsForFaviconDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_8;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = 0;
  objc_msgSend(v3, "firstImageDataMatchingPageURLStringIn:matchedPageURLString:", v2, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (!v4 || (v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v4)) == 0)
  {

LABEL_8:
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 24);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_2;
    v10[3] = &unk_1E54434F0;
    v10[4] = v8;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v9, "firstIconUUIDMatchingPageURLStringIn:completionHandler:", v2, v10);

    goto LABEL_9;
  }
  v7 = (void *)v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_9:
}

void __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 64);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_3;
  v12[3] = &unk_1E5443388;
  v12[4] = v7;
  v14 = v5;
  v15 = v8;
  v13 = v6;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9] == 2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_4;
    v6[3] = &unk_1E54434C8;
    v9 = *(id *)(a1 + 56);
    v4 = *(id *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = v5;
    objc_msgSend(v2, "_iconForIconUUID:completionHandler:", v3, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __118__WBSFaviconProviderPersistenceController_firstIconForVariantsOfPageURLString_includingPrivateData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "_imageFromURL:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, v2, v4);

}

- (void)firstIconForVariantsOfDomainString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke;
  block[3] = &unk_1E54417E0;
  v13 = v7;
  v14 = v8;
  block[4] = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(internalQueue, block);

}

void __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2 && objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(*(id *)(a1 + 40), "safari_domainFaviconURLStringVariantsForFaviconDatabase");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_2;
    v4[3] = &unk_1E5443400;
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v2, "firstIconInfoMatchingIconURLStringIn:completionHandler:", v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_3;
  block[3] = &unk_1E54417E0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9] == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_4;
    v5[3] = &unk_1E5443518;
    v4 = *(id *)(a1 + 48);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v2, "_iconForIconUUID:completionHandler:", v3, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __117__WBSFaviconProviderPersistenceController_firstIconForVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_imageFromURL:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)pageURLStringsPrefixedWithVariantsOfDomainString:(id)a3 includingPrivateData:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __131__WBSFaviconProviderPersistenceController_pageURLStringsPrefixedWithVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke;
  v13[3] = &unk_1E5443428;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalQueue, v13);

}

void __131__WBSFaviconProviderPersistenceController_pageURLStringsPrefixedWithVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 2 && objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "safari_domainURLStringPrefixVariantsForFaviconDatabase");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "pageURLStringsWithPrefixesIn:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObjectsFromArray:", v4);

    }
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __131__WBSFaviconProviderPersistenceController_pageURLStringsPrefixedWithVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_2;
    v7[3] = &unk_1E5443310;
    v8 = v2;
    v9 = *(id *)(a1 + 48);
    v6 = v2;
    objc_msgSend(v5, "fetchPageURLStringsWithPrefixesIn:completionHandler:", v3, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __131__WBSFaviconProviderPersistenceController_pageURLStringsPrefixedWithVariantsOfDomainString_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)sqliteStoreDidFailDatabaseIntegrityCheck:(id)a3 completionHandler:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  void **p_databaseURL;
  NSURL *databaseURL;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;

  v5 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  databaseURL = self->_databaseURL;
  p_databaseURL = (void **)&self->_databaseURL;
  -[NSURL path](databaseURL, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = objc_msgSend(v6, "removeItemAtPath:error:", v9, &v13);
  v11 = v13;

  if ((v10 & 1) == 0)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderPersistenceController sqliteStoreDidFailDatabaseIntegrityCheck:completionHandler:].cold.1(p_databaseURL, v12);
  }
  v5[2](v5);

}

- (void)sqliteStoreDidFallBackToInMemoryStore:(id)a3
{
  NSObject *v4;

  v4 = WBS_LOG_CHANNEL_PREFIXFaviconPersistence();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[WBSFaviconProviderPersistenceController sqliteStoreDidFallBackToInMemoryStore:].cold.1((uint64_t)self, v4);
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (NSURL)diskCacheURL
{
  return self->_diskCacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCacheURL, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_setUpCompletionHandler, 0);
  objc_storeStrong((id *)&self->_inMemoryImageCache, 0);
  objc_storeStrong((id *)&self->_privateCache, 0);
  objc_storeStrong((id *)&self->_recordsCache, 0);
  objc_storeStrong((id *)&self->_faviconDatabase, 0);
  objc_storeStrong((id *)&self->_faviconDiskCache, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)initWithPersistenceBaseURL:(NSObject *)a3 databaseName:preferredIconSize:isReadOnly:.cold.1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  OUTLINED_FUNCTION_0_0(&dword_1A840B000, a3, (uint64_t)a3, "Unexpected nil args for base url (%p) or name (%p)", (uint8_t *)&v4);
}

void __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Cannot open, required database urls are nil", v1, 2u);
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = v3;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEBUG, "Failed to write icon data for page url %{private}@, error: %{public}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

void __147__WBSFaviconProviderPersistenceController_setIconData_forPageURLString_iconURLString_iconSize_hasGeneratedResolutions_isPrivate_completionHandler___block_invoke_4_cold_2(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v4, v5, "Failed to write icon data, error: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)sqliteStoreDidFailDatabaseIntegrityCheck:(void *)a1 completionHandler:(void *)a2 .cold.1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v2;
  v8 = 2114;
  v9 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1A840B000, v3, v5, "Failed to remove corrupted database at %{public}@, error: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)sqliteStoreDidFallBackToInMemoryStore:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Using in-memory representation for database %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
