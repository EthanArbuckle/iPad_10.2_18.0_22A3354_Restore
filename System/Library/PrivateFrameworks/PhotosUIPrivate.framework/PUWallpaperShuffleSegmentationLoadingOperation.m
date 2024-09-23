@implementation PUWallpaperShuffleSegmentationLoadingOperation

- (PUWallpaperShuffleSegmentationLoadingOperation)initWithPosterMedia:(id)a3 assetDirectory:(id)a4 photoLibrary:(id)a5 isPreloading:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  PUWallpaperShuffleSegmentationLoadingOperation *v13;
  uint64_t v14;
  PFPosterMedia *posterMedia;
  __CFString *v16;
  objc_super v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperShuffleSegmentationLoadingOperation;
  v13 = -[PXAsyncOperation init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    posterMedia = v13->_posterMedia;
    v13->_posterMedia = (PFPosterMedia *)v14;

    objc_storeStrong((id *)&v13->_assetDirectory, a4);
    objc_storeStrong((id *)&v13->_photoLibrary, a5);
    v13->_isPreloading = v6;
    if (v6)
      v16 = CFSTR("preloading");
    else
      v16 = CFSTR("loading");
    objc_storeStrong((id *)&v13->_operationType, v16);
  }

  return v13;
}

- (void)px_start
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperShuffleSegmentationLoadingOperation posterMedia](self, "posterMedia");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    -[PUWallpaperShuffleSegmentationLoadingOperation px_finishIfPossible](self, "px_finishIfPossible");
  PLWallpaperGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PUWallpaperShuffleSegmentationLoadingOperation operationType](self, "operationType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleSegmentationLoadingOperation posterMedia](self, "posterMedia");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v5;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Started %{public}@ segmentation for shuffle asset %{public}@.", buf, 0x16u);

  }
  if (-[PUWallpaperShuffleSegmentationLoadingOperation tryLoadSegmentationFromDirectory](self, "tryLoadSegmentationFromDirectory"))
  {
    -[PUWallpaperShuffleSegmentationLoadingOperation px_finishIfPossible](self, "px_finishIfPossible");
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v3, "assetUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleSegmentationLoadingOperation photoLibrary](self, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchAssetsWithUUIDs:options:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[PUWallpaperShuffleSegmentationLoadingOperation setError:](self, "setError:", 0);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1818]), "initWithPhotoAsset:", v14);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71298]), "initWithParallaxAsset:", v15);
      objc_msgSend(v16, "setDisableSettlingEffect:", 1);
      -[PUWallpaperShuffleSegmentationLoadingOperation downloadProgressHandler](self, "downloadProgressHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDownloadProgressHandler:", v17);

      objc_initWeak((id *)buf, self);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __58__PUWallpaperShuffleSegmentationLoadingOperation_px_start__block_invoke;
      v20[3] = &unk_1E589ECD0;
      objc_copyWeak(&v22, (id *)buf);
      v21 = v14;
      objc_msgSend(v16, "loadSegmentationItemWithCompletion:", v20);
      -[PUWallpaperShuffleSegmentationLoadingOperation setLoader:](self, "setLoader:", v16);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      PLWallpaperGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "assetUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v19;
        _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "Failed to fetch asset %{public}@", buf, 0xCu);

      }
      -[PUWallpaperShuffleSegmentationLoadingOperation px_finishIfPossible](self, "px_finishIfPossible");
    }

  }
}

- (BOOL)tryLoadSegmentationFromDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id v11;

  -[PUWallpaperShuffleSegmentationLoadingOperation assetDirectory](self, "assetDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleSegmentationLoadingOperation posterMedia](self, "posterMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subpath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0D71298], "loadSegmentationItemFromWallpaperURL:error:", v6, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v9 = v7 != 0;
    if (v7)
      -[PUWallpaperShuffleSegmentationLoadingOperation setSegmentationItem:](self, "setSegmentationItem:", v7);
    else
      -[PUWallpaperShuffleSegmentationLoadingOperation setError:](self, "setError:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_handleSegmentationResult:(id)a3 forAssetUUID:(id)a4 loadingError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[PUWallpaperShuffleSegmentationLoadingOperation operationType](self, "operationType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "Finished %{public}@ segmentation for shuffle asset %{public}@: %{public}@", (uint8_t *)&v15, 0x20u);

    }
    -[PUWallpaperShuffleSegmentationLoadingOperation setSegmentationItem:](self, "setSegmentationItem:", v8);
    -[PUWallpaperShuffleSegmentationLoadingOperation setError:](self, "setError:", 0);
  }
  else
  {
    -[PUWallpaperShuffleSegmentationLoadingOperation setError:](self, "setError:", v10);
    PLWallpaperGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[PUWallpaperShuffleSegmentationLoadingOperation operationType](self, "operationType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "Segmentation %{public}@ failed for shuffle asset %{public}@: %{public}@", (uint8_t *)&v15, 0x20u);

    }
  }
  -[PUWallpaperShuffleSegmentationLoadingOperation px_finishIfPossible](self, "px_finishIfPossible");

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperShuffleSegmentationLoadingOperation;
  -[PXAsyncOperation cancel](&v4, sel_cancel);
  -[PUWallpaperShuffleSegmentationLoadingOperation loader](self, "loader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (BOOL)px_shouldWaitForCancel
{
  return 1;
}

- (void)px_finishIfPossible
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperShuffleSegmentationLoadingOperation segmentationItem](self, "segmentationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[PUWallpaperShuffleSegmentationLoadingOperation error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      if ((-[PUWallpaperShuffleSegmentationLoadingOperation isCancelled](self, "isCancelled") & 1) != 0)
        goto LABEL_6;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperShuffleResourceManager.m"), 621, CFSTR("Operation finished, but has invalid output."));
    }
  }

LABEL_6:
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PUWallpaperShuffleSegmentationLoadingOperation posterMedia](self, "posterMedia");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = -[PUWallpaperShuffleSegmentationLoadingOperation isCancelled](self, "isCancelled");
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Finished segmentation loading operation for shuffle asset %{public}@ (cancelled: %d)", buf, 0x12u);

  }
  v8.receiver = self;
  v8.super_class = (Class)PUWallpaperShuffleSegmentationLoadingOperation;
  -[PXAsyncOperation px_finishIfPossible](&v8, sel_px_finishIfPossible);
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setSegmentationItem:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationItem, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (id)downloadProgressHandler
{
  return self->_downloadProgressHandler;
}

- (void)setDownloadProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)operationType
{
  return self->_operationType;
}

- (PISegmentationLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
  objc_storeStrong((id *)&self->_loader, a3);
}

- (PFPosterMedia)posterMedia
{
  return self->_posterMedia;
}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)isPreloading
{
  return self->_isPreloading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetDirectory, 0);
  objc_storeStrong((id *)&self->_posterMedia, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong(&self->_downloadProgressHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
}

void __58__PUWallpaperShuffleSegmentationLoadingOperation_px_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleSegmentationResult:forAssetUUID:loadingError:", v7, v8, v6);

}

@end
