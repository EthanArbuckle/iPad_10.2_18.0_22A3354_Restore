@implementation WBSLPLinkMetadataCache

- (WBSLPLinkMetadataCache)initWithCacheDirectoryURL:(id)a3 expirationInterval:(double)a4 maximumNumberOfEntries:(unint64_t)a5
{
  WBSLPLinkMetadataCache *v6;
  WBSLPLinkMetadataCache *v7;
  WBSLPLinkMetadataCache *v8;

  v6 = -[WBSLPLinkMetadataCache initWithCacheDirectoryURL:expirationInterval:](self, "initWithCacheDirectoryURL:expirationInterval:", a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_evictionEnabled = 1;
    v6->_maximumNumberOfEntries = a5;
    v8 = v6;
  }

  return v7;
}

- (WBSLPLinkMetadataCache)initWithCacheDirectoryURL:(id)a3 expirationInterval:(double)a4
{
  id v6;
  WBSLPLinkMetadataCache *v7;
  void *v8;
  uint64_t v9;
  NSURL *databaseURL;
  uint64_t v11;
  NSURL *diskCacheURL;
  NSObject *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *internalQueue;
  WBSLPLinkMetadataCache *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSLPLinkMetadataCache;
  v7 = -[WBSLPLinkMetadataCache init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend(CFSTR("LPLinkMetadata"), "stringByAppendingPathExtension:", CFSTR("db"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    databaseURL = v7->_databaseURL;
    v7->_databaseURL = (NSURL *)v9;

    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("LPLinkMetadata"), 1);
    v11 = objc_claimAutoreleasedReturnValue();
    diskCacheURL = v7->_diskCacheURL;
    v7->_diskCacheURL = (NSURL *)v11;

    v7->_expirationInterval = a4;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSLPLinkMetadataCache.%@.%p._internalQueue"), objc_opt_class(), v7);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), v13);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v15;

    v17 = v7;
  }

  return v7;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5445A38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(internalQueue, v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  WBSOnDiskDataCache *v6;
  uint64_t v7;
  void *v8;
  WBSLPLinkMetadataSQLiteStore *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  v2 = MEMORY[0x1A85D45E4](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 64) && *(_QWORD *)(v5 + 56))
  {
    v6 = -[WBSOnDiskDataCache initWithCacheDirectoryURL:]([WBSOnDiskDataCache alloc], "initWithCacheDirectoryURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDataCacheDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setIsInMemoryCacheEnabled:", 0);
    v9 = -[WBSSQLiteStore initWithURL:]([WBSLPLinkMetadataSQLiteStore alloc], "initWithURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 16);
    *(_QWORD *)(v10 + 16) = v9;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:");
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke_7;
    v14[3] = &unk_1E5445A10;
    objc_copyWeak(&v15, (id *)(a1 + 48));
    objc_msgSend(v12, "openAndCheckIntegrity:createIfNeeded:fallBackToMemoryStoreIfError:lockingPolicy:completionHandler:", 1, 1, 0, 1, v14);
    objc_destroyWeak(&v15);
  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __127__WBSFaviconProviderPersistenceController_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_completionHandler___block_invoke_cold_1(v13);
    objc_msgSend(*(id *)(a1 + 32), "_finishSetUpWithStatus:", 3);
  }
}

void __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  _QWORD v6[6];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E5443130;
    v6[4] = v4;
    v6[5] = a2;
    dispatch_async(v5, v6);
  }

}

uint64_t __52__WBSLPLinkMetadataCache_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id *v1;

  v1 = *(id **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    return objc_msgSend(v1, "_finishSetUpWithStatus:", objc_msgSend(*(id *)(a1 + 32), "_internalStatusFromWBSSQLStoreStatus:"));
  else
    return objc_msgSend(v1[1], "setUp");
}

- (void)closeAfterPendingChangesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5445A88;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 3;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5445A60;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "closeWithCompletionHandler:", v3);

  objc_destroyWeak(&v5);
}

