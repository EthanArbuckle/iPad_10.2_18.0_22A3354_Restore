@implementation PUPhotoKitAssetActionManager

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  objc_class *v11;
  id v12;
  int v13;
  BOOL v14;
  BOOL v15;
  unsigned __int8 v16;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v10 = +[PUPhotoKitAssetActionManager actionPerformerClassForActionType:](PUPhotoKitAssetActionManager, "actionPerformerClassForActionType:", a3);
  if (!v10 || (v11 = v10, v8) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v18.receiver = self;
    v18.super_class = (Class)PUPhotoKitAssetActionManager;
    v16 = -[PUAssetActionManager canPerformActionType:onAsset:inAssetCollection:](&v18, sel_canPerformActionType_onAsset_inAssetCollection_, a3, v8, v9);
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v9;
  else
    v12 = 0;
  v13 = -[objc_class canPerformOnAsset:inAssetCollection:](v11, "canPerformOnAsset:inAssetCollection:", v8, v12);
  v14 = a3 == 39;
  if (a3 == 39)
    v15 = 0;
  else
    v15 = v13;
  if (v14 && v13)
  {
    v16 = -[PUPhotoKitAssetActionManager enableNavigateToPhotos](self, "enableNavigateToPhotos");
LABEL_15:
    v15 = v16;
  }

  return v15;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  objc_class *v11;
  unsigned __int8 v12;
  BOOL v13;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v10 = +[PUPhotoKitAssetActionManager actionPerformerClassForActionType:](PUPhotoKitAssetActionManager, "actionPerformerClassForActionType:", a3);
  if (v10 && ((v11 = v10, !v8) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v12 = -[objc_class shouldEnableOnAsset:inAssetCollection:](v11, "shouldEnableOnAsset:inAssetCollection:", v8, v9);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUPhotoKitAssetActionManager;
    v12 = -[PUAssetActionManager shouldEnableActionType:onAsset:inAssetCollection:](&v15, sel_shouldEnableActionType_onAsset_inAssetCollection_, a3, v8, v9);
  }
  v13 = v12;

  return v13;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  id v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  objc_super v24;

  v7 = a4;
  if (!-[PUPhotoKitAssetActionManager _actionTypeIsSimple:](self, "_actionTypeIsSimple:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 444, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _actionTypeIsSimple:actionType]"));

  }
  v8 = +[PUPhotoKitAssetActionManager actionPerformerClassForActionType:](PUPhotoKitAssetActionManager, "actionPerformerClassForActionType:", a3);
  if (v8)
  {
    v9 = objc_msgSend([v8 alloc], "initWithActionType:assets:orAssetsByAssetCollection:", a3, 0, v7);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PUPhotoKitAssetActionManager;
    -[PUAssetActionManager actionPerformerForSimpleActionType:onAssetsByAssetCollection:](&v24, sel_actionPerformerForSimpleActionType_onAssetsByAssetCollection_, a3, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PUPhotoKitAssetActionManager _photoKitAssetsDataSource](self, "_photoKitAssetsDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "photosDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __93__PUPhotoKitAssetActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke;
      v21[3] = &unk_1E58A51A8;
      v22 = v13;
      v23 = v14;
      v15 = v14;
      v16 = v13;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v21);
      objc_msgSend(v10, "setFetchResultsByAssetCollection:", v15);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUPhotoKitAssetActionManager _photosDataSource](self, "_photosDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPhotosDataSource:", v17);

  }
  objc_msgSend((id)objc_opt_class(), "actionManagerLog");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActionPerformerLog:", v18);

  return v10;
}

- (id)actionPerformerForSettingFavoriteTo:(BOOL)a3 onAssetsByAssetCollection:(id)a4
{
  _BOOL8 v4;
  id v6;
  PUPhotoKitFavoriteActionPerformer *v7;
  void *v8;

  v4 = a3;
  v6 = a4;
  v7 = -[PUAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:]([PUPhotoKitFavoriteActionPerformer alloc], "initWithActionType:assets:orAssetsByAssetCollection:", 40, 0, v6);

  -[PUPhotoKitFavoriteActionPerformer setFavorite:](v7, "setFavorite:", v4);
  -[PUPhotoKitAssetActionManager _photosDataSource](self, "_photosDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitActionPerformer setPhotosDataSource:](v7, "setPhotosDataSource:", v8);

  return v7;
}

- (id)actionPerformerForDuplicatingAssetsByAssetCollection:(id)a3 withNewStillImageTime:(id *)a4
{
  id v5;
  PUPhotoKitDuplicateActionPerformer *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v5 = a3;
  v6 = -[PUAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:]([PUPhotoKitDuplicateActionPerformer alloc], "initWithActionType:assets:orAssetsByAssetCollection:", 37, 0, v5);

  v8 = *a4;
  -[PUPhotoKitDuplicateActionPerformer setNewStillImageTime:](v6, "setNewStillImageTime:", &v8);
  return v6;
}

- (id)actionPerformerForPastingAdjustmentsByAssetCollection:(id)a3
{
  id v3;
  PUPhotoKitPasteAdjustmentsActionPerformer *v4;

  v3 = a3;
  v4 = -[PUPXPhotoKitActionPerformerAdapter initWithActionType:assets:orAssetsByAssetCollection:]([PUPhotoKitPasteAdjustmentsActionPerformer alloc], "initWithActionType:assets:orAssetsByAssetCollection:", 20, 0, v3);

  return v4;
}

- (id)actionPerformerForRevertingAdjustmentsByAssetCollection:(id)a3
{
  id v3;
  PUPhotoKitRevertAdjustmentsActionPerformer *v4;

  v3 = a3;
  v4 = -[PUPXPhotoKitActionPerformerAdapter initWithActionType:assets:orAssetsByAssetCollection:]([PUPhotoKitRevertAdjustmentsActionPerformer alloc], "initWithActionType:assets:orAssetsByAssetCollection:", 21, 0, v3);

  return v4;
}

- (id)actionPerformerForEditingWithQuickCropContext:(id)a3 onAsset:(id)a4
{
  id v5;
  id v6;
  PUPhotoKitEditActionPerformer *v7;
  void *v8;
  PUPhotoKitEditActionPerformer *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PUPhotoKitEditActionPerformer alloc];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PUAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:](v7, "initWithActionType:assets:orAssetsByAssetCollection:", 24, v8, 0);
  -[PUPhotoKitEditActionPerformer setQuickCropContext:](v9, "setQuickCropContext:", v6);

  return v9;
}

