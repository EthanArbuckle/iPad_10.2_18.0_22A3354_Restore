@implementation PUAssetExplorerReviewScreenBadgeTileViewController

- (void)performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PUAssetExplorerReviewScreenBadgeTileViewController _isPerformingChanges](self, "_isPerformingChanges");
  -[PUAssetExplorerReviewScreenBadgeTileViewController _setPerformingChanges:](self, "_setPerformingChanges:", 1);
  v4[2](v4);

  -[PUAssetExplorerReviewScreenBadgeTileViewController _setPerformingChanges:](self, "_setPerformingChanges:", v5);
  if (!v5)
    -[PUAssetExplorerReviewScreenBadgeTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (id)loadView
{
  id v3;
  PXUIAssetBadgeView *v4;
  PXUIAssetBadgeView *badgeView;

  v3 = objc_alloc(MEMORY[0x1E0D7BB38]);
  v4 = (PXUIAssetBadgeView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  badgeView = self->__badgeView;
  self->__badgeView = v4;

  -[PXUIAssetBadgeView setDelegate:](self->__badgeView, "setDelegate:", self);
  return self->__badgeView;
}

- (void)viewDidLoad
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAssetExplorerReviewScreenBadgeTileViewController;
  -[PUTileViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PUAssetExplorerReviewScreenBadgeTileViewController_viewDidLoad__block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUAssetExplorerReviewScreenBadgeTileViewController performChanges:](self, "performChanges:", v3);
}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetExplorerReviewScreenBadgeTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUAssetExplorerReviewScreenBadgeTileViewController setAssetReference:](self, "setAssetReference:", 0);
  -[PUAssetExplorerReviewScreenBadgeTileViewController setActionManager:](self, "setActionManager:", 0);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetExplorerReviewScreenBadgeTileViewController;
  -[PUTileViewController prepareForReuse](&v3, sel_prepareForReuse);
  -[PUAssetExplorerReviewScreenBadgeTileViewController setAssetReference:](self, "setAssetReference:", 0);
  -[PUAssetExplorerReviewScreenBadgeTileViewController setActionManager:](self, "setActionManager:", 0);
}

- (void)setBrowsingViewModel:(id)a3
{
  PUBrowsingViewModel *v4;
  PUBrowsingViewModel *browsingViewModel;
  _QWORD v6[5];
  PUBrowsingViewModel *v7;

  v4 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v4)
  {
    -[PUBrowsingViewModel unregisterChangeObserver:](browsingViewModel, "unregisterChangeObserver:", self);
    -[PUBrowsingViewModel registerChangeObserver:](v4, "registerChangeObserver:", self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__PUAssetExplorerReviewScreenBadgeTileViewController_setBrowsingViewModel___block_invoke;
    v6[3] = &unk_1E58ABCA8;
    v6[4] = self;
    v7 = v4;
    -[PUAssetExplorerReviewScreenBadgeTileViewController performChanges:](self, "performChanges:", v6);

  }
}

- (void)setAssetReference:(id)a3
{
  PUAssetReference *v4;
  PUAssetReference *v5;
  _QWORD v6[5];
  PUAssetReference *v7;

  v4 = (PUAssetReference *)a3;
  v5 = v4;
  if (self->_assetReference != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__PUAssetExplorerReviewScreenBadgeTileViewController_setAssetReference___block_invoke;
    v6[3] = &unk_1E58ABCA8;
    v6[4] = self;
    v7 = v4;
    -[PUAssetExplorerReviewScreenBadgeTileViewController performChanges:](self, "performChanges:", v6);

  }
}

- (void)setActionManager:(id)a3
{
  PUAssetActionManager *v4;
  PUAssetActionManager *v5;
  _QWORD v6[5];
  PUAssetActionManager *v7;

  v4 = (PUAssetActionManager *)a3;
  v5 = v4;
  if (self->_actionManager != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__PUAssetExplorerReviewScreenBadgeTileViewController_setActionManager___block_invoke;
    v6[3] = &unk_1E58ABCA8;
    v6[4] = self;
    v7 = v4;
    -[PUAssetExplorerReviewScreenBadgeTileViewController performChanges:](self, "performChanges:", v6);

  }
}

