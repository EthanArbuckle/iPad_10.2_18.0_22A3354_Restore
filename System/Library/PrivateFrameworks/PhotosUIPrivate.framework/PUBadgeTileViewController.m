@implementation PUBadgeTileViewController

- (void)applyLivePhotoEffect:(int64_t)a3 toAsset:(id)a4 undoManager:(id)a5
{
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  NSObject *v19;
  id v20;
  int64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBadgeTileViewController.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  if (objc_msgSend(v9, "canPlayPhotoIris")
    && (v11 = PFMetadataPlaybackVariationFromPXAssetVariation(),
        v11 == objc_msgSend(v9, "playbackVariation")))
  {
    PLOneUpGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      PXAssetVariationTypeDescription();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "User selected variation %@ for asset %@, but it is already applied. No-op.", buf, 0x16u);

    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PUBadgeTileViewController_applyLivePhotoEffect_toAsset_undoManager___block_invoke;
    aBlock[3] = &unk_1E58A9DF0;
    v21 = a3;
    v14 = v9;
    v19 = v14;
    v20 = v10;
    v15 = _Block_copy(aBlock);
    v16 = v15;
    if (a3)
      -[PUBadgeTileViewController _performEditsIfAllowedOnAsset:edits:](self, "_performEditsIfAllowedOnAsset:edits:", v14, v15);
    else
      (*((void (**)(void *))v15 + 2))(v15);

    v12 = v19;
  }

}

- (void)disableLivePhotoForAsset:(id)a3 undoManager:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "canPlayPhotoIris") & 1) != 0)
  {
    v7 = *MEMORY[0x1E0D7C180];
    objc_msgSend(MEMORY[0x1E0D7B1E0], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__PUBadgeTileViewController_disableLivePhotoForAsset_undoManager___block_invoke;
    v11[3] = &unk_1E58AB060;
    v12 = v5;
    v9 = (id)objc_msgSend(v8, "performEditOperationWithType:asset:undoManager:completionHandler:", v7, v12, v6, v11);

    v10 = v12;
  }
  else
  {
    PLOneUpGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "User selected Live Photo Off for asset %@, but it is already off. No-op.", buf, 0xCu);
    }
  }

}

- (void)_toggleDepthForAsset:(id)a3 enable:(BOOL)a4 undoManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBadgeTileViewController.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PUBadgeTileViewController__toggleDepthForAsset_enable_undoManager___block_invoke;
  v14[3] = &unk_1E58AA878;
  v17 = a4;
  v15 = v9;
  v16 = v10;
  v11 = v10;
  v12 = v9;
  -[PUBadgeTileViewController _performEditsIfAllowedOnAsset:edits:](self, "_performEditsIfAllowedOnAsset:edits:", v12, v14);

}

- (void)_performEditsIfAllowedOnAsset:(id)a3 edits:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = v6;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v10 = objc_msgSend(v9, "isSpatialMedia");
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0DC3450];
    PELocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PELocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC3448];
    PELocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __65__PUBadgeTileViewController__performEditsIfAllowedOnAsset_edits___block_invoke;
    v23[3] = &unk_1E58AB6C0;
    v17 = v7;
    v24 = v17;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v18);

    v19 = (void *)MEMORY[0x1E0DC3448];
    PELocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, &__block_literal_global_15830);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v21);

    if (self->_delegateRespondsTo.presentViewController)
    {
      -[PUBadgeTileViewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "badgeTileViewController:presentViewController:", self, v14);

    }
    else
    {
      v17[2](v17);
    }

  }
  else
  {
    v7[2](v7);
  }

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
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBadgeTileViewController;
  -[PUTileViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUBadgeTileViewController _invalidateBadgeView](self, "_invalidateBadgeView");
  -[PUBadgeTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBadgeTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUBadgeTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
}

- (void)didChangeActive
{
  id v3;

  if (self->_delegateRespondsTo.badgeVisibilityDidChange)
  {
    -[PUBadgeTileViewController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "badgeVisibilityDidChange:", self);

  }
}

- (BOOL)isBadgeVisible
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBadgeTileViewController;
  return -[PUTileController isActive](&v3, sel_isActive);
}

