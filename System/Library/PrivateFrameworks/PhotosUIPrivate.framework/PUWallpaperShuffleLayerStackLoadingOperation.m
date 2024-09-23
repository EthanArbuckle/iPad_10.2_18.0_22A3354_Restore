@implementation PUWallpaperShuffleLayerStackLoadingOperation

- (PUWallpaperShuffleLayerStackLoadingOperation)initWithPosterMedia:(id)a3 editConfiguration:(id)a4 assetDirectory:(id)a5 style:(id)a6 persistedStyle:(id)a7 isPreloading:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PUWallpaperShuffleLayerStackLoadingOperation *v19;
  uint64_t v20;
  PFPosterMedia *posterMedia;
  uint64_t v22;
  PFPosterEditConfiguration *editConfiguration;
  __CFString *v24;
  objc_super v26;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PUWallpaperShuffleLayerStackLoadingOperation;
  v19 = -[PXAsyncOperation init](&v26, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    posterMedia = v19->_posterMedia;
    v19->_posterMedia = (PFPosterMedia *)v20;

    v22 = objc_msgSend(v15, "copy");
    editConfiguration = v19->_editConfiguration;
    v19->_editConfiguration = (PFPosterEditConfiguration *)v22;

    objc_storeStrong((id *)&v19->_assetDirectory, a5);
    objc_storeStrong((id *)&v19->_style, a6);
    objc_storeStrong((id *)&v19->_persistedStyle, a7);
    v19->_isPreloading = v8;
    if (v8)
      v24 = CFSTR("preloading");
    else
      v24 = CFSTR("loading");
    objc_storeStrong((id *)&v19->_operationType, v24);
  }

  return v19;
}

- (void)px_start
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;
  CGRect v51;

  v50 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperShuffleLayerStackLoadingOperation posterMedia](self, "posterMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleLayerStackLoadingOperation assetDirectory](self, "assetDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleLayerStackLoadingOperation segmentationItem](self, "segmentationItem");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v4 == 0;
  else
    v8 = 1;
  if (v8 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperShuffleResourceManager.m"), 657, CFSTR("Invalid layer stack inputs"));

  }
  PLWallpaperGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[PUWallpaperShuffleLayerStackLoadingOperation operationType](self, "operationType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleLayerStackLoadingOperation posterMedia](self, "posterMedia");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v10;
    v48 = 2114;
    v49 = v12;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Started %{public}@ layer stack for shuffle asset %{public}@.", buf, 0x16u);

  }
  if (-[PUWallpaperShuffleLayerStackLoadingOperation tryLoadLayerStackFromDirectory](self, "tryLoadLayerStackFromDirectory")|| v7 == 0)
  {
    -[PUWallpaperShuffleLayerStackLoadingOperation px_finishIfPossible](self, "px_finishIfPossible");
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71220]), "initWithSegmentationItem:", v7);
    -[PUWallpaperShuffleLayerStackLoadingOperation setLayerStackRequest:](self, "setLayerStackRequest:", v13);

    if (-[PUWallpaperShuffleLayerStackLoadingOperation isPreloading](self, "isPreloading"))
      v14 = 2;
    else
      v14 = 1;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", v14);
    -[PUWallpaperShuffleLayerStackLoadingOperation layerStackRequest](self, "layerStackRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPriority:", v15);

    -[PUWallpaperShuffleLayerStackLoadingOperation style](self, "style");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleLayerStackLoadingOperation layerStackRequest](self, "layerStackRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStyle:", v17);

    if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
      v19 = 35;
    else
      v19 = 3;
    -[PUWallpaperShuffleLayerStackLoadingOperation layerStackRequest](self, "layerStackRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLayerStackOptions:", v19);

    -[PUWallpaperShuffleLayerStackLoadingOperation editConfiguration](self, "editConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 || (objc_msgSend(v4, "editConfiguration"), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v21, "normalizedVisibleFrame");
      if (!CGRectIsNull(v51))
      {
        objc_msgSend(v21, "normalizedVisibleFrame");
        PXRectFlippedVertically();
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        objc_msgSend(v21, "normalizedLandscapeVisibleFrame");
        PXRectFlippedVertically();
        v31 = v30;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        objc_msgSend(v7, "originalLayout");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "layoutByUpdatingNormalizedPortraitVisibleFrame:landscapeVisibleFrame:", v23, v25, v27, v29, v31, v33, v35, v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUWallpaperShuffleLayerStackLoadingOperation layerStackRequest](self, "layerStackRequest");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setLayout:", v39);

        -[PUWallpaperShuffleLayerStackLoadingOperation layerStackRequest](self, "layerStackRequest");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setUpdateClockZPosition:", 1);

      }
    }
    objc_initWeak((id *)buf, self);
    -[PUWallpaperShuffleLayerStackLoadingOperation layerStackRequest](self, "layerStackRequest");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __56__PUWallpaperShuffleLayerStackLoadingOperation_px_start__block_invoke;
    v44[3] = &unk_1E58A79E0;
    objc_copyWeak(&v45, (id *)buf);
    objc_msgSend(v42, "submit:", v44);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);

  }
}

- (BOOL)tryLoadLayerStackFromDirectory
{
  _BOOL4 v3;

  v3 = -[PUWallpaperShuffleLayerStackLoadingOperation _canLoadLayerStackFromDirectory](self, "_canLoadLayerStackFromDirectory");
  if (v3)
    LOBYTE(v3) = -[PUWallpaperShuffleLayerStackLoadingOperation _loadLayerStackFromDirectory](self, "_loadLayerStackFromDirectory");
  return v3;
}

