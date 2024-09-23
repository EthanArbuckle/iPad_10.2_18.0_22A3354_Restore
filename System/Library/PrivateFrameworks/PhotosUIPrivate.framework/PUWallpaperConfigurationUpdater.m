@implementation PUWallpaperConfigurationUpdater

- (PUWallpaperConfigurationUpdater)initWithPhotoLibrary:(id)a3 sourceConfiguration:(id)a4 targetAssetDirectory:(id)a5 overrideConfiguration:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PUWallpaperConfigurationUpdater *v15;
  PUWallpaperConfigurationUpdater *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperConfigurationUpdater;
  v15 = -[PUWallpaperConfigurationUpdater init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibrary, a3);
    objc_storeStrong((id *)&v16->_sourceConfiguration, a4);
    objc_storeStrong((id *)&v16->_targetAssetDirectory, a5);
    objc_storeStrong((id *)&v16->_overrideConfiguration, a6);
  }

  return v16;
}

- (void)attemptUpdateWithCompletionBlock:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PUWallpaperConfigurationUpdater overrideConfiguration](self, "overrideConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetURL");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!(v7 | v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperConfigurationUpdater.m"), 57, CFSTR("Either asset URL or asset identifier are required to update the configuration."));

    goto LABEL_12;
  }
  if (v7)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D711F8]), "initWithFileURL:", v7);
  }
  else
  {
    if (!v8)
      goto LABEL_12;
    v11 = (void *)MEMORY[0x1E0CD1390];
    v27[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperConfigurationUpdater photoLibrary](self, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchAssetsWithLocalIdentifiers:options:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1818]), "initWithPhotoAsset:", v16);
    else
      v10 = 0;

  }
  if (v10)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71298]), "initWithParallaxAsset:", v10);
    objc_initWeak((id *)location, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__PUWallpaperConfigurationUpdater_attemptUpdateWithCompletionBlock___block_invoke;
    v21[3] = &unk_1E58AB9E8;
    objc_copyWeak(&v23, (id *)location);
    v22 = v5;
    objc_msgSend(v17, "loadSegmentationItemWithCompletion:", v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
    goto LABEL_15;
  }
LABEL_12:
  PLWallpaperGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = v7;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_INFO, "Failed to load asset for configuration update: assetURL: %@, assetIdentifier: %@", location, 0x16u);
  }

  -[PUWallpaperConfigurationUpdater sourceConfiguration](self, "sourceConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v20, "copy");

  objc_msgSend(v10, "setOptions:", objc_msgSend(v10, "options") & 0xFFFFFFFFFFFFFFF7);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUWallpaperPosterErrorDomain"), -1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, _QWORD, _QWORD, void *))v5 + 2))(v5, v10, 0, 0, 0, v17);
LABEL_15:

}

