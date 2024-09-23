@implementation PUParallaxLayerStackRadarController

- (PUParallaxLayerStackRadarController)initWithAsset:(id)a3 compoundLayerStack:(id)a4 segmentationItem:(id)a5 posterDescriptor:(id)a6 posterConfiguration:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PUParallaxLayerStackRadarController *v17;
  PUParallaxLayerStackRadarController *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSURL *baseTemporaryURL;
  uint64_t v24;
  NSURL *screenshotURL;
  id v27;
  objc_super v28;

  v27 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PUParallaxLayerStackRadarController;
  v17 = -[PUParallaxLayerStackRadarController init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_asset, a3);
    objc_storeStrong((id *)&v18->_compoundLayerStack, a4);
    objc_storeStrong((id *)&v18->_segmentationItem, a5);
    objc_storeStrong((id *)&v18->_posterDescriptor, a6);
    objc_storeStrong((id *)&v18->_posterConfiguration, a7);
    v19 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("photosradarfeedback"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURLWithPath:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    baseTemporaryURL = v18->_baseTemporaryURL;
    v18->_baseTemporaryURL = (NSURL *)v22;

    objc_msgSend(MEMORY[0x1E0D7B428], "captureScreenshot");
    v24 = objc_claimAutoreleasedReturnValue();
    screenshotURL = v18->_screenshotURL;
    v18->_screenshotURL = (NSURL *)v24;

  }
  return v18;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(void *, void *, id);
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  void (**v35)(void *, void *, id);
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[4];
  id v44;
  PUParallaxLayerStackRadarController *v45;
  _QWORD aBlock[4];
  id v47;
  PUParallaxLayerStackRadarController *v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke;
  aBlock[3] = &unk_1E58A1FB8;
  v6 = v4;
  v47 = v6;
  v48 = self;
  v7 = _Block_copy(aBlock);
  v43[0] = v5;
  v43[1] = 3221225472;
  v43[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_3;
  v43[3] = &unk_1E58A1FE0;
  v8 = v6;
  v44 = v8;
  v45 = self;
  v9 = _Block_copy(v43);
  v41[0] = v5;
  v41[1] = 3221225472;
  v41[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_152;
  v41[3] = &unk_1E58A2008;
  v41[4] = self;
  v10 = v8;
  v42 = v10;
  v11 = _Block_copy(v41);
  v36[0] = v5;
  v36[1] = 3221225472;
  v36[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_157;
  v36[3] = &unk_1E58A2030;
  v12 = v9;
  v38 = v12;
  v28 = v7;
  v39 = v28;
  v36[4] = self;
  v13 = v11;
  v40 = v13;
  v14 = v10;
  v37 = v14;
  v15 = (void (**)(void *, void *, id))_Block_copy(v36);
  -[PUParallaxLayerStackRadarController compoundLayerStack](self, "compoundLayerStack");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[PUParallaxLayerStackRadarController segmentationItem](self, "segmentationItem", v28);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v16, v17);
  }
  else
  {
    objc_msgSend(v14, "beginCollectionOperationWithName:timeout:", CFSTR("Load Layer Stack"), 1.84467441e19, v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_opt_class();
    -[PUParallaxLayerStackRadarController asset](self, "asset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2_161;
    v33[3] = &unk_1E58A2058;
    v33[4] = self;
    v34 = v18;
    v35 = v15;
    v17 = v18;
    objc_msgSend(v19, "loadLayerStackForAsset:completion:", v20, v33);

  }
  objc_msgSend(v14, "beginCollectionOperationWithName:timeout:", CFSTR("Asset Resource"), 10.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CD1390];
  -[PUParallaxLayerStackRadarController asset](self, "asset");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_167;
  v30[3] = &unk_1E58A2080;
  v31 = v14;
  v32 = v21;
  v25 = v21;
  v26 = v14;
  objc_msgSend(v22, "px_generateResourceFilesForAssets:completionHandler:", v24, v30);

  -[PUParallaxLayerStackRadarController screenshotURL](self, "screenshotURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addAttachment:", v27);

}

- (void)saveDebugLayerStack:(id)a3 toFileName:(id)a4 item:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  SEL v28;
  _QWORD aBlock[5];
  id v30;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PUParallaxLayerStackRadarController_saveDebugLayerStack_toFileName_item_completion___block_invoke;
  aBlock[3] = &unk_1E58A20D0;
  aBlock[4] = self;
  v30 = v12;
  v15 = v12;
  v16 = a5;
  v17 = _Block_copy(aBlock);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71220]), "initWithSegmentationItem:", v16);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
  objc_msgSend(v18, "setPriority:", v19);

  objc_msgSend(v18, "setLayerStackOptions:", 20);
  v20 = objc_msgSend(v16, "isSettlingEffectAvailable");

  objc_msgSend(v18, "setSettlingEffectEnabled:", v20);
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __86__PUParallaxLayerStackRadarController_saveDebugLayerStack_toFileName_item_completion___block_invoke_2;
  v24[3] = &unk_1E58A20F8;
  v27 = v13;
  v28 = a2;
  v24[4] = self;
  v25 = v11;
  v26 = v17;
  v21 = v13;
  v22 = v17;
  v23 = v11;
  objc_msgSend(v18, "submit:", v24);

}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PFWallpaperCompoundLayerStack)compoundLayerStack
{
  return self->_compoundLayerStack;
}