- (UIView)livePhotoBadgeContainerView
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v15;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PUTileViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PUTileViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v15 = v3;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = v10;
          v17 = 0u;
          v18 = 0u;
          -[PUBadgeTileViewController _badgeInfo](self, "_badgeInfo");
          objc_msgSend(v3, "text");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = v17;
          v16[1] = v18;
          objc_msgSend(MEMORY[0x1E0D7B218], "textForBadgeInfo:style:", v16, 3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (v13)
          {

            goto LABEL_13;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
    v3 = v15;
  }
LABEL_13:

  return (UIView *)v3;
}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *assetViewModel;
  PUAssetViewModel *v7;

  v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    v7 = v5;
    -[PUAssetViewModel unregisterChangeObserver:](assetViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAssetViewModel registerChangeObserver:](self->_assetViewModel, "registerChangeObserver:", self);
    -[PUBadgeTileViewController _invalidateBadgeInfo](self, "_invalidateBadgeInfo");
    -[PUBadgeTileViewController _invalidateBadgeProvider](self, "_invalidateBadgeProvider");
    -[PUBadgeTileViewController _invalidateBadgeView](self, "_invalidateBadgeView");
    -[PUBadgeTileViewController _updateIfNeeded](self, "_updateIfNeeded");
    v5 = v7;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $695FA93EABCFCBDB4C719AE58023905F *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->userDidTapBadgeView = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->badgeVisibilityDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->undoManager = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->presentViewController = objc_opt_respondsToSelector() & 1;
  }

}