- (id)actionPerformerForEditingPlaybackRate:(float)a3 onAsset:(id)a4
{
  id v5;
  PUPXPhotoKitPlaybackRateActionPerformer *v6;
  PUPXPhotoKitPlaybackRateActionPerformer *v7;
  double v8;
  PUPhotoKitPlaybackRatePerformer *v9;
  void *v10;
  PUPhotoKitPlaybackRatePerformer *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = [PUPXPhotoKitPlaybackRateActionPerformer alloc];
  v7 = -[PXActionPerformer initWithActionType:](v6, "initWithActionType:", *MEMORY[0x1E0D7BFE8]);
  *(float *)&v8 = a3;
  -[PUPXPhotoKitPlaybackRateActionPerformer setPlaybackRate:](v7, "setPlaybackRate:", v8);
  v9 = [PUPhotoKitPlaybackRatePerformer alloc];
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PUPXPhotoKitActionPerformerAdapter initWithActionType:assets:orAssetsByAssetCollection:pxActionPerformer:](v9, "initWithActionType:assets:orAssetsByAssetCollection:pxActionPerformer:", 27, v10, 0, v7);
  return v11;
}

- (id)actionPerformerForEditingAudioMixMode:(id)a3 onAsset:(id)a4
{
  id v5;
  id v6;
  PUPXPhotoKitAudioMixModeActionPerformer *v7;
  PUPXPhotoKitAudioMixModeActionPerformer *v8;
  PUPhotoKitAudioMixModePerformer *v9;
  void *v10;
  PUPhotoKitAudioMixModePerformer *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PUPXPhotoKitAudioMixModeActionPerformer alloc];
  v8 = -[PXActionPerformer initWithActionType:](v7, "initWithActionType:", *MEMORY[0x1E0D7BFE0]);
  -[PUPXPhotoKitAudioMixModeActionPerformer setAudioMixMode:](v8, "setAudioMixMode:", v6);

  v9 = [PUPhotoKitAudioMixModePerformer alloc];
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PUPXPhotoKitActionPerformerAdapter initWithActionType:assets:orAssetsByAssetCollection:pxActionPerformer:](v9, "initWithActionType:assets:orAssetsByAssetCollection:pxActionPerformer:", 28, v10, 0, v8);
  return v11;
}

- (id)actionPerformerForEditingWithPendingEditsRequest:(id)a3 onAsset:(id)a4
{
  id v5;
  id v6;
  PUPhotoKitEditActionPerformer *v7;
  void *v8;
  PUPhotoKitEditActionPerformer *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PUPhotoKitEditActionPerformer alloc];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PUAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:](v7, "initWithActionType:assets:orAssetsByAssetCollection:", 15, v8, 0);
  -[PUPhotoKitEditActionPerformer setPendingEditsRequest:](v9, "setPendingEditsRequest:", v6);

  return v9;
}

- (id)_photosDataSource
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[PUPhotoKitAssetActionManager dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PUPhotoKitAssetActionManager dataSourceManager](self, "dataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_photoKitAssetsDataSource
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[PUAssetActionManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PUAssetActionManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetActionManagerCurrentAssetsDataSource:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)_actionTypeIsSimple:(unint64_t)a3
{
  return (a3 < 0x3F) & (0x7FFFFEDFFFFFFFFEuLL >> a3);
}

- (PUPhotoKitDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (BOOL)enableNavigateToPhotos
{
  return self->_enableNavigateToPhotos;
}

- (void)setEnableNavigateToPhotos:(BOOL)a3
{
  self->_enableNavigateToPhotos = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

void __93__PUPhotoKitAssetActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "sectionForAssetCollection:", v6);
  v4 = v6;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetsInSection:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

    v4 = v6;
  }

}

+ (Class)actionPerformerClassForActionType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = 0;
  switch(a3)
  {
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
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
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
    case 0x3CuLL:
    case 0x3EuLL:
      goto LABEL_4;
    case 0x11uLL:
      +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "showAutoEnhanceAction");

      goto LABEL_4;
    case 0x19uLL:
    case 0x1AuLL:
      +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "showRotateAction");

LABEL_4:
      v3 = (void *)objc_opt_class();
      break;
    default:
      return (Class)v3;
  }
  return (Class)v3;
}

@end