void __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_3;
  v2[3] = &unk_1E5445A60;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 1), "savePendingChangesBeforeTearDown");
    v4 = v3[3];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_4;
    v5[3] = &unk_1E5443108;
    v5[4] = v3;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __72__WBSLPLinkMetadataCache_closeAfterPendingChangesWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)savePendingChangesBeforeTermination
{
  NSObject *internalQueue;
  uint64_t v4;
  WBSOnDiskDataCache *metadataDiskCache;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  internalQueue = self->_internalQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSLPLinkMetadataCache_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5445AB0;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(internalQueue, block);
  if (!*((_BYTE *)v10 + 24))
  {
    -[WBSOnDiskDataCache savePendingChangesBeforeTearDown](self->_metadataDiskCache, "savePendingChangesBeforeTearDown");
    metadataDiskCache = self->_metadataDiskCache;
    self->_metadataDiskCache = 0;

    v6 = self->_internalQueue;
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __61__WBSLPLinkMetadataCache_savePendingChangesBeforeTermination__block_invoke_2;
    v7[3] = &unk_1E5441CB8;
    v7[4] = self;
    dispatch_sync(v6, v7);
  }
  _Block_object_dispose(&v9, 8);
}

void __61__WBSLPLinkMetadataCache_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 40);
  if (v3 == 3 || v3 == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *(_QWORD *)(v2 + 40) = 3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "savePendingChangesBeforeTermination");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

  }
}

uint64_t __61__WBSLPLinkMetadataCache_savePendingChangesBeforeTermination__block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

- (void)setMetadata:(id)a3 forURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  WBSLPLinkMetadataCache *v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5445B50;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  objc_copyWeak(&v20, &location);
  dispatch_async(internalQueue, v15);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

void __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "safari_stringByFormattingForFaviconDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 40), "length");
  v4 = *(_QWORD **)(a1 + 48);
  if (v3)
  {
    v5 = (void *)v4[2];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke_2;
    v6[3] = &unk_1E5445B28;
    objc_copyWeak(&v9, (id *)(a1 + 64));
    v8 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "linkAndUpdateTimestampForMetadataWithURLString:completionHandler:", v2, v6);

    objc_destroyWeak(&v9);
  }
  else
  {
    objc_msgSend(v4, "removeMetadataWithURLString:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }

}

void __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  NSObject **v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke_3;
    block[3] = &unk_1E5445B00;
    v8 = v3;
    v11 = a1[5];
    v9 = v5;
    v10 = a1[4];
    objc_copyWeak(&v12, a1 + 6);
    dispatch_async(v6, block);
    objc_destroyWeak(&v12);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(v2, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke_4;
    v6[3] = &unk_1E5445AD8;
    objc_copyWeak(&v9, (id *)(a1 + 64));
    v8 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "setEntry:forKeyString:completionHandler:", v3, v5, v6);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke_4(id *a1, char a2)
{
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke_5;
    v7[3] = &unk_1E5443428;
    v10 = a2;
    v7[4] = WeakRetained;
    v9 = a1[5];
    v8 = a1[4];
    dispatch_async(v6, v7);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __69__WBSLPLinkMetadataCache_setMetadata_forURLString_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_didFinishDiskCacheWriteWithCompletionHandler:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "uuidString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_didFailDiskCacheWriteForUUID:completionHandler:", v3, *(_QWORD *)(a1 + 48));

  }
}

- (void)reuseMetadataOfURLString:(id)a3 forURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  WBSLPLinkMetadataCache *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__WBSLPLinkMetadataCache_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E54423F8;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

void __82__WBSLPLinkMetadataCache_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "safari_stringByFormattingForFaviconDatabase");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "safari_stringByFormattingForFaviconDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "linkURLString:withUUIDForURLString:completionHandler:", v2, v3, *(_QWORD *)(a1 + 56));

}

