@implementation PUAssetExplorerReviewScreenActionManager

- (PUAssetExplorerReviewScreenActionManager)initWithSourceType:(unint64_t)a3
{
  PUAssetExplorerReviewScreenActionManager *v4;
  PUUUIDSelectionManager *v5;
  PUUUIDSelectionManager *selectionManager;
  PUUUIDSelectionManager *v7;
  PUUUIDSelectionManager *disableLivePhotosSelectionManager;
  PUAssetExplorerReviewScreenActionManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUAssetExplorerReviewScreenActionManager;
  v4 = -[PUAssetExplorerReviewScreenActionManager init](&v11, sel_init);
  if (v4)
  {
    v5 = -[PUUUIDSelectionManager initWithSelectedUUIDs:]([PUUUIDSelectionManager alloc], "initWithSelectedUUIDs:", 0);
    selectionManager = v4->_selectionManager;
    v4->_selectionManager = v5;

    v7 = -[PUUUIDSelectionManager initWithSelectedUUIDs:]([PUUUIDSelectionManager alloc], "initWithSelectedUUIDs:", 0);
    disableLivePhotosSelectionManager = v4->_disableLivePhotosSelectionManager;
    v4->_disableLivePhotosSelectionManager = v7;

    v4->__sourceType = a3;
    v9 = v4;
  }

  return v4;
}

- (Class)_actionPerformerClassForActionType:(unint64_t)a3
{
  if (a3 - 41 > 0xB)
    return (Class)0;
  else
    return (Class)(id)objc_opt_class();
}

- (BOOL)_hasReviewScreenActionTypeForAssetActionType:(unint64_t)a3
{
  return a3 - 41 < 0xC;
}