- (void)setCompoundLayerStack:(id)a3
{
  objc_storeStrong((id *)&self->_compoundLayerStack, a3);
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setSegmentationItem:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationItem, a3);
}

- (PFPosterDescriptor)posterDescriptor
{
  return self->_posterDescriptor;
}

- (PFPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (NSURL)baseTemporaryURL
{
  return self->_baseTemporaryURL;
}

- (NSURL)screenshotURL
{
  return self->_screenshotURL;
}

- (void)setScreenshotURL:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotURL, 0);
  objc_storeStrong((id *)&self->_baseTemporaryURL, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterDescriptor, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_compoundLayerStack, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

id __86__PUParallaxLayerStackRadarController_saveDebugLayerStack_toFileName_item_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "baseTemporaryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, a3);

  v11 = 0;
  if ((_DWORD)v7)
  {
    objc_msgSend(v9, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("imagestack"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D75198], "saveCompoundLayerStack:toURL:options:error:", v5, v13, 0xFFFFLL, a3))v11 = v13;
    else
      v11 = 0;

  }
  return v11;
}

void __86__PUParallaxLayerStackRadarController_saveDebugLayerStack_toFileName_item_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v23 = 0;
  objc_msgSend(a2, "result:", &v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
  if (v3)
  {
    objc_msgSend(v3, "compoundLayerStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "portraitLayerStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "compoundLayerStack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "landscapeLayerStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PUParallaxLayerStackRadarController.m"), 212, CFSTR("A portrait layer stack should always be available"));

    }
    objc_msgSend(*(id *)(a1 + 40), "portraitLayerStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageSize");
    objc_msgSend(v9, "layerStackByUpdatingLayers:imageSize:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "landscapeLayerStack");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageSize");
      objc_msgSend(v13, "layerStackByUpdatingLayers:imageSize:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75348]), "initWithPortraitLayerStack:landscapeLayerStack:", v12, v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v4;

    if (v19)
    {
      v20 = v19;
      v21 = 0;
    }
    else
    {
      v20 = 0;
      v21 = v17;
    }
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v20, v21);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v17 = v4;
  }

}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "beginCollectionOperationWithName:timeout:", CFSTR("Visual Diagnostics"), 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "visualDiagnosticsConfigurationForAsset:compoundLayerStack:segmentationItem:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D7BBF8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2;
  v15[3] = &unk_1E58AB038;
  v16 = *(id *)(a1 + 32);
  v17 = v11;
  v14 = v11;
  objc_msgSend(v13, "requestVisualDiagnosticsPDFDocumentURLWithConfiguration:resultHandler:", v12, v15);

}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "beginCollectionOperationWithName:timeout:", CFSTR("Save Debug Layer Stack"), 1.84467441e19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingPathExtension");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("radarLayerStack");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  v12 = *(void **)(a1 + 40);
  objc_msgSend(v12, "segmentationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_4;
  v15[3] = &unk_1E58AB038;
  v16 = *(id *)(a1 + 32);
  v17 = v5;
  v14 = v5;
  objc_msgSend(v12, "saveDebugLayerStack:toFileName:item:completion:", v4, v11, v13, v15);

}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_152(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  char v13;
  id v14;
  char v15;
  NSObject *v16;
  const char *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "baseTemporaryURL");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "URLByAppendingPathComponent:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    LOBYTE(v5) = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v20);
    v9 = v20;
    if ((v5 & 1) == 0)
    {
      PLWallpaperGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Failed to create destination directory for settling effect attachment, error: %@", buf, 0xCu);
      }
      v14 = v9;
      goto LABEL_17;
    }
    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("SettlingEffect.mov"));
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject path](v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "fileExistsAtPath:", v11);

    if (v12)
    {
      v19 = v9;
      v13 = objc_msgSend(v4, "removeItemAtURL:error:", v10, &v19);
      v14 = v19;

      if ((v13 & 1) == 0)
      {
        PLWallpaperGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v14;
          v17 = "Failed to remove old copy of settling effect video, error: %@";
          goto LABEL_15;
        }
LABEL_16:

        goto LABEL_17;
      }
      v9 = v14;
    }
    v18 = v9;
    v15 = objc_msgSend(v3, "writeToURL:options:error:", v10, 1, &v18);
    v14 = v18;

    if ((v15 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addAttachment:", v10);
LABEL_17:

      goto LABEL_18;
    }
    PLWallpaperGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      v17 = "Failed to write settling effect video, error: %@";
LABEL_15:
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_18:

}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id);
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void (**)(uint64_t, id))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5, v8);
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, v8, v7);

  v11 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "segmentationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "settlingEffectVideoData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);

  objc_msgSend(*(id *)(a1 + 32), "baseTemporaryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "posterDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  LODWORD(v10) = objc_msgSend(v15, "saveToURL:error:", v14, &v25);
  v16 = v25;

  if ((_DWORD)v10)
  {
    v17 = *(void **)(a1 + 40);
    objc_msgSend(v14, "URLByAppendingPathComponent:", *MEMORY[0x1E0D75748]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAttachment:", v18);

  }
  objc_msgSend(*(id *)(a1 + 32), "posterConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  v20 = objc_msgSend(v19, "saveToURL:error:", v14, &v24);
  v21 = v24;

  if (v20)
  {
    v22 = *(void **)(a1 + 40);
    objc_msgSend(v14, "URLByAppendingPathComponent:", *MEMORY[0x1E0D75728]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAttachment:", v23);

  }
}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2_161(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = a3;
  v10 = v9;
  if (a3)
  {
    objc_msgSend(v9, "compoundLayerStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCompoundLayerStack:", v11);

    objc_msgSend(*(id *)(a1 + 32), "setSegmentationItem:", v7);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "compoundLayerStack");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "segmentationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v14);

  }
  else
  {
    PLWallpaperGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Failed to generate layer stack. Error: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  v16 = *(void **)(a1 + 40);
  objc_msgSend(v10, "compoundLayerStack");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "portraitLayerStack");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endWithSuccess:error:", v18 != 0, v8);

}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "addAttachment:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "endWithSuccess:error:", objc_msgSend(v3, "count") != 0, 0);

}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addAttachment:", a2);
  }
  else
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to archive layer stack. Error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "endWithSuccess:error:", a2 != 0, v5);

}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addAttachment:", a2);
  objc_msgSend(*(id *)(a1 + 40), "endWithSuccess:error:", a2 != 0, v6);

}

