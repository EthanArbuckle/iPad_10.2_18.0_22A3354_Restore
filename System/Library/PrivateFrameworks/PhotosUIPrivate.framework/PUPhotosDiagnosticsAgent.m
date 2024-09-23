@implementation PUPhotosDiagnosticsAgent

+ (id)localDiagnosticsAgent
{
  if (localDiagnosticsAgent_onceToken != -1)
    dispatch_once(&localDiagnosticsAgent_onceToken, &__block_literal_global_69794);
  return (id)localDiagnosticsAgent_localDiagnosticsAgent;
}

void __49__PUPhotosDiagnosticsAgent_localDiagnosticsAgent__block_invoke()
{
  PUPhotosDiagnosticsAgent *v0;
  void *v1;

  v0 = objc_alloc_init(PUPhotosDiagnosticsAgent);
  v1 = (void *)localDiagnosticsAgent_localDiagnosticsAgent;
  localDiagnosticsAgent_localDiagnosticsAgent = (uint64_t)v0;

}

- (void)captureDescriptionOfUIState:(int64_t)a3 resultHandler:(id)a4
{
  id v6;
  void *v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PUPhotosDiagnosticsAgent_captureDescriptionOfUIState_resultHandler___block_invoke;
    block[3] = &unk_1E58A7210;
    v10 = a3;
    block[4] = self;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)dumpState:(int64_t)a3 toDirectoryURL:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  _QWORD block[4];
  id v17;
  PUPhotosDiagnosticsAgent *v18;
  id v19;
  id v20;
  uint64_t *v21;
  int64_t v22;
  id obj;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    v12 = v8;
  }
  else
  {
    objc_msgSend(v10, "temporaryDirectory");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__69733;
  v28 = __Block_byref_object_dispose__69734;
  v29 = 0;
  obj = 0;
  v14 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &obj);
  objc_storeStrong(&v29, obj);
  if ((v14 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke;
    block[3] = &unk_1E58A5C98;
    v22 = a3;
    v17 = v13;
    v18 = self;
    v19 = v11;
    v21 = &v24;
    v20 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v15 = v17;
  }
  else
  {
    objc_msgSend((id)v25[5], "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
  }

  _Block_object_dispose(&v24, 8);
}

- (void)timelineForWidgetSize:(id)a3 jsonFormat:(BOOL)a4 resultHandler:(id)a5
{
  _BOOL8 v5;
  void *v7;
  void (**v8)(id, id);
  id v9;

  v5 = a4;
  v7 = (void *)MEMORY[0x1E0D7BAF0];
  v8 = (void (**)(id, id))a5;
  objc_msgSend(v7, "timelineDiagnosticForWidgetSize:jsonFormat:", a3, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v9);

}

- (void)timelineForAlbum:(id)a3 widgetSize:(id)a4 jsonFormat:(BOOL)a5 resultHandler:(id)a6
{
  _BOOL8 v6;
  void *v9;
  void (**v10)(id, id);
  id v11;

  v6 = a5;
  v9 = (void *)MEMORY[0x1E0D7BAF0];
  v10 = (void (**)(id, id))a6;
  objc_msgSend(v9, "timelineDiagnosticForAlbum:widgetSize:jsonFormat:", a3, a4, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v11);

}

- (void)setContentPrivacyState:(int64_t)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PUPhotosDiagnosticsAgent_setContentPrivacyState_resultHandler___block_invoke;
  block[3] = &unk_1E58A7210;
  v9 = v6;
  v10 = a3;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)startTungstenRecordingToDirectoryURL:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PUPhotosDiagnosticsAgent *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PUPhotosDiagnosticsAgent_startTungstenRecordingToDirectoryURL_resultHandler___block_invoke;
  block[3] = &unk_1E58ABAF0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)stopTungstenRecordingWithResultHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PUPhotosDiagnosticsAgent_stopTungstenRecordingWithResultHandler___block_invoke;
  v6[3] = &unk_1E58AB968;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  PXDiagnosticsNotificationCenter *diagnosticsNotificationCenter;
  PXDiagnosticsNotificationCenter *v11;
  PXDiagnosticsNotificationCenter *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  diagnosticsNotificationCenter = self->_diagnosticsNotificationCenter;
  if (!diagnosticsNotificationCenter)
  {
    v11 = (PXDiagnosticsNotificationCenter *)objc_alloc_init(MEMORY[0x1E0D7B2F0]);
    v12 = self->_diagnosticsNotificationCenter;
    self->_diagnosticsNotificationCenter = v11;

    diagnosticsNotificationCenter = self->_diagnosticsNotificationCenter;
  }
  -[PXDiagnosticsNotificationCenter postNotificationWithName:userInfo:resultHandler:](diagnosticsNotificationCenter, "postNotificationWithName:userInfo:resultHandler:", v13, v8, v9);

}