- (unint64_t)_reviewScreenActionTypeForAssetActionType:(unint64_t)a3
{
  unint64_t result;
  void *v7;

  result = 0;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3CuLL:
    case 0x3DuLL:
    case 0x3EuLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenActionManager.m"), 326, CFSTR("Unexpected action type %lu"), a3);

      result = 0;
      break;
    case 0x29uLL:
      result = 3;
      break;
    case 0x2BuLL:
      result = 1;
      break;
    case 0x2CuLL:
      result = 2;
      break;
    case 0x2DuLL:
      result = 4;
      break;
    case 0x2EuLL:
      result = 5;
      break;
    case 0x2FuLL:
      result = 6;
      break;
    case 0x30uLL:
      result = 7;
      break;
    case 0x31uLL:
      result = 8;
      break;
    case 0x32uLL:
      result = 9;
      break;
    case 0x33uLL:
      result = 10;
      break;
    case 0x34uLL:
      result = 11;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  objc_class *v14;
  unsigned __int8 v15;
  BOOL v16;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  if (-[PUAssetExplorerReviewScreenActionManager _hasReviewScreenActionTypeForAssetActionType:](self, "_hasReviewScreenActionTypeForAssetActionType:", a3)&& ((v10 = -[PUAssetExplorerReviewScreenActionManager _reviewScreenActionTypeForAssetActionType:](self, "_reviewScreenActionTypeForAssetActionType:", a3), v11 = v10, v10 - 3 >= 9)&& v10 != 1|| v8)&& (-[PUAssetExplorerReviewScreenActionManager reviewScreenActionManagerDelegate](self, "reviewScreenActionManagerDelegate"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "assetExplorerReviewScreenActionManager:canPerformActionType:onAsset:inAssetCollection:", self,
                v11,
                v8,
                v9),
        v12,
        v13))
  {
    v14 = -[PUAssetExplorerReviewScreenActionManager _actionPerformerClassForActionType:](self, "_actionPerformerClassForActionType:", a3);
    if (v14)
    {
      v15 = -[objc_class canPerformOnAsset:inAssetCollection:](v14, "canPerformOnAsset:inAssetCollection:", v8, v9);
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)PUAssetExplorerReviewScreenActionManager;
      v15 = -[PUAssetActionManager canPerformActionType:onAsset:inAssetCollection:](&v18, sel_canPerformActionType_onAsset_inAssetCollection_, a3, v8, v9);
    }
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  objc_class *v12;
  unsigned __int8 v13;
  BOOL v14;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  if (-[PUAssetExplorerReviewScreenActionManager _hasReviewScreenActionTypeForAssetActionType:](self, "_hasReviewScreenActionTypeForAssetActionType:", a3)&& (v10 = -[PUAssetExplorerReviewScreenActionManager _reviewScreenActionTypeForAssetActionType:](self, "_reviewScreenActionTypeForAssetActionType:", a3), -[PUAssetExplorerReviewScreenActionManager reviewScreenActionManagerDelegate](self, "reviewScreenActionManagerDelegate"), v11 = (void *)objc_claimAutoreleasedReturnValue(), LODWORD(v10) = objc_msgSend(v11, "assetExplorerReviewScreenActionManager:shouldEnableActionType:onAsset:inAssetCollection:", self, v10, v8, v9), v11,
        !(_DWORD)v10))
  {
    v14 = 0;
  }
  else
  {
    v12 = -[PUAssetExplorerReviewScreenActionManager _actionPerformerClassForActionType:](self, "_actionPerformerClassForActionType:", a3);
    if (v12)
    {
      v13 = -[objc_class shouldEnableOnAsset:inAssetCollection:](v12, "shouldEnableOnAsset:inAssetCollection:", v8, v9);
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)PUAssetExplorerReviewScreenActionManager;
      v13 = -[PUAssetActionManager shouldEnableActionType:onAsset:inAssetCollection:](&v16, sel_shouldEnableActionType_onAsset_inAssetCollection_, a3, v8, v9);
    }
    v14 = v13;
  }

  return v14;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  id v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  PUAssetExplorerReviewScreenActionManager *v22;
  _QWORD v23[4];
  id v24;
  PUAssetExplorerReviewScreenActionManager *v25;
  _QWORD v26[4];
  id v27;
  PUAssetExplorerReviewScreenActionManager *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  PUAssetExplorerReviewScreenActionManager *v32;
  _QWORD v33[4];
  id v34;
  PUAssetExplorerReviewScreenActionManager *v35;
  _QWORD v36[4];
  id v37;
  PUAssetExplorerReviewScreenActionManager *v38;
  _QWORD v39[4];
  id v40;
  PUAssetExplorerReviewScreenActionManager *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  PUAssetExplorerReviewScreenActionManager *v45;
  objc_super v46;

  v7 = a4;
  v8 = -[PUAssetExplorerReviewScreenActionManager _actionPerformerClassForActionType:](self, "_actionPerformerClassForActionType:", a3);
  if (v8)
  {
    v9 = objc_msgSend([v8 alloc], "initWithActionType:assets:orAssetsByAssetCollection:", a3, 0, v7);
  }
  else
  {
    v46.receiver = self;
    v46.super_class = (Class)PUAssetExplorerReviewScreenActionManager;
    -[PUAssetActionManager actionPerformerForSimpleActionType:onAssetsByAssetCollection:](&v46, sel_actionPerformerForSimpleActionType_onAssetsByAssetCollection_, a3, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    -[PUAssetExplorerReviewScreenActionManager reviewScreenActionManagerDelegate](self, "reviewScreenActionManagerDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenActionManager reviewAssetProvider](self, "reviewAssetProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a3)
    {
      case ')':
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke;
        v42[3] = &unk_1E58AB790;
        v43 = v7;
        v44 = v12;
        v45 = self;
        objc_msgSend(v11, "setPerformUserInteractionTaskBlock:", v42);

        v14 = v43;
        goto LABEL_24;
      case '*':
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_2;
        v39[3] = &unk_1E58ABCA8;
        v40 = v12;
        v41 = self;
        objc_msgSend(v11, "setPerformUserInteractionTaskBlock:", v39);
        v14 = v40;
        goto LABEL_24;
      case '+':
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_3;
        v36[3] = &unk_1E58ABCA8;
        v37 = v12;
        v38 = self;
        objc_msgSend(v11, "setPerformUserInteractionTaskBlock:", v36);
        v14 = v37;
        goto LABEL_24;
      case ',':
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_4;
        v33[3] = &unk_1E58ABCA8;
        v34 = v12;
        v35 = self;
        objc_msgSend(v11, "setPerformUserInteractionTaskBlock:", v33);
        v14 = v34;
        goto LABEL_24;
      case '-':
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_5;
        v29[3] = &unk_1E58AB790;
        v30 = v7;
        v31 = v12;
        v32 = self;
        objc_msgSend(v11, "setPerformUserInteractionTaskBlock:", v29);

        v14 = v30;
        goto LABEL_24;
      case '.':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenActionManager.m"), 467, CFSTR("Expecting markup action performer"));

        }
        v14 = v11;
        objc_msgSend(v14, "setReviewAssetProvider:", v13);
        objc_msgSend(v14, "setMarkupObserver:", v12);
        goto LABEL_24;
      case '/':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenActionManager.m"), 476, CFSTR("Expecting edit action performer"));

        }
        v15 = v11;
        objc_msgSend(v15, "setReviewAssetProvider:", v13);
        -[PUAssetExplorerReviewScreenActionManager reviewScreenActionManagerDelegate](self, "reviewScreenActionManagerDelegate");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPhotoDelegate:", v14);
        goto LABEL_20;
      case '0':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenActionManager.m"), 487, CFSTR("Expecting fun effects action performer"));

        }
        v15 = v11;
        objc_msgSend(v15, "setReviewAssetProvider:", v13);
        objc_msgSend(v15, "setFunEffectsObserver:", v12);
        objc_msgSend(v12, "reviewScreenBarsModelForAssetExplorerReviewScreenActionManager:", self);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setReviewBarsModel:", v14);