- (BOOL)_canLoadLayerStackFromDirectory
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;

  -[PUWallpaperShuffleLayerStackLoadingOperation assetDirectory](self, "assetDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUWallpaperShuffleLayerStackLoadingOperation posterMedia](self, "posterMedia");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "style");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PUWallpaperShuffleLayerStackLoadingOperation persistedStyle](self, "persistedStyle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bakedStyle");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[PUWallpaperShuffleLayerStackLoadingOperation style](self, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bakedStyle");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v10)
    {

    }
    else
    {
      v11 = v10;
      v12 = objc_msgSend(v6, "isEqual:", v10);

      if ((v12 & 1) == 0)
      {
        v7 = 0;
LABEL_15:

        return v7;
      }
    }
    -[PUWallpaperShuffleLayerStackLoadingOperation editConfiguration](self, "editConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    if (v13)
    {
      objc_msgSend(v5, "normalizedVisibleFrame");
      objc_msgSend(v13, "normalizedVisibleFrame");
      if (!PXRectApproximatelyEqualToRect())
        v7 = 0;
    }

    goto LABEL_15;
  }
  return 0;
}

- (BOOL)_loadLayerStackFromDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v14;

  -[PUWallpaperShuffleLayerStackLoadingOperation assetDirectory](self, "assetDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleLayerStackLoadingOperation posterMedia](self, "posterMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subpath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0D71298], "loadCompoundLayerStackFromWallpaperURL:options:error:", v6, 2, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    -[PUWallpaperShuffleLayerStackLoadingOperation editConfiguration](self, "editConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v7, "compoundLayerStackByUpdatingPortraitDepthEnabled:landscapeDepthEnabled:", objc_msgSend(v9, "isDepthEnabled"), objc_msgSend(v9, "isLandscapeDepthEnabled"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "compoundLayerStackByUpdatingParallaxDisabled:", objc_msgSend(v10, "isPerspectiveZoomEnabled") ^ 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PUWallpaperShuffleLayerStackLoadingOperation setLayerStack:](self, "setLayerStack:", v7);
    -[PUWallpaperShuffleLayerStackLoadingOperation setError:](self, "setError:", v8);

    v12 = v7 != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_handleLayerStackResponse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  objc_msgSend(a3, "result:", &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v4)
  {
    objc_msgSend(v4, "compoundLayerStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleLayerStackLoadingOperation setLayerStack:](self, "setLayerStack:", v6);

    PLWallpaperGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PUWallpaperShuffleLayerStackLoadingOperation operationType](self, "operationType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperShuffleLayerStackLoadingOperation posterMedia](self, "posterMedia");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "assetUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2114;
      v19 = v10;
      v11 = "Finished %{public}@ layer stack for shuffle asset %{public}@";
      v12 = v7;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 22;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v12, v13, v11, buf, v14);

    }
  }
  else
  {
    -[PUWallpaperShuffleLayerStackLoadingOperation setError:](self, "setError:", v5);
    PLWallpaperGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PUWallpaperShuffleLayerStackLoadingOperation operationType](self, "operationType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperShuffleLayerStackLoadingOperation posterMedia](self, "posterMedia");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "assetUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v8;
      v18 = 2114;
      v19 = v10;
      v20 = 2114;
      v21 = v5;
      v11 = "Layer stack %{public}@ failed for shuffle asset %{public}@: %{public}@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
      goto LABEL_6;
    }
  }

  -[PUWallpaperShuffleLayerStackLoadingOperation px_finishIfPossible](self, "px_finishIfPossible");
}

- (void)cancel
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUWallpaperShuffleLayerStackLoadingOperation;
  -[PXAsyncOperation cancel](&v5, sel_cancel);
  -[PUWallpaperShuffleLayerStackLoadingOperation layerStackRequest](self, "layerStackRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllRequests");

}

- (BOOL)px_shouldWaitForCancel
{
  return 1;
}

- (void)px_finishIfPossible
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLWallpaperGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PUWallpaperShuffleLayerStackLoadingOperation posterMedia](self, "posterMedia");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    v9 = 1024;
    v10 = -[PUWallpaperShuffleLayerStackLoadingOperation isCancelled](self, "isCancelled");
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "Finished layer stack loading operation for shuffle asset %{public}@ (cancelled: %d)", buf, 0x12u);

  }
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperShuffleLayerStackLoadingOperation;
  -[PXAsyncOperation px_finishIfPossible](&v6, sel_px_finishIfPossible);
}

- (PFPosterMedia)posterMedia
{
  return self->_posterMedia;
}

- (PFPosterEditConfiguration)editConfiguration
{
  return self->_editConfiguration;
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (PIParallaxStyle)persistedStyle
{
  return self->_persistedStyle;
}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (BOOL)isPreloading
{
  return self->_isPreloading;
}

- (PISegmentationItem)segmentationItem
{
  return (PISegmentationItem *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSegmentationItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (PFWallpaperCompoundLayerStack)layerStack
{
  return (PFWallpaperCompoundLayerStack *)objc_getProperty(self, a2, 312, 1);
}

- (void)setLayerStack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 320, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)operationType
{
  return self->_operationType;
}

- (PIParallaxCompoundLayerStackRequest)layerStackRequest
{
  return self->_layerStackRequest;
}

- (void)setLayerStackRequest:(id)a3
{
  objc_storeStrong((id *)&self->_layerStackRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerStackRequest, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_layerStack, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_assetDirectory, 0);
  objc_storeStrong((id *)&self->_persistedStyle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_editConfiguration, 0);
  objc_storeStrong((id *)&self->_posterMedia, 0);
}

void __56__PUWallpaperShuffleLayerStackLoadingOperation_px_start__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleLayerStackResponse:", v3);

}

@end