- (id)_reviewActionManager
{
  void *v2;
  void *v3;
  id v4;

  -[PUAssetExplorerReviewScreenBadgeTileViewController actionManager](self, "actionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_disableLivePhotosSelectionManager
{
  void *v2;
  void *v3;

  -[PUAssetExplorerReviewScreenBadgeTileViewController _reviewActionManager](self, "_reviewActionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableLivePhotosSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)applyLayoutInfo:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUAssetExplorerReviewScreenBadgeTileViewController;
  -[PUTileViewController applyLayoutInfo:](&v5, sel_applyLayoutInfo_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PUAssetExplorerReviewScreenBadgeTileViewController _setOverContent:](self, "_setOverContent:", objc_msgSend(v4, "isOverContent"));

}

- (void)_setOverContent:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->__isOverContent != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __70__PUAssetExplorerReviewScreenBadgeTileViewController__setOverContent___block_invoke;
    v3[3] = &unk_1E58AAD68;
    v3[4] = self;
    v4 = a3;
    -[PUAssetExplorerReviewScreenBadgeTileViewController performChanges:](self, "performChanges:", v3);
  }
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUAssetExplorerReviewScreenBadgeTileViewController _needsUpdate](self, "_needsUpdate")
    && -[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUAssetExplorerReviewScreenBadgeTileViewController _updateBadgeViewIfNeeded](self, "_updateBadgeViewIfNeeded");
    if (-[PUAssetExplorerReviewScreenBadgeTileViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenBadgeTileViewController.m"), 180, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (void)_invalidateBadgeView
{
  void *v4;

  if (!-[PUAssetExplorerReviewScreenBadgeTileViewController _isPerformingChanges](self, "_isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenBadgeTileViewController.m"), 189, CFSTR("must be inside change block"));

  }
  -[PUAssetExplorerReviewScreenBadgeTileViewController _setNeedsUpdateBadgeView:](self, "_setNeedsUpdateBadgeView:", 1);
}

- (void)_updateBadgeViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (-[PUAssetExplorerReviewScreenBadgeTileViewController _needsUpdateBadgeView](self, "_needsUpdateBadgeView"))
  {
    -[PUAssetExplorerReviewScreenBadgeTileViewController _setNeedsUpdateBadgeView:](self, "_setNeedsUpdateBadgeView:", 0);
    -[PUAssetExplorerReviewScreenBadgeTileViewController _badgeView](self, "_badgeView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v11 = v3;
      -[PUAssetExplorerReviewScreenBadgeTileViewController _reviewActionManager](self, "_reviewActionManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAssetExplorerReviewScreenBadgeTileViewController assetReference](self, "assetReference");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "canPerformActionType:onAsset:inAssetCollection:", 45, v6, v7) ^ 1;
      objc_msgSend(v11, "setHidden:", v8);
      if ((v8 & 1) == 0)
      {
        -[PUAssetExplorerReviewScreenBadgeTileViewController _disableLivePhotosSelectionManager](self, "_disableLivePhotosSelectionManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_configureBadgeView:isOverContent:isLivePhotoDisabled:", v11, -[PUAssetExplorerReviewScreenBadgeTileViewController _isOverContent](self, "_isOverContent"), objc_msgSend(v9, "isSelectedUUID:", v10));

      }
      v3 = v11;
    }

  }
}

- (void)assetBadgeView:(id)a3 userDidSelectBadges:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[PUAssetExplorerReviewScreenBadgeTileViewController assetReference](self, "assetReference", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenBadgeTileViewController _disableLivePhotosSelectionManager](self, "_disableLivePhotosSelectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSelectedUUID:", v7);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __89__PUAssetExplorerReviewScreenBadgeTileViewController_assetBadgeView_userDidSelectBadges___block_invoke;
  v19 = &unk_1E589CEB8;
  v21 = v9 ^ 1;
  v20 = v7;
  v10 = v7;
  objc_msgSend(v8, "performChanges:", &v16);
  objc_msgSend(v5, "assetCollection", v16, v17, v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  v23 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAssetExplorerReviewScreenBadgeTileViewController _reviewActionManager](self, "_reviewActionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionPerformerForSimpleActionType:onAssetsByAssetCollection:", 45, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "performWithCompletionHandler:", 0);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PUAssetExplorerReviewScreenBadgeTileViewControllerSelectionManagerObserverContext == a5)
  {
    -[PUAssetExplorerReviewScreenBadgeTileViewController _disableLivePhotosSelectionManager](self, "_disableLivePhotosSelectionManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v9)
    {
      if ((v6 & 1) == 0)
        goto LABEL_6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenBadgeTileViewController.m"), 259, CFSTR("Expecting observable to match the current selection manager"));

      if ((v6 & 1) == 0)
        goto LABEL_6;
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__PUAssetExplorerReviewScreenBadgeTileViewController_observable_didChange_context___block_invoke;
    v13[3] = &unk_1E58ABD10;
    v13[4] = self;
    -[PUAssetExplorerReviewScreenBadgeTileViewController performChanges:](self, "performChanges:", v13);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenBadgeTileViewController.m"), 267, CFSTR("Not expecting any other observables"));

LABEL_6:
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUAssetExplorerReviewScreenBadgeTileViewController browsingViewModel](self, "browsingViewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[PUAssetExplorerReviewScreenBadgeTileViewController assetReference](self, "assetReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetViewModelChangesByAssetReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "assetsDataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "assetReferenceForAssetReference:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", v12);
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        while (2)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17), "assetChanged", (_QWORD)v18) & 1) != 0)
            {

              -[PUAssetExplorerReviewScreenBadgeTileViewController setAssetReference:](self, "setAssetReference:", v12);
              goto LABEL_13;
            }
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v15)
            continue;
          break;
        }
      }