- (void)applyLayoutInfo:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUBadgeTileViewController;
  -[PUTileViewController applyLayoutInfo:](&v8, sel_applyLayoutInfo_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PUBadgeTileViewController _setOverContent:](self, "_setOverContent:", objc_msgSend(v5, "isOverContent"));
    objc_msgSend(v5, "contentWidth");
    v7 = v6;

    -[PUBadgeTileViewController _setContentWidth:](self, "_setContentWidth:", v7);
  }
  -[PUBadgeTileViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUBadgeTileViewController;
  -[PUTileViewController prepareForReuse](&v5, sel_prepareForReuse);
  -[PUBadgeTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
  -[PUBadgeTileViewController _badgeView](self, "_badgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  -[PUBadgeTileViewController _badgeInfoProvider](self, "_badgeInfoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performChanges:", &__block_literal_global_186);

}

- (void)_setBadgeInfo:(PXAssetBadgeInfo *)a3
{
  PXAssetBadgeInfo *p_badgeInfo;
  __int128 v6;
  PXAssetBadgeInfo badgeInfo;
  PXAssetBadgeInfo v8;

  p_badgeInfo = &self->__badgeInfo;
  v8 = *a3;
  badgeInfo = self->__badgeInfo;
  if ((PXAssetBadgeInfoEqualToBadgeInfo() & 1) == 0)
  {
    v6 = *(_OWORD *)&a3->count;
    *(_OWORD *)&p_badgeInfo->badges = *(_OWORD *)&a3->badges;
    *(_OWORD *)&p_badgeInfo->count = v6;
    -[PUBadgeTileViewController _invalidateBadgeProvider](self, "_invalidateBadgeProvider", *(_OWORD *)&badgeInfo.badges, *(_OWORD *)&badgeInfo.count, *(_OWORD *)&v8.badges, *(_OWORD *)&v8.count);
    -[PUBadgeTileViewController _invalidateBadgeView](self, "_invalidateBadgeView");
  }
}

- (void)_setOverContent:(BOOL)a3
{
  if (self->__isOverContent != a3)
  {
    self->__isOverContent = a3;
    -[PUBadgeTileViewController _invalidateBadgeView](self, "_invalidateBadgeView");
  }
}

- (void)_setContentWidth:(double)a3
{
  if (self->__contentWidth != a3)
  {
    self->__contentWidth = a3;
    -[PUBadgeTileViewController _invalidateBadgeView](self, "_invalidateBadgeView");
  }
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUBadgeTileViewController _needsUpdate](self, "_needsUpdate")
    && -[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUBadgeTileViewController _updateBadgeInfoIfNeeded](self, "_updateBadgeInfoIfNeeded");
    -[PUBadgeTileViewController _updateBadgeProviderIfNeeded](self, "_updateBadgeProviderIfNeeded");
    -[PUBadgeTileViewController _updateBadgeViewIfNeeded](self, "_updateBadgeViewIfNeeded");
    if (-[PUBadgeTileViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBadgeTileViewController.m"), 322, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return -[PUBadgeTileViewController _needsUpdateBadgeInfo](self, "_needsUpdateBadgeInfo")
      || -[PUBadgeTileViewController _needsUpdateBadgeProvider](self, "_needsUpdateBadgeProvider")
      || -[PUBadgeTileViewController _needsUpdateBadgeView](self, "_needsUpdateBadgeView");
}

- (void)_invalidateBadgeInfo
{
  -[PUBadgeTileViewController _setNeedsUpdateBadgeInfo:](self, "_setNeedsUpdateBadgeInfo:", 1);
  -[PUBadgeTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateBadgeInfoIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  if (-[PUBadgeTileViewController _needsUpdateBadgeInfo](self, "_needsUpdateBadgeInfo"))
  {
    -[PUBadgeTileViewController _setNeedsUpdateBadgeInfo:](self, "_setNeedsUpdateBadgeInfo:", 0);
    v7 = 0u;
    v8 = 0u;
    -[PUBadgeTileViewController assetViewModel](self, "assetViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "badgeInfoPromise");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "badgeInfo");
    }
    else
    {
      v7 = 0u;
      v8 = 0u;
    }

    v6[0] = v7;
    v6[1] = v8;
    -[PUBadgeTileViewController _setBadgeInfo:](self, "_setBadgeInfo:", v6);
  }
}

- (void)_invalidateBadgeProvider
{
  -[PUBadgeTileViewController _setNeedsUpdateBadgeProvider:](self, "_setNeedsUpdateBadgeProvider:", 1);
  -[PUBadgeTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateBadgeProviderIfNeeded
{
  PUBadgeInfoProvider *v3;
  _QWORD v4[5];

  if (-[PUBadgeTileViewController _needsUpdateBadgeProvider](self, "_needsUpdateBadgeProvider"))
  {
    -[PUBadgeTileViewController _setNeedsUpdateBadgeProvider:](self, "_setNeedsUpdateBadgeProvider:", 0);
    -[PUBadgeTileViewController _badgeInfoProvider](self, "_badgeInfoProvider");
    v3 = (PUBadgeInfoProvider *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = objc_alloc_init(PUBadgeInfoProvider);
      -[PUBadgeInfoProvider registerChangeObserver:context:](v3, "registerChangeObserver:context:", self, PUBadgeInfoProviderObservationContext);
      -[PUBadgeTileViewController set_badgeInfoProvider:](self, "set_badgeInfoProvider:", v3);
    }
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__PUBadgeTileViewController__updateBadgeProviderIfNeeded__block_invoke;
    v4[3] = &unk_1E58A7340;
    v4[4] = self;
    -[PUBadgeInfoProvider performChanges:](v3, "performChanges:", v4);

  }
}

- (void)_invalidateBadgeView
{
  -[PUBadgeTileViewController _setNeedsUpdateBadgeView:](self, "_setNeedsUpdateBadgeView:", 1);
  -[PUBadgeTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateBadgeViewIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  if (-[PUBadgeTileViewController _needsUpdateBadgeView](self, "_needsUpdateBadgeView"))
  {
    -[PUBadgeTileViewController _setNeedsUpdateBadgeView:](self, "_setNeedsUpdateBadgeView:", 0);
    -[PUBadgeTileViewController _badgeInfoProvider](self, "_badgeInfoProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    -[PUBadgeTileViewController _badgeInfo](self, "_badgeInfo");
    v10 = 0u;
    v11 = 0u;
    if (v3)
      objc_msgSend(v3, "outputBadgeInfo");
    v4 = objc_msgSend(v3, "outputShouldAnimate");
    -[PUBadgeTileViewController _badgeView](self, "_badgeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    v9 = v13;
    if ((PXAssetBadgeInfoIsNull() & 1) == 0)
    {
      if (v5)
      {
        v6 = (void *)objc_opt_class();
        v7 = -[PUBadgeTileViewController _isOverContent](self, "_isOverContent", v8, v9);
        -[PUBadgeTileViewController _contentWidth](self, "_contentWidth");
        v8 = v10;
        v9 = v11;
        objc_msgSend(v6, "_configureBadgeView:withBadgeInfo:isOverContent:contentWidth:animated:", v5, &v8, v7, v4);
      }
    }

  }
}

- (id)_menuForBadges:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  id *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x40000002000) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((a3 & 0x2000) != 0)
    {
      -[PUBadgeTileViewController _liveVariationsMenuForBadges:](self, "_liveVariationsMenuForBadges:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
    if ((a3 & 0x40000000000) != 0)
    {
      -[PUBadgeTileViewController _depthToggleMenuForBadges:](self, "_depthToggleMenuForBadges:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v5, "addObject:", v7);

    }
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    goto LABEL_23;
  }
  if ((a3 & 0x2000000000) != 0)
  {
    -[PUBadgeTileViewController assetViewModel](self, "assetViewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBadgeTileViewController.m"), 426, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetViewModel.asset"), v31, v33);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBadgeTileViewController.m"), 426, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetViewModel.asset"), v31);
    }

LABEL_15:
    objc_msgSend(MEMORY[0x1E0D7B6F8], "dataSourceManagerWithAsset:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D7CD10];
    objc_msgSend(v11, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = objc_msgSend(v13, "identifier");
    v42[1] = 0;
    v42[2] = 0;
    v42[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v12, "indexPathSetWithIndexPath:", v42);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD78]), "initWithDataSourceManager:", v11);
    v16 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke;
    v40[3] = &unk_1E589D3F8;
    v17 = v14;
    v41 = v17;
    objc_msgSend(v15, "performChanges:", v40);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6C0]), "initWithSelectionManager:", v15);
    objc_msgSend(v18, "setDataSourceManager:", v11);
    objc_msgSend(v18, "setPerformerDelegate:", self);
    if ((a3 & 0x8000000000) != 0)
    {
      v19 = (void *)MEMORY[0x1E0DC3428];
      PXLocalizedSharedLibraryString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.fill"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v16;
      v37[1] = 3221225472;
      v37[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke_2;
      v37[3] = &unk_1E58A5B60;
      v22 = &v38;
      v38 = v18;
      v23 = &v39;
      v39 = v5;
      v24 = v37;
    }
    else
    {
      if ((a3 & 0x4000000000) == 0)
        goto LABEL_21;
      v19 = (void *)MEMORY[0x1E0DC3428];
      PXLocalizedSharedLibraryString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2.fill"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v16;
      v34[1] = 3221225472;
      v34[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke_216;
      v34[3] = &unk_1E58A5B60;
      v22 = &v35;
      v35 = v18;
      v23 = &v36;
      v36 = v5;
      v24 = v34;
    }
    objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v20, v21, 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0DC39D0];
      v43[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "menuWithChildren:", v27);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
LABEL_23:

      return v8;
    }
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  v8 = 0;
  return v8;
}

- (id)_liveVariationsMenuForBadges:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id *v42;
  id *v43;
  id *v44;
  id *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id location;
  _QWORD v72[7];

  v72[5] = *MEMORY[0x1E0C80C00];
  if (self->_delegateRespondsTo.undoManager)
  {
    -[PUBadgeTileViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "undoManagerForAssetActionPerformer:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[PUBadgeTileViewController assetViewModel](self, "assetViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PULocalizedString(CFSTR("LIVE_PHOTO_BADGE_MENU_ACTION_LIVE"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("livephoto"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v8, "mediaSubtypes");
  if ((v46 & 0x10) != 0)
  {
    PLServicesLivePortraitLocalizedFrameworkString();
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("livephoto.portrait"));
    v10 = objc_claimAutoreleasedReturnValue();

    v49 = (void *)v10;
    v50 = (void *)v9;
  }
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC3428];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke;
  v67[3] = &unk_1E58A9FD0;
  v44 = &v70;
  objc_copyWeak(&v70, &location);
  v12 = v8;
  v68 = v12;
  v13 = v6;
  v69 = v13;
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v50, v49, 0, v67);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("LIVE_PHOTO_BADGE_MENU_ACTION_LOOP"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("livephoto.loop"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_2;
  v63[3] = &unk_1E58A9FD0;
  v45 = &v66;
  objc_copyWeak(&v66, &location);
  v17 = v12;
  v64 = v17;
  v18 = v13;
  v65 = v18;
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v15, v16, 0, v63);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("LIVE_PHOTO_BADGE_MENU_ACTION_BOUNCE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("livephoto.bounce"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_3;
  v59[3] = &unk_1E58A9FD0;
  v43 = &v62;
  objc_copyWeak(&v62, &location);
  v22 = v17;
  v60 = v22;
  v23 = v18;
  v61 = v23;
  objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v20, v21, 0, v59);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("LIVE_PHOTO_BADGE_MENU_ACTION_LONG_EXPOSURE"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("livephoto.long.exposure"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_4;
  v55[3] = &unk_1E58A9FD0;
  v42 = &v58;
  objc_copyWeak(&v58, &location);
  v28 = v22;
  v56 = v28;
  v29 = v23;
  v57 = v29;
  objc_msgSend(v25, "actionWithTitle:image:identifier:handler:", v26, v27, 0, v55);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("livephoto.slash"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v46 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("livephoto.slash.portrait"), &v58, &v62, &v70, &v66);
    v32 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v32;
  }
  v33 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("LIVE_PHOTO_BADGE_MENU_ACTION_DISABLE_LIVE_PHOTO"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_5;
  v51[3] = &unk_1E58A9FD0;
  objc_copyWeak(&v54, &location);
  v35 = v28;
  v52 = v35;
  v36 = v29;
  v53 = v36;
  objc_msgSend(v33, "actionWithTitle:image:identifier:handler:", v34, v31, 0, v51);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "setState:", !(a3 & 0x1000000) & (a3 >> 6));
  objc_msgSend(v48, "setState:", (a3 >> 7) & 1);
  objc_msgSend(v24, "setState:", (a3 >> 8) & 1);
  objc_msgSend(v30, "setState:", (a3 >> 9) & 1);
  objc_msgSend(v37, "setState:", (a3 >> 24) & 1);
  v38 = (void *)MEMORY[0x1E0DC39D0];
  v72[0] = v47;
  v72[1] = v48;
  v72[2] = v24;
  v72[3] = v30;
  v72[4] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v54);
  objc_destroyWeak(v42);

  objc_destroyWeak(v43);
  objc_destroyWeak(v45);

  objc_destroyWeak(v44);
  objc_destroyWeak(&location);

  return v40;
}

- (id)_depthToggleMenuForBadges:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  PUBadgeTileViewController *v15;
  id v16[2];
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!PECanRenderPortrait())
    return 0;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC36F8];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke;
  v14 = &unk_1E589D470;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  v15 = self;
  objc_msgSend(v5, "elementWithUncachedProvider:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC39D0];
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  return v9;
}

- (id)_depthMenuElementsForDepthEnabled:(BOOL)a3 depthControllerExists:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  BOOL v30;
  BOOL v31;
  id location;
  _QWORD v33[4];

  v5 = a3;
  v33[2] = *MEMORY[0x1E0C80C00];
  if (self->_delegateRespondsTo.undoManager)
  {
    -[PUBadgeTileViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "undoManagerForAssetActionPerformer:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[PUBadgeTileViewController assetViewModel](self, "assetViewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __85__PUBadgeTileViewController__depthMenuElementsForDepthEnabled_depthControllerExists___block_invoke;
  v26[3] = &unk_1E589D498;
  v30 = v5;
  v31 = a4;
  objc_copyWeak(&v29, &location);
  v12 = v10;
  v27 = v12;
  v13 = v8;
  v28 = v13;
  -[PUBadgeTileViewController _depthToggleActionForEnable:handler:](self, "_depthToggleActionForEnable:handler:", 1, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __85__PUBadgeTileViewController__depthMenuElementsForDepthEnabled_depthControllerExists___block_invoke_2;
  v20[3] = &unk_1E589D498;
  v24 = v5;
  v25 = a4;
  objc_copyWeak(&v23, &location);
  v15 = v12;
  v21 = v15;
  v16 = v13;
  v22 = v16;
  -[PUBadgeTileViewController _depthToggleActionForEnable:handler:](self, "_depthToggleActionForEnable:handler:", 0, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setState:", v5);
  objc_msgSend(v17, "setState:", !v5);
  v33[0] = v14;
  v33[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v18;
}

- (id)_disabledDepthMenuElementsDepthEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v3 = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  -[PUBadgeTileViewController _depthToggleActionForEnable:handler:](self, "_depthToggleActionForEnable:handler:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBadgeTileViewController _depthToggleActionForEnable:handler:](self, "_depthToggleActionForEnable:handler:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributes:", 1);
  objc_msgSend(v6, "setAttributes:", 1);
  if (v3)
    v7 = v5;
  else
    v7 = v6;
  objc_msgSend(v7, "setState:", 1);
  v10[0] = v5;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_depthToggleActionForEnable:(BOOL)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  PLServicesLivePortraitLocalizedFrameworkString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("f.cursive.circle"));
  else
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("f.cursive.circle.slash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3428];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PUBadgeTileViewController__depthToggleActionForEnable_handler___block_invoke;
  v12[3] = &unk_1E58A63F8;
  v13 = v5;
  v9 = v5;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)assetBadgeView:(id)a3 menuForBadges:(unint64_t)a4
{
  return -[PUBadgeTileViewController _menuForBadges:](self, "_menuForBadges:", a4);
}

- (void)assetBadgeView:(id)a3 dismissAnyPresentedViewControllerWithCompletion:(id)a4
{
  id v5;
  id v6;

  if (self->_delegateRespondsTo.userDidTapBadgeView)
  {
    v5 = a4;
    -[PUBadgeTileViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissPresentedViewController:presentMenuWithCompletion:", self, v5);

  }
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  -[PUBadgeTileViewController _badgeView](self, "_badgeView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "badgeInfoChanged", a3))
    -[PUBadgeTileViewController _invalidateBadgeInfo](self, "_invalidateBadgeInfo");
  -[PUBadgeTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if (a4 == 1 && (void *)PUBadgeInfoProviderObservationContext == a5)
    -[PUBadgeTileViewController _invalidateBadgeView](self, "_invalidateBadgeView", a3);
  -[PUBadgeTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (PUBadgeTileViewControllerDelegate)delegate
{
  return (PUBadgeTileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (BOOL)_needsUpdateBadgeInfo
{
  return self->__needsUpdateBadgeInfo;
}

- (void)_setNeedsUpdateBadgeInfo:(BOOL)a3
{
  self->__needsUpdateBadgeInfo = a3;
}

- (BOOL)_needsUpdateBadgeProvider
{
  return self->__needsUpdateBadgeProvider;
}

- (void)_setNeedsUpdateBadgeProvider:(BOOL)a3
{
  self->__needsUpdateBadgeProvider = a3;
}

- (BOOL)_needsUpdateBadgeView
{
  return self->__needsUpdateBadgeView;
}

- (void)_setNeedsUpdateBadgeView:(BOOL)a3
{
  self->__needsUpdateBadgeView = a3;
}

- (PXAssetBadgeInfo)_badgeInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].fileSize;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[6].duration;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (PUBadgeInfoProvider)_badgeInfoProvider
{
  return self->__badgeInfoProvider;
}

- (void)set_badgeInfoProvider:(id)a3
{
  objc_storeStrong((id *)&self->__badgeInfoProvider, a3);
}

- (PXUIAssetBadgeView)_badgeView
{
  return self->__badgeView;
}

- (BOOL)_isOverContent
{
  return self->__isOverContent;
}

- (double)_contentWidth
{
  return self->__contentWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__badgeView, 0);
  objc_storeStrong((id *)&self->__badgeInfoProvider, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __65__PUBadgeTileViewController__depthToggleActionForEnable_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__PUBadgeTileViewController__depthMenuElementsForDepthEnabled_depthControllerExists___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (!*(_BYTE *)(a1 + 56) || !*(_BYTE *)(a1 + 57))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_toggleDepthForAsset:enable:undoManager:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));

  }
}

void __85__PUBadgeTileViewController__depthMenuElementsForDepthEnabled_depthControllerExists___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 56) || !*(_BYTE *)(a1 + 57))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_toggleDepthForAsset:enable:undoManager:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

  }
}

void __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void (**v15)(id, void *);
  dispatch_time_t v16;
  intptr_t v17;
  NSObject *v18;
  __int16 v19[8];
  _QWORD v20[4];
  NSObject *v21;
  void (**v22)(id, void *);
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    if ((*(_WORD *)(a1 + 48) & 0x380) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v5, "_disabledDepthMenuElementsDepthEnabled:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v6);

    }
    else
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v7, "assetViewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v9;

        if (v5)
        {
          v10 = dispatch_group_create();
          dispatch_group_enter(v10);
          v35 = 0;
          v36 = &v35;
          v37 = 0x2020000000;
          v38 = 0;
          v31 = 0;
          v32 = &v31;
          v33 = 0x2020000000;
          v34 = 0;
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v30 = 0;
          v11 = (void *)MEMORY[0x1E0D7CB58];
          v12 = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend((id)objc_opt_class(), "_adjustmentDataLoadingQueue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_2;
          v20[3] = &unk_1E589D448;
          objc_copyWeak(&v26, (id *)(a1 + 40));
          v14 = v10;
          v21 = v14;
          v23 = &v27;
          v15 = v3;
          v22 = v15;
          v24 = &v35;
          v25 = &v31;
          objc_msgSend(v11, "assetHasDepthEnabled:queue:handler:", v5, v13, v20);

          v16 = dispatch_time(0, 100000000);
          v17 = dispatch_group_wait(v14, v16);
          *((_BYTE *)v28 + 24) = v17 != 0;
          if (v17)
          {
            PLOneUpGetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19[0] = 0;
              _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEFAULT, "Badge tile menu synchronous depth enabled check timed out, continuing asynchronously with loading indicator", (uint8_t *)v19, 2u);
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "_depthMenuElementsForDepthEnabled:depthControllerExists:", *((unsigned __int8 *)v36 + 24), *((unsigned __int8 *)v32 + 24));
            v18 = objc_claimAutoreleasedReturnValue();
            v15[2](v15, v18);
          }

          objc_destroyWeak(&v26);
          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v31, 8);
          _Block_object_dispose(&v35, 8);

          goto LABEL_13;
        }
      }
      else
      {

      }
      v3[2](v3, (void *)MEMORY[0x1E0C9AA60]);
      v5 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  v3[2](v3, (void *)MEMORY[0x1E0C9AA60]);
LABEL_14:

}

void __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_2(uint64_t a1, char a2, char a3)
{
  id *v6;
  id WeakRetained;
  id v8;
  id v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;

  v6 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));

  if (WeakRetained)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_copyWeak(&v9, v6);
      v10 = a2;
      v11 = a3;
      v8 = *(id *)(a1 + 40);
      px_dispatch_on_main_queue();

      objc_destroyWeak(&v9);
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_3;
      v15 = &unk_1E58ABAC8;
      v16 = *(id *)(a1 + 40);
      px_dispatch_on_main_queue();

    }
  }
}