- (void)setSystemAuthenticationType:(int64_t)a3 resultHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  int64_t v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PUPhotosDiagnosticsAgent_setSystemAuthenticationType_resultHandler___block_invoke;
  v7[3] = &unk_1E58A5CE8;
  v8 = v5;
  v9 = a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (id)_currentPrivacyController
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3470], "pu_debugCurrentPrivacyController");
}

- (id)_descriptionForAllUIState
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  PUPhotosDiagnosticsAgent *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = self;
  v9 = v3;
  v4 = v3;
  PLDiagnosticsEnumerateAllUIStatesUsingBlock();
  v5 = (void *)objc_msgSend(v4, "copy", v7, 3221225472, __53__PUPhotosDiagnosticsAgent__descriptionForAllUIState__block_invoke, &unk_1E58A5D10, v8);

  return v5;
}

- (id)_descriptionOfUIState:(int64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id result;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0D7B2E0], "sharedController");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentItemProviders");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "servicesWithItemProviders:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "consoleDescriptionForServices:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    case 2:
      -[PUPhotosDiagnosticsAgent _currentAssetIdentifierDescription](self, "_currentAssetIdentifierDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 3:
      -[PUPhotosDiagnosticsAgent _currentAssetIdentifierUUID](self, "_currentAssetIdentifierUUID");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 4:
      -[PUPhotosDiagnosticsAgent _currentAssetViewModelDescription](self, "_currentAssetViewModelDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 5:
      -[PUPhotosDiagnosticsAgent _currentAssetDetailedDescription](self, "_currentAssetDetailedDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 6:
      -[PUPhotosDiagnosticsAgent _currentAssetMetadata](self, "_currentAssetMetadata");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 7:
      -[PUPhotosDiagnosticsAgent _selectedAssetIdentifiersDescription](self, "_selectedAssetIdentifiersDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 8:
      -[PUPhotosDiagnosticsAgent _selectedAssetUUIDsDescription](self, "_selectedAssetUUIDsDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 9:
      -[PUPhotosDiagnosticsAgent _viewModelDescription](self, "_viewModelDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 10:
      -[PUPhotosDiagnosticsAgent _viewControllerHierarchyDescription](self, "_viewControllerHierarchyDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 11:
      objc_msgSend(MEMORY[0x1E0DC3F20], "_allDescriptions");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 12:
      -[PUPhotosDiagnosticsAgent _windowRecursiveDescription](self, "_windowRecursiveDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 13:
      v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v10 = (void *)MEMORY[0x1E0D7B480];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __50__PUPhotosDiagnosticsAgent__descriptionOfUIState___block_invoke;
      v12[3] = &unk_1E58A5D38;
      v13 = v9;
      v3 = v9;
      objc_msgSend(v10, "enumerateAllViewsUsingBlock:", v12);
      v6 = (void *)objc_msgSend(v3, "copy");

      goto LABEL_18;
    case 14:
      objc_msgSend(MEMORY[0x1E0D7BA88], "allDiagnosticDescriptions");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 15:
      v11 = (void *)MEMORY[0x1E0D7B7C0];
      -[PUPhotosDiagnosticsAgent _currentWindows](self, "_currentWindows");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "diagnosticDescriptionForWindows:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_21;
    case 16:
      -[PUPhotosDiagnosticsAgent _uuidsShownInGrid](self, "_uuidsShownInGrid");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v6 = (void *)v8;
LABEL_21:
      result = v6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_currentAsset
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "pu_debugCurrentAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_selectedAssets
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3470], "pu_debugCurrentlySelectedAssets");
}

- (id)_currentAssetIdentifierDescription
{
  void *v2;
  void *v3;

  -[PUPhotosDiagnosticsAgent _currentAsset](self, "_currentAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_currentAssetIdentifierUUID
{
  void *v2;
  void *v3;

  -[PUPhotosDiagnosticsAgent _currentAsset](self, "_currentAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_uuidsShownInGrid
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "pu_debugCurrentPhotosViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_selectedAssetIdentifiersDescription
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUPhotosDiagnosticsAgent _selectedAssets](self, "_selectedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "localIdentifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_selectedAssetUUIDsDescription
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUPhotosDiagnosticsAgent _selectedAssets](self, "_selectedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "uuid", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_currentAssetViewModelDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "pu_debugCurrentViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "currentAssetReference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "assetViewModelForAssetReference:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "debugDetailedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_currentAssetMetadata
{
  void *v2;
  void *v3;

  -[PUPhotosDiagnosticsAgent _currentAsset](self, "_currentAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataDebugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_currentAssetDetailedDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUPhotosDiagnosticsAgent _currentAsset](self, "_currentAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailedDebugDescriptionInLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_viewModelDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "pu_debugCurrentViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDetailedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_viewControllerHierarchyDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PUPhotosDiagnosticsAgent _currentWindows](self, "_currentWindows", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "rootViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_printHierarchy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_windowRecursiveDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PUPhotosDiagnosticsAgent _currentWindows](self, "_currentWindows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "recursiveDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pu_stringByIndentingNewLines");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@:\n\t%@\n"), v9, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_currentWindows
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__currentTimestamp
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy_MM_dd_HH_mm_ssZ"));
  objc_msgSend(v3, "stringFromDate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_captureCurrentAssetResourcesToDirectory:(id)a3 withResultHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *group;
  id v31;
  id v32;
  uint64_t v33;
  id obj;
  _QWORD block[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0DC3470], "pu_debugCurrentAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = (_QWORD *)&unk_1AB0EE000;
  v32 = v8;
  if (v32 && objc_msgSend(MEMORY[0x1E0CD16F8], "authorizationStatusForAccessLevel:", 2) == 3)
  {
    v27 = v7;
    -[PUPhotosDiagnosticsAgent __currentTimestamp](self, "__currentTimestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", v32);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v47;
      do
      {
        v13 = 0;
        v33 = v11;
        do
        {
          if (*(_QWORD *)v47 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v13);
          if ((objc_msgSend(v14, "type") & 0xFFFFFFFFFFFFFFFBLL) != 2)
          {
            v15 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v32, "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v14, "type");
            objc_msgSend(v14, "originalFilename");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            v20 = CFSTR(".unknown");
            if (v18)
              v20 = (const __CFString *)v18;
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/AssetResource_%@_%@_%ld_%@"), v31, v28, v16, v17, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            dispatch_group_enter(group);
            objc_msgSend(MEMORY[0x1E0CD1458], "defaultManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v21, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke;
            v38[3] = &unk_1E58A5D88;
            v39 = v31;
            v40 = v28;
            v41 = v32;
            v42 = v14;
            v43 = v29;
            v44 = v21;
            v45 = group;
            v24 = v21;
            objc_msgSend(v22, "writeDataForAssetResource:toFile:options:completionHandler:", v14, v23, 0, v38);

            v11 = v33;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v11);
    }

    v7 = v27;
    v9 = &unk_1AB0EE000;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = v9[283];
  block[2] = __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke_218;
  block[3] = &unk_1E58AB968;
  v36 = v29;
  v37 = v6;
  v25 = v29;
  v26 = v6;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

}

- (void)captureDescriptionOfStatisticsWithResultHandler:(id)a3
{
  id v3;
  id v4;
  dispatch_queue_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD block[4];
  NSObject *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  _QWORD aBlock[4];
  dispatch_queue_t v32;
  id v33;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v5 = dispatch_queue_create("PUPhotosDiagnosticsAgent.output", 0);
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke;
    aBlock[3] = &unk_1E58A5BF8;
    v32 = v5;
    v7 = v4;
    v33 = v7;
    v8 = v5;
    v9 = _Block_copy(aBlock);
    v28[0] = v6;
    v28[1] = 3221225472;
    v28[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_3;
    v28[3] = &unk_1E58A5DD8;
    v10 = dispatch_group_create();
    v29 = v10;
    v11 = v9;
    v30 = v11;
    v12 = _Block_copy(v28);
    dispatch_group_enter(v10);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_5;
    block[3] = &unk_1E58AB800;
    v26 = v12;
    v27 = v11;
    v13 = v10;
    v25 = v13;
    v14 = v11;
    v15 = v12;
    v16 = MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], block);
    dispatch_group_enter(v13);
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_8;
    v22[3] = &unk_1E58ABD10;
    v23 = v13;
    v17 = v13;
    dispatch_async(v8, v22);
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_9;
    v19[3] = &unk_1E58AB968;
    v20 = v7;
    v21 = v3;
    v18 = v7;
    dispatch_group_notify(v17, v16, v19);

  }
}

- (void)captureDescriptionOfCloudPhotoLibraryWithResultHandler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D113A0]);
    v5 = (void *)objc_msgSend(v4, "initForManagementWithLibraryIdentifier:", *MEMORY[0x1E0D11290]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __83__PUPhotosDiagnosticsAgent_captureDescriptionOfCloudPhotoLibraryWithResultHandler___block_invoke;
    v7[3] = &unk_1E58A5EB8;
    v8 = v5;
    v9 = v3;
    v6 = v5;
    objc_msgSend(v6, "openWithCompletionHandler:", v7);

  }
}

- (void)captureDescriptionOfPhotoAnalysisWithResultHandler:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoAnalysisClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v11 = 0;
    objc_msgSend(v5, "dumpAnalysisStatusError:", &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v9 = v8;
    if (v7)
      PLPrettyPrintPList();
    else
      objc_msgSend(v8, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v10);

  }
  else
  {
    v3[2](v3, &stru_1E58AD278);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsNotificationCenter, 0);
  objc_storeStrong((id *)&self->_recordingSessions, 0);
}

void __83__PUPhotosDiagnosticsAgent_captureDescriptionOfCloudPhotoLibraryWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "localizedDescription");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__PUPhotosDiagnosticsAgent_captureDescriptionOfCloudPhotoLibraryWithResultHandler___block_invoke_2;
    v6[3] = &unk_1E58A5E90;
    v4 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "getStatusForComponents:completionHandler:", 0, v6);

  }
}

uint64_t __83__PUPhotosDiagnosticsAgent_captureDescriptionOfCloudPhotoLibraryWithResultHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    objc_msgSend(a3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(_QWORD))(v4 + 16))(*(_QWORD *)(a1 + 40));
  }
  return objc_msgSend(*(id *)(a1 + 32), "closeWithCompletionHandler:", &__block_literal_global_245_69662);
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_2;
  v6[3] = &unk_1E58ABCA8;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = *(NSObject **)(a1 + 32);
  v9 = a4;
  v10 = a3;
  dispatch_group_enter(v8);
  objc_msgSend(MEMORY[0x1E0D7B2C0], "defaultController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_4;
  v13[3] = &unk_1E58A5DB0;
  v16 = *(id *)(a1 + 40);
  v14 = v7;
  v15 = *(id *)(a1 + 32);
  v12 = v7;
  objc_msgSend(v11, "collectStatisticsForViewModel:extendedTraitCollection:resultHandler:", v10, v9, v13);

}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(void *, const __CFString *, uint64_t, uint64_t);
  _QWORD aBlock[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_6;
  v10[3] = &unk_1E58A5E00;
  v12 = &v13;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v5, "px_enumerateDescendantViewControllersWithOptions:usingBlock:", 0, v10);

  if (!*((_BYTE *)v14 + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  aBlock[0] = v6;
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_7;
  aBlock[3] = &unk_1E58A5E28;
  v9 = *(id *)(a1 + 40);
  v7 = (void (**)(void *, const __CFString *, uint64_t, uint64_t))_Block_copy(aBlock);
  v7[2](v7, CFSTR("iPhone"), 5, 1);
  v7[2](v7, CFSTR("iPad Portrait"), 7, 1);
  v7[2](v7, CFSTR("iPad Landscape"), 7, 2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  _Block_object_dispose(&v13, 8);
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_8(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "px_isVisible"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v3 = v7;
    objc_msgSend(v3, "viewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "px_extendedTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = (objc_class *)MEMORY[0x1E0D7B5C0];
  v8 = a2;
  v14 = (id)objc_msgSend([v7 alloc], "initWithFormFactor:orientation:visibleChromeElements:", a3, a4, 9);
  v9 = objc_alloc(MEMORY[0x1E0D7B2D0]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithPhotoLibrary:extendedTraitCollection:", v10, v14);

  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, id))(v12 + 16))(v12, v8, v13, v14);

}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("==== Curated Library (%@) ====\n\n"), *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  v8 = *(_QWORD *)(a1 + 48);
  if (v10)
    objc_msgSend(v10, "summaryDescription");
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to capture curated library statistics: %@"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "containsString:", CFSTR("\n"));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return result;
}

void __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke_2;
  v8[3] = &unk_1E58A5D60;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 64);
  v12 = v4;
  v13 = v5;
  v14 = v6;
  v15 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 80);
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke_218(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/AssetResource_%@_%@_%ld_error.txt"), v3, v4, v5, objc_msgSend(*(id *)(a1 + 64), "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = objc_msgSend(v7, "writeToURL:atomically:encoding:error:", v8, 1, 4, &v13);
    v10 = v13;

    if ((v9 & 1) == 0)
    {
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v15 = v6;
        v16 = 2112;
        v17 = v12;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Error writing debug asset resource to path:%@ error:%@ writeError:%@", buf, 0x20u);
      }

    }
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "addObject:", *(_QWORD *)(a1 + 80));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

