@implementation PUWallpaperShuffleResourceExportOperation

- (void)px_start
{
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
  char v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  PLWallpaperGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v6;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Started exporting resources for shuffle asset %{public}@.", buf, 0xCu);

  }
  -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceExportOperation exportDirectory](self, "exportDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperShuffleResourceManager.m"), 786, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterMedia != nil"));

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperShuffleResourceManager.m"), 787, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exportDirectory"));

  }
  -[PUWallpaperShuffleResourceExportOperation segmentationItem](self, "segmentationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || -[PUWallpaperShuffleResourceExportOperation _tryExportFromDirectory](self, "_tryExportFromDirectory"))
  {
    -[PUWallpaperShuffleResourceExportOperation px_finishIfPossible](self, "px_finishIfPossible");
    goto LABEL_21;
  }
  -[PUWallpaperShuffleResourceExportOperation exportDirectory](self, "exportDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subpath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "fileExistsAtPath:", v14);

  if (!(_DWORD)v11)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v16 = objc_msgSend(v15, "removeItemAtURL:error:", v32, &v35);
  v17 = v35;

  if ((v16 & 1) != 0)
  {

LABEL_14:
    -[PUWallpaperShuffleResourceExportOperation editConfiguration](self, "editConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "editConfiguration");
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[PUWallpaperShuffleResourceExportOperation style](self, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bakedStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v24 = (void *)MEMORY[0x1E0D71298];
    v25 = -[PUWallpaperShuffleResourceExportOperation options](self, "options");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __53__PUWallpaperShuffleResourceExportOperation_px_start__block_invoke;
    v33[3] = &unk_1E58A3090;
    objc_copyWeak(&v34, (id *)buf);
    objc_msgSend(v24, "saveSegmentationItem:layerStackOptions:configuration:style:layout:toWallpaperURL:completion:", v9, v25, v20, v23, 0, v32, v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleResourceExportOperation setExportTask:](self, "setExportTask:", v26);

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);

    goto LABEL_21;
  }
  PLWallpaperGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "assetUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v29;
    v38 = 2114;
    v39 = v17;
    _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_ERROR, "Failed to delete wallpaper directory %{public}@, error: %{public}@", buf, 0x16u);

  }
  -[PUWallpaperShuffleResourceExportOperation _handleExportCompletion:](self, "_handleExportCompletion:", v17);

LABEL_21:
}

- (BOOL)_tryExportFromDirectory
{
  _BOOL4 v3;

  v3 = -[PUWallpaperShuffleResourceExportOperation _canExportFromDirectory](self, "_canExportFromDirectory");
  if (v3)
    LOBYTE(v3) = -[PUWallpaperShuffleResourceExportOperation _exportFromDirectory](self, "_exportFromDirectory");
  return v3;
}

- (BOOL)_canExportFromDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  uint64_t v39;
  double v40;
  CGFloat v41;
  void *v42;
  double v43;
  CGFloat v44;
  CGFloat v46;
  CGFloat v47;
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  -[PUWallpaperShuffleResourceExportOperation sourceDirectory](self, "sourceDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subpath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((_DWORD)v5)
  {
    -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "editConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "style");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PUWallpaperShuffleResourceExportOperation persistedStyle](self, "persistedStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bakedStyle");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[PUWallpaperShuffleResourceExportOperation style](self, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bakedStyle");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v15)
    {

    }
    else
    {
      v16 = v15;
      v17 = objc_msgSend(v11, "isEqual:", v15);

      if ((v17 & 1) == 0)
      {
        LOBYTE(v12) = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    -[PUWallpaperShuffleResourceExportOperation editConfiguration](self, "editConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18
      || (objc_msgSend(v10, "normalizedVisibleFrame"),
          objc_msgSend(v18, "normalizedVisibleFrame"),
          PXRectApproximatelyEqualToRect())
      && (objc_msgSend(v10, "normalizedLandscapeVisibleFrame"),
          objc_msgSend(v18, "normalizedLandscapeVisibleFrame"),
          PXRectApproximatelyEqualToRect())
      && (v19 = objc_msgSend(v18, "isDepthEnabled"), v19 == objc_msgSend(v10, "isDepthEnabled"))
      && (v20 = objc_msgSend(v18, "isPerspectiveZoomEnabled"),
          v20 == objc_msgSend(v10, "isPerspectiveZoomEnabled")))
    {
      v48 = 0;
      objc_msgSend(MEMORY[0x1E0D71298], "loadCompoundLayerStackFromWallpaperURL:options:error:", v6, 0, &v48);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "portraitLayerStack");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "layout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "visibleFrame");
      v46 = v25;
      v47 = v24;
      v27 = v26;
      v29 = v28;

      objc_msgSend(v22, "layout");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "inactiveFrame");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;

      objc_msgSend(v22, "layout");
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v39, "imageSize");
      v41 = v40;
      objc_msgSend(v22, "layout");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "imageSize");
      v44 = v43;

      v49.origin.x = 0.0;
      v49.origin.y = 0.0;
      v49.size.width = v41;
      v49.size.height = v44;
      v51.origin.y = v46;
      v51.origin.x = v47;
      v51.size.width = v27;
      v51.size.height = v29;
      LODWORD(v39) = CGRectContainsRect(v49, v51);
      v50.origin.x = 0.0;
      v50.origin.y = 0.0;
      v50.size.width = v41;
      v50.size.height = v44;
      v52.origin.x = v32;
      v52.origin.y = v34;
      v52.size.width = v36;
      v52.size.height = v38;
      v12 = v39 ^ CGRectContainsRect(v50, v52) ^ 1;

    }
    else
    {
      LOBYTE(v12) = 0;
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 0;
LABEL_19:

  return v12;
}