uint64_t __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_depthMenuElementsForDepthEnabled:depthControllerExists:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applyLivePhotoEffect:toAsset:undoManager:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applyLivePhotoEffect:toAsset:undoManager:", 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applyLivePhotoEffect:toAsset:undoManager:", 2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applyLivePhotoEffect:toAsset:undoManager:", 3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "disableLivePhotoForAsset:undoManager:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __44__PUBadgeTileViewController__menuForBadges___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

void __44__PUBadgeTileViewController__menuForBadges___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "actionPerformerForActionType:", *MEMORY[0x1E0D7C070]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7BBE8];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_firstKeyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultPresenterWithViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPresentationEnvironment:", v7);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke_3;
  v8[3] = &unk_1E58AB060;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performActionWithCompletionHandler:", v8);

}

void __44__PUBadgeTileViewController__menuForBadges___block_invoke_216(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "actionPerformerForActionType:", *MEMORY[0x1E0D7C078]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7BBE8];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_firstKeyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultPresenterWithViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPresentationEnvironment:", v7);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke_2_217;
  v8[3] = &unk_1E58AB060;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performActionWithCompletionHandler:", v8);

}

void __44__PUBadgeTileViewController__menuForBadges___block_invoke_2_217(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLSharedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Error moving asset %{public}@ to shared library:%@", (uint8_t *)&v8, 0x16u);

    }
  }

}