- (void)metadataForURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSLPLinkMetadataCache *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WBSLPLinkMetadataCache_metadataForURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5445BF0;
  v12 = v6;
  v13 = self;
  v9 = v6;
  objc_copyWeak(&v15, &location);
  v14 = v7;
  v10 = v7;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __65__WBSLPLinkMetadataCache_metadataForURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "safari_stringByFormattingForFaviconDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__WBSLPLinkMetadataCache_metadataForURLString_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5445BC8;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "metadataInfoForURLString:completionHandler:", v2, v4);

  objc_destroyWeak(&v6);
}

void __65__WBSLPLinkMetadataCache_metadataForURLString_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSObject **v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__WBSLPLinkMetadataCache_metadataForURLString_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5445BA0;
    v9 = v3;
    v7 = *(id *)(a1 + 32);
    v10 = v5;
    v11 = v7;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    dispatch_async(v6, v8);
    objc_destroyWeak(&v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __65__WBSLPLinkMetadataCache_metadataForURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "uuidString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__WBSLPLinkMetadataCache_metadataForURLString_completionHandler___block_invoke_4;
    v4[3] = &unk_1E5445B78;
    objc_copyWeak(&v7, (id *)(a1 + 56));
    v6 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(v3, "getEntryURLForKeyString:completionHandler:", v2, v4);

    objc_destroyWeak(&v7);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __65__WBSLPLinkMetadataCache_metadataForURLString_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_didRetrieveEntryURL:forMetadataInfo:completionHandler:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)removeMetadataWithURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSLPLinkMetadataCache *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5445C40;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_copyWeak(&v15, &location);
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "safari_stringByFormattingForFaviconDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5445C18;
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  objc_msgSend(v4, "removeMetadataInfoForURLString:completionHandler:", v2, v5);
  objc_destroyWeak(&v7);

}

void __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      v6 = WeakRetained[3];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke_3;
      block[3] = &unk_1E54432C0;
      block[4] = WeakRetained;
      v8 = v3;
      v9 = *(id *)(a1 + 32);
      dispatch_async(v6, block);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke_4;
  v4[3] = &unk_1E54423D0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "removeEntriesForKeyStrings:completionHandler:", v3, v4);

}

uint64_t __72__WBSLPLinkMetadataCache_removeMetadataWithURLString_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllMetadataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5445A88;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5445C68;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "removeAllMetadataInfoWithCompletionHandler:", v3);

  objc_destroyWeak(&v5);
}

void __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[3];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke_3;
    v5[3] = &unk_1E5443108;
    v5[4] = WeakRetained;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __65__WBSLPLinkMetadataCache_removeAllMetadataWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reset");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)dataCacheDidSetUp:(id)a3
{
  if (self->_cacheState == 1)
    -[WBSLPLinkMetadataCache _finishSetUpWithStatus:](self, "_finishSetUpWithStatus:", 0);
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
    v12 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WBSLPLinkMetadataCache sqliteStoreDidFailDatabaseIntegrityCheck:completionHandler:].cold.1(p_databaseURL, v12, v11);
  }
  v5[2](v5);

}

- (void)_didRetrieveEntryURL:(id)a3 forMetadataInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  WBSLPLinkMetadataCache *v17;
  id v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke;
  v15[3] = &unk_1E5445B50;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_copyWeak(&v20, &location);
  dispatch_async(internalQueue, v15);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