- (BOOL)_exportFromDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperShuffleResourceExportOperation sourceDirectory](self, "sourceDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subpath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperShuffleResourceExportOperation exportDirectory](self, "exportDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subpath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v6, v10, &v21);
  v13 = v21;

  PLWallpaperGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "assetUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_INFO, "Successfully copied existing data for shuffle asset %{public}@", buf, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "assetUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Failed to copy shuffle asset %{public}@, error: %{public}@", buf, 0x16u);

    }
    -[PUWallpaperShuffleResourceExportOperation setError:](self, "setError:", v13);
  }

  return v12;
}

- (void)_handleExportCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assetUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Error while exporting resources for shuffle asset %{public}@: %{public}@", (uint8_t *)&v11, 0x16u);

    }
    -[PUWallpaperShuffleResourceExportOperation setError:](self, "setError:", v4);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "assetUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_INFO, "Successfully exported shuffle asset %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  -[PUWallpaperShuffleResourceExportOperation px_finishIfPossible](self, "px_finishIfPossible");

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperShuffleResourceExportOperation;
  -[PXAsyncOperation cancel](&v4, sel_cancel);
  -[PUWallpaperShuffleResourceExportOperation exportTask](self, "exportTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

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
    -[PUWallpaperShuffleResourceExportOperation posterMedia](self, "posterMedia");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    v9 = 1024;
    v10 = -[PUWallpaperShuffleResourceExportOperation isCancelled](self, "isCancelled");
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "Finished export operation for shuffle asset %{public}@ (cancelled: %d)", buf, 0x12u);

  }
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperShuffleResourceExportOperation;
  -[PXAsyncOperation px_finishIfPossible](&v6, sel_px_finishIfPossible);
}

- (PFPosterMedia)posterMedia
{
  return self->_posterMedia;
}

- (void)setPosterMedia:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (PFPosterEditConfiguration)editConfiguration
{
  return self->_editConfiguration;
}

- (void)setEditConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (PIParallaxStyle)persistedStyle
{
  return self->_persistedStyle;
}

- (void)setPersistedStyle:(id)a3
{
  objc_storeStrong((id *)&self->_persistedStyle, a3);
}

- (NSURL)sourceDirectory
{
  return self->_sourceDirectory;
}

- (void)setSourceDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDirectory, a3);
}

- (NSURL)exportDirectory
{
  return self->_exportDirectory;
}

- (void)setExportDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_exportDirectory, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setSegmentationItem:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationItem, a3);
}

- (PISegmentationLoading)exportTask
{
  return (PISegmentationLoading *)objc_getProperty(self, a2, 320, 1);
}

- (void)setExportTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 328, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_exportTask, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_exportDirectory, 0);
  objc_storeStrong((id *)&self->_sourceDirectory, 0);
  objc_storeStrong((id *)&self->_persistedStyle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_editConfiguration, 0);
  objc_storeStrong((id *)&self->_posterMedia, 0);
}

void __53__PUWallpaperShuffleResourceExportOperation_px_start__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleExportCompletion:", v3);

}

@end