void __44__PUBadgeTileViewController__menuForBadges___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLSharedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Error moving asset %{public}@ to personal library:%@", (uint8_t *)&v8, 0x16u);

    }
  }

}

void __57__PUBadgeTileViewController__updateBadgeProviderIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssetViewModel:", v4);

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "_badgeInfo");
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
  }
  v6[0] = v7;
  v6[1] = v8;
  objc_msgSend(v3, "setBadgeInfo:", v6);

}

uint64_t __44__PUBadgeTileViewController_prepareForReuse__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prepareForReuse");
}

uint64_t __65__PUBadgeTileViewController__performEditsIfAllowedOnAsset_edits___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLOneUpGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "User approved 1up edit of spatial asset", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__PUBadgeTileViewController__performEditsIfAllowedOnAsset_edits___block_invoke_164()
{
  NSObject *v0;
  uint8_t v1[16];

  PLOneUpGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AAB61000, v0, OS_LOG_TYPE_DEFAULT, "User cancelled 1up edit of spatial asset", v1, 2u);
  }

}

void __69__PUBadgeTileViewController__toggleDepthForAsset_enable_undoManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  char v9;

  PXAssetEditOperationTypeForDepthToggle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B1E0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PUBadgeTileViewController__toggleDepthForAsset_enable_undoManager___block_invoke_2;
  v7[3] = &unk_1E58A5270;
  v9 = *(_BYTE *)(a1 + 48);
  v8 = v4;
  v6 = (id)objc_msgSend(v3, "performEditOperationWithType:asset:undoManager:completionHandler:", v2, v8, v5, v7);

}