+ (void)loadLayerStackForAsset:(id)a3 completion:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CD1818];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithPhotoAsset:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71298]), "initWithParallaxAsset:", v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PUParallaxLayerStackRadarController_loadLayerStackForAsset_completion___block_invoke;
  v11[3] = &unk_1E58A20A8;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v9, "loadSegmentationItemWithCompletion:", v11);

}

+ (id)visualDiagnosticsConfigurationForAsset:(id)a3 compoundLayerStack:(id)a4 segmentationItem:(id)a5
{
  id v7;
  id v8;
  id v9;
  PUParallaxVisualDiagnosticsProvider *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PUParallaxVisualDiagnosticsProvider);
  -[PUParallaxVisualDiagnosticsProvider setAsset:](v10, "setAsset:", v9);

  -[PUParallaxVisualDiagnosticsProvider setCompoundLayerStack:](v10, "setCompoundLayerStack:", v8);
  -[PUParallaxVisualDiagnosticsProvider setSegmentationItem:](v10, "setSegmentationItem:", v7);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA8]), "initWithRootProvider:", v10);
  objc_msgSend(v11, "setName:", CFSTR("ParallaxDiagnostics"));
  objc_msgSend(v11, "setIsPrivateDataAllowed:", 1);

  return v11;
}

+ (id)visualDiagnosticsActionForAsset:(id)a3 compoundLayerStack:(id)a4 segmentationItem:(id)a5 fromViewController:(id)a6 actionBeingHandler:(id)a7 actionEndHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eye"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke;
  v30[3] = &unk_1E58A2148;
  v36 = v19;
  v37 = a1;
  v31 = v15;
  v32 = v14;
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v22 = v19;
  v23 = v17;
  v24 = v16;
  v25 = v14;
  v26 = v15;
  v27 = v18;
  objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", CFSTR("Parallax Diagnostics"), v21, 0, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

void __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 80), "visualDiagnosticsConfigurationForAsset:compoundLayerStack:segmentationItem:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7BBF8], "showVisualDiagnosticsWithConfiguration:fromViewController:completionHandler:", v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));

  }
  else
  {
    v7 = (void *)objc_opt_class();
    v8 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke_2;
    v9[3] = &unk_1E58A2120;
    v14 = *(_QWORD *)(a1 + 80);
    v10 = v8;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 72);
    objc_msgSend(v7, "loadLayerStackForAsset:completion:", v10, v9);

  }
}

void __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 64), "visualDiagnosticsConfigurationForAsset:compoundLayerStack:segmentationItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke_196;
    block[3] = &unk_1E58ABAF0;
    v11 = v8;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v9 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    PLWallpaperGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Failed to generate layer stack. Error: %@", buf, 0xCu);
    }
  }

}

uint64_t __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke_196(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0D7BBF8], "showVisualDiagnosticsWithConfiguration:fromViewController:completionHandler:", a1[4], a1[5], a1[6]);
}

void __73__PUParallaxLayerStackRadarController_loadLayerStackForAsset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71220]), "initWithSegmentationItem:", v3);
    objc_msgSend(v4, "setLayerStackOptions:", 0xFFFFLL);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
    objc_msgSend(v4, "setPriority:", v5);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__PUParallaxLayerStackRadarController_loadLayerStackForAsset_completion___block_invoke_2;
    v6[3] = &unk_1E58AB170;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    objc_msgSend(v4, "submit:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __73__PUParallaxLayerStackRadarController_loadLayerStackForAsset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = 0;
  objc_msgSend(a2, "result:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
