@implementation PUPXAssetActionManager

- (PUPXAssetActionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXAssetActionManager.m"), 134, CFSTR("%s is not available as initializer"), "-[PUPXAssetActionManager init]");

  abort();
}

- (PUPXAssetActionManager)initWithUnderlyingActionManager:(id)a3
{
  id v5;
  PUPXAssetActionManager *v6;
  PUPXAssetActionManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPXAssetActionManager;
  v6 = -[PUPXAssetActionManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingActionManager, a3);

  return v7;
}

- (id)px_selectionManager
{
  return (id)-[PXAssetActionManager selectionManager](self->_underlyingActionManager, "selectionManager");
}

- (id)_selectionSnapshotForAssetReferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetActionManager selectionManager](self->_underlyingActionManager, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v6, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7CD48], "indexPathSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v7, "identifier");
          objc_msgSend(v14, "indexPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          PXSimpleIndexPathFromIndexPath();

          v18[0] = v19;
          v18[1] = v20;
          objc_msgSend(v8, "addIndexPath:", v18);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD88]), "initWithDataSource:selectedIndexPaths:", v7, v8);
  }
  else
  {
    v16 = v6;
  }

  return v16;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  _OWORD v20[2];

  v8 = (unint64_t)a4;
  v9 = (unint64_t)a5;
  PXAssetActionTypeForPUAssetActionType(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && v8 | v9)
  {
    -[PXAssetActionManager objectReference](self->_underlyingActionManager, "objectReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D7CCD0]);
    v13 = *(_OWORD *)(MEMORY[0x1E0D7D0D0] + 16);
    v20[0] = *MEMORY[0x1E0D7D0D0];
    v20[1] = v13;
    v14 = objc_msgSend(v12, "initWithSectionObject:itemObject:subitemObject:indexPath:", v9, v8, 0, v20);
    -[PXAssetActionManager setObjectReference:](self->_underlyingActionManager, "setObjectReference:", v14);

    LOBYTE(v14) = -[PXAssetActionManager canPerformActionType:](self->_underlyingActionManager, "canPerformActionType:", v10);
    -[PXAssetActionManager setObjectReference:](self->_underlyingActionManager, "setObjectReference:", v11);

    -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v14 & 1) != 0)
    {
      v16 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUPXAssetActionManager underlyingActionManager](self, "underlyingActionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isActionTypeAllowed:", v10);

  v16 = 0;
  if (v18 && v15)
    v16 = objc_msgSend(v15, "canPerformActionType:onAsset:inAssetCollection:", a3, v8, v9);
LABEL_9:

  return v16;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a5;
  PXAssetActionTypeForPUAssetActionType(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = -[PXAssetActionManager shouldEnableActionType:onAsset:](self->_underlyingActionManager, "shouldEnableActionType:onAsset:", v10, v8);
  else
    v11 = 0;
  -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) == 0 && v12)
    v11 = objc_msgSend(v12, "shouldEnableActionType:onAsset:inAssetCollection:", a3, v8, v9);

  return v11;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetReferences:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PUPXAssetActionPerformer *v13;
  void *v14;
  void *v15;

  v6 = a4;
  PXAssetActionTypeForPUAssetActionType(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PXAssetActionManager objectReference](self->_underlyingActionManager, "objectReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pxAssetReference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetActionManager setObjectReference:](self->_underlyingActionManager, "setObjectReference:", v10);

    }
    -[PXAssetActionManager actionPerformerForActionType:](self->_underlyingActionManager, "actionPerformerForActionType:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a3 != 61)
      {
        -[PUPXAssetActionManager _selectionSnapshotForAssetReferences:](self, "_selectionSnapshotForAssetReferences:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSelectionSnapshot:", v12);

      }
      v13 = -[PUPXAssetActionPerformer initWithUnderlyingActionPerformer:]([PUPXAssetActionPerformer alloc], "initWithUnderlyingActionPerformer:", v11);
    }
    else
    {
      v13 = 0;
    }
    -[PXAssetActionManager setObjectReference:](self->_underlyingActionManager, "setObjectReference:", v8);

  }
  else
  {
    v13 = 0;
  }
  -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v13 && v14)
  {
    objc_msgSend(v14, "actionPerformerForSimpleActionType:onAssetReferences:", a3, v6);
    v13 = (PUPXAssetActionPerformer *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetReferences:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = a4;
  -[PUPXAssetActionManager actionPerformerForSimpleActionType:onAssetReferences:](self, "actionPerformerForSimpleActionType:onAssetReferences:", 40, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7 && v8)
  {
    objc_msgSend(v8, "actionPerformerForSettingFavoriteTo:onAssetReferences:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  return -[PUPXAssetActionManager actionPerformerForSimpleActionType:onAssetReferences:](self, "actionPerformerForSimpleActionType:onAssetReferences:", a3, 0);
}

- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "actionPerformerForEditingWithQuickCropContext:onAsset:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7)
  {
    *(float *)&v8 = a3;
    objc_msgSend(v7, "actionPerformerForEditingPlaybackRate:onAsset:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "actionPerformerForEditingAudioMixMode:onAsset:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "actionPerformerForEditingWithPendingEditsRequest:onAsset:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)barButtonItemForActionType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  PXAssetActionTypeForPUAssetActionType(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && -[PXAssetActionManager canPerformActionType:](self->_underlyingActionManager, "canPerformActionType:", v5))
  {
    -[PXAssetActionManager barButtonItemForActionType:](self->_underlyingActionManager, "barButtonItemForActionType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 && v7)
  {
    objc_msgSend(v7, "barButtonItemForActionType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)localizedTitleForActionType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  PXAssetActionTypeForPUAssetActionType(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && -[PXAssetActionManager canPerformActionType:](self->_underlyingActionManager, "canPerformActionType:", v5))
  {
    -[PXAssetActionManager localizedTitleForActionType:useCase:](self->_underlyingActionManager, "localizedTitleForActionType:useCase:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[PUPXAssetActionManager fallbackActionManager](self, "fallbackActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 && v7)
  {
    objc_msgSend(v7, "localizedTitleForActionType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (PXAssetActionManager)underlyingActionManager
{
  return self->_underlyingActionManager;
}

- (PUAssetActionManager)fallbackActionManager
{
  return self->_fallbackActionManager;
}

- (void)setFallbackActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackActionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackActionManager, 0);
  objc_storeStrong((id *)&self->_underlyingActionManager, 0);
}

@end