void __50__PUPhotosDiagnosticsAgent__descriptionOfUIState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v5, "diagnosticDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

}

void __53__PUPhotosDiagnosticsAgent__descriptionForAllUIState__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  PLDiagnosticsTitleOfUIState();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_descriptionOfUIState:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v4, "pu_stringByIndentingNewLines");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("%@:\n\t%@\n\n"), v8, v7);

  }
}

void __70__PUPhotosDiagnosticsAgent_setSystemAuthenticationType_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D7BAC8], "sharedObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E0CB3940];
  PXDebugDescriptionFromSystemAuthenticationType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("System authentication type simulation set to %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v6);

  objc_msgSend(v2, "setForcedSystemAuthenticationType:", v3);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

uint64_t __67__PUPhotosDiagnosticsAgent_stopTungstenRecordingWithResultHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isStopped", (_QWORD)v11) & 1) == 0)
          objc_msgSend(v7, "stop");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __79__PUPhotosDiagnosticsAgent_startTungstenRecordingToDirectoryURL_resultHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(v22, "temporaryDirectory");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  v36 = 0;
  v5 = objc_msgSend(v22, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v36);
  v6 = v36;
  v21 = v6;
  if ((v5 & 1) != 0)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__69733;
    v34 = __Block_byref_object_dispose__69734;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D7B480];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__PUPhotosDiagnosticsAgent_startTungstenRecordingToDirectoryURL_resultHandler___block_invoke_2;
    v27[3] = &unk_1E58A5CC0;
    v28 = v4;
    v29 = &v30;
    objc_msgSend(v7, "enumerateAllViewsUsingBlock:", v27);
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("No recordings were started. Ensure that current renderers support recording."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v31[5], "count"))
    {
      v9 = (void *)MEMORY[0x1E0CB37A0];
      v10 = objc_msgSend((id)v31[5], "count");
      v11 = &stru_1E58AD278;
      if (v10 > 1)
        v11 = CFSTR("s");
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Started recording%@:\n  "), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = (id)v31[5];
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "recordingURL");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "appendFormat:", CFSTR("%@\n  "), v18);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
        }
        while (v14);
      }

    }
    else
    {
      v12 = v8;
    }
    objc_storeStrong((id *)(a1[5] + 8), (id)v31[5]);
    (*(void (**)(void))(a1[6] + 16))();

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v19 = a1[6];
    objc_msgSend(v6, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);

  }
}