- (void)_handleSegmentationItem:(id)a3 error:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PUWallpaperConfigurationUpdater sourceConfiguration](self, "sourceConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    v54 = (void *)objc_msgSend(v11, "copy");
    -[PUWallpaperConfigurationUpdater overrideConfiguration](self, "overrideConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "editConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71230], "defaultOriginalStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "kind");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "availableStyleOfKind:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0D71248], "styleWithBakedStyle:", v15);
      v19 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v19;
    }
    if ((objc_msgSend(v13, "includeBackfillLayers") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
    {
      v20 = 67;
    }
    else
    {
      v20 = 65;
    }
    v56 = v10;
    if (PFPosterWantsLowLuminanceContent() && objc_msgSend(v13, "includeInactiveLayers"))
      v20 |= 4uLL;
    v55 = v15;
    v57 = v9;
    v23 = objc_msgSend(v13, "applySmartCrop");
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71220]), "initWithSegmentationItem:", v8);
    objc_msgSend(v24, "setResponseQueue:", MEMORY[0x1E0C80D38]);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
    objc_msgSend(v24, "setPriority:", v25);

    objc_msgSend(v24, "setLayerStackOptions:", v20);
    objc_msgSend(v24, "setStyle:", v16);
    objc_msgSend(v12, "editConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSettlingEffectEnabled:", objc_msgSend(v26, "isSettlingEffectEnabled"));

    if ((v23 & 1) == 0)
    {
      objc_msgSend(v8, "originalLayout");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "portraitLayout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "originalLayout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "landscapeLayout");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "normalizedVisibleFrame");
      PXSizeGetAspectRatio();
      PXRectWithAspectRatioFittingRect();
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      objc_msgSend(v30, "normalizedVisibleFrame");
      PXSizeGetAspectRatio();
      PXRectWithAspectRatioFittingRect();
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v47 = objc_alloc(MEMORY[0x1E0D75208]);
      objc_msgSend(v28, "layoutByUpdatingNormalizedVisibleFrame:", v32, v34, v36, v38);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "layoutByUpdatingNormalizedVisibleFrame:", v40, v42, v44, v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(v47, "initWithPortraitLayout:landscapeLayout:", v48, v49);
      objc_msgSend(v24, "setLayout:", v50);

      objc_msgSend(v24, "setUpdateClockZPosition:", 1);
    }
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __81__PUWallpaperConfigurationUpdater__handleSegmentationItem_error_completionBlock___block_invoke;
    v58[3] = &unk_1E58ABA10;
    v59 = v54;
    v60 = v13;
    v61 = v16;
    v62 = v12;
    v10 = v56;
    v64 = v56;
    v63 = v8;
    v51 = v16;
    v52 = v13;
    v53 = v54;
    objc_msgSend(v24, "submit:", v58);

    v9 = v57;
    v22 = v55;
  }
  else
  {
    PLWallpaperGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v9;
      _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_ERROR, "Loading segmentation item failed during configuration update: %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUWallpaperPosterErrorDomain"), -1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, v12, 0, 0, 0, v22);
  }

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PFPosterConfiguration)sourceConfiguration
{
  return self->_sourceConfiguration;
}

- (NSURL)targetAssetDirectory
{
  return self->_targetAssetDirectory;
}

- (PUPosterOverrideConfiguration)overrideConfiguration
{
  return self->_overrideConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideConfiguration, 0);
  objc_storeStrong((id *)&self->_targetAssetDirectory, 0);
  objc_storeStrong((id *)&self->_sourceConfiguration, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __81__PUWallpaperConfigurationUpdater__handleSegmentationItem_error_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v45 = 0;
  objc_msgSend(a2, "result:", &v45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v45;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "statistics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Segmentation stats: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v3, "compoundLayerStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "compoundLayerStackByUpdatingPortraitDepthEnabled:landscapeDepthEnabled:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0D75210]);
    v11 = (void *)MEMORY[0x1E0CD1698];
    objc_msgSend(*(id *)(a1 + 40), "assetIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuidFromLocalIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithAssetUUID:", v13);
    v46 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMedia:", v15);

    objc_msgSend(v9, "portraitLayerStack");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "normalizedVisibleFrame");
    PXRectFlippedVertically();
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(*(id *)(a1 + 32), "editConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNormalizedVisibleFrame:", v19, v21, v23, v25);

    objc_msgSend(v9, "landscapeLayerStack");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layout");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "normalizedVisibleFrame");
    PXRectFlippedVertically();
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    objc_msgSend(*(id *)(a1 + 32), "editConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setNormalizedLandscapeVisibleFrame:", v30, v32, v34, v36);

    objc_msgSend(*(id *)(a1 + 48), "bakedStyle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "editConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setStyle:", v38);

    objc_msgSend(*(id *)(a1 + 32), "setOptions:", objc_msgSend(*(id *)(a1 + 32), "options") & 0xFFFFFFFFFFFFFFF7);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v48 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Segmentation failed during configuration update: %{public}@", buf, 0xCu);
    }

    v9 = 0;
  }
  v40 = 32;
  if (!v3)
    v40 = 56;
  v41 = *(_QWORD *)(a1 + 72);
  v42 = *(void **)(a1 + 48);
  v43 = *(id *)(a1 + v40);
  objc_msgSend(v42, "bakedStyle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *, _QWORD, id))(v41 + 16))(v41, v43, v9, v44, *(_QWORD *)(a1 + 64), v4);

}

void __68__PUWallpaperConfigurationUpdater_attemptUpdateWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleSegmentationItem:error:completionBlock:", v7, v6, *(_QWORD *)(a1 + 32));

}

@end