void __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = objc_msgSend(*(id *)(a1 + 40), "_isMetadataExpired:", *(_QWORD *)(a1 + 48));
  if (!v2 || (v3 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = *(void **)(v4 + 8);
      objc_msgSend(v5, "uuidString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke_2;
      v13[3] = &unk_1E5445C90;
      objc_copyWeak(&v16, (id *)(a1 + 64));
      v15 = *(id *)(a1 + 56);
      v14 = *(id *)(a1 + 48);
      objc_msgSend(v6, "removeEntriesForKeyStrings:completionHandler:", v8, v13);

      objc_destroyWeak(&v16);
    }
    else
    {
      v9 = *(void **)(v4 + 16);
      objc_msgSend(v5, "uuidString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke_5;
      v11[3] = &unk_1E54423D0;
      v12 = *(id *)(a1 + 56);
      objc_msgSend(v9, "removeAllMetadataInfoWithUUID:completionHandler:", v10, v11);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke_2(id *a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke_3;
    block[3] = &unk_1E54432C0;
    block[4] = WeakRetained;
    v6 = a1[4];
    v7 = a1[5];
    dispatch_async(v4, block);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "uuidString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke_4;
  v4[3] = &unk_1E54423D0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "removeAllMetadataInfoWithUUID:completionHandler:", v3, v4);

}

uint64_t __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__WBSLPLinkMetadataCache__didRetrieveEntryURL_forMetadataInfo_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_evictCacheItemsIfNecessaryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5445A88;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 72);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E54436D8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performLRUEvictionIfNecessaryWithMaximumNumberOfEntries:completionHandler:", v4, v5);

  objc_destroyWeak(&v7);
}

void __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  NSObject **v10;
  id v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E54417E0;
    v9 = v3;
    v7 = *(id *)(a1 + 32);
    v10 = v5;
    v11 = v7;
    dispatch_async(v6, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_4;
    v4[3] = &unk_1E54423D0;
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v2, "removeEntriesForKeyStrings:completionHandler:", v3, v4);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
}

uint64_t __75__WBSLPLinkMetadataCache__evictCacheItemsIfNecessaryWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_didFinishDiskCacheWriteWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_evictionEnabled)
  {
    objc_initWeak(&location, self);
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E5445A88;
    v7[4] = self;
    objc_copyWeak(&v9, &location);
    v8 = v5;
    dispatch_async(internalQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5445C68;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_evictCacheItemsIfNecessaryWithCompletionHandler:", v3);

  objc_destroyWeak(&v5);
}

void __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke_2(uint64_t a1, char a2)
{
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  char v9;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E5441D80;
    v9 = a2;
    block[4] = WeakRetained;
    v8 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __72__WBSLPLinkMetadataCache__didFinishDiskCacheWriteWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "_didFinishDiskCacheWriteWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_didFailDiskCacheWriteForUUID:(id)a3 completionHandler:(id)a4
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
  block[2] = __74__WBSLPLinkMetadataCache__didFailDiskCacheWriteForUUID_completionHandler___block_invoke;
  block[3] = &unk_1E54432C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __74__WBSLPLinkMetadataCache__didFailDiskCacheWriteForUUID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__WBSLPLinkMetadataCache__didFailDiskCacheWriteForUUID_completionHandler___block_invoke_2;
  v3[3] = &unk_1E54423D0;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "removeAllMetadataInfoWithUUID:completionHandler:", v1, v3);

}

uint64_t __74__WBSLPLinkMetadataCache__didFailDiskCacheWriteForUUID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)_internalStatusFromWBSSQLStoreStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (BOOL)_isMetadataExpired:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "dateAdded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  v7 = -v5;

  return self->_expirationInterval < v7 || v6 > 0.0;
}

- (void)_finishSetUpWithStatus:(int64_t)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__WBSLPLinkMetadataCache__finishSetUpWithStatus___block_invoke;
  v4[3] = &unk_1E5443130;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

void __49__WBSLPLinkMetadataCache__finishSetUpWithStatus___block_invoke(uint64_t a1)
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
    v3 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = 0;

    v6 = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = 2;
  }
  *(_QWORD *)(v2 + 40) = v6;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = 0;

}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (NSURL)diskCacheURL
{
  return self->_diskCacheURL;
}

- (BOOL)evictionEnabled
{
  return self->_evictionEnabled;
}

- (unint64_t)maximumNumberOfEntries
{
  return self->_maximumNumberOfEntries;
}

- (double)expirationInterval
{
  return self->_expirationInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCacheURL, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong(&self->_setUpCompletionHandler, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_metadataDatabase, 0);
  objc_storeStrong((id *)&self->_metadataDiskCache, 0);
}

- (void)sqliteStoreDidFailDatabaseIntegrityCheck:(void *)a3 completionHandler:.cold.1(void **a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = a2;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1A840B000, v5, OS_LOG_TYPE_ERROR, "Failed to remove corrupted database at %{public}@, error: %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