void __79__PUPhotosDiagnosticsAgent_startTungstenRecordingToDirectoryURL_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "engine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startRecordingToDirectoryURL:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

void __65__PUPhotosDiagnosticsAgent_setContentPrivacyState_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "_currentPrivacyController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v5 = CFSTR("Couldn't find a privacy controller in current view hierarchy");
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (!v4)
  {
    objc_msgSend(v2, "unlock");
    v5 = CFSTR("Privacy controller set to UNLOCKED");
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    objc_msgSend(v2, "lockImmediately");
    v5 = CFSTR("Privacy controller set to LOCKED");
LABEL_7:
    objc_msgSend(v8, "addObject:", v5);
  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  id obj;
  uint64_t v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t);
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t, void *);
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  switch(*(_QWORD *)(a1 + 72))
  {
    case 0:
      v2 = (void *)MEMORY[0x1E0CB3940];
      v3 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "__currentTimestamp");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringWithFormat:", CFSTR("PhotosUI_%@"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "URLByAppendingPathComponent:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = *(void **)(a1 + 48);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v75 = *(id *)(v8 + 40);
      LOBYTE(v4) = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v75);
      objc_storeStrong((id *)(v8 + 40), v75);
      if ((v4 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "_descriptionForAllUIState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("PhotosUIDescription.txt"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "writeToURL:atomically:encoding:error:", v10, 1, 4, 0);

        v11 = MEMORY[0x1E0C809B0];
        v68 = MEMORY[0x1E0C809B0];
        v69 = 3221225472;
        v70 = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_2;
        v71 = &unk_1E58A5C20;
        v72 = *(_QWORD *)(a1 + 40);
        v73 = v6;
        v74 = v47;
        v60 = v11;
        v61 = 3221225472;
        v62 = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_4;
        v63 = &unk_1E58A5C48;
        v64 = v73;
        v65 = *(id *)(a1 + 32);
        v66 = v74;
        v67 = *(id *)(a1 + 56);
        PXIterateAsynchronously();

      }
      else
      {
        v43 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "localizedDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v44);

      }
      break;
    case 1:
      v46 = a1;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "windows");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v13;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v57;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v57 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v17);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Naming layer tree for %@"), v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v19);

              objc_msgSend(v18, "_recursivelyNameLayerTree");
            }
            v20 = (void *)MEMORY[0x1E0CB3940];
            v21 = *(void **)(v46 + 32);
            objc_msgSend(*(id *)(v46 + 40), "__currentTimestamp");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", CFSTR("PhotosLayerHierarchy_%p_%@.caar"), v18, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "URLByAppendingPathComponent:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "layer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "path");
            v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v26, "UTF8String");
            CAEncodeLayerTreeToFile();

            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v24, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("Dumped layer tree to %@"), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v29);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
        }
        while (v15);
      }

      v30 = *(_QWORD *)(v46 + 56);
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v31);

      break;
    case 2:
      v32 = (void *)MEMORY[0x1E0D7B480];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_5;
      v53[3] = &unk_1E58A5C70;
      v54 = *(id *)(a1 + 32);
      v33 = v47;
      v55 = v33;
      objc_msgSend(v32, "enumerateAllViewsUsingBlock:", v53);
      v34 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v35);

      v36 = v54;
      goto LABEL_16;
    case 3:
      v37 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_6;
      v51[3] = &unk_1E58A7700;
      v52 = *(id *)(a1 + 56);
      objc_msgSend(v37, "_captureCurrentAssetResourcesToDirectory:withResultHandler:", v38, v51);

      v36 = v52;