void __69__PUBadgeTileViewController__toggleDepthForAsset_enable_undoManager___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    +[PUBadgeTileViewController logToggledDepthEffect:onAsset:](PUBadgeTileViewController, "logToggledDepthEffect:onAsset:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    PLOneUpGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 40))
        v8 = CFSTR("enable");
      else
        v8 = CFSTR("disable");
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to %@ depth for asset %@ with error: %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

void __66__PUBadgeTileViewController_disableLivePhotoForAsset_undoManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0D09910];
    v7 = *(_QWORD *)(a1 + 32);
    v14 = *MEMORY[0x1E0D09828];
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.oneUpLivePhotoDisabled"), v8);
  }
  else
  {
    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Failed to disable Live photo for asset %@ with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }

}

void __70__PUBadgeTileViewController_applyLivePhotoEffect_toAsset_undoManager___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  PXAssetEditOperationTypeForVariationType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B1E0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PUBadgeTileViewController_applyLivePhotoEffect_toAsset_undoManager___block_invoke_2;
  v7[3] = &unk_1E58AB728;
  v9 = a1[6];
  v8 = v4;
  v6 = (id)objc_msgSend(v3, "performEditOperationWithType:asset:undoManager:completionHandler:", v2, v8, v5, v7);

}

void __70__PUBadgeTileViewController_applyLivePhotoEffect_toAsset_undoManager___block_invoke_2(uint64_t a1, int a2, void *a3)
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
    +[PUBadgeTileViewController logAppliedLivePhotoEffect:toAsset:](PUBadgeTileViewController, "logAppliedLivePhotoEffect:toAsset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    PLOneUpGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to apply suggested variation with error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

+ (void)logAppliedLivePhotoEffect:(int64_t)a3 toAsset:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  v5 = (void *)objc_opt_class();
  PXAssetVariationTypeDescription();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_logEffectNameApplied:toAsset:", v6, v4);

}