LABEL_13:
    }

  }
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (PUAssetActionManager)actionManager
{
  return self->_actionManager;
}

- (PXUIAssetBadgeView)_badgeView
{
  return self->__badgeView;
}

- (BOOL)_isPerformingChanges
{
  return self->__performingChanges;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__performingChanges = a3;
}

- (BOOL)_needsUpdateBadgeView
{
  return self->__needsUpdateBadgeView;
}

- (void)_setNeedsUpdateBadgeView:(BOOL)a3
{
  self->__needsUpdateBadgeView = a3;
}

- (BOOL)_isOverContent
{
  return self->__isOverContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__badgeView, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

uint64_t __83__PUAssetExplorerReviewScreenBadgeTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBadgeView");
}

uint64_t __89__PUAssetExplorerReviewScreenBadgeTileViewController_assetBadgeView_userDidSelectBadges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(a2, "addSelectedUUID:", v2);
  else
    return objc_msgSend(a2, "removeSelectedUUID:", v2);
}

uint64_t __70__PUAssetExplorerReviewScreenBadgeTileViewController__setOverContent___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBadgeView");
}

void __71__PUAssetExplorerReviewScreenBadgeTileViewController_setActionManager___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_disableLivePhotosSelectionManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:context:", *(_QWORD *)(a1 + 32), PUAssetExplorerReviewScreenBadgeTileViewControllerSelectionManagerObserverContext);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_disableLivePhotosSelectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerChangeObserver:context:", *(_QWORD *)(a1 + 32), PUAssetExplorerReviewScreenBadgeTileViewControllerSelectionManagerObserverContext);
  objc_msgSend(*(id *)(a1 + 32), "_invalidateBadgeView");

}

uint64_t __72__PUAssetExplorerReviewScreenBadgeTileViewController_setAssetReference___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBadgeView");
}

uint64_t __75__PUAssetExplorerReviewScreenBadgeTileViewController_setBrowsingViewModel___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBadgeView");
}

uint64_t __65__PUAssetExplorerReviewScreenBadgeTileViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBadgeView");
}

+ (CGSize)badgeTileSize
{
  double v2;
  double v3;
  _QWORD block[5];
  CGSize result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PUAssetExplorerReviewScreenBadgeTileViewController_badgeTileSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (badgeTileSize_onceToken != -1)
    dispatch_once(&badgeTileSize_onceToken, block);
  v2 = *(double *)&badgeTileSize_badgeTileSize_0;
  v3 = *(double *)&badgeTileSize_badgeTileSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (void)_configureBadgeView:(id)a3 isOverContent:(BOOL)a4 isLivePhotoDisabled:(BOOL)a5
{
  _BOOL8 v5;
  id v6;
  uint64_t v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setStyle:", 4);
  PXAssetBadgeInfoCreateWithBadges();
  objc_msgSend(v6, "setBadgeInfo:", &v7);
  objc_msgSend(v6, "setOverContent:", v5);

}

void __67__PUAssetExplorerReviewScreenBadgeTileViewController_badgeTileSize__block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  double v4;
  double v5;
  char v6;
  char v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  id v11;

  v2 = objc_alloc(MEMORY[0x1E0D7BB38]);
  v11 = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = 0;
  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v6 = 1;
  do
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "_configureBadgeView:isOverContent:isLivePhotoDisabled:", v11, 0, v3 & 1);
    objc_msgSend(v11, "sizeThatFits:", v4, v5);
    v6 = 0;
    if (*(double *)&badgeTileSize_badgeTileSize_0 >= *(double *)&v8)
      v8 = badgeTileSize_badgeTileSize_0;
    badgeTileSize_badgeTileSize_0 = v8;
    v10 = badgeTileSize_badgeTileSize_1;
    if (*(double *)&badgeTileSize_badgeTileSize_1 < v9)
      *(double *)&v10 = v9;
    badgeTileSize_badgeTileSize_1 = v10;
    v3 = 1;
  }
  while ((v7 & 1) != 0);

}

@end
