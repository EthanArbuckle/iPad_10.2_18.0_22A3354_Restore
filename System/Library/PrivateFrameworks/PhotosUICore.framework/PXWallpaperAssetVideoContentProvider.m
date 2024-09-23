@implementation PXWallpaperAssetVideoContentProvider

- (PXWallpaperAssetVideoContentProvider)initWithWallpaperAsset:(id)a3
{
  id v5;
  PXWallpaperAssetVideoContentProvider *v6;
  PXWallpaperAssetVideoContentProvider *v7;
  void *v8;
  uint64_t v9;
  NSString *contentIdentifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXWallpaperAssetVideoContentProvider;
  v6 = -[PXWallpaperAssetVideoContentProvider init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    objc_msgSend(v5, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("-wallpaper"));
    v9 = objc_claimAutoreleasedReturnValue();
    contentIdentifier = v7->_contentIdentifier;
    v7->_contentIdentifier = (NSString *)v9;

  }
  return v7;
}

- (PXWallpaperAssetVideoContentProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWallpaperAssetVideoContentProvider.m"), 39, CFSTR("%s is not available as initializer"), "-[PXWallpaperAssetVideoContentProvider init]");

  abort();
}

- (void)makeUniqueContentIdentifier
{
  NSString *v3;
  NSString *contentIdentifier;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  contentIdentifier = self->_contentIdentifier;
  self->_contentIdentifier = v3;

}

- (void)beginLoadingWithPriority:(int64_t)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_msgSend((id)objc_opt_class(), "_loadingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PXWallpaperAssetVideoContentProvider_beginLoadingWithPriority___block_invoke;
  block[3] = &unk_1E51447A0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(v5, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

}

- (void)cancelLoading
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWallpaperAssetVideoContentProvider.m"), 59, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXWallpaperAssetVideoContentProvider cancelLoading]", v6);

  abort();
}

- (void)_loadWallpaperAssetWithPriority:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v5 = objc_alloc(MEMORY[0x1E0CD1818]);
  -[PXWallpaperAssetVideoContentProvider asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPhotoAsset:", v6);

  objc_msgSend(v7, "segmentationResourceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PXWallpaperAssetVideoContentProvider__loadWallpaperAssetWithPriority___block_invoke;
    v10[3] = &unk_1E51226B8;
    v10[4] = self;
    v10[5] = a3;
    objc_msgSend(MEMORY[0x1E0D71240], "loadSettlingEffectVideoDataFromURL:completion:", v8, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXVideoContentProviderErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXWallpaperAssetVideoContentProvider _handleLoadedPlayerItem:priority:error:](self, "_handleLoadedPlayerItem:priority:error:", 0, a3, v9);

  }
}

- (void)_handleLoadedPlayerItem:(id)a3 priority:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "_loadingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  PLVideoPlaybackGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v19 = v8;
    v20 = 2113;
    v21 = v9;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Handling loaded player item: %{private}@, error: %{private}@", buf, 0x16u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PXWallpaperAssetVideoContentProvider__handleLoadedPlayerItem_priority_error___block_invoke;
  v14[3] = &unk_1E5146098;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

- (id)contentIdentifier
{
  return self->_contentIdentifier;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

void __79__PXWallpaperAssetVideoContentProvider__handleLoadedPlayerItem_priority_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__PXWallpaperAssetVideoContentProvider__handleLoadedPlayerItem_priority_error___block_invoke_2;
  v5[3] = &unk_1E51226E0;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v8 = v3;
  v9 = v4;
  objc_msgSend(v6, "performChanges:", v5);

}

void __79__PXWallpaperAssetVideoContentProvider__handleLoadedPlayerItem_priority_error___block_invoke_2(uint64_t a1)
{
  PXVideoContentProviderLoadingResult *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  PXVideoContentProviderLoadingResult *v7;
  _OWORD v8[3];

  v2 = [PXVideoContentProviderLoadingResult alloc];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v8[0] = *MEMORY[0x1E0CA2E40];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v7 = -[PXVideoContentProviderLoadingResult initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:](v2, "initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:", v3, 0, v8, 0, v4, v5, CFSTR("Loaded"));
  objc_msgSend(*(id *)(a1 + 32), "setLoadingResult:", v7);

}

void __72__PXWallpaperAssetVideoContentProvider__loadWallpaperAssetWithPriority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithData:contentType:options:", v5, *MEMORY[0x1E0C8A2E8], MEMORY[0x1E0C9AA70]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_handleLoadedPlayerItem:priority:error:", v9, *(_QWORD *)(a1 + 40), 0);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    if (v6)
    {
      v12 = *MEMORY[0x1E0CB3388];
      v13[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PXVideoContentProviderErrorDomain"), 1, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXVideoContentProviderErrorDomain"), 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "_handleLoadedPlayerItem:priority:error:", 0, *(_QWORD *)(a1 + 40), v8);
  }

}

void __65__PXWallpaperAssetVideoContentProvider_beginLoadingWithPriority___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadWallpaperAssetWithPriority:", *(_QWORD *)(a1 + 40));

}

+ (id)_loadingQueue
{
  if (_loadingQueue_onceToken != -1)
    dispatch_once(&_loadingQueue_onceToken, &__block_literal_global_78844);
  return (id)_loadingQueue_loadingQueue;
}

void __53__PXWallpaperAssetVideoContentProvider__loadingQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_loadingQueue_loadingQueue;
  _loadingQueue_loadingQueue = v0;

}

@end