LABEL_20:

        goto LABEL_24;
      case '1':
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_6;
        v26[3] = &unk_1E58ABCA8;
        v27 = v12;
        v28 = self;
        objc_msgSend(v11, "setPerformUserInteractionTaskBlock:", v26);
        v14 = v27;
        goto LABEL_24;
      case '2':
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_7;
        v23[3] = &unk_1E58ABCA8;
        v24 = v12;
        v25 = self;
        objc_msgSend(v11, "setPerformUserInteractionTaskBlock:", v23);
        v14 = v24;
        goto LABEL_24;
      case '3':
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_8;
        v20[3] = &unk_1E58ABCA8;
        v21 = v12;
        v22 = self;
        objc_msgSend(v11, "setPerformUserInteractionTaskBlock:", v20);
        v14 = v21;
LABEL_24:

        break;
      default:
        break;
    }

  }
  return v10;
}

- (PUAssetExplorerReviewScreenActionManagerDelegate)reviewScreenActionManagerDelegate
{
  return (PUAssetExplorerReviewScreenActionManagerDelegate *)objc_loadWeakRetained((id *)&self->_reviewScreenActionManagerDelegate);
}

- (void)setReviewScreenActionManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reviewScreenActionManagerDelegate, a3);
}

- (PUReviewAssetProvider)reviewAssetProvider
{
  return (PUReviewAssetProvider *)objc_loadWeakRetained((id *)&self->_reviewAssetProvider);
}

- (void)setReviewAssetProvider:(id)a3
{
  objc_storeWeak((id *)&self->_reviewAssetProvider, a3);
}

- (PUUUIDSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PUUUIDSelectionManager)disableLivePhotosSelectionManager
{
  return self->_disableLivePhotosSelectionManager;
}

- (unint64_t)_sourceType
{
  return self->__sourceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableLivePhotosSelectionManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_destroyWeak((id *)&self->_reviewAssetProvider);
  objc_destroyWeak((id *)&self->_reviewScreenActionManagerDelegate);
}

void __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(a1 + 40), "assetExplorerReviewScreenActionManager:didPressSelectForAsset:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetExplorerReviewScreenActionManagerDidPressCancel:", *(_QWORD *)(a1 + 40));
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetExplorerReviewScreenActionManagerDidPressDone:", *(_QWORD *)(a1 + 40));
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetExplorerReviewScreenActionManagerDidPressRetake:", *(_QWORD *)(a1 + 40));
}

void __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(a1 + 40), "assetExplorerReviewScreenActionManager:didToggleLivePhoto:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetExplorerReviewScreenActionManagerDidPressSend:", *(_QWORD *)(a1 + 40));
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetExplorerReviewScreenActionManagerDidPressSelectAll:", *(_QWORD *)(a1 + 40));
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetExplorerReviewScreenActionManagerDidPressDeselectAll:", *(_QWORD *)(a1 + 40));
}

@end