+ (void)logToggledDepthEffect:(BOOL)a3 onAsset:(id)a4
{
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  v5 = (void *)objc_opt_class();
  if (v4)
    v6 = CFSTR("DepthOn");
  else
    v6 = CFSTR("DepthOff");
  objc_msgSend(v5, "_logEffectNameApplied:toAsset:", v6, v7);

}

+ (void)_logEffectNameApplied:(id)a3 toAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUBadgeTileViewController.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.oneUpLivePhoto%@EffectSuggestionApplied"), v7);
  v10 = (void *)MEMORY[0x1E0D09910];
  v13 = *MEMORY[0x1E0D09828];
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendEvent:withPayload:", v9, v11);

}

+ (CGSize)badgeTileSizeForAssetViewModel:(id)a3 contentWidth:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  CGSize result;

  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "badgeInfoPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "badgeInfo");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }

  v9[0] = v10;
  v9[1] = v11;
  objc_msgSend(MEMORY[0x1E0D7BB38], "sizeForBadgeInfo:contentWidth:", v9, a4);
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGSize)leadingBadgesSizeForAssetViewModel:(id)a3 contentWidth:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGSize result;

  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "badgeInfoPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "badgeInfo");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }

  v11 = 0u;
  v12 = 0u;
  v9 = v13;
  v10 = v14;
  objc_msgSend(MEMORY[0x1E0D7B218], "topLeftPrimaryBadgeInfoForBadgeInfo:", &v9);
  v9 = v11;
  v10 = v12;
  objc_msgSend(MEMORY[0x1E0D7BB38], "sizeForBadgeInfo:contentWidth:", &v9, a4);
  result.height = v8;
  result.width = v7;
  return result;
}

