@implementation PUWallpaperShortcutsPlaygroundSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperShortcutsPlaygroundSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUWallpaperShortcutsPlaygroundSettings setSelectedConfigurationUUID:](self, "setSelectedConfigurationUUID:", 0);
  -[PUWallpaperShortcutsPlaygroundSettings setSelectedAssetIdentifier:](self, "setSelectedAssetIdentifier:", 0);
  -[PUWallpaperShortcutsPlaygroundSettings setUseAssetURL:](self, "setUseAssetURL:", 0);
  -[PUWallpaperShortcutsPlaygroundSettings setSmartCropEnabled:](self, "setSmartCropEnabled:", 1);
  -[PUWallpaperShortcutsPlaygroundSettings setPreviewEnabled:](self, "setPreviewEnabled:", 0);
}

- (void)setUseAssetURL:(BOOL)a3
{
  self->_useAssetURL = a3;
}

- (void)setSmartCropEnabled:(BOOL)a3
{
  self->_smartCropEnabled = a3;
}

- (void)setSelectedConfigurationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_selectedConfigurationUUID, a3);
}

- (void)setSelectedAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAssetIdentifier, a3);
}

- (void)setPreviewEnabled:(BOOL)a3
{
  self->_previewEnabled = a3;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "assetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&sAssetIdentifier, v10);
    +[PUWallpaperShortcutsPlaygroundSettings sharedInstance](PUWallpaperShortcutsPlaygroundSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelectedAssetIdentifier:", v10);

    objc_initWeak(&location, self);
    objc_msgSend(v9, "itemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __70__PUWallpaperShortcutsPlaygroundSettings_UI__picker_didFinishPicking___block_invoke;
    v18 = &unk_1E58AA2B8;
    objc_copyWeak(&v19, &location);
    v14 = (id)objc_msgSend(v12, "loadFileRepresentationForTypeIdentifier:completionHandler:", v13, &v15);

    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

- (void)_handleLoadFileURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:conformingToType:", v7, *MEMORY[0x1E0CEC530]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LODWORD(v6) = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v4, v9, &v12);

  v11 = v12;
  if ((_DWORD)v6)
    objc_storeStrong((id *)&sAssetURL, v9);

}

void __70__PUWallpaperShortcutsPlaygroundSettings_UI__picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleLoadFileURL:", v3);

}

+ (id)settingsControllerModule
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  NSObject *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  NSObject *v49;
  void *v50;
  _QWORD v51[3];
  _QWORD v52[2];
  _QWORD v53[5];

  v53[3] = *MEMORY[0x1E0C80C00];
  if (settingsControllerModule_onceToken != -1)
    dispatch_once(&settingsControllerModule_onceToken, &__block_literal_global_1767);
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = (void *)sPosterService;
  v4 = *MEMORY[0x1E0D7C6A8];
  v48[0] = MEMORY[0x1E0C809B0];
  v5 = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_2;
  v48[3] = &unk_1E58A5310;
  v49 = v2;
  v42 = v2;
  objc_msgSend(v3, "fetchPosterConfigurationsForExtension:completion:", v4, v48);
  dispatch_group_wait(v42, 0xFFFFFFFFFFFFFFFFLL);
  v6 = objc_alloc(MEMORY[0x1E0CD16F8]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPhotoLibraryURL:", v7);

  v9 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_selectedAssetIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K != nil"), v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  v31 = (void *)MEMORY[0x1E0D83078];
  v13 = (void *)MEMORY[0x1E0D83010];
  v46[0] = v5;
  v46[1] = 3221225472;
  v46[2] = __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_4;
  v46[3] = &unk_1E58A8568;
  v14 = v8;
  v47 = v14;
  objc_msgSend(v13, "pu_rowWithTitle:action:", CFSTR("Pick Asset"), v46);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v39;
  v15 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_selectedConfigurationUUID);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Configuration"), v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "pu_possibleValues:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "condition:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v32;
  v16 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Asset URL"), CFSTR("useAssetURL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v17;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Smart Crop"), CFSTR("smartCropEnabled"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v18;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Preview"), CFSTR("previewEnabled"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v11;
  objc_msgSend(v16, "sectionWithRows:title:condition:", v20, CFSTR("Options"), v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v21;
  v22 = (void *)MEMORY[0x1E0D83078];
  v23 = (void *)MEMORY[0x1E0D83010];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_6;
  v43[3] = &unk_1E58A8590;
  v44 = v14;
  v45 = a1;
  v41 = v14;
  objc_msgSend(v23, "pu_rowWithTitle:action:", CFSTR("Run Action"), v43);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:condition:", v25, 0, v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "moduleWithTitle:contents:", CFSTR("Shortcuts Playground"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (void)_runActionWithModuleController:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _PUPosterOverrideConfiguration *v14;
  _PUPosterOverrideConfiguration *v15;
  PUWallpaperPosterEditDebugViewController *v16;
  void *v17;
  PUWallpaperPosterEditDebugViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PUWallpaperConfigurationUpdater *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, void *);
  void *v33;
  id v34;

  v5 = a3;
  v6 = a4;
  +[PUWallpaperShortcutsPlaygroundSettings sharedInstance](PUWallpaperShortcutsPlaygroundSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedConfigurationUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __90__PUWallpaperShortcutsPlaygroundSettings_UI___runActionWithModuleController_photoLibrary___block_invoke;
  v33 = &unk_1E589AE10;
  v9 = v8;
  v34 = v9;
  PXFind();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D751F0];
  objc_msgSend(v10, "assetDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loadFromURL:error:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "setOptions:", 8);
    v14 = [_PUPosterOverrideConfiguration alloc];
    v15 = -[_PUPosterOverrideConfiguration initWithSettings:assetURL:assetIdentifier:](v14, "initWithSettings:assetURL:assetIdentifier:", v7, sAssetURL, sAssetIdentifier);
    if (objc_msgSend(v7, "previewEnabled"))
    {
      v16 = [PUWallpaperPosterEditDebugViewController alloc];
      objc_msgSend(v10, "assetDirectory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PUWallpaperPosterEditDebugViewController initWithExistingConfiguration:assetDirectory:overrideConfiguration:photoLibrary:](v16, "initWithExistingConfiguration:assetDirectory:overrideConfiguration:photoLibrary:", v13, v17, v15, v6);

      -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v18, "setModalPresentationStyle:", 5);
      objc_msgSend(v5, "presentViewController:animated:completion:", v18, 1, 0);
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("PhotosShortcutsUpdateRendering"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fileURLWithPath:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = -[PUWallpaperConfigurationUpdater initWithPhotoLibrary:sourceConfiguration:targetAssetDirectory:overrideConfiguration:]([PUWallpaperConfigurationUpdater alloc], "initWithPhotoLibrary:sourceConfiguration:targetAssetDirectory:overrideConfiguration:", v6, v13, v22, v15);
      v24 = (void *)sConfigurationUpdater;
      sConfigurationUpdater = (uint64_t)v23;

      v25 = (void *)sConfigurationUpdater;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __90__PUWallpaperShortcutsPlaygroundSettings_UI___runActionWithModuleController_photoLibrary___block_invoke_2;
      v26[3] = &unk_1E589AE38;
      v27 = v22;
      v28 = v13;
      v29 = v5;
      v18 = v22;
      objc_msgSend(v25, "attemptUpdateWithCompletionBlock:", v26);

    }
  }

}

uint64_t __90__PUWallpaperShortcutsPlaygroundSettings_UI___runActionWithModuleController_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "serverUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __90__PUWallpaperShortcutsPlaygroundSettings_UI___runActionWithModuleController_photoLibrary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  PUWallpaperPlaygroundViewController *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v8 = (void *)MEMORY[0x1E0CB3620];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v31 = 0;
  objc_msgSend(v12, "removeItemAtURL:error:", v13, &v31);
  v14 = v31;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 32);
  v30 = v14;
  objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 0, 0, &v30);
  v17 = v30;

  v19 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(a1 + 40);
  v29 = v17;
  objc_msgSend(v18, "saveToURL:error:", v19, &v29);
  v20 = v29;

  v21 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "media");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subpath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URLByAppendingPathComponent:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v20;
  objc_msgSend(MEMORY[0x1E0D71298], "saveSegmentationItem:compoundLayerStack:style:toWallpaperURL:error:", v9, v11, v10, v25, &v28);

  v26 = v28;
  v27 = -[PUWallpaperPlaygroundViewController initWithConfiguration:assetDirectory:]([PUWallpaperPlaygroundViewController alloc], "initWithConfiguration:assetDirectory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  -[PUWallpaperPlaygroundViewController presentPlaygroundWithPresentingViewController:](v27, "presentPlaygroundWithPresentingViewController:", *(_QWORD *)(a1 + 48));

}

