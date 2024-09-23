@implementation PUPhotoEditIrisModel

- (PUPhotoEditIrisModel)init
{
  return -[PUPhotoEditIrisModel initWithAsset:compositionController:](self, "initWithAsset:compositionController:", 0, 0);
}

- (PUPhotoEditIrisModel)initWithAsset:(id)a3 compositionController:(id)a4
{
  id v7;
  id v8;
  unsigned __int16 v9;
  PUPhotoEditIrisModel *v10;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isLivePhoto"))
    v9 = objc_msgSend(v7, "livePhotoVisibilityState");
  else
    v9 = 0;
  v10 = -[PUPhotoEditIrisModel initWithIrisVisibilityState:hasAdjustments:compositionController:](self, "initWithIrisVisibilityState:hasAdjustments:compositionController:", v9, objc_msgSend(v7, "isAdjusted"), v8);

  if (v10)
    objc_storeStrong((id *)&v10->_asset, a3);

  return v10;
}

- (PUPhotoEditIrisModel)initWithIrisVisibilityState:(unsigned __int16)a3 hasAdjustments:(BOOL)a4 compositionController:(id)a5
{
  id v9;
  PUPhotoEditIrisModel *v10;
  PUPhotoEditIrisModel *v11;
  id *v12;
  _QWORD v14[4];
  id *v15;
  unsigned __int16 v16;
  objc_super v17;

  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PUPhotoEditIrisModel;
  v10 = -[PUViewModel init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_assetVisibility = a3;
    v10->_assetHasAdjustments = a4;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__PUPhotoEditIrisModel_initWithIrisVisibilityState_hasAdjustments_compositionController___block_invoke;
    v14[3] = &unk_1E58A7DF8;
    v16 = a3;
    v12 = v10;
    v15 = v12;
    objc_msgSend(v12, "performChanges:", v14);
    objc_storeStrong(v12 + 10, a5);

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PUPhotoEditIrisModel *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = +[PUPhotoEditIrisModel allocWithZone:](PUPhotoEditIrisModel, "allocWithZone:", a3);
  -[PUPhotoEditIrisModel asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditIrisModel compositionController](self, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUPhotoEditIrisModel initWithAsset:compositionController:](v4, "initWithAsset:compositionController:", v5, v6);

  *(_WORD *)(v7 + 68) = self->_editingVisibility;
  *(_WORD *)(v7 + 70) = self->_assetVisibility;
  *(_BYTE *)(v7 + 66) = self->_assetHasAdjustments;
  *(_BYTE *)(v7 + 64) = self->_videoEnabled;
  return (id)v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditIrisModel;
  -[PUPhotoEditIrisModel dealloc](&v4, sel_dealloc);
}

- (void)setVideoEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__PUPhotoEditIrisModel_setVideoEnabled___block_invoke;
  v3[3] = &unk_1E58AAD68;
  v3[4] = self;
  v4 = a3;
  -[PUViewModel performChanges:](self, "performChanges:", v3);
}

- (void)notifyCannotSupportVideoEdits
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__PUPhotoEditIrisModel_notifyCannotSupportVideoEdits__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v2);
}

- (BOOL)reenablingLivePhotoShouldRemoveEdits
{
  -[PUPhotoEditIrisModel editingVisibility](self, "editingVisibility");
  return PHVideoComplementVisibilityStateHasFullEditingSupport() ^ 1;
}

- (BOOL)hasUnsavedChanges
{
  int IsPlayable;
  _BOOL4 v4;
  int v5;

  -[PUPhotoEditIrisModel assetVisibility](self, "assetVisibility");
  -[PUPhotoEditIrisModel assetHasAdjustments](self, "assetHasAdjustments");
  IsPlayable = PHVideoComplementVisibilityStateIsPlayable();
  if (IsPlayable != -[PUPhotoEditIrisModel isVideoEnabled](self, "isVideoEnabled")
    && -[PUPhotoEditIrisModel assetVisibility](self, "assetVisibility") == 2
    && -[PUPhotoEditIrisModel editingVisibility](self, "editingVisibility") == 10)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = -[PUPhotoEditIrisModel assetVisibility](self, "assetVisibility");
    return ((v5 ^ -[PUPhotoEditIrisModel editingVisibility](self, "editingVisibility")) >> 2) & 1;
  }
  return v4;
}