+ (void)_configureBadgeView:(id)a3 withBadgeInfo:(PXAssetBadgeInfo *)a4 isOverContent:(BOOL)a5 contentWidth:(double)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  __int128 v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  double v18;
  BOOL v19;

  v7 = a7;
  v11 = a3;
  v14[1] = 3221225472;
  v12 = *(_OWORD *)&a4->count;
  v16 = *(_OWORD *)&a4->badges;
  v17 = v12;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __99__PUBadgeTileViewController__configureBadgeView_withBadgeInfo_isOverContent_contentWidth_animated___block_invoke;
  v14[3] = &unk_1E589D390;
  v15 = v11;
  v19 = a5;
  v18 = a6;
  v13 = v11;
  objc_msgSend(v13, "performChanges:animated:", v14, v7);

}

+ (id)_adjustmentDataLoadingQueue
{
  if (_adjustmentDataLoadingQueue_onceToken != -1)
    dispatch_once(&_adjustmentDataLoadingQueue_onceToken, &__block_literal_global_261);
  return (id)_adjustmentDataLoadingQueue_loadingQueue;
}

void __56__PUBadgeTileViewController__adjustmentDataLoadingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.photos.DepthEnabledLoadingQueue", 0);
  v1 = (void *)_adjustmentDataLoadingQueue_loadingQueue;
  _adjustmentDataLoadingQueue_loadingQueue = (uint64_t)v0;

}

uint64_t __99__PUBadgeTileViewController__configureBadgeView_withBadgeInfo_isOverContent_contentWidth_animated___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[2];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  objc_msgSend(v2, "setBadgeInfo:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setStyle:", 3);
  objc_msgSend(*(id *)(a1 + 32), "setOverContent:", *(unsigned __int8 *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 32), "setContentWidth:", *(double *)(a1 + 72));
}

@end