LABEL_16:

      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "px_URLByAppendingPathComponentFollowedByCurrentDateAndTime:", CFSTR("Memories"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0D7BA88];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_7;
      v48[3] = &unk_1E58AA3D0;
      v41 = *(id *)(a1 + 56);
      v49 = v39;
      v50 = v41;
      v42 = v39;
      objc_msgSend(v40, "dumpTapToRadarDiagnosticAttachmentsToURL:completionHandler:", v42, v48);

      break;
    default:
      break;
  }

}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "index") + 1;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_3;
  v8[3] = &unk_1E58A5BF8;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "dumpState:toDirectoryURL:resultHandler:", v4, v6, v8);

}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v2 = (void *)getDEUtilsClass_softClass_69773;
  v15 = getDEUtilsClass_softClass_69773;
  if (!getDEUtilsClass_softClass_69773)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getDEUtilsClass_block_invoke_69774;
    v11[3] = &unk_1E58AAEB0;
    v11[4] = &v12;
    __getDEUtilsClass_block_invoke_69774((uint64_t)v11);
    v2 = (void *)v13[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v12, 8);
  v4 = (void *)objc_msgSend(v3, "copyItem:toDestinationDir:zipped:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v5 = *(void **)(a1 + 48);
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("\nArchive of Photos UI state available at %@\n\nEnjoy."), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "preferredFileNameForExportingDebugHierarchy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v7 = objc_msgSend(v3, "exportDebugHierarchyToURL:error:", v6, &v15);
  v8 = v15;
  v9 = *(void **)(a1 + 40);
  v10 = (void *)MEMORY[0x1E0CB3940];
  if (v7)
  {
    objc_msgSend(v6, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Dumped Tungsten hierarchy to %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);
  }
  else
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed to export Tungsten hierarchy of <%@: %p>: %@"), v11, v3, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

    v8 = (id)v14;
  }

}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "componentsJoinedByString:", CFSTR("\n"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Captured current asset resources:\n%@"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_7(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Dumped Memory diagnostics to: %@\n"), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to dump Memory diagnostics: %@\n"), a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

}

uint64_t __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "next");
}

void __70__PUPhotosDiagnosticsAgent_captureDescriptionOfUIState_resultHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = a1[6];
  v3 = (void *)a1[4];
  if (v2)
    objc_msgSend(v3, "_descriptionOfUIState:");
  else
    objc_msgSend(v3, "_descriptionForAllUIState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();

}

@end