void __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  PXFilter();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sPosterConfigurations;
  sPosterConfigurations = v2;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0CD2168];
  v4 = a2;
  v8 = (id)objc_msgSend([v3 alloc], "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CD2170], "imagesFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilter:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v8);
  +[PUWallpaperShortcutsPlaygroundSettings sharedInstance](PUWallpaperShortcutsPlaygroundSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v7);

  objc_msgSend(v4, "presentViewController:animated:completion:", v6, 1, 0);
}

uint64_t __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_runActionWithModuleController:photoLibrary:", a2, *(_QWORD *)(a1 + 32));
}

id __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "serverUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = (void *)MEMORY[0x1E0D751F0];
  objc_msgSend(a2, "assetDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadFromURL:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "configurationType") == 0;
  return v5;
}

void __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getPRSServiceClass_softClass;
  v8 = getPRSServiceClass_softClass;
  if (!getPRSServiceClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getPRSServiceClass_block_invoke;
    v4[3] = &unk_1E58AAEB0;
    v4[4] = &v5;
    __getPRSServiceClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_alloc_init(v1);
  v3 = (void *)sPosterService;
  sPosterService = (uint64_t)v2;

}

- (id)parentSettings
{
  return +[PUSuggestionsSettings sharedInstance](PUSuggestionsSettings, "sharedInstance");
}

- (NSString)selectedConfigurationUUID
{
  return self->_selectedConfigurationUUID;
}

- (NSString)selectedAssetIdentifier
{
  return self->_selectedAssetIdentifier;
}

- (BOOL)useAssetURL
{
  return self->_useAssetURL;
}

- (BOOL)smartCropEnabled
{
  return self->_smartCropEnabled;
}

- (BOOL)previewEnabled
{
  return self->_previewEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedConfigurationUUID, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_29094 != -1)
    dispatch_once(&sharedInstance_onceToken_29094, &__block_literal_global_29095);
  return (id)sharedInstance_sharedInstance_29096;
}

void __56__PUWallpaperShortcutsPlaygroundSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PUSuggestionsSettings sharedInstance](PUSuggestionsSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcutsPlaygroundSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_29096;
  sharedInstance_sharedInstance_29096 = v0;

}

@end