- (void)setIgnoresUpdates:(BOOL)a3
{
  if (self->_ignoresUpdates != a3)
  {
    self->_ignoresUpdates = a3;
    if (!a3)
      -[PUPhotoEditIrisModel _updateAutoDisableStateIfNeeded](self, "_updateAutoDisableStateIfNeeded");
  }
}

- (void)_updateAutoDisableStateIfNeeded
{
  _QWORD v3[5];

  if (-[PUPhotoEditIrisModel isVideoEnabled](self, "isVideoEnabled")
    && !-[PUPhotoEditIrisModel ignoresUpdates](self, "ignoresUpdates"))
  {
    if (-[PUPhotoEditIrisModel _hasLegacyIrisConflicts](self, "_hasLegacyIrisConflicts"))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __55__PUPhotoEditIrisModel__updateAutoDisableStateIfNeeded__block_invoke;
      v3[3] = &unk_1E58ABD10;
      v3[4] = self;
      -[PUViewModel performChanges:](self, "performChanges:", v3);
    }
  }
}

- (BOOL)_hasLegacyIrisConflicts
{
  void *v2;
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

  -[PUPhotoEditIrisModel compositionController](self, "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D71260];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0D71260], "newComposition");
  v6 = (void *)objc_msgSend(v4, "newCompositionControllerWithComposition:", v5);

  objc_msgSend(v6, "availableKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v3, "PIRedEyeAdjustmentKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

  objc_msgSend(v3, "PIAutoEnhanceAdjustmentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v10);

  objc_msgSend(v6, "composition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v2, "isEqual:forKeys:visualChangesOnly:", v11, v8, 1);

  return v12 ^ 1;
}

- (PUPhotoEditIrisModelChange)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditIrisModel;
  -[PUViewModel currentChange](&v3, sel_currentChange);
  return (PUPhotoEditIrisModelChange *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUPhotoEditIrisModelChange);
}

- (void)_setHidden:(BOOL)a3 explicit:(BOOL)a4 supportable:(BOOL)a5
{
  int v6;
  int v7;
  int IsPlayable;
  id v9;

  if (a3 && a4)
    v6 = 4;
  else
    v6 = 0;
  if (a5)
    v7 = 8;
  else
    v7 = 0;
  -[PUPhotoEditIrisModel setEditingVisibility:](self, "setEditingVisibility:", v7 | a3 | v6 | 2u);
  IsPlayable = PHVideoComplementVisibilityStateIsPlayable();
  if (self->_videoEnabled != IsPlayable)
  {
    self->_videoEnabled = IsPlayable;
    -[PUPhotoEditIrisModel currentChange](self, "currentChange");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setVideoEnabledDidChange:", 1);

  }
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (BOOL)ignoresUpdates
{
  return self->_ignoresUpdates;
}

- (unsigned)editingVisibility
{
  return self->_editingVisibility;
}

- (void)setEditingVisibility:(unsigned __int16)a3
{
  self->_editingVisibility = a3;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setCompositionController:(id)a3
{
  objc_storeStrong((id *)&self->_compositionController, a3);
}

- (unsigned)assetVisibility
{
  return self->_assetVisibility;
}

- (BOOL)assetHasAdjustments
{
  return self->_assetHasAdjustments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

uint64_t __55__PUPhotoEditIrisModel__updateAutoDisableStateIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "editingVisibility");
  return objc_msgSend(*(id *)(a1 + 32), "_setHidden:explicit:supportable:", 1, 0, PHVideoComplementVisibilityStateHasFullEditingSupport());
}

uint64_t __53__PUPhotoEditIrisModel_notifyCannotSupportVideoEdits__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHidden:explicit:supportable:", 1, 0, 0);
}

uint64_t __40__PUPhotoEditIrisModel_setVideoEnabled___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "editingVisibility");
  return objc_msgSend(*(id *)(a1 + 32), "_setHidden:explicit:supportable:", *(_BYTE *)(a1 + 40) == 0, 1, PHVideoComplementVisibilityStateHasFullEditingSupport());
}

uint64_t __89__PUPhotoEditIrisModel_initWithIrisVisibilityState_hasAdjustments_compositionController___block_invoke(uint64_t a1)
{
  uint64_t IsHidden;

  IsHidden = PHVideoComplementVisibilityStateIsHidden();
  return objc_msgSend(*(id *)(a1 + 32), "_setHidden:explicit:supportable:", IsHidden, PHVideoComplementVisibilityStateIsExplicit(), 1);
}

@end
