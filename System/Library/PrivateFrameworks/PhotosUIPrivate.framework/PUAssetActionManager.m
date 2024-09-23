@implementation PUAssetActionManager

+ (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUAssetActionManager.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unlockDeviceHandlerWithActionType != nil"));

  }
  v5 = a1;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v9, "copy");
  v7 = (void *)_sharedUnlockDeviceHandlerWithActionType;
  _sharedUnlockDeviceHandlerWithActionType = v6;

  objc_sync_exit(v5);
}

+ (id)_unlockDeviceHandlerWithActionType
{
  id v2;
  void *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = _Block_copy((const void *)_sharedUnlockDeviceHandlerWithActionType);
  objc_sync_exit(v2);

  v4 = _Block_copy(v3);
  return v4;
}

+ (OS_os_log)actionManagerLog
{
  if (actionManagerLog_onceToken[0] != -1)
    dispatch_once(actionManagerLog_onceToken, &__block_literal_global_10996);
  return (OS_os_log *)(id)actionManagerLog_actionManagerLog;
}

void __40__PUAssetActionManager_actionManagerLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "AssetActions");
  v1 = (void *)actionManagerLog_actionManagerLog;
  actionManagerLog_actionManagerLog = (uint64_t)v0;

}

- (PXSectionedSelectionManager)px_selectionManager
{
  return 0;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  return 0;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  return 1;
}

- (id)barButtonItemForActionType:(unint64_t)a3
{
  return 0;
}

- (id)localizedTitleForActionType:(unint64_t)a3
{
  return 0;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  return 0;
}

- (id)_assetsByAssetCollectionForAssetReferences:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;
  void *v30;
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x1E0C9AA70];
    if (v5 && v6)
    {
      v29 = v6;
      v30 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = v3;
    v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v10)
    {
      v11 = v10;
      v21 = v3;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v4);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v14, "assetCollection");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "asset");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            v17 = v15 == 0;
          else
            v17 = 1;
          if (v17)
          {
            PXAssertGetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v14;
              _os_log_error_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "Unable to map asset reference to assetsByAssetCollection: %@", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", v15);
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v18 = v19;
              -[NSObject addObject:](v19, "addObject:", v16);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v16);
              v18 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v15);
            }
          }

        }
        v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v11);
      v3 = v21;
    }
  }

  return v8;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetReferences:(id)a4
{
  void *v6;
  void *v7;

  -[PUAssetActionManager _assetsByAssetCollectionForAssetReferences:](self, "_assetsByAssetCollectionForAssetReferences:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetActionManager actionPerformerForSimpleActionType:onAssetsByAssetCollection:](self, "actionPerformerForSimpleActionType:onAssetsByAssetCollection:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetsByAssetCollection:(id)a4
{
  return 0;
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetReferences:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a3;
  -[PUAssetActionManager _assetsByAssetCollectionForAssetReferences:](self, "_assetsByAssetCollectionForAssetReferences:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetActionManager actionPerformerForSettingFavoriteTo:onAssetsByAssetCollection:](self, "actionPerformerForSettingFavoriteTo:onAssetsByAssetCollection:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)actionPerformerForDuplicatingAssetsByAssetCollection:(id)a3 withNewStillImageTime:(id *)a4
{
  return 0;
}

- (id)actionPerformerForPastingAdjustmentsByAssetCollection:(id)a3
{
  return 0;
}

- (id)actionPerformerForRevertingAdjustmentsByAssetCollection:(id)a3
{
  return 0;
}

- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4
{
  return 0;
}

- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4
{
  return 0;
}

- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4
{
  return 0;
}

- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4
{
  return 0;
}

- (id)actionPerformerForRemoveAssetsFromFeaturedPhotosByAssetCollection:(id)a3 assetToSuggestionMap:(id)a4
{
  return 0;
}

- (BOOL)canPerformAction:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4
{
  id v6;
  BOOL v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PUAssetActionManager_canPerformAction_onAllAssetsByAssetCollection___block_invoke;
    v9[3] = &unk_1E589C9F8;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = a3;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = -[PUAssetActionManager canPerformActionType:onAsset:inAssetCollection:](self, "canPerformActionType:onAsset:inAssetCollection:", a3, 0, 0);
  }

  return v7;
}

- (BOOL)canPerformAction:(unint64_t)a3 onAllAssetReferences:(id)a4
{
  void *v6;

  -[PUAssetActionManager _assetsByAssetCollectionForAssetReferences:](self, "_assetsByAssetCollectionForAssetReferences:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[PUAssetActionManager canPerformAction:onAllAssetsByAssetCollection:](self, "canPerformAction:onAllAssetsByAssetCollection:", a3, v6);

  return a3;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAllAssetsByAssetCollection:(id)a4
{
  id v6;
  BOOL v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__PUAssetActionManager_shouldEnableActionType_onAllAssetsByAssetCollection___block_invoke;
    v9[3] = &unk_1E589C9F8;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = a3;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = -[PUAssetActionManager shouldEnableActionType:onAsset:inAssetCollection:](self, "shouldEnableActionType:onAsset:inAssetCollection:", a3, 0, 0);
  }

  return v7;
}

- (PUAssetActionManagerDelegate)delegate
{
  return (PUAssetActionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __76__PUAssetActionManager_shouldEnableActionType_onAllAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "shouldEnableActionType:onAsset:inAssetCollection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), v7, (_QWORD)v13);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

void __70__PUAssetActionManager_canPerformAction_onAllAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:onAsset:inAssetCollection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), v7, (_QWORD)v13);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

@end
